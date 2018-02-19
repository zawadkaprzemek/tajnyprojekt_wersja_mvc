<?php
if($_SESSION['user_data']['usr_role']=='super_admin'){
$delete=true;
}else{
$delete=false;
}
$user=$model['user_name'];
$images=get_images(strtolower($user),'public');
$count=count($images);
?>
<div class="col-sm-12">
    <h4>Zdjęcia użytkownika</h4>
    <?php include(dirname(__FILE__).'/../photos/gallery.php')?>
    <div class="galleries panel panel-default">
        <div class="public-gallery">
            <div class="panel-heading">
                <h4 class="panel-title">Galeria publiczna <?php if($count>0){echo '<span>('.jednostki($count).')</span>';}?></h4>
            </div>
            <div class="panel-body">
                <?php
                if($count==0){
                    echo '<p>Użytkownik nie posiada jeszcze zdjęć w galerii</p>';
                }else{
                    print_images($images,$delete);
                }
                ?>
            </div>
        </div>
        <?php
        $images=get_images(strtolower($user),'private');
        $count=count($images,true);
        if(($count>0)||($_SESSION['user_data']['usr_role']=='super_admin')){ ?>
        <div class="private-gallery">
            <div class="panel-heading">
                <h4 class="panel-title">Galeria prywatna <?php if($count>0){echo '<span>('.jednostki($count).')</span>';}?></h4>
            </div>
            <div class="panel-body">
                <?php
                if(($_SESSION['user_data']['usr_role']=='super_admin')&&(!isset($_GET['ref_user']))){
                    $gall_perm=1;
                }else{
                    $guest=(isset($_GET['ref_user'])? $_GET['ref_user'] : $_SESSION['user_data']['name']);
                    $perm=ProfileController::gall_perm($model['user_name'],$guest);
                    if(@count($perm[0])>0){
                        $gall_perm=$perm[0]['status'];
                        $wfa=($perm[0]['status']==0 ? true : false);
                    }
                }
                if($count==0){
                    echo '<p>Użytkownik nie posiada jeszcze zdjęć w galerii</p>';
                }else{
                    if(@$gall_perm==1){
                        print_images($images,$delete);
                    }else{
                        no_permissions_gallery(@$wfa,$guest,$model['user_name']);
                    }
                }
                ?>
            </div>
        </div>
        <?php } ?>

    </div>
</div>
<?php
if($_SESSION['user_data']['usr_role']=='super_admin'){
    include(dirname(__FILE__).'/../photos/upload.php');
}
?>