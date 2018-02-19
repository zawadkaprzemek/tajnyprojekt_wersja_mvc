<?php
if(($model['users_data']['account_type']=='1')&&($model['users_data']['coins']<20)){
    $disabled='disabled=true';
}
if($model['users_data']['is_blocked']!=0){
    $blocked=true;
    $disabled='disabled=true';
}
?>
<div class="col-sm-12" id="chat" xmlns="http://www.w3.org/1999/html">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <span class="glyphicon glyphicon-comment"></span> Chat z
            <?php echo "<a target='_blank' href='".ROOT_URL."profile/show/".$model['users_data']['user_to']."'>"
                .$model['users_data']['user_to']."</a>";?>
        </div>
        <div class="panel-body">
            <ul class="chat">
                <?php
                if(count($model['mess'])>0){
                    foreach ($model['mess'] as $mess){
                    if($mess['user_from']==$_SESSION['user_data']['name']){
                        $leftright='right';
                    }else{
                        $leftright='left';
                    }
                        ?>
                        <li class="<?php echo @$leftright; ?> clearfix"><span
                                class="chat-img pull-<?php echo $leftright; ?>">
                            <img src="<?php echo ROOT_PATH.AVATAR_PATH.'/'.$mess['avatar']; ?>" alt="User Avatar"
                                 class="img-rounded"/>
                        </span>
                            <div class="chat-body clearfix">
                                <div class="header">
                                    <strong class="primary-font <?php if ($leftright == 'right') {
                                        echo "pull-right";
                                    } ?>"><?php echo $mess['user_from'] ?></strong>
                                    <small class="<?php if ($leftright == 'left') {
                                        echo "pull-right";
                                    } ?> text-muted">
                                        <span class="glyphicon glyphicon-time"></span><?php echo nice_data
                                        ($mess['data_mess'])
                                        ?></small>
                                </div>
                                <p class="chat-message">
                                    <?php echo str_replace(array("\r\n", "\r", "\n"), " <br />",($mess['message'])) ?>
                                </p>
                            </div>
                        </li>
                    <?php } ?>

                <?php } else {
                    ?>
                    <li>Jeszcze nie ma żadnych wiadomości między Wami, zrób pierwszy krok i napisz...</li>
                <?php }
                if(($model['users_data']['account_type']=='1')&&($model['users_data']['coins']<20)){
                    ?>
                <li>
                    Masz konto standard i skończyły Ci się punkty. Chcesz dalej rozmawiać z użytkownikiem
                    <strong><?php echo $model['users_data']['user_to']?></strong>? Zmień teraz konto na VIP, albo
                    doładuj swoje konto punktami. Kliknij w poniższy przycisk.
                    <a href="<?php echo ROOT_URL.'doladuj/'?>" class="plus">
                        <button title="Dodaj punkty">
                            <i class="fa fa-plus-circle" aria-hidden="true"></i>
                        </button> Dodaj punkty
                    </a>
                </li>
               <?php }
                if(@$blocked==true){
                    echo '<li>Użytkownik <strong>'.$model['users_data']['user_to'].'</strong> zablokował Cie i nie 
                    chce z Tobą rozmawiać!</li>';
                }
                ?>
            </ul>
        </div>
        <div class="panel-footer">
            <form role="form" action="<?php echo ROOT_URL.'profile/write_message'?>"
                  method="post" name="messageform" id="messageform" <?php echo @$disabled;?> >
                <div class="input-group">
                    <textarea id="message-input" <?php echo @$disabled;?> type="text" data-emojiable="true" name="message" class="form-control wdt-emoji-bundle-enabled wdt-emoji-open-on-colon input-sm" placeholder="..."
                              required></textarea>
                    <span class="input-group-btn">
                            <input type="submit" <?php echo @$disabled;?> class="btn btn-warning btn-sm" id="btn-chat" name="write_message" value="Wyślij"/>
                        </span>

                </div>
                <div class="form-group hidden">
                    <input type="hidden" name="user_to" value="<?php echo $model['users_data']['user_to'] ?>">
                    <input type="hidden" name="user_from" value="<?php echo $_SESSION['user_data']['name'] ?>">
                </div>
            </form>
            <div>
                <?php include('../'.ROOT_PATH.'assets/php/emoji-picker.php');?>
            </div>

        </div>

    </div>
    <?php Messages::display(); ?>
</div>
<?php
include('../'.ROOT_PATH.'assets/php/emoji-script.php');
?>
