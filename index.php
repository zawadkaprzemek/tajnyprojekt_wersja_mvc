<?php
require_once "vendor/autoload.php";
session_start();

require('config.php');

$bootstrap = new Bootstrap(str_replace('xplayroom2/','',$_SERVER['REQUEST_URI']));
$controller = $bootstrap->createController();
if($controller){
	$controller->executeAction();
}