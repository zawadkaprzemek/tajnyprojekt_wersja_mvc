<div class="col-sm-12 notification" id="notifications">
    <h4>Powiadomienia</h4>
<?php
if(count($model)>0){
    foreach ($model as $not){
        echo '<div class="col-sm-10 panel panel-default notification-panel">
            <div class="panel-body">
            '.print_notification($not['type'],$not['user_to'],$not['user_from']).'
            <button type="button" class="close close-notif" data-dismiss="panel" data-notif="'.$not['id'].'" 
            aria-hidden="true">×</button>
            </div>
          </div>';
    }
}else{
    echo '<p class="alert alert-info">Brak powiadomień</p>';
}
?>
</div>