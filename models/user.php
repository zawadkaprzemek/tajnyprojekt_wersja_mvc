<?php
class User extends Model{
	public function register($post){

		$password = md5($post['password']);

        // Insert into MySQL
        $this->query('INSERT INTO users (name, email, password,role,account_type,activate) 
        VALUES(:name, :email,:password,:role,:account_type,:activate)');
        $this->bind(':name', $post['name']);
        $this->bind(':email', $post['email']);
        $this->bind(':password', $password);
        $this->bind(':role', 'user');
        $this->bind(':account_type', 1);
        $this->bind(':activate', (isset($post['activate']) ? $post['activate'] : 0 ));
        $this->execute();
        // Verify
        if($this->lastInsertId()){
            $this->addCoins($post['name']);
            return true;
        }else{
            return false;
        }
	}

	public function login(){
		// Sanitize POST
		$post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);

		$password = md5($post['password']);
		//$password = $this->hashPassword($post['password'], $post['email']);

		if($post['login']){
			// Compare Login
			$this->query('SELECT * FROM users WHERE email =:email AND password =:password');
			$this->bind(':email', $post['email']);
			$this->bind(':password', $password);
			
			$row = $this->single();

			if($row){
				$_SESSION['is_logged_in'] = true;
				$_SESSION['user_data'] = array(
					"id"	=> $row['id'],
					"name"	=> $row['name'],
					"email"	=> $row['email'],
					"role"	=> $row['role'],
					"account_type"=>$row['account_type'],
					"activate"=> $row['activate'],
                    "usr_role"=>$row['role']

				);
				return true;
			} 
		}
		
		return false;
	}

	public function checkName($name){
        if (!preg_match("/^[A-Za-z0-9]+$/",$name)) {
            $message =array('status'=>'error','message'=>'Login może składać się tylko z liter i cyfr');
        }else{
            $this->query("SELECT * FROM users WHERE name=:name");
            $this->bind(':name',$name);
            $data=$this->single();
            if ($data!==false) {
                $message =array('status'=>'error','message'=>'Username already exists.');
            }
        }
        if(isset($message)){
            return $message;
        }else{
            return true;
        }
    }

    public function checkEmail($email){
        if(!filter_var($email,FILTER_VALIDATE_EMAIL)) {
            $message =array('status'=>'error','message'=>'E-mail address is invalid.');
        }else{
            $this->query("SELECT * FROM users WHERE email=:email");
            $this->bind(':email',$email);
            $data= $this->single();
            if ($data!==false) {
                $message =array('status'=>'error','message'=>'E-mail address is already in use.');
            }
        }
        if(isset($message)){
            return $message;
        }else{
            return true;
        }
    }

    public function checkPassword($password,$rep_password){
        if(strlen($password) < 8) {
            $message =array('status'=>'error','message'=>'Hasło musi się składać conajmniej z 8 znaków');
        }else if($password != $rep_password) {
            $message =array('status'=>'error','message'=>'Hasła nie są takie same');
        }

        if(isset($message)){
            return $message;
        }else{
            return true;
        }
    }

	private function hashPassword($password, $email){ 
		$salt = "asKHE'3b45u4usdfho283!yhrDCfsd_faterglasdmc!";

		$hash = sha1($password . $salt . $email);

		for ($i = 0; $i < 1000; $i++) {
			$hash = sha1($hash . $salt);
		}

		return $hash;
	}

	public function activate($user){
	    $this->query("UPDATE users SET activate=1 WHERE name=:user");
        $this->bind(':user',$user);
        try{
            $this->execute();
            return true;
        }
        catch (Exception $e){
            return false;
        }
    }

	public function index($sex){
	    if(isset($sex)){
            $this->query("SELECT * FROM users_info INNER JOIN 
            (SELECT name FROM users WHERE role='fake' ORDER BY name ASC) as usr 
             ON users_info.user_name=usr.name WHERE sex=:sex");
            $this->bind(':sex',$sex);
        }else{
            $this->query("SELECT * FROM users_info INNER JOIN 
            (SELECT name FROM users WHERE role='fake' ORDER BY name ASC) as usr 
             ON users_info.user_name=usr.name");
        }
        $data= $this->resultSet();
        return $data;
    }

    public function registered_users($sex){
        if(isset($sex)){
            $this->query("SELECT * FROM users_info INNER JOIN 
            (SELECT name FROM users WHERE role='user' ORDER BY name ASC) as usr 
             ON users_info.user_name=usr.name WHERE sex=:sex");
            $this->bind(':sex',$sex);
        }else{
            $this->query("SELECT * FROM users_info INNER JOIN 
            (SELECT name FROM users WHERE role='user' ORDER BY name ASC) as usr 
             ON users_info.user_name=usr.name");
        }
        $data= $this->resultSet();
        return $data;
    }

    public function messages_list(){
        $this->query("SELECT name,avatar FROM users INNER JOIN users_info ON users.name=users_info.user_name
        WHERE role='fake' AND (name IN (SELECT user_to FROM messages) OR name IN (SELECT user_from FROM messages)) 
        GROUP BY name");
        $data = $this->resultSet();
        $nd=array();
        foreach ($data as $item){
            $this->query("SELECT COUNT(id) as all_m,
             (SELECT COUNT(id) as unread FROM messages WHERE (user_to=:name AND unread='0') ) as unread
            FROM messages WHERE user_to=:name OR user_from=:name");
            $this->bind(":name",$item['name']);
            $m=$this->single();
            /*$this->query("SELECT user_to,user_from, MAX(data_mess) as data, count(id) as how_much FROM messages WHERE
            user_to=:name OR user_from=:name GROUP BY user_to,user_from");
            $this->bind(":name",$item['name']);
            $d=$this->resultSet();*/
            $this->query('SELECT user_to FROM messages WHERE user_from=:user GROUP BY user_to,user_from');
            $this->bind(':user', $item['name']);
            $to = $this->resultSet();
            $this->query('SELECT user_from FROM messages WHERE user_to=:user GROUP BY user_to,user_from');
            $this->bind(':user', $item['name']);
            $from = $this->resultSet();
            $users=array_unique(array_merge(array_map('current',$to),array_map('current',$from)));
            $data = array();
            if(count($users)>0) {
                foreach ($users as $user) {
                    $this->query("SELECT count(id) as ile, MAX(data_mess) as date,user_to,user_from,
            (SELECT count(id) FROM messages WHERE unread=0 AND user_to=:user AND user_from=:person) as unread, 
            (SELECT avatar FROM users_info WHERE user_name=:person) as avatar 
            FROM messages WHERE (user_to=:user AND user_from=:person) OR (user_from=:user AND user_to=:person)");
                    $this->bind(':user', $item['name']);
                    $this->bind(':person', $user);
                    $da = $this->resultSet();
                    array_push($data, $da);
                }
                $data = array_map('current', $data);
                usort($data, 'sort_date');
            }
            array_push($nd,array_merge($item,$m,array('mess'=>$data)));
        }
        return $nd;
    }

    public function exist($user){
        $this->query("SELECT count(id) as exist FROM users INNER JOIN users_info ON users.name=users_info.user_name 
        WHERE name=:user");
        $this->bind(":user",$user);
        $data=$this->single();
        return $data['exist'];
    }

    public function messages($users){
        $this->query("UPDATE messages SET unread=1 WHERE user_from=:user_from AND user_to=:user_to");
        $this->bind(':user_from',$users[1]);
        $this->bind(':user_to',$users[0]);
        $this->execute();
        $this->query("SELECT (SELECT coins FROM account_coins WHERE login=:user) as coins,
        (SELECT account_type FROM users WHERE name=:user) as account_type,
        COUNT(data) as is_blocked FROM blocked_users WHERE user_name1=:profile AND user_name2=:user");
        $this->bind(':profile', $users[0]);
        $this->bind(':user', $users[1]);
        $users_data=$this->single();
        $users_d=array_merge($users_data,array('name'=>$users[1]));

        $this->query("SELECT (SELECT coins FROM account_coins WHERE login=:user) as coins,
        (SELECT account_type FROM users WHERE name=:user) as account_type,
        COUNT(data) as is_blocked FROM blocked_users WHERE user_name1=:profile AND user_name2=:user");
        $this->bind(':profile', $users[1]);
        $this->bind(':user', $users[0]);
        $users_data=$this->single();
        $users_da=array_merge($users_data,array('name'=>$users[0]));

        $this->query("SELECT user_to,user_from,message,data_mess, avatar FROM messages INNER JOIN users_info ON messages
        .user_from=users_info.user_name WHERE (user_from=:user AND user_to=:profile) OR (user_from=:profile AND user_to=:user) ORDER BY data_mess ASC");
        $this->bind(':profile', $users[1]);
        $this->bind(':user', $users[0]);
        $mess = $this->resultSet();
        return $data=array('mess'=>$mess,'users'=>array($users_d,$users_da));
    }

    public function notifications(){
        $this->query("SELECT name FROM users INNER JOIN users_info ON users.name=users_info.user_name
        WHERE role='fake' AND name IN (SELECT user_to FROM notifications) GROUP BY name");
        $users=$this->resultSet();
        $data=array();
        foreach ($users as $user){
            $this->query("SELECT notifications.id,user_to,user_from,type,status,users.role as role FROM 
            notifications
            INNER JOIN users ON notifications.user_to=users.name
            WHERE user_to=:user ORDER BY date DESC");
            $this->bind(":user",$user['name']);
            $notf=$this->resultSet();
            array_push($data,array('name'=>$user['name'],'notf'=>$notf));
        }
        return $data;
    }

    public function newNotifications(){
        $this->query("SELECT count(notifications.id) as new FROM notifications INNER JOIN users 
        ON notifications.user_to=users.name WHERE (role='fake' AND status='0')");
        $data=$this->single();
        return $data['new'];

    }

    public function create($post){
        $av_name=$post['login'].'.png';
        if(save_avatar($post['avatar'],$av_name)){
            $this->query("INSERT INTO users VALUES (NULL,:name,:email,:pass,'fake',2,1)");
            $this->bind(':name',$post['login']);
            $this->bind(':email',$post['login'].'@fmail.com');
            $this->bind(':pass',md5($post['login']).'.jpg');
            $this->execute();
            if($this->lastInsertId()){
                $this->query("INSERT INTO users_info VALUES (:name,:age,:avatar,:state,:info,:sex,NULL)");
                $this->bind(':name',$post['login']);
                $this->bind(':age',age($post['age']));
                $this->bind(':avatar',$av_name);
                $this->bind(':state',$post['state']);
                $this->bind(':info',$post['info']);
                $this->bind(':sex',$post['sex']);
                $this->execute();
            }
            return true;
        }else{
            Messages::setMsg("Wystąpił błąd przy zapisie avataru, spróbuj ponownie", "error");
            return false;
        }

    }

    public function update($post){
        $this->query("UPDATE users_info SET state=:state,info=:info,avatar=:avatar,age=:age WHERE user_name=:user");
        if($post['avatar']!=''){
            $av_name=$post['user'].'.png';
            if((save_avatar($post['avatar'],$av_name))&&($av_name!=$post['old_avatar'])&&($post['old_avatar']!='')){
                unlink('../'.ROOT_PATH.AVATAR_PATH.'/'.$post['old_avatar']);
            }
        }
        $this->bind(':state',$post['state']);
        $this->bind(':info',$post['info']);
        $this->bind(':avatar',($post['avatar']!=''? $av_name: $post['old_avatar']));
        $this->bind(':user',$post['user']);
        $this->bind(':age',age($post['age']));
        $this->execute();

        return;
    }

    public function addCoins($name){
        $this->query("INSERT INTO account_coins VALUES (:name,:coins)");
        $this->bind(':name',$name);
        $this->bind(':coins',COINS_AT_START);
        $this->execute();
        return true;
    }
}