<?php
class UsersController extends Controller{	
	protected function getName() {
		return 'users';
	}

    public function index() {
        if($_SESSION['user_data']['role']=='super_admin') {
            $model = new User();
            $this->returnView('index', $model->index(@$_GET['sex']));
        }else{
            $this->redirect('home');
        }
    }

    public function registered_users() {
        if($_SESSION['user_data']['role']=='super_admin') {
            $model = new User();
            $this->returnView('index', $model->registered_users(@$_GET['sex']));
        }else{
            $this->redirect('home');
        }
    }

    public function add(){
        if($_SESSION['user_data']['role']=='super_admin') {
            $this->returnView('add');
        }else{
            $this->redirect('home');
        }
    }

    public function create(){
        if($_SESSION['user_data']['role']=='super_admin') {
            $post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
            $model = new User();
            if(isset($post['add_profile'])){
                if(!$model->exist($post['login'])){
                    if($model->create($post)){
                        $this->redirect('profile','show/'.$post['login']);
                    }else{
                        $this->redirect('users','add');
                    }
                }else{
                    Messages::setMsg("Podany nick jest już zajęty!", "error");
                    $this->redirect('users','add');
                }
            }else{
                $this->redirect('users','add');
            }
        }else{
            $this->redirect('home');
        }
    }

    protected function Edit($profile){
        if($_SESSION['user_data']['role']=='super_admin') {
            $model = new Profile();
            $this->returnView('edit', $model->Show($profile));
        }else{
            $this->redirect('home');
        }
    }

    protected function Update(){
        $post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
        $model=new User();
        if(isset($post['edit_profile'])){
            $model->update($post);
            $this->redirect('profile','show/'.$post['user']);
        }else{
            $this->redirect('users','edit/'.$post['user']);
        }
    }
    public function messages_list(){
        if($_SESSION['user_data']['role']=='super_admin') {
            $model = new User();
            $this->returnView('messages_list', $model->messages_list());
        }else{
            $this->redirect('home');
        }
    }

    public function messages($conversation){
        if($_SESSION['user_data']['role']=='super_admin') {
            $model = new User();
            $users = explode('-', $conversation);
            if (($model->exist($users[0])) && ($model->exist($users[1]))) {
                $this->returnView('messages', $model->messages($users));
            } else {
                $this->redirect('users', 'messages_list');
            }
        }else{
            $this->redirect('home');
        }
    }

    public function write_message(){
        $post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
        $model=new Profile();
        if($model->is_blocked($post['user_to'],$post['user_from'])==false){
            if($_SESSION['user_data']['account_type']==2){
                $vip=true;
            }else if($model->coins($post['user_from'])>=MESSAGE_COST){
                $vip=false;
            }else{
                Messages::setMsg("Nie posiadasz wystarczającej ilości punktów aby napisać wiadomość", "error");
                $this->redirect('users','messages/'.$post['user_from'].'-'.$post['user_to']);
                return;
            }
            if(!$model->Write_message($post,$vip)){
                Messages::setMsg("Wystąpił nieoczekiwany błąd, spróbuj ponownie", "error");
            }
        }
        $this->redirect('users','messages/'.$post['user_from'].'-'.$post['user_to']);
    }

    public function notifications(){
        if($_SESSION['user_data']['role']=='super_admin') {
            $model = new User();
            $this->returnView('notifications', $model->notifications());
        }else{
            $this->redirect('home');
        }
    }

    public function NewNotifications(){
        $model=new User;
        return $model->newNotifications();
    }

}