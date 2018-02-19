<?php
if($model['sex']=='w'){
    $sex="Kobieta";
}else{
    $sex="Mężczyzna";
}
if($model['date_birth']!=NULL){
    $age=db_to_age($model['date_birth']);
}else{
    $age=$model['age'];
}
$guest=(isset($_GET['ref_user'])? $_GET['ref_user'] : $_SESSION['user_data']['name']);
?>
<div class="profile_display">

    <div class="col-sm-4 col-xs-12">
        <img src="<?php echo ROOT_PATH.AVATAR_PATH.$model['avatar'];?>" class="img-responsive profile_img">
        <div class="col-xs-6 col-sm-12 col-sm-offset-0 col-xs-offset-3 btn-container">
        <a class="btn btn-default btn-message" href="<?php echo ROOT_URL?>profile/message/<?php echo
        $model['user_name'];?>">
            <i class="fa fa-envelope" aria-hidden="true"></i>
            Wyślij wiadomość</a>
            <?php if($_SESSION['user_data']['usr_role']=='super_admin'){ ?>
                    <a class="btn btn-default btn-message" href="<?php echo ROOT_URL?>users/edit/<?php echo
                    $model['user_name'];?>">
                        <i class="fa fa-pencil-square" aria-hidden="true"></i>
                        Edytuj profil</a>
            <?php } ?>
        </div>
    </div>
    <div class="col-sm-8 col-xs-12 user_name">
        <div class="col-sm-8">
            <h2><?php echo $model['user_name'].', '.@$age;?>&nbsp;
                <?php echo is_vip($model['user_name'],$model['account_type']);?>
            </h2>
        </div>
        <div class="col-sm-4 actions text-right">
            <?php if($_SESSION['user_data']['account_type']==2){
                ?>
            <input type="hidden" name="user_name" id="user_name" value="<?php echo $model['user_name']?>">
            <input type="hidden" name="guest_name" id="guest_name" value="<?php echo $guest?>">
            <?php
                $fav=ProfileController::is_favorite($guest,$model['user_name']);
                if($fav!=false){
                    $fclass=' on';
                    $ftitle='Usuń z ulubionych';
                }else{
                    $ftitle='Dodaj do ulubionych';
                }
            ?>
            <span class="favorite<?php echo @$fclass?>" title="<?php echo @$ftitle?>">
                <i class="fa fa-star-o" aria-hidden="true"></i></span>
            <?php
                $blc=ProfileController::is_blocked($guest,$model['user_name']);
                if($blc!=false){
                    $bclass=' on';
                    $btitle='Odblokuj użytkownika';
                }else{
                    $btitle='Zablokuj użytkownika';
                } ?>
            <span class="blocked<?php echo @$bclass?>" title="<?php echo @$btitle?>">
                <i class="fa fa-ban" aria-hidden="true"></i></span>
        <?php }?>
        </div>
     </div>
    <div class="user_info col-sm-8 col-xs-12">
        <div class="col-sm-4 col-xs-3 bold">Płeć:</div>
        <div class="col-sm-8 col-xs-9"><?php echo $sex?></div>
        <div class="col-sm-4 col-xs-3 bold">Stan cywilny:</div>
        <div class="col-sm-8 col-xs-9"><?php echo $model['state']?></div>
    </div>
    <div class="clearfix"></div>

    <div class="col-sm-12 col-xs-12 about_me">
        <p><strong>O mnie:</strong></p>
        <p><?php echo $model['info'];?></p>
    </div>
    <?php include('photos.php');?>
</div>