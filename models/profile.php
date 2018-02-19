<?php
class Profile extends Model{
    public function Index(){
        return true;
    }

    public function Show($profile){
        $this->query('SELECT * FROM users_info INNER JOIN users ON users_info.user_name=users.name WHERE 
        user_name=:user');
        $this->bind(':user', $profile);
        $data = $this->single();
        return $data;
    }
    public function Message($profile){
        $this->query("UPDATE messages SET unread=1 WHERE user_from=:profile AND user_to=:user");
        $this->bind(':user',$_SESSION['user_data']['name']);
        $this->bind(':profile',$profile);
        $this->execute();
        $this->query("SELECT (SELECT coins FROM account_coins WHERE login=:user) as coins,
        (SELECT account_type FROM users WHERE name=:user) as account_type,
        COUNT(data) as is_blocked FROM blocked_users WHERE user_name1=:profile AND user_name2=:user");
        $this->bind(':profile', $profile);
        $this->bind(':user', $_SESSION['user_data']['name']);
        $users_data=$this->single();
        $users_data=array_merge($users_data,array('user_to'=>$profile));
        $this->query("SELECT user_to,user_from,message,data_mess, avatar FROM messages INNER JOIN users_info ON messages
        .user_from=users_info.user_name WHERE (user_from=:user AND user_to=:profile) OR (user_from=:profile AND user_to=:user) ORDER BY data_mess ASC");
        $this->bind(':profile', $profile);
        $this->bind(':user', $_SESSION['user_data']['name']);
        $mess = $this->resultSet();
        $data= array('users_data'=>$users_data,'mess'=>$mess);
        return $data;
    }

    public function Write_message($post,$vip=false){
        $this->query('INSERT INTO messages VALUES(NULL,:user_from, :user_to, :message,NOW(),0)');
        $this->bind(':user_from', $post['user_from']);
        $this->bind(':user_to', $post['user_to']);
        $this->bind(':message', $post['message']);
        $this->execute();
        // Verify
        if($this->lastInsertId()){
            if(!$vip){
                $this->query("UPDATE account_coins SET coins=coins-:cost WHERE login=:user");
                $this->bind(':cost',MESSAGE_COST);
                $this->bind(':user',$post['user_from']);
                $this->execute();
                return true;
                }
            }
        return true;
    }

    public function gallery_perm($user,$guest){
        $this->query("SELECT status FROM gallery_permissions WHERE (gallery_owner='".$user."' AND user='".$guest."') ");
        $data=$this->resultSet();
        return $data;
    }
    public function is_favorite($user,$guest){
        $this->query("SELECT * FROM favorite_users WHERE user_name1='".$user."' AND user_name2='".$guest."'");
        $data=$this->single();
        return $data;
    }

    public function add_favorite($user,$guest){
        $this->query("INSERT INTO favorite_users VALUES(:user1,:user2,NOW())");
        $this->bind(':user1',$user);
        $this->bind(':user2',$guest);
        $this->execute();
        return;
    }

    public function remove_favorite($user,$guest){
        $this->query("DELETE FROM favorite_users WHERE user_name1=:user1 AND user_name2=:user2 ");
        $this->bind(':user1',$user);
        $this->bind(':user2',$guest);
        $this->execute();
        return;
    }

    public function is_blocked($user,$guest){
        $this->query("SELECT * FROM blocked_users WHERE user_name1='".$user."' AND user_name2='".$guest."'");
        $data=$this->single();
        return $data;
    }

    public function add_blocked($user,$guest){
        $this->query("INSERT INTO blocked_users VALUES(:user1,:user2,NOW())");
        $this->bind(':user1',$user);
        $this->bind(':user2',$guest);
        $this->execute();
        return;
    }

    public function remove_blocked($user,$guest){
        $this->query("DELETE FROM blocked_users WHERE user_name1=:user1 AND user_name2=:user2 ");
        $this->bind(':user1',$user);
        $this->bind(':user2',$guest);
        $this->execute();
        return;
    }

    public function coins($user){
        $this->query("SELECT coins FROM account_coins WHERE login=:user");
        $this->bind(':user',$user);
        $data=$this->single();
        return $data['coins'];
    }

    public function search($request){
        $this->query("SELECT * FROM users INNER JOIN users_info ON users.name=users_info.user_name WHERE users.name 
        LIKE :request AND role='fake'");
        $this->bind(':request','%'.$request.'%');
        $data=$this->resultSet();
        return $data;
    }

    public function visit($user,$guest){
        $this->query("SELECT count(data) as count FROM profile_visit WHERE user_name1=:guest AND user_name2=:user");
        $this->bind(':guest',$guest);
        $this->bind(':user',$user);
        $data=$this->single();
        if($data['count']!=0){
            $this->query("UPDATE profile_visit SET data=NOW(),checked=0 WHERE user_name1=:guest AND user_name2=:user");
        }else{
            $this->query("INSERT INTO profile_visit VALUES (:guest,:user,NOW(),0)");
        }
        $this->bind(':guest',$guest);
        $this->bind(':user',$user);
        $this->execute();
        return;
    }
    public function profile_exist($user){
        if($_SESSION['user_data']['role']!='super_admin'){
            if(DISPLAY_TRUE===true){
                $this->query("SELECT count(id) as exist FROM users INNER JOIN users_info ON users.name=users_info.user_name WHERE 
        name=:user AND role!='super_admin'");
            }else{
                $this->query("SELECT count(id) as exist FROM users INNER JOIN users_info ON users.name=users_info.user_name WHERE 
        name=:user AND role='fake'");
            }
        }else{
            $this->query("SELECT count(id) as exist FROM users INNER JOIN users_info ON users.name=users_info.user_name WHERE 
        name=:user");
        }

        $this->bind(':user',$user);
        $data=$this->single();
        return $data['exist'];
    }

    public function get_status($owner,$user){
        $this->query("SELECT status FROM gallery_permissions WHERE (gallery_owner='".$owner."' AND user='".$user."' ");
        $status = $this->single();
        return $status;
    }

    public function notif_exist($user_to,$user_from,$type){
        $this->query("SELECT count(id) FROM notifications WHERE (user_to='".$user_to."' AND user_from='"
            .$user_from."' AND type='".$type."')");
        $exist=$this->single();
        return $exist;
    }

    public function add_notification($user_to,$user_from,$type){
        $this->query("INSERT INTO notifications VALUES (NULL,'".$user_to."','".$user_from."','".$type."','0',NOW())");
        $this->execute();
        if($this->lastInsertId()){
            return true;
        }
    }

    public function update_notification($user_to,$user_from,$type,$status){
        $this->query("UPDATE notifications SET status='".$status."',notifications.date=NOW() WHERE (user_to='".$user_to."' 
        AND user_from='".$user_from."' AND type='".$type."')");
        $this->execute();
        return true;
    }

    public function change_notification($user_to,$user_from,$type,$new_type){
        $this->query("UPDATE notifications SET status='1',type='".$new_type."',notifications.date=NOW() WHERE 
        (user_to='".$user_to."' AND user_from='".$user_from."' AND type='".$type."')");
        $this->execute();
        return true;
    }

    public function get_notification_id($user_to,$user_from,$type){
        $this->query("SELECT id FROM notifications WHERE user_to='".$user_to."' AND user_from='".$user_from."' AND 
        type='".$type."'");
        $data=$this->single();
        return $data['id'];
    }

    public function remove_notification($id){
        $this->query("DELETE FROM notifications WHERE id=:id");
        $this->bind('id',$id);
        $this->execute();
        return;
    }

    public function permission_ask_new($owner,$user){
        $this->query("INSERT INTO gallery_permissions VALUES (NULL,'".$owner."','".$user."',0,NOW())");
        $this->execute();
        if($this->lastInsertId()){
            return true;
        }
    }

    public function accept_permission($owner,$user){
        $this->query("UPDATE gallery_permissions SET status='1' WHERE gallery_owner='".$owner."' AND user='".$user."'");
        $this->execute();
        return true;
    }

    public function decline_permission($owner,$user){
        $this->query("DELETE FROM gallery_permissions WHERE gallery_owner='".$owner."' AND user='".$user."'");
        $this->execute();
        return true;
    }
}