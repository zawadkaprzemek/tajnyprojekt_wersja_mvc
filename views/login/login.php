<?php if(!isset($_SESSION['is_logged_in'])){ ?>
<!DOCTYPE html>
<html>
<head>
    <title><?php echo PAGE_TITLE?></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="robots" content="noindex, nofollow" />
    <link rel="stylesheet" type="text/css" href="<?php echo ROOT_PATH; ?>assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<?php echo ROOT_PATH; ?>assets/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="<?php echo ROOT_PATH; ?>assets/css/login.css">
    <script type="text/javascript" src="<?php echo ROOT_PATH; ?>assets/js/jquery.js"></script>
    <script type="text/javascript" src="<?php echo ROOT_PATH; ?>assets/js/bootstrap.min.js"></script>

</head>
<body>

<div class="container">
    <div class="row">
        <div class="col-md-12 col-sm-12 login_page">
            <div class="col-sm-12 white_bg">
                <div class="col-sm-12 girl_bg">
                    <div class="col-sm-5 col-xs-8 text-center white_bg">
                        <img src="<?php echo ROOT_PATH; ?>assets/img/logo1.jpg" alt="<?php echo PAGE_TITLE?>"
                             class="img-responsive">
                        <form role="form" action="<?php echo ROOT_URL; ?>login/authenticate" method="post"
                              name="loginform">
                            <fieldset>
                                <div class="form-group">
                                    <input type="text" name="email" placeholder="Adres Email" required class="form-control" />
                                </div>
                                <div class="form-group">
                                    <input type="password" name="password" placeholder="Hasło" required class="form-control" />
                                </div>
                                <div class="form-group">
                                    <input type="submit" name="login" value="Zaloguj się" class="btn btn-default
                                    btn-lg btn-block" />
                                </div>
                                <?php Messages::display(); ?>&nbsp;
                            </fieldset>
                        </form>
                    </div>
                    <div class="clearfix"></div>
                    <div class="col-sm-5 col-xs-8 only_text text-center">
                        <p>Ponad <span>44540</span> anonimowych użytkowników!</p>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div class="col-sm-12 logotypes text-center">
                    <img src="<?php echo ROOT_PATH; ?>assets/img/logotypes.jpg" class="img-responsive">
                </div>
                <div class="col-sm-12 text-center service_name">
                    <p><?php echo PAGE_TITLE?> - <?php echo $_SERVER['HTTP_HOST']?></p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
<?php }else{
   header("Location: ".ROOT_URL);
}?>