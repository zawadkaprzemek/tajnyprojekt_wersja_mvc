<?php if(isset($_SESSION['is_logged_in'])){ ?>
<!DOCTYPE html>
<html lang="pl">
<head>
	<title><?php echo PAGE_TITLE?></title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="robots" content="noindex, nofollow" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<meta http-equiv="Expires" content="Mon, 26 Jul 1997 05:00:00 GMT">
	<meta http-equiv="Pragma" content="no-cache">
	<link rel="stylesheet" type="text/css" href="<?php echo ROOT_PATH; ?>assets/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="<?php echo ROOT_PATH; ?>assets/css/font-awesome.min.css">
	<link href="<?php echo ROOT_PATH; ?>assets/css/emoji.css" rel="stylesheet">
	<link href="<?php echo ROOT_PATH; ?>assets/css/jquery.modal.css" rel="stylesheet">
	<link href="https://afeld.github.io/emoji-css/emoji.css" rel="stylesheet">
	<link rel="stylesheet" href="<?php echo ROOT_PATH; ?>assets/css/wdt-emoji-bundle.css"/>
	<link rel="stylesheet" type="text/css" href="<?php echo ROOT_PATH; ?>assets/css/chat.css">
	<link rel="stylesheet" type="text/css" href="<?php echo ROOT_PATH; ?>assets/css/main.css">
	<link rel="stylesheet" type="text/css" href="<?php echo ROOT_PATH; ?>assets/css/portfel.css">
	<link rel="stylesheet" type="text/css" href="<?php echo ROOT_PATH; ?>assets/css/rwd.css">
	<script type="text/javascript" src="<?php echo ROOT_PATH; ?>assets/js/jquery.js"></script>
	<script type="text/javascript" src="<?php echo ROOT_PATH; ?>assets/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<?php echo ROOT_PATH; ?>assets/js/scripts.js"></script>
	<script src="<?php echo ROOT_PATH; ?>assets/js/przemo-gallery.js"></script>
	<script src="<?php echo ROOT_PATH; ?>assets/js/gallery-upload.js"></script>
	<script type="text/javascript" src="<?php echo ROOT_PATH; ?>assets/js/emoji.min.js"></script>
	<script type="text/javascript" src="<?php echo ROOT_PATH; ?>assets/js/wdt-emoji-bundle.js"></script>
	<script type="text/javascript" src="<?php echo ROOT_PATH; ?>assets/js/jquery.modal.js"></script>
</head>
<body>
<?php
require_once ('header.php');
?>
	<section>
		<div class="container">
			<div class="row">
				<div class="col-sm-12">
					<div class="col-sm-9 main pull-right">
						<?php require($view); ?>
					</div>
					<div class="col-sm-3 sidebar">
						<?php
						require_once ('sidebar.php');
						?>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>
<?php }else{
	header("Location: ".ROOT_URL."login");
}?>