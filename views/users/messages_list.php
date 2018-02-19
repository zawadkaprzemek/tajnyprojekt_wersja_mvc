<div class="col-sm-12" xmlns="http://www.w3.org/1999/html">
    <h2>Wiadomości do użytkowników:</h2>
    <div id="accordion" class="panel-group">
    <?php
    foreach ($model as $profile){ ?>
        <div class="panel panel-default">
            <div class="panel-heading">
                <h4 class="panel-title">
                    <a data-toggle="collapse" data-parent="#accordion"
                       href="#collapse_<?php echo $profile['name']; ?>">
                        <img src="<?php echo ROOT_PATH.AVATAR_PATH.$profile['avatar'];?>" class="img-responsive
                        img-rounded">
                        <?php echo $profile['name']; ?> - <strong>
                            <?php echo @$profile['unread'];?></strong>/<?php echo @$profile['all_m']?>
                    </a>
                </h4>
            </div>
            <div id="collapse_<?php echo $profile['name']; ?>" class="panel-collapse collapse">
                <div class="panel-body my_messages">
                    <div class="col-sm-12 messages_container">
                        <div class="col-sm-12 messages_top">
                            <div class="col-sm-6 col-sm-offset-2"><i class="fa fa-user fa-2x" aria-hidden="true" title="Użytkownik"></i></div>
                            <div class="col-sm-1 text-center"><i class="fa fa-comments-o fa-2x" aria-hidden="true" title="Liczba wiadomości"></i></div>
                            <div class="col-sm-3 text-center"><i class="fa fa-clock-o fa-2x" aria-hidden="true" title="Ostatnia wiadomość"></i></div>
                        </div>
                        <?php foreach ($profile['mess'] as $item){
                            $class=($item['unread']>0? 'bold': null);
                            $user=($item['user_to']==$profile['name']? $item['user_from'] : $item['user_to']);?>
                        <div class="col-sm-12 panel panel-default">
                            <a class="<?php echo $class; ?> panel-body"
                               href="<?php echo ROOT_URL.'users/messages/'.$profile['name'].'-'.$user?>">
                                <div class="col-sm-2">
                                    <img src="<?php echo ROOT_PATH.AVATAR_PATH. @$item['avatar'] ?>" class="img-responsive img-rounded">
                                </div>
                                <div class="col-sm-4">
                                    <?php echo $user; ?>
                                </div>
                                <div class="col-sm-3 text-center">Nieprzeczytane: <?php echo @$item['unread'] ?></div>
                                <div class="col-sm-3 text-center"><?php echo nice_data($item['date']) ?></div>
                            </a>
                        </div>
                        <?php }?>
                    </div>
                </div>
            </div>
        </div>
    <?php } ?>
    </div>
</div>
