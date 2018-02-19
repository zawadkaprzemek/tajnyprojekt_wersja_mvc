<?php
class ProfileController extends Controller{
    protected function getName() {
        return 'profile';
    }

    protected function Index(){
        $this->redirect('home','index');
    }
    protected function Show($profile){
        $my=new My_profile();
        if($my->Index()!==false){
            if($profile==$_SESSION['user_data']['name']){
                $this->redirect('my_profile','index');
            }else{
                $model = new Profile();
                if($model->profile_exist($profile)){
                    ($_SESSION['user_data']['role']!='super_admin'?
                        $model->visit($profile,$_SESSION['user_data']['name']):
                        (isset($_GET['ref_user'])? $model->visit($profile,$_GET['ref_user']): null )
                    );
                    $this->returnView('show', $model->Show($profile));
                }else{
                    $this->redirect('home');
                }

            }
        }else{
            $this->redirect('my_profile','edit');
        }


    }
    protected function Message($profile){
        $my=new My_profile();
        if($my->Index()!==false){
            if($profile==$_SESSION['user_data']['name']){
                $this->redirect('my_profile','messages');
            }else{
                $model = new Profile();
                if($model->profile_exist($profile)) {
                    $this->returnView('message', $model->Message($profile));
                }else{
                    $this->redirect('home');
                }
            }
        }else{
            $this->redirect('my_profile','edit');
        }


    }
    protected function Write_message(){
        $post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
        $model = new Profile();
        if($model->is_blocked($post['user_to'],$post['user_from'])==false){
            if($_SESSION['user_data']['account_type']==2){
                $vip=true;
            }else if($model->coins($post['user_from'])>=MESSAGE_COST){
                $vip=false;
            }else{
                Messages::setMsg("Nie posiadasz wystarczającej ilości punktów aby napisać wiadomość", "error");
                $this->redirect('profile','message/'.$post['user_to']);
                return;
            }
            if(!$model->Write_message($post,$vip)){
                Messages::setMsg("Wystąpił nieoczekiwany błąd, spróbuj ponownie", "error");
            }
        }

        $this->redirect('profile','message/'.$post['user_to']);
    }

    protected function search($request=null){
        $my=new My_profile();
        if($my->Index()!==false){
            $post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
            if($request==null){
                if(isset($post['search'])){
                    $this->redirect('profile','search/'.$post['search']);
                }else{
                    $this->redirect('home');
                }
            }else{
                $model=new Profile();
                $this->returnView('search',$model->search($request));
            }
        }else{
            $this->redirect('my_profile','edit');
        }


    }
    protected function gall_perm($user,$guest){
        $model = new Profile();
        return $model->gallery_perm($user,$guest);
    }
    protected function is_favorite($user,$guest){
        $model = new Profile();
        return $model->is_favorite($user,$guest);
    }

    protected function is_blocked($user,$guest){
        $model = new Profile();
        return $model->is_blocked($user,$guest);
    }
}