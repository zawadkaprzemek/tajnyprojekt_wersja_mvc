<?php
class VideosController extends Controller{
    protected function getName() {
        return 'videos';
    }

    protected function Index(){
        $my=new My_profile();
        if($my->Index()!==false){
            $model = new Videos();
            $this->returnView('index', $model->Index());
        }else{
            $this->redirect('my_profile','edit');
        }

    }
}