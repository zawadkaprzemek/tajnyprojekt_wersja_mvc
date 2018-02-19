<?php
class Home extends Model{
	public function Index(){
		return;
	}

	public function Page($page){
	    $pp=($_SESSION['user_data']['account_type']=='2'? 12 : 11);
	    $start=($page-1)*$pp;
        if($_SESSION['user_data']['account_type']==1&&$page==10){
            $pp=10;
        }
	    $this->query("SELECT * FROM users_info INNER JOIN 
        (SELECT name,account_type FROM users WHERE role='fake') as usr
         ON users_info.user_name=usr.name LIMIT $start,$pp ");
        $data=$this->resultSet();
        return $data;
    }
    public function CountProfiles(){
        $this->query("SELECT count(name) as profiles_count FROM users_info INNER JOIN 
        (SELECT name,account_type FROM users WHERE role='fake') as usr
         ON users_info.user_name=usr.name");
        $data=$this->single();
        return $data;
    }
}