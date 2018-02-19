<?php
if($_SESSION['user_data']['activate']==0){ ?>
    <div id="activatebox" class="modal modal-popup fade in" role="dialog" aria-hidden="true" data-keyboard="false" data-backdrop="static" style="opacity:1; display:none;">
            <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-body text-center">
                <form id="activateform" role="form" method="post">
                    <div class="form-group">
                        <label for="activatekey" class="alert alert-warning">Wprowadź kod aktywacyjny aby odblokować dostęp do serwisu</label>
                    <input class="form-control input-lg" type="text" value="" placeholder="Mój kod aktywacyjny" id="activatekey" name="activatekey" required>
                    </div>
                    <input type="submit" value="Aktywuję moje konto" name="submitkey" class="btn">
                    <p id="activate_error" class="alert alert-danger"></p>
                </form>
            </div>
        </div>
</div>

<script>
    $(document).ready(function () {
        $('#activatebox').modal({backdrop: 'static', keyboard: false}, 'show');
    });

</script>
<?php }
$req=explode("/",$_SERVER['REQUEST_URI']);
?>
<div class="container-fluid">
<div class="row">
    <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="row">
                <div class="col-sm-12">
                <div class="navbar-header">
                    <div class="search-container">
                    <form class="navbar-form navbar-left" method="post" role="search" action="<?php echo
                    ROOT_URL?>profile/search">
                        <div class="form-group">
                            <input type="text" name="search" id="search" class="form-control" value="" placeholder="Szukaj..." required>
                        </div>
                    </form>
                    </div>
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#main-menu">
                        <span class="sr-only">Nawigacja</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                    <div class="col-sm-6 col-xs-12 collapse navbar-collapse navbar-right" id="main-menu">
                        <ul class="nav navbar-nav text-right">
                            <li class="visible-sm visible-xs <?php if((in_array('home',$req))||(!isset
                                ($_SERVER['PATH_INFO']))){ echo 'active';}?>">
                                <a href="<?php echo ROOT_URL.'home'?>">
                                    <strong class="visible-xs-inline">Strona główna</strong>
                                    <i class="fa fa-home" aria-hidden="true"></i>
                                </a></li>
                            <li class="visible-sm visible-xs <?php if((in_array('my_profile',$req))&&(Controller::getAction()=='index')){ echo 'active';}?>">
                                <a href="<?php echo ROOT_URL.'my_profile'?>">
                                    <strong>Mój profil</strong>
                                    <i class="fa fa-user" aria-hidden="true"></i>
                                </a>
                            </li>
                            <li class="visible-sm visible-xs <?php if((in_array('my_profile',$req))&&(Controller::getAction()=='edit')){ echo 'active';}?>">
                                <a href="<?php echo ROOT_URL.'my_profile/edit'?>">
                                    <strong>Edytuj profil</strong>
                                    <i class="fa fa-pencil-square" aria-hidden="true"></i>
                                </a>
                            </li>
                            <li>
                            <?php
                            if($_SESSION['user_data']['account_type']=='2'){ ?>
                                <a href="#">
                                <span class="vip" title="Posiadasz konto VIP">
                                    <strong class="visible-xs-inline">Posiadasz konto VIP</strong>
                                <i class="fa fa-trophy" aria-hidden="true"></i>
                                </span></a>
                            <?php }else{
                                $pr=new Profile();
                                $coins=$pr->coins($_SESSION['user_data']['name']);
                                if(isset($coins)){ ?>
                                    <span class="coins" title="Posiadasz <?php echo $coins;?> punktów do wydania w naszym portalu">
                                    <i class="fa fa-gg-circle" aria-hidden="true"></i> <?php echo $coins;?>
                                    </span>
                 <a href="<?php echo ROOT_URL.'doladuj'?>" class="plus"><button title="Dodaj punkty"><i class="fa
                 fa-plus-circle" aria-hidden="true"></i></button> Dodaj punkty</a>
                                <?php }

                            }?>
                            </li>
                            <li <?php if((in_array('my_profile',$req))&&(Controller::getAction()=='messages')){ echo
                            'class="active"';}?>><a href="<?php echo ROOT_URL
                                    .'my_profile/messages'?>" class="messages" title="Wiadomości">
                                    <strong class="visible-xs-inline ">Wiadomości</strong>
                                    <i class="fa fa-comments-o" aria-hidden="true"></i>
                                    <?php
                                    if(@$mess>0){
                                        echo '<span class="red_circle">'.@$mess.'</span>';
                                    }
                                    ?>
                                </a></li>
                            <li class="visible-sm visible-xs <?php if((in_array('my_profile',$req))&&
                                (Controller::getAction()=='visitors')){ echo
                            'active';}?>">
                                <a href="<?php echo ROOT_URL.'my_profile/visitors'?>">
                                    <strong>Odwiedzili mnie</strong>
                                    <i class="fa fa-eye" aria-hidden="true"></i>
                                    <?php if (@$ilev>0) {?>
                                    <span class="red_circle"><?php echo @$ilev;?></span>
                                    <?php }?>
                                </a>
                            </li>
                            <li class="visible-sm visible-xs <?php if((in_array('my_profile',$req))&&
                                (Controller::getAction()=='favorite')){ echo
                            'active';}?>">
                                <a href="<?php echo ROOT_URL.'my_profile/favorite'?>">
                                    <strong>Ulubieni użytkownicy</strong>
                                    <i class="fa fa-star" aria-hidden="true"></i>
                                </a>
                            </li>
                            <li class="visible-sm visible-xs <?php if((in_array('videos',$req))&&
                                (Controller::getAction()=='index')){ echo 'active';}?>">
                                <a href="<?php echo ROOT_URL.'videos'?>">
                                    <strong>Filmy użytkowników</strong>
                                    <i class="fa fa-video-camera" aria-hidden="true"></i>
                                </a>
                            </li>
                            <li <?php if((in_array('my_profile',$req))&&(Controller::getAction()=='notifications')){
                                echo
                            'class="active"';}?>><a href="<?php echo ROOT_URL.'my_profile/notifications'?>" class="notification user"
                                   title="Powiadomienia">
                                    <strong class="visible-xs-inline">Powiadomienia</strong>
                                    <i class="fa fa-bell" aria-hidden="true"></i>
                                    <?php
                                    $newn=My_profileController::NewNotifications();
                                    if($newn>0){
                                        echo '<span class="red_circle">'.@$newn.'</span>';
                                    }
                                    ?>
                                </a></li>

                            <?php
                            if($_SESSION['user_data']['role']=='super_admin'){?>
                                <li><a href="<?php echo ROOT_URL.'users/notifications'?>" class="notification fake"
                                       title="Powiadomienia użytkowników">
                                        <strong class="visible-xs-inline">Powiadomienia użytkowników</strong>
                                        <i class="fa fa-bell" aria-hidden="true"></i>
                                    <?php
                                    $faken=UsersController::NewNotifications();
                                    if(@$faken>0){
                                        echo '<span class="red_circle">'.@$faken.'</span>';
                                    }
                                    ?>

                                </a></li>
                            <?php }?>

                            <li><a href="<?php echo ROOT_URL.'logout'?>" title="Wyloguj">
                                    <strong class="visible-xs-inline">Wyloguj</strong>
                                    <i class="fa fa-sign-out" aria-hidden="true"></i>
                                </a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </nav>
</div>
</div>