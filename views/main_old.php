<html>
<head>
	<title><?php echo PAGE_TITLE; ?></title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
	<link rel="stylesheet" href="<?php echo ROOT_PATH; ?>assets/css/style.css" />
</head>
<body>
	<nav class="navbar navbar-default">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Ogłoszenia</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
          <ul class="nav navbar-nav">
            <li><a href="<?php echo ROOT_URL; ?>">Start</a></li>
            <li><a href="<?php echo ROOT_URL; ?>ads">Ogłoszenia</a></li>
          </ul>

          <ul class="nav navbar-nav navbar-right">
            <?php if(isset($_SESSION['is_logged_in'])) : ?>
            <li><a href="<?php echo ROOT_URL; ?>">Witaj <?php echo $_SESSION['user_data']['name']; ?></a></li>
            <li><a href="<?php echo ROOT_URL; ?>users/logout">Wyloguj</a></li>
          <?php else : ?>
            <li><a href="<?php echo ROOT_URL; ?>users/login">Zaloguj</a></li>
            <li><a href="<?php echo ROOT_URL; ?>users/register">Zarejestruj</a></li>
          <?php endif; ?>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

    <div class="container">

     <div class="row">
      <div class="col-xs-12 col-md-6 col-md-offset-3">
        <?php Messages::display(); ?>
     	  <?php require($view); ?>
      </div>
     </div>

    </div>
</body>
</html>