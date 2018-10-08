<?php

// Define DB Params
define("DB_HOST", "localhost");
define("DB_USER", "root");
define("DB_PASS", "");
define("DB_NAME", "dyskretna_przygoda");

// Define URL
define("ROOT_PATH", "/xplayroom2/");
define("ROOT_URL", "/xplayroom2/");

//zmienne do api
define('API_TOKENS',serialize(array(md5(md5("DyskretnaPrzygoda")),md5(md5("PrzygodaDyskretna")))));

//dodatkowe zmienne
define("PAGE_TITLE",'Dyskretna przygoda');
define("DISPLAY_TRUE",false);
define("AVATAR_PATH",'assets/img/avatars/');
define("GALLERY_PATH",'assets/img/gallery');
define("VIDEOS_PATH",'assets/video');
define("ACTIVATE_CODE",'SXC693FXCY');
define("MESSAGE_COST",20);
define("COINS_AT_START",400);
define("COINS_TO_ADD",1000);

include("conf/functions.php");
include("conf/functions-order.php");

foreach (glob("app/*.php") as $filename) {
    include $filename;
}

foreach (glob("controllers/*.php") as $filename) {
    include $filename;
}

foreach (glob("models/*.php") as $filename) {
    include $filename;
}

?>