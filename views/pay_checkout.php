<?php if($_SESSION['user_data']['account_type']==1){
    $vip_order=new Doladuj();
    $order=$vip_order->Index();
    if($order!=false){
        $cookie=$order['cookie'];
        $pay_link=$order['pay_link'];
        ?>
        <div class="panel panel-warning pay_checkout">
            <div class="panel-heading"><p>Zamówiłeś konto VIP. Twoja płatność obecnie jest weryfikowana.<br>Gdy tylko zaksięgujemy środki, Twoje
                    konto zmieni się w konto VIP.</p></div>
            <div class="panel-body loading_container">
                <p class="pay_info">Kliknij poniżej, aby sprawdzić status płatności, lub - jeśli jeszcze tego nie
                    zrobiłeś - aby opłacić konto VIP.</p>
                <input type="hidden" name="cookie" id="cookie" value="<?php echo $cookie;?>">
                <input type="hidden" name="user_name" id="user" value="<?php echo $_SESSION['user_data']['name'];?>">
                <button class="btn btn-warning check_vip">Sprawdź status swojej płatności</button>
                <a href="<?php echo $pay_link;?>"><button class="btn btn-info">Opłać VIP</button></a>
                <div class="loading">
                    <img src="<?php echo ROOT_PATH?>assets/img/loading.gif" alt="">
                </div>
            </div>
        </div>
    <?php }
} ?>