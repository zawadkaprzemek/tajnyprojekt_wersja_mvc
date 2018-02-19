<?php
include (dirname(__FILE__).'/../pay_checkout.php');
?>
<div class="col-sm-12 my_messages">
    <h3>Moje wiadomości:</h3>
    <?php
    if(count($model)>0) {?>
    <div class="col-sm-12 messages_container">
        <?php foreach ($model as $item) {
            $class = ($item['unread'] > 0 ? "bold" : "");
            $item['date'] = nice_data($item['date']);
            ?>
            <div class="col-sm-12 panel panel-default">
                <a class="<?php echo @$class; ?> panel-body" href="<?php echo ROOT_URL.'profile/message/'.$item['user_to'] ?>">
                    <div class="col-sm-2 col-xs-3 mess_avatar">
                        <img src="<?php echo ROOT_PATH . AVATAR_PATH . @$item['avatar'] ?>"
                             class="img-responsive img-rounded"></div>
                    <div class="col-sm-4 col-xs-3 mess_name">
                        <i class="fa fa-user fa-2x" aria-hidden="true" title="Użytkownik"></i>
                        <?php echo(@$item['user_to'] == $_SESSION['user_data']['name'] ? @$item['user_from'] : @$item['user_to']) ?>
                    </div>
                    <div class="col-sm-3 col-xs-2 text-center">
                        <i class="fa fa-comments-o fa-2x" aria-hidden="true" title="Liczba wiadomości"></i>
                        <?php echo @$item['ile'] ?>
                    </div>
                    <div class="col-sm-3 col-xs-4 text-center">
                        <i class="fa fa-clock-o fa-2x" aria-hidden="true" title="Ostatnia wiadomość"></i>
                        <?php echo @$item['date'] ?>
                    </div>
                </a>
            </div>
        <?php } ?>
        </div>
    <?php }else{ ?>
        <p class="alert alert-info">Jeszcze nie masz żadnych wiadomości, zrób pierwszy krok i napisz do naszych użytkowników</p>
    <?php }
    ?>
</div>

