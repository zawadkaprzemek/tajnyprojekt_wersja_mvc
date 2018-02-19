<div class="col-sm-12">
    <ul class="nav nav-pils">
        <li class="col-sm-4 <?php if(isset($_GET['sex'])&&($_GET['sex']=='w')){echo 'active';}?>">
            <a href="<?php echo ROOT_URL.'users/'.UsersController::getAction().'?sex=w'?>">
                Kobiety <i class="fa fa-female" aria-hidden="true"></i>
            </a>
        </li>
        <li class="col-sm-4 <?php if(isset($_GET['sex'])&&($_GET['sex']=='m')){echo 'active';}?>">
            <a href="<?php echo ROOT_URL.'users/'.UsersController::getAction().'?sex=m'?>">
                Mężczyźni <i class="fa fa-male" aria-hidden="true"></i>
            </a>
        </li>
        <li class="col-sm-4 <?php if(!isset($_GET['sex'])){echo 'active';}?>">
            <a href="<?php echo ROOT_URL.'users/'.UsersController::getAction()?>">
                Wszyscy <i class="fa fa-female" aria-hidden="true"></i>
                <i class="fa fa-male" aria-hidden="true"></i>
            </a>
        </li>
    </ul>
    <div class="tab-content">
        <?php
        foreach($model as $profile) {?>
            <div class="col-sm-4">
                <img src="<?php echo ROOT_PATH.AVATAR_PATH.'/'.$profile['avatar']?>" class="img-responsive" alt="">
                <p class="user_name"><?php echo $profile['name'];?></p>
                <p><a class="btn btn-default" href="<?php echo ROOT_URL.'profile/show/'.$profile['name'];?>">Pokaż
                        profil</a>
                    <a class="btn btn-default" href="<?php echo ROOT_URL.'users/edit/'.$profile['name'];?>">Edytuj
                    profil</a></p>
            </div>
        <?php }
        ?>
    </div>
</div>