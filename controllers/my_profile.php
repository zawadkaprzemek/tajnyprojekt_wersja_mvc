<?php
class My_profileController extends Controller{
    protected function getName() {
        return 'my_profile';
    }

    protected function Index(){
        $model = new My_profile();
        if($model->Index()!==false){
            $this->returnView('index', $model->Index());
        }else{
            $this->redirect('my_profile','edit');
        }

    }
    protected function Edit(){
        $model = new My_profile();
        $this->returnView('edit', $model->Index());
    }
    protected function Messages(){
        $model = new My_profile();
        if($model->Index()!==false){
            $this->returnView('messages', $model->Messages());
        }else{
            $this->redirect('my_profile','edit');
        }
    }
    protected function Visitors(){
        $model = new My_profile();
        if($model->Index()!==false) {
            $this->returnView('visitors', $model->Visitors());
        }else{
            $this->redirect('my_profile','edit');
        }
    }

    protected function NewMessages(){
        $model = new My_profile();
        return $model->NewMessages();
    }

    protected function NewVisitors(){
        $model = new My_profile();
        return $model->NewVisitors();
    }

    protected function Favorite(){
        $model = new My_profile();
        if($model->Index()!==false) {
            $this->returnView('favorite', $model->Favorite());
        }else{
            $this->redirect('my_profile','edit');
        }
    }

    protected function Notifications(){
        $model = new My_profile();
        if($model->Index()!==false) {
            $model->UpdateNotifications();
            $this->returnView('notifications', $model->Notifications());
        }else{
            $this->redirect('my_profile','edit');
        }
    }

    protected function NewNotifications(){
        $model = new My_profile();
        return $model->NewNotifications();
    }

    protected function GetAvatar(){
        $model= new My_profile();
        return $model->getAvatar();
    }

    protected function Update(){
        $post = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
        $model=new My_profile();
        if(isset($post['edit_profile'])){
            $model->update($post);
        }
        $this->redirect('my_profile');
    }
}