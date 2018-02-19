<?php
include (dirname(__FILE__).'/../pay_checkout.php');
?>
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
if($_SESSION['user_data']['account_type']==2) {
    if($_SESSION['user_data']['name']==$model['user_name']){
        $title='Posiadasz konto VIP';
    }else{
        $title='Ten użytkownik posiada konto VIP';
    }
    $vip='<span class="vip" title="'.$title.'"><i class="fa fa-trophy" aria-hidden="true"></i></span>';
}

?>
<div class="profile_display">

    <div class="col-sm-4 col-xs-12">
        <img src="<?php echo ROOT_PATH.AVATAR_PATH.$model['avatar'];?>" class="img-responsive profile_img">
    </div>
    <div class="col-sm-8 col-xs-12 user_name">
        <div class="col-sm-8">
            <h2><?php echo $model['user_name'].', '.@$age;?>&nbsp;
                <?php echo (isset($vip) ? $vip : null);?>
            </h2>
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
    <?php include(dirname(__FILE__).'/../photos/photos.php');?>
</div>