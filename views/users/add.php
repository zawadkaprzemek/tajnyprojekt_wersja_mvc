<div class="form_container ">
    <form role="form" action="<?php echo ROOT_URL?>users/create" method="post" name="addprofileform"
          id="addprofileform" enctype="multipart/form-data">
        <div class="col-sm-12">
            <br>
            <?php Messages::display(); ?>
        </div>
        <div class="col-sm-12"><h2>Dodaj nowego użytkownika</h2></div>
        <div class="form-group col-sm-8 col-md-8">
            <label for="state">Login:</label>
            <input type="text" class="form-control" id="login" name="login" value=""
                   pattern="[a-zA-Z0-9]{5,20}"
                   title="Login nie powinien zawierać polskich liter i znaków specjalnych, od 5 do 20 znaków"
                   required>
        </div>
        <div class="clearfix"></div>
        <div class="form-group col-sm-8 col-md-8">
            <label for="state">Stan cywilny:</label>
            <input type="text" class="form-control" id="state" name="state" value="" required>
        </div>
        <div class="clearfix"></div>
        <div class="form-group col-sm-8">
            <label for="info">O mnie:</label>
            <textarea class="form-control col-sm-8" name="info" id="info" placeholder="..." required></textarea>
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
                    <input type="file" id="file" name="file" accept="image/*" required>
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
            </div>
        </div>
        <div class="col-sm-4 hidden">
            <p class="bold">Podgląd:</p>
            <div class="cropped">
            </div>
        </div>
        <div class="clearfix"></div>
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
        <div class="clearfix"></div>
        <div class="form-group col-sm-6">
            <label for="date_birth">Wiek:</label>
            <input type="number" class="form-control" id="age" name="age" min="18" max="100" value="" required>
        </div>
        <div class="clearfix"></div>
        <div class="col-sm-8">
        <input type="submit" name="add_profile" class="btn btn-default" value="Dodaj nowego użytkownika" />
        </div>
        <div class="clearfix"></div>
    </form>
</div>

<script type="text/javascript" src="<?php echo ROOT_PATH?>assets/js/cropbox.js"></script>
<script type="text/javascript">
    window.onload = function() {
        var options =
        {
            imageBox: '.imageBox',
            thumbBox: '.thumbBox',
            spinner: '.spinner',
            imgSrc: ''
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
