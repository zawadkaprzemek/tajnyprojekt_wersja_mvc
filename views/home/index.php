<?php
include (dirname(__FILE__).'/../pay_checkout.php');
?>
<div class="text-center profile_list">
	<?php Messages::display()?>
<?php if($_SESSION['user_data']['account_type']=='1'){ ?>
	<div class="col-md-4 col-sm-6 profile buy_points list-unstyled">
		<div class="thumbnail">
			<p>Twoje konto: STANDARD</p>
			<h3>Zmień konto na VIP</h3>
			<ul>
				<li><i class="fa fa-check" aria-hidden="true"></i>nieograniczone wiadomości</li>
				<li><i class="fa fa-check" aria-hidden="true"></i>dostęp do pełnej bazy użytkowników</li>
				<li><i class="fa fa-check" aria-hidden="true"></i>baza seks-filmów użytkowniczek</li>
			</ul>
			<p>Kliknij w przycisk poniżej i raz na zawsze zmień swoje konto na VIP teraz:</p>
			<a href="<?php echo ROOT_URL.'doladuj'?>"><button class="btn btn-info">Zmień konto na VIP</button></a>
		</div>
	</div>
<?php }
foreach($model['profiles'] as $profile){
	user_profile($profile);
}
if(($_SESSION['user_data']['account_type']==1)&&(HomeController::getRequest()==10)){?>
	<div class="col-md-4 col-sm-6 profile buy_points list-unstyled">
		<div class="thumbnail">
			<p>Twoje konto: STANDARD</p>
			<h3>Zmień konto na VIP</h3>
			<ul>
				<li><i class="fa fa-check" aria-hidden="true"></i>nieograniczone wiadomości</li>
				<li><i class="fa fa-check" aria-hidden="true"></i>dostęp do pełnej bazy użytkowników</li>
				<li><i class="fa fa-check" aria-hidden="true"></i>baza seks-filmów użytkowniczek</li>
			</ul>
			<p>Kliknij w przycisk poniżej i raz na zawsze zmień swoje konto na VIP teraz:</p>
			<a href="doladuj.php"><button class="btn btn-info">Zmień konto na VIP</button></a>
		</div>
	</div>
<?php }
?>
	<div class="clearfix"></div>
</div>
<div class="col-sm-8 col-xs-12 col-xs-offset-0 col-sm-offset-2 text-center">
	<ul class="pagination">
		<?php
		$page=(HomeController::getRequest()!=''? HomeController::getRequest(): 1);
		$paginate_range=3;
		$pp=($_SESSION['user_data']['account_type']==2? 12: 11);
		$pages=ceil($model['profiles_count']['profiles_count']/$pp);
		if(($_SESSION['user_data']['account_type']=='1')&&($pages>10)){
				$pages=10;
		}

		if($page>1){?>
			<li><a href="<?php echo ROOT_URL.'home/page/'.($page-1);?>">«</a></li>
		<?php }
		$range=$paginate_range;
		$initial_num = $page - $range;
		$condition_limit_num = ($page + $range)  + 2;

		for ($x=$initial_num; $x<$condition_limit_num; $x++) {

			// be sure '$x is greater than 0' AND 'less than or equal to the $total_pages'
			if (($x > 0) && ($x <= $pages)) {

				// current page
				if ($x == $page) {
					echo '<li class="active"><span>'.$x.'</span></li>';
				}

				// not current page
				else {
					echo '<li><a href="'.ROOT_URL.'home/page/'.$x.'">'.$x.'</a></li>';
				}
			}
		}
		if($page<$pages){?>
		<li><a href="<?php echo ROOT_URL.'home/page/'.($page+1);?>">»</a></li></ul>
	<?php }

	?>

</div>