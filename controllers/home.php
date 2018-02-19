<?php
class HomeController extends Controller{	
	protected function getName() {
		return 'home';
	}

	protected function Index(){
		$model = new Home();
		$this->returnView('index',array('profiles'=>$model->Page(1),'profiles_count'=>$model->CountProfiles()));
	}
    protected function Page($page){
        $model = new Home();
        $profiles_count=$model->CountProfiles()['profiles_count'];
        $pp=($_SESSION['user_data']['account_type']==2? 12: 11);
        if(($_SESSION['user_data']['account_type']==1)&&($page>10)){
              $this->redirect('home','page/10');
        }
        if(($page<1)||($page>ceil($profiles_count/$pp))){
            $this->redirect('home');
        }else{
            $this->returnView('index',array('profiles'=>$model->Page($page),'profiles_count'=>$model->CountProfiles()));
        }

    }
}