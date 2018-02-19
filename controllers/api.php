<?php
class ApiController extends Controller{
    protected function getName() {
        return 'api';
    }

    protected function Index(){
        $this->redirect('home','index');
    }

    protected function favorite(){
        $post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
        $model=new Profile();
        if(isset($post)){
            $is_fav=$model->is_favorite($post['user'],$post['user2']);
            if($is_fav!=false){
                $model->remove_favorite($post['user'],$post['user2']);
            }else{
                $model->add_favorite($post['user'],$post['user2']);
            }
            echo json_encode(array('resp'=>'success'));
        }else{
            $this->redirect('home');
        }

    }

    protected function blocked(){
        $post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
        $model=new Profile();
        if(isset($post)){
            $is_fav=$model->is_blocked($post['user'],$post['user2']);
            if($is_fav!=false){
                $model->remove_blocked($post['user'],$post['user2']);
            }else{
                $model->add_blocked($post['user'],$post['user2']);
            }
            echo json_encode(array('resp'=>'success'));
        }else{
            $this->redirect('home');
        }

    }


    protected function gallery_permissions($request){
        if(isset($_REQUEST)){
            $owner=$_REQUEST['owner'];
            $user=$_REQUEST['user'];
            $model = new Profile();
            switch ($request){
                case 'ask':
                    if($model->get_status($owner,$user)==false){
                        if($model->permission_ask_new($owner,$user)&&($model->add_notification($owner,$user,'1'))){
                            $resp='success';
                        }
                    }else{
                        if($model->notif_exist($owner,$user,'1')){
                            if($model->update_notification($owner,$user,'1','0')){
                                $resp='success';
                            }
                        }else{
                            if($model->add_notification($owner,$user,'1')){
                                $resp='success';
                            }
                        }
                    }
                    echo json_encode(array('resp'=>$resp));
                    break;
                case 'answer':
                    $notif_type=$_REQUEST['notif_type'];
                    switch ($notif_type){
                        case 1:
                            $answer=($_REQUEST['answer']=='yes'? 1 : 0);
                            $type=($_REQUEST['answer']=='yes'? 2 : 3);
                            $new_type=($_REQUEST['answer']=='yes'? 4 : 5);
                            if($answer){
                                $model->accept_permission($owner,$user);
                            }else{
                                $model->decline_permission($owner,$user);
                            }
                            $model->add_notification($user,$owner,$type);
                            $model->change_notification($owner,$user,$notif_type,$new_type);
                            $id=$model->get_notification_id($owner,$user,$new_type);
                            if($id!==false){
                                echo json_encode(array('resp'=>'success','id'=>$id));
                            }else{
                                echo json_encode(array('resp'=>'fail'));
                            }
                            break;
                        default:
                            break;
                    }
                    break;
                default:
                    break;
            }

        }

    }

    protected function notifications($action){
        $model=new Profile();
        switch ($action){
            case 'delete':
                $request=$_REQUEST;
                if($request['type']=='delete'){
                    $model->remove_notification($request['notif']);
                    echo json_encode(array('resp'=>'success'));
                }
                break;
            default:
                break;
        }
    }

    protected function order(){
        $post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
        $model=new Doladuj();
        $ob=$model->make_order($post['name'],$post['email']);
        if($model->save_order($post['name'],$ob->cookie,$ob->payment_link)){
            echo json_encode(array('resp'=>'success','link'=>$ob->payment_link));
        }

    }

    protected function check_payment(){
        $post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
        $model=new Doladuj();
        $status=$model->check_payment($post['cookie']);
        $resp=array('status'=>$status->status);
        if($status->status===true){
            $model->update_payment($post['user'],$post['cookie']);
            $model->update_account_type($post['user']);
            $resp['redir']=true;
            Messages::setMsg("Gratulacje! Twoja płatność przebiegła pomyślnie. Twoje konto zostało
            zmienione na VIP", "success");
        }
        echo json_encode($resp);

    }

    protected function check_code(){
        $post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
        $model=new Doladuj();
        $result=$model->check_code($post['s']);
        $response=array('status'=>$result['status'],'code'=>$result['code']);
        if($result['status']=='OK'&&$result['code']=='1001'){
            $model->add_coins($post['user']);
            $pr=new Profile();
            $response['coins']=$pr->coins($post['user']);
        }
        echo json_encode($response);
    }

    protected function activate(){
        $model= new User();
        $post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
        if(isset($post['key'])){
            if($post['key']==ACTIVATE_CODE){
                if($model->activate($_SESSION['user_data']['name'])===true){
                    $_SESSION['user_data']['activate']=1;
                    echo 1;
                }else{
                    echo 3;
                }
            }else{
                echo 2;
            }
        }
    }

    protected function gallery($action){
        $success=$error=0;
        switch($action){
            case 'upload':
                foreach ($_FILES['files']['name'] as $i => $name){
                $photo=new Photo($_REQUEST['user'],$_REQUEST['gallery'],$name,$_FILES['files']['tmp_name'][$i]);
                    if($photo->img&&$photo->thumb){
                        $success++;
                    }else{
                        $error++;
                    }
                }
                echo json_encode(array('success'=>$success,'error'=>$error));
                break;
            case 'delete':
                $arr= explode('/',$_REQUEST['image']);
                $image=$arr[(sizeof($arr)-1)];
                $photo= new Photo($_REQUEST['user'],$_REQUEST['gallery'],$image);
                try{
                    $photo->destroy();
                    $success++;
                }catch (Exception $e){
                    $error++;
                }
                echo json_encode(array('success'=>$success,'error'=>$error));
                break;
            default:
                echo json_encode(array('status'=>'error'));
                break;
        }
    }


    protected function register(){
        $headers=apache_request_headers();
        $tokens=unserialize(API_TOKENS);
        @$token=$headers['Authorization_Token_Key'];
        if(in_array($token,$tokens)){
            $post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
            $model=new User();
            $resp=$model->checkName($post['name']);
            if($resp===true){
                $resp=$model->checkEmail($post['email']);
                if($resp===true){
                    $resp=$model->checkPassword($post['password'],$post['rep_password']);
                    if($resp===true){
                        if($model->register($post)===true){
                            $resp=array('status'=>'ok','message'=>'Rejestracja udana');
                        }else{
                            $resp=array('status'=>'error','message'=>'Spróbuj ponownie');
                        }
                    }
                }
            }
            echo json_encode($resp);
        }else{
            echo json_encode(array('status'=>'error','message'=>'Authorization error'));
        }

    }

}