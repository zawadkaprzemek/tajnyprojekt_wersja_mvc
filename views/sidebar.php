<div class="user_logged">
    <div class="user_photo pull-left">
        <?php
        $avatar=(My_profileController::getAvatar()==NULL? 'default.png' : My_profileController::getAvatar());
        ?>
        <img src="<?php echo ROOT_PATH.AVATAR_PATH.$avatar;?>" class="img-responsive
        img-rounded" alt="<?php echo $_SESSION['user_data']['name']?>">
    </div>
    <div class="user_name">
        <p><a href="<?php echo ROOT_URL?>my_profile"><?php echo $_SESSION['user_data']['name'];?></a></p>
    </div>
    <div class="clearfix"></div>
</div>
<ul class="menu-list">
    <?php
    $req=explode("/",$_SERVER['REQUEST_URI']);
    ?>
<li <?php if((in_array('home',$req))||(!isset($_SERVER['PATH_INFO']))){ echo 'class="active"';}?>>
    <a href="<?php echo ROOT_URL?>home"><i class="fa fa-home" aria-hidden="true"></i>Strona główna</a>
</li>
<li <?php if((in_array('my_profile',$req))&&(Controller::getAction()=='index')){ echo 'class="active"';}?>>
    <a href="<?php echo ROOT_URL?>my_profile"><i class="fa fa-user" aria-hidden="true"></i>Mój profil</a>
</li>
<li <?php if((in_array('my_profile',$req))&&(Controller::getAction()=='edit')){ echo 'class="active"';}?>>
    <a href="<?php echo ROOT_URL?>my_profile/edit"><i class="fa fa-pencil-square" aria-hidden="true"></i>Edytuj profil</a>
</li>
<li <?php if((in_array('my_profile',$req))&&(Controller::getAction()=='messages')){ echo 'class="active"';}?>>
    <a href="<?php echo ROOT_URL?>my_profile/messages"><i class="fa fa-comments" aria-hidden="true"></i>Wiadomości
        <?php
        $nm=My_profileController::NewMessages();
        if($nm>0){
            echo '<span class="circle">'.$nm.'</span>';
        } ?>
    </a>
</li>
<li <?php if((in_array('my_profile',$req))&&(Controller::getAction()=='visitors')){ echo 'class="active"';}?>>
    <a href="<?php echo ROOT_URL?>my_profile/visitors"><i class="fa fa-eye" aria-hidden="true"></i>Odwiedzili mnie
        <?php
        $nv=My_profileController::NewVisitors();
        if($nv>0){
        echo '<span class="circle">'.$nv.'</span>';
        } ?>
    </a>
</li>
<li <?php if((in_array('my_profile',$req))&&(Controller::getAction()=='favorite')){ echo 'class="active"';}?>>
    <a href="<?php echo ROOT_URL?>my_profile/favorite"><i class="fa fa-star" aria-hidden="true"></i>Ulubieni
        użytkownicy</a>
</li>
<li <?php if((in_array('videos',$req))&&(Controller::getAction()=='index')){ echo 'class="active"';}?>>
    <a href="<?php echo ROOT_URL?>videos"><i class="fa fa-video-camera" aria-hidden="true"></i>Filmy użytkowników</a>
</li>
    <hr>
    <?php
    if($_SESSION['user_data']['role']=='super_admin'){?>
        <li <?php if((in_array('users',$req))&&(Controller::getAction()=='index')){ echo 'class="active"';}?>>
            <a href="<?php echo ROOT_URL?>users"><i class="fa fa-users" aria-hidden="true"></i>Lista
                użytkowników</a>
        </li>
        <li <?php if((in_array('users',$req))&&(Controller::getAction()=='registered_users')){ echo 'class="active"';
        }?>>
            <a href="<?php echo ROOT_URL?>users/registered_users"><i class="fa fa-registered" aria-hidden="true"></i>Zarejestrowani
                użytkownicy</a>
        </li>
        <li <?php if((in_array('users',$req))&&(Controller::getAction()=='add')){ echo 'class="active"';}?>>
            <a href="<?php echo ROOT_URL?>users/add"><i class="fa fa-user-plus" aria-hidden="true"></i>Dodaj użytkowników</a>
        </li>
        <li <?php if((in_array('users',$req))&&(Controller::getAction()=='messages_list')){ echo 'class="active"';}?>>
            <a href="<?php echo ROOT_URL?>users/messages_list"><i class="fa fa-comments-o" aria-hidden="true"></i>Lista wiadomości </a>
        </li>
        <hr>
    <?php }?>
<li><a href="<?php echo ROOT_URL?>logout"><i class="fa fa-sign-out" aria-hidden="true"></i>Wyloguj</a></li>
</ul>