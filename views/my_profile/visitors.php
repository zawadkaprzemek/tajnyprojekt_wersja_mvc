<?php
include (dirname(__FILE__).'/../pay_checkout.php');
?>
    <div class="visitors text-center col-sm-12 ">
        <?php if($_SESSION['user_data']['account_type']==2){?>
        <div class="profile_list">
            <h3>Goście Twojego profilu:</h3>
            <?php
            if(count($model)>0) {
                foreach ($model as $visit) {
                    user_profile($visit);
                }
            }else{ ?>
                <p class="alert alert-info">Jeszcze nikt nie odwiedził Twojego profilu</p>
            <?php }
            ?>
        </div>
        <?php }else{?>
            <p class="alert alert-warning">
                Opcja dostępna wyłącznie dla posiadaczy konta VIP, <a href="<?php echo ROOT_URL?>doladuj">zmień swoje konto
                    na VIP</a>
            </p>
        <?php } ?>
        <div class="clearfix"></div>
    </div>