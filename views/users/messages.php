<?php
$user_to=$model['users'][1]['name'];
$user_from=$model['users'][0]['name'];
$blocked=$model['users'][1]['is_blocked'];
?>
<div class="col-sm-12" id="chat" xmlns="http://www.w3.org/1999/html">
    <div class="panel panel-primary">
        <div class="panel-heading">
            <span class="glyphicon glyphicon-comment"></span>
            Chat z <a target='_blank' href='<?php echo ROOT_URL."profile/show/".$user_from;?>?ref_user=<?php echo
            $user_to?>'>
            <?php echo $user_from;?>
            </a>
            <?php
            if(is_vip($user_from,$model['users'][0]['account_type']!='')){
                echo is_vip($user_from, $model['users'][0]['account_type']);
            }else{
                echo '<i class="fa fa-gg-circle" aria-hidden="true"></i> '.$model['users'][0]['coins'];
            }
            ?>
        </div>
        <div class="panel-body">
            <ul class="chat">
                <?php
                if(count($model['mess'])>0){
                    foreach ($model['mess'] as $mess){
                        if($mess['user_from']==$user_to){
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
                if(@$blocked==true){
                    echo '<li>Użytkownik <strong>'.$model['users'][0]['name'].'</strong> zablokował Cie i nie 
                    chce z Tobą rozmawiać!</li>';
                    $disabled='disabled=true';
                }
                ?>
            </ul>
        </div>
        <div class="panel-footer">
            <form role="form" action="<?php echo ROOT_URL.'users/write_message'?>"
                  method="post" name="messageform" id="messageform" <?php echo @$disabled;?> >
                <div class="input-group">
                    <textarea id="message-input" <?php echo @$disabled;?> type="text" data-emojiable="true" name="message" class="form-control wdt-emoji-bundle-enabled wdt-emoji-open-on-colon input-sm" placeholder="..."
                              required></textarea>
                    <span class="input-group-btn">
                            <input type="submit" <?php echo @$disabled;?> class="btn btn-warning btn-sm" id="btn-chat" name="write_message" value="Wyślij"/>
                        </span>

                </div>
                <div class="form-group hidden">
                    <input type="hidden" name="user_from" value="<?php echo $user_to ?>">
                    <input type="hidden" name="user_to" value="<?php echo $user_from ?>">
                </div>
            </form>
            <div>
                <?php include('../'.ROOT_PATH.'assets/php/emoji-picker.php');?>
            </div>

        </div>

    </div>
</div>
<?php
include('../'.ROOT_PATH.'assets/php/emoji-script.php');
?>
