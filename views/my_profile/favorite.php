<?php
include (dirname(__FILE__).'/../pay_checkout.php');
?>
<div class="favorite_users text-center col-sm-12">
<?php if($_SESSION['user_data']['account_type']==2){ ?>
    <ul class="nav nav-tabs nav-pills nav-justified" role="tablist">
        <li class="active col-xs-6"><a href="#favorite" role="tab" data-toggle="tab">Ulubieni użytkownicy</a></li>
        <li class="col-xs-6"><a href="#blocked" role="tab" data-toggle="tab">Użytkownicy zablokowani</a></li>
    </ul>
    <div class="tab-content">
        <div class="tab-pane active" id="favorite">
            <div class="text-center profile_list">
            <?php
            if(count($model['favorite'])>0){
                foreach ($model['favorite'] as $profile){
                    user_profile($profile);
                }
            }else{
                echo '<p class="alert alert-info">Jeszcze żadnego z użytkowników naszego serwisu nie dodałeś do ulubionych</p>';
            }
            ?>
            </div>
        </div>
        <div class="tab-pane" id="blocked">
            <div class="text-center profile_list">
                <?php
                if(count($model['blocked'])>0){
                    foreach ($model['blocked'] as $profile){
                        user_profile($profile);
                    }
                }else{
                    echo '<p class="alert alert-info">Żaden z użytkowników naszego serwisu nie został przez Ciebie
                    zablokowany</p>';
                }
                ?>
                </div>
        </div>
        </div>
<?php
}else{
    echo '<p class="alert alert-warning">Opcja dostępna wyłącznie dla posiadaczy konta VIP, <a href="'.ROOT_URL
        .'doladuj">zmień swoje konto na VIP</a></p>';
}?>
</div>