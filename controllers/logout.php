<?php
class LogoutController extends Controller{
    protected function getName() {
        return 'logout';
    }

    public function index(){
        unset($_SESSION['is_logged_in']);
        unset($_SESSION['user_data']);
        Messages::setMsg('Wylogowano', 'success');
        // Redirect
        $this->redirect('login');
    }
}