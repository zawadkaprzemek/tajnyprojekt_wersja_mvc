<?php
class LoginController extends Controller{
    protected function getName() {
        return 'login';
    }

    public function index(){
        $this->returnView('login','',false);
    }

    public function authenticate(){
        $model = new User();
        if ($model->login()) {
            $this->redirect('home');
        }
        else {
            Messages::setMsg("Niewłaściwy adres Email lub hasło!!!", "error");
            $this->redirect('login');
        }
    }
}