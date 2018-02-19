<?php
class DoladujController extends Controller{
    protected function getName() {
        return 'doladuj';
    }

    protected function Index(){
        $model= new Doladuj();
        $this->returnView('index',$model->Index());
    }

}