<?php
class Doladuj extends Model{
    public function Index(){

        $this->query("SELECT * FROM vip_pay WHERE user=:user");
        $this->bind(':user',$_SESSION['user_data']['name']);
        $data=$this->single();
        return $data;
    }


    public function make_order($user,$email){
        $country='PL';
        error_reporting(0);

        $array['api_key'] = '5f07862b59314fb49588a5b4c8683502';			//required - your api_key
////////////////////////////////
        $array['aid']		= '160393';								//required - affiliate_partner_id - your ID
        $array['cid']		= 'abc123';								//creative_id - your data - will be visible in DA interface
        $array['ac']		= 'abc123';								//action_channel - your data - will be visible in DA interface
        $array['order_url']	= 'http://sundaycashsaver.com/48/xplayroom/';	//required - site where the weight loss RO order is sent - each category and country will have its own address
        $array['base_url']	= 'http://www.xplayroom.com/';			//required - site where the order was generated
        $array['price']		= '147';								//required - price listed on your site
////////////////////////////////

        $array['name'] 		= addslashes($user);		//test123
        $array['surname'] 	= @addslashes($_POST['surname']);	//test123
        $array['phone'] 	= @addslashes($phone);		//00123456789/+123456789
        $array['email'] 	= addslashes($email);		//test@test.com
        $array['country'] 	= @addslashes($country);	//RO
        $array['city'] 		= @addslashes($_POST['city']);		//test
        $array['address'] 	= @addslashes($_POST['address']);	//test123 123
        $array['pcode'] 	= @addslashes($_POST['pcode']);		//634
        $array['note'] 		= @addslashes($_POST['note']);		//test123 123
        $array['referer'] 	= $_SERVER['HTTP_REFERER'];
        $array['ip'] 		= $_SERVER['REMOTE_ADDR'];
        $array['user_agent'] = $_SERVER['HTTP_USER_AGENT'];

        $return=makeOrder($array);	// function that will send the order

        return json_decode($return);
    }

    public function check_payment($cookie){
        $postdata="cookie_confirm=".$cookie;
        $url='http://sundaycashsaver.com/48/xplayroom/confirm.php';
        $headers = [
            'Referer: '.$_SERVER['HTTP_REFERER'],
            'User-Agent: '.$_SERVER['HTTP_USER_AGENT'],
            'X-Forwarded-For: '.$_SERVER['REMOTE_ADDR']
        ];
        $c=curl_init();
        curl_setopt($c,CURLOPT_URL,$url);
        curl_setopt ($c, CURLOPT_SSL_VERIFYPEER, FALSE);
        curl_setopt($c,CURLOPT_RETURNTRANSFER,1);
        curl_setopt ($c, CURLOPT_USERAGENT, $_SERVER['HTTP_USER_AGENT']);
        curl_setopt ($c, CURLOPT_TIMEOUT, 10);
        curl_setopt($c,CURLOPT_POSTFIELDS, $postdata);
        curl_setopt($c,CURLOPT_POST, 1);
        curl_setopt($c, CURLOPT_REFERER, $_SERVER['HTTP_REFERER']);
        curl_setopt($c, CURLOPT_SSL_VERIFYHOST, 0);
        curl_setopt($c, CURLOPT_SSL_VERIFYPEER, 0);
        curl_setopt($c, CURLOPT_HTTPHEADER, $headers);

        $response = curl_exec ($c);
        curl_close($c);
        //$response='{"status":true}';
        $result=json_decode($response);
        return $result;
    }

    public function save_order($user,$cookie,$pay_link){
        $this->query("INSERT INTO vip_pay VALUES (NULL,:user,'".$cookie."','".$pay_link."','1')");
        $this->bind(':user',$user);
        $this->execute();
        if($this->lastInsertId()){
            return true;
        }
    }

    public function update_payment($user,$cookie){
        $this->query("UPDATE vip_pay SET status=2 WHERE user=:user AND cookie=:cookie");
        $this->bind(':user',$user);
        $this->bind(':cookie',$cookie);
        $this->execute();
        return;
    }

    public function update_account_type($user){
        $this->query("UPDATE users SET account_type='2' WHERE name=:name");
        $this->bind(":name",$user);
        $this->execute();
        $_SESSION['user_data']['account_type']=2;
    }

    public function check_code($code){
        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, "https://ssl.mobiltek.pl/api/check_code.php?keyword=gmc%&shortcode=48607767767&passwd=sestoka&code=".$code);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
        $output = curl_exec($ch);
        curl_close($ch);
        $arr = explode(PHP_EOL,trim($output));
        $ar2=explode(':',$arr[1]);
        $result=array('status'=>$arr[0],'code'=>$ar2[0]);
        //$result=array('status'=>'OK','code'=>'1001'); //
        return $result;
    }

    public function add_coins($user){
        $this->query("UPDATE account_coins SET coins=coins+:coins_add WHERE login=:user");
        $this->bind(':user',$user);
        $this->bind(':coins_add',COINS_TO_ADD);
        $this->execute();
        return;
    }

}