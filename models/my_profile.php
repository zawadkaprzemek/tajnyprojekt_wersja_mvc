<?php
class My_profile extends Model{
    public function Index(){
        $this->query('SELECT * FROM users_info WHERE user_name=:user');
        $this->bind(':user', $_SESSION['user_data']['name']);
        $data = $this->single();
        return $data;
    }

    public function Messages(){
        $this->query('SELECT user_to FROM messages WHERE user_from=:user GROUP BY user_to,user_from');
        $this->bind(':user', $_SESSION['user_data']['name']);
        $to = $this->resultSet();
        $this->query('SELECT user_from FROM messages WHERE user_to=:user GROUP BY user_to,user_from');
        $this->bind(':user', $_SESSION['user_data']['name']);
        $from = $this->resultSet();
        $users=array_unique(array_merge(array_map('current',$to),array_map('current',$from)));
        $data = array();
        if(count($users)>0) {
            foreach ($users as $user) {
                $this->query("SELECT count(id) as ile, MAX(data_mess) as date,user_to,user_from,
            (SELECT count(id) FROM messages WHERE unread=0 AND user_to=:user AND user_from=:person) as unread, 
            (SELECT avatar FROM users_info WHERE user_name=:person) as avatar 
            FROM messages WHERE (user_to=:user AND user_from=:person) OR (user_from=:user AND user_to=:person)");
                $this->bind(':user', $_SESSION['user_data']['name']);
                $this->bind(':person', $user);
                $da = $this->resultSet();
                array_push($data, $da);
            }
            $data = array_map('current', $data);
            usort($data, 'sort_date');
        }
        return $data;
    }

    public function NewMessages(){
        $this->query("SELECT id FROM messages WHERE (user_to=:user AND unread='0') GROUP BY user_from");
        $this->bind(':user',$_SESSION['user_data']['name']);
        $data=$this->resultSet();
        return count($data);
    }

    public function Visitors(){
        $this->query("UPDATE profile_visit SET checked=1 WHERE user_name2=:user AND checked=0");
        $this->bind(':user', $_SESSION['user_data']['name']);
        $this->execute();
        $this->query("SELECT * FROM users_info INNER JOIN users ON users_info.user_name=users.name 
        INNER JOIN profile_visit ON users_info.user_name=profile_visit.user_name1 WHERE user_name IN
        (SELECT user_name1 FROM profile_visit WHERE user_name2=:user) GROUP BY user_name ORDER BY 
        profile_visit.data DESC");
        $this->bind(':user', $_SESSION['user_data']['name']);
        $data = $this->resultSet();
        return $data;
    }

    public function NewVisitors(){
        $this->query("SELECT COUNT(data) as new FROM profile_visit WHERE user_name2=:user AND checked=0");
        $this->bind(":user",$_SESSION['user_data']['name']);
        $data=$this->single();
        return $data['new'];
    }

    public function Favorite(){
        $this->query("SELECT * FROM users_info INNER JOIN users ON users_info.user_name=users.name 
        INNER JOIN favorite_users ON users_info.user_name=favorite_users.user_name2 WHERE user_name IN
        (SELECT user_name2 FROM favorite_users WHERE user_name1=:user) GROUP BY user_name ORDER BY 
        favorite_users.data DESC");
        $this->bind(':user', $_SESSION['user_data']['name']);
        $fav = $this->resultSet();
        $this->query("SELECT * FROM users_info INNER JOIN users ON users_info.user_name=users.name 
        INNER JOIN blocked_users ON users_info.user_name=blocked_users.user_name2 WHERE user_name IN
        (SELECT user_name2 FROM blocked_users WHERE user_name1=:user) GROUP BY user_name ORDER BY 
        blocked_users.data DESC");
        $this->bind(':user', $_SESSION['user_data']['name']);
        $blocked = $this->resultSet();
        $data=array('favorite'=>$fav,'blocked'=>$blocked);
        return $data;
    }


    public function Notifications(){
        $this->query("SELECT * FROM notifications WHERE user_to=:user ORDER BY date DESC");
        $this->bind(":user",$_SESSION['user_data']['name']);
        $data=$this->resultSet();
        return $data;
    }

    public function UpdateNotifications(){
        $this->query("UPDATE notifications SET status='1' WHERE user_to=:user");
        $this->bind(":user",$_SESSION['user_data']['name']);
        $this->execute();
        return;
    }

    public function NewNotifications(){
        $this->query("SELECT COUNT(id) as new FROM notifications WHERE user_to=:user AND status='0'");
        $this->bind(":user",$_SESSION['user_data']['name']);
        $data=$this->single();
        return $data['new'];
    }

    public function getAvatar(){
        $this->query("SELECT avatar FROM users_info WHERE user_name=:name");
        $this->bind(":name",$_SESSION['user_data']['name']);
        $data=$this->single();
        return $data['avatar'];
    }

    public function update($post){
        if($this->Index()===false){
            $this->query("INSERT INTO users_info VALUES(:user,NULL,:avatar,:state,:info,:sex,:birth)");
            $this->bind(':sex',$post['sex']);
            $this->bind(':birth',$post['date_birth']);
        }else{
            $this->query("UPDATE users_info SET state=:state,info=:info,avatar=:avatar WHERE user_name=:user");
        }
        if($post['avatar']!=''){
            $avatar=$post['avatar'];
            $av_name=$post['user'].".png";
            if(save_avatar($avatar,$av_name)===true){
                if(($post['old_avatar']!='')&&($post['old_avatar']!=$av_name)){
                    unlink(ROOT_PATH.AVATAR_PATH.'/'.$post['old_avatar']);
                }
            }
        }
        $this->bind(':state',$post['state']);
        $this->bind(':info',$post['info']);
        $this->bind(':avatar',($post['avatar']!=''? $av_name: $post['old_avatar']));
        $this->bind(':user',$post['user']);
        $this->execute();

        return;
    }

}