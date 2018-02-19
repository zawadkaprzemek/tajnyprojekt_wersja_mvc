<?php
$action=$_SERVER['PHP_SELF'];
?>

<div class="col-sm-12 upload">
    <form id="fileupload" action="<?php echo $action;?>" method="POST" enctype="multipart/form-data">
        <div class="row fileupload">
            <div class="col-lg-10">

                <span class="btn btn-success fileinput-button">
                    <i class="glyphicon glyphicon-plus"></i>
                    <span>Dodaj zdjęcia...</span>
                    <input type="file" name="files[]" id="addfiles" accept="image/*" multiple>
                </span>
                <input type="radio" id="public" name="gallery" value="public" checked>
                <label for="public">Publiczna galeria</label>
                <input type="radio" id="private" name="gallery" value="private">
                <label for="private">Prywatna galeria</label>
                <input type="hidden" value="ADD" name="method">
                <?php
                if(stristr($_SERVER['PHP_SELF'],'my_profile')=='my_profile'){
                    $user=$_SESSION['user_data']['name'];
                }else{
                    $user=$model['user_name'];
                }
                ?>
                <input type="hidden" value="<?php echo $user;?>" name="user">

            </div>
        </div>
    </form>
<div class="loading">
    <img src="<?php echo ROOT_PATH.'/assets/img/loading.gif';?>" alt="">
</div>
</div>