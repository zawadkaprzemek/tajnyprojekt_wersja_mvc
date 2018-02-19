<div class="col-sm-12" id="notifications">
    <h4>Powiadomienia użytkowników</h4>
<?php
if(count($model)>0){?>
    <div class="panel-group" id="accordion">
    <?php foreach ($model as $user){
        //var_dump($user);
        $unread=0;
        foreach ($user['notf'] as $notif){
            ($notif['status']==0? $unread++ : null);
        }

        ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion" href="#collapse_<?php echo @$user['name']?>">
                    <?php echo @$user['name'].' '.@$unread.'/'.count($user['notf'])?>
                    </a>
                </h4>
            </div>
            <div id="collapse_<?php echo $user['name']?>" class="panel-collapse collapse">
                <div class="panel-body">
                    <div class="col-sm-12 notification" id="<?php echo $user['name']?>_notif">
                        <?php foreach ($user['notf'] as $notf){?>
                            <div class="col-sm-10 panel panel-default notification-panel">
                                <div class="panel-body">
                                    <?php echo print_notification($notf['type'],$notf['user_to'],$notf['user_from'],
                                        $notf['role'])?>
                                    <button type="button" class="close close-notif" data-dismiss="panel"
                                            data-notif="<?php echo $notf['id']?>" aria-hidden="true">×</button>
                                </div>
                            </div>
                        <?php } ?>
                    </div>
                </div>
            </div>
        </div>
    <?php }?>
    </div>
<?php }else{
    echo '<p class="alert alert-info">Brak powiadomień</p>';
}
?>
</div>