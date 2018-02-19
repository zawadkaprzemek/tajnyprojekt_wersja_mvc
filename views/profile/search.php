<div class="search-results">
    <div class="col-sm-12"><h3>Wyniki wyszukiwania "<?php echo Controller::getRequest()?>":</h3></div>
    <div class="text-center profile_list">
        <?php
        if(count($model)>0){
            foreach ($model as $profile){
                user_profile($profile);
            }
        }else{?>
        <div class="col-sm-12"><p class="alert alert-info">Nie znaleziono żadnego użytkownika pasującego do podanej frazy:
                <?php echo Controller::getRequest();?></div>
        <?php }
        ?>
        <div class="clearfix"></div>
    </div>

</div>