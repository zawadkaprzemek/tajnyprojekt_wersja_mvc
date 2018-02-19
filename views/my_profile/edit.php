<?php
if($model['sex']=='w'){
    $sex="Kobieta";
}else{
    $sex="Mężczyzna";
}
?>

<script type="text/javascript" src="<?php echo ROOT_PATH?>/assets/js/cropbox.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
    $(function() {
        $("#date_birth" ).datepicker({
            dateFormat: 'yy-mm-dd',
            maxDate:"-18Y",
            changeMonth: true,
            changeYear: true,
            showOn: "both",
            buttonImage: "<?php echo ROOT_PATH?>/assets/img/calendar.gif",
            buttonImageOnly: true,
            buttonText: "Wybierz datę urodzenia"
        });
    });
</script>
<div class="form_container">
    <form role="form" action="<?php echo ROOT_URL?>my_profile/update" method="post" name="editprofileform"
          id="editprofileform"
          enctype="multipart/form-data">
        <div class="col-sm-12"><h3><?php echo ($model==false ? 'Uzupełnij profil' : 'Edytuj profil')?></h3></div>
        <div class="form-group col-sm-8 col-md-8">
            <label for="state">Stan cywilny:</label>
            <input type="text" class="form-control" id="state" name="state" value="<?php echo $model['state'];?>"
                   required>
        </div>
        <div class="clearfix"></div>
        <div class="form-group col-sm-8">
            <label for="info">O mnie:</label>
            <textarea class="form-control col-sm-8" name="info" id="info" required><?php echo $model['info'];
                ?></textarea>
        </div>
        <div class="clearfix"></div>
        <div class="form-group col-sm-12 cropbox-container">
            <label for="file">Avatar:</label>
            <div class="imageBox">
                <div class="thumbBox"></div>
                <div class="spinner" style="display: none">Loading...</div>
            </div>
            <div class="action row">
                <div class="col-xs-5">
                <span class="btn btn-primary fileinput-button">
                    <i class="glyphicon glyphicon-plus"></i>
                    <span>Wybierz zdjęcie...</span>
                    <input type="file" name="file" id="file" accept="image/*" <?php if($model['avatar']==''){echo
                    "required";
                    }?>>
                </span>
                    <p class="help-block hidden">Plik musi być zdjęciem i nie może zajmować więcej niż 2MB</p>
                </div>
                <div class="col-xs-7">
                    <input type="button" id="btnCrop" class="btn btn-default crop" value="Ustaw jako avatar">
                    <input type="button" id="btnZoomIn" class="btn btn-default resize" value="+">
                    <input type="button" id="btnZoomOut" class="btn btn-default resize" value="-">
                </div>
                <div class="clearfix"></div>
                <p class="help-block">Plik musi być zdjęciem i nie może zajmować więcej niż 2MB</p>
            </div>
            <div style="display: none;">
                <input type="hidden" name="avatar" id="avatar" value="">
                <input type="hidden" name="old_avatar" id="old_avatar" value="<?php echo $model['avatar'];?>">
            </div>
        </div>
        <div class="col-sm-12 hidden">
            <p class="bold">Podgląd:</p>
            <div class="cropped">
                <?php if($model['avatar']!=''){?>
                    <img src="<?php echo ROOT_PATH.AVATAR_PATH.$model['avatar']?>" class="img-responsive">
               <?php } ?>
            </div>
        </div>
        <div class="clearfix"></div>
        <?php if(!isset($model['sex'])){?>
        <div class="radio col-sm-8">
            <div class="btn-group" data-toggle="buttons">
                <label class="btn btn-primary">
                    <input type="radio" name="sex" value="w" required> <i class="fa fa-female" aria-hidden="true"> Kobieta</i>
                </label>
                <label class="btn btn-primary">
                    <input type="radio" name="sex" value="m" required> <i class="fa fa-male" aria-hidden="true"> Mężczyzna</i>
                </label>
            </div>
        </div>
        <?php }?>
        <div class="clearfix"></div>
        <?php if($model['date_birth']==''){?>
        <div class="form-group col-sm-6">
            <label for="date_birth">Data urodzenia:</label>
            <p><input type="date" class="form-control" id="date_birth" name="date_birth" value="<?php echo $model['date_birth'];?>" required></p>
        </div>
        <?php }?>
        <div class="clearfix"></div>
        <div class="col-sm-8">
        <input type="hidden" name="user" id="user" value="<?php echo $_SESSION['user_data']['name']?>" />
        <input type="submit" name="edit_profile" class="btn btn-default" value="Zapisz zmiany" />
        </div>
        <div class="clearfix"></div>
    </form>
</div>


<script type="text/javascript">
    window.onload = function() {
        var options =
        {
            imageBox: '.imageBox',
            thumbBox: '.thumbBox',
            spinner: '.spinner',
            imgSrc: '<?php echo ROOT_PATH.AVATAR_PATH.$model['avatar']?>'
        }
        var cropper = new cropbox(options);
        document.querySelector('#file').addEventListener('change', function(){
            var reader = new FileReader();
            reader.onload = function(e) {
                options.imgSrc = e.target.result;
                cropper = new cropbox(options);
            }
            reader.readAsDataURL(this.files[0]);
            this.files = [];
        })
        document.querySelector('#btnCrop').addEventListener('click', function(){
            var img = cropper.getDataURL();
            document.querySelector('.cropped').innerHTML = '<img src="'+img+'" class="img-responsive">';
            document.getElementById('avatar').value=img;
        })
        document.querySelector('#btnZoomIn').addEventListener('click', function(){
            cropper.zoomIn();
        })
        document.querySelector('#btnZoomOut').addEventListener('click', function(){
            cropper.zoomOut();
        })
    };
</script>
