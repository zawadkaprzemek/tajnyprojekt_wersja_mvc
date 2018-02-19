<?php
define('MONTH_NAMES',serialize(array('','styczeń','luty','marzec','kwiecień','maj','czerwiec','lipiec','sierpień','wrzesień',
    'październik','listopad','grudzień')));
function addDots($text, $limit) {

    if (strlen($text) > $limit) {
        return trim(mb_substr($text, 0, $limit,"utf-8")) . '...';
    } else {
        return $text;
    }
}
function sort_date($el1, $el2)
{
    return strcmp($el2['date'], $el1['date']);
}

function db_to_age($date_birth){
    $date=strtotime($date_birth);
    $roznica=(((((time()-$date)/60)/60)/24)/365);
    $arr=explode(".",$roznica);
    $wiek=str_split((string)$arr[0]);
    if(($wiek[1]>1)&&($wiek[1]<5)){
        $age=$arr[0].' lata';
    }else{
        $age=$arr[0].' lat';
    }
    return $age;
}

function age($age){
    $array=str_split((string)$age);
    if(($array[1]>1)&&($array[1]<5)){
        $age=$age.' lata';
    }else{
        $age=$age.' lat';
    }
    return $age;
}

function save_avatar($avatar,$av_name){
    list($type, $avatar) = explode(';', $avatar);
    list(, $avatar)      = explode(',', $avatar);
    $avatar = base64_decode($avatar);
    $filepath = '../'.ROOT_PATH.AVATAR_PATH."/".$av_name;
    if(file_put_contents($filepath,$avatar)){
        return true;
    }else{
        return false;
    }
}

function nice_data($item){
    $month_names=unserialize(MONTH_NAMES);
    $date=explode(" ",$item);
    $h=explode(":",$date[1]);
    $hour=$h[0].":".$h[1];
    $today=date('Y-m-d');
    $a=explode("-",$date[0]);
    if($a[2][0]==0){
        $a[2]=$a[2][1];
    }
    if($a[1][0]==0){
        $a[1]=$a[1][1];
    }
    if($date[0]==$today){
        return $hour;
    }else{
        $res = round((strtotime($today) - strtotime($date[0])) / 86400);
        if($res==1){
            return "wczoraj ".$hour;
        }else{
            if($a[0]==date('Y')){
                return $a[2].' '.$month_names[$a[1]];
            }else{
                return $a[2].' '.$month_names[$a[1]].' '.$a[0];
            }
        }

    }
}
function get_images($user,$gallery){
    if($gallery=='private'){
        $files = glob(GALLERY_PATH.'/'.$user.'/private/thumbnail/*.*');
    }else{
        $files = glob(GALLERY_PATH.'/'.$user.'/thumbnail/*.*');
    }
    $supported_format = array('gif','jpg','jpeg','png');
    $images=array();
    foreach ($files as $file){
        $ext = strtolower(pathinfo($file, PATHINFO_EXTENSION));
        if (in_array($ext, $supported_format))
        {
            array_push($images,$file);
        }
    }
    return $images;
}
function print_images($images,$delete=false){
    foreach ($images as $image){
        $to_remove=['/thumbnail'];
        $big_image=str_replace(@$to_remove,'',$image);
        echo '<div class="col-sm-2 col-xs-3 text-center preview">
              <a href="#" data-image="'.ROOT_PATH.$big_image.'" class="img-prev" data-gallery>
              <img src="'.ROOT_PATH.$image.'"/></a>';
        if($delete){
            echo '<button class="delete" data-type="DELETE">
              <i class="fa fa-times" aria-hidden="true"></i>
              </button>';
        }
              echo '</div>';
    }
}

function no_permissions_gallery($wfa=false,$guest,$user){
    $text='<div class="col-sm-2 lock">
          <img src="'.ROOT_PATH.'assets/img/lock.png" class="img-responsive">
          </div>
          <div class="col-sm-8">
          <p class="bold">Nie masz uprawnień do oglądania zdjęć z tej galerii</p>
          <p>Kliknij w poniższy przycisk, aby poprosić uzytkownika '.$user.' o przyznanie dostępu do jej 
          pikantnych zdjęć.</p>';
            if($wfa==false){
                $text.='<p><button class="btn btn-primary permissions_ask">Poproś o dostęp</button></p>';
            }else{
                $text.='<p class="alert-success alert">Wysłano prośbę o dostęp do galerii</p>';
            }

    $text.='</div>';
    $text.='<input type="hidden" name="guest" value="'.$guest.'">';
    $text.='<input type="hidden" name="owner" value="'.$user.'">';
    echo $text;
}

function print_notification($type,$owner,$user,$role='user'){
    if($role=='fake'){
        $link=ROOT_PATH.'profile/show/'.$user.'?ref_user='.$owner;
    }else{
        $link=ROOT_PATH.'profile/show/'.$user;
    }
    switch ($type){
        case 1:
            $text='Użytkownik <a href="'.$link.'" target="_blank">'.$user.'</a> prosi o dostęp do prywatnej galerii';
            $text.='<form action="'.$_SERVER['REQUEST_URI'].'" class="permissions_answer">
                    <input type="hidden" name="user" value="'.$user.'">
                    <input type="hidden" name="owner" value="'.$owner.'">
                    <input type="hidden" name="type" value="'.$type.'">
                    <button class="btn btn-primary">Akceptuj</button>
                    <button class="btn btn-danger">Odrzuć</button>
                    </form>';
            break;
        case 2:
            $text='Użytkownik <a href="'.$link.'" target="_blank">'.$user.'</a> zaakceptował Twoją prośbę o dostęp do prywatnej galerii';
            break;
        case 3:
            $text='Użytkownik <a href="'.$link.'" target="_blank">'.$user.'</a> odrzucił Twoją prośbę o dostęp do prywatnej galerii';
            break;
        case 4:
            $text='Zaakceptowano prośbę użytkownika <a href="'.$link.'" target="_blank">'.$user.'</a> o dostęp do prywatnej galerii';
            break;
        case 5:
            $text='Odrzucono prośbę użytkownika <a href="'.$link.'" target="_blank">'.$user.'</a> o dostęp do prywatnej galerii';
            break;
        default:
            $text='';
            break;
    }
    return $text;
}
function jednostki($howmany){
    $arr=str_split((string)$howmany);
    if($howmany=='1'){
        $jed='zdjęcie';
    }else if(($arr[(sizeof($arr)-1)]>1)&&($arr[(sizeof($arr)-1)]<5)){
        if((sizeof($arr)==2)&&($arr[0]=='1')){
            $jed='zdjęć';
        }else{
            $jed='zdjęcia';
        }
    }else{
        $jed='zdjęć';
    }
    return $howmany.' '.$jed;
}



function is_vip($user,$acc_type){
    if($acc_type==2){
        if($_SESSION['user_data']['name']==$user){
            $title='Posiadasz konto VIP';
        }else{
            $title='Ten użytkownik posiada konto VIP';
        }
        return '<span class="vip" title="'.$title.'"><i class="fa fa-trophy" aria-hidden="true"></i></span>';
    }
}


function user_profile($array){
    $class=(@$array['account_type']=='2')? 'vip' : 'standard';?>
    <div class="col-md-4 col-xs-6 col-sm-6 profile <?php echo $class;?>">
        <a href="<?php echo ROOT_URL.'profile/show/'.$array['user_name'];?>">
            <div class="thumbnail">
                <div class="photo">
                    <img src="<?php echo ROOT_PATH.AVATAR_PATH.$array['avatar'];?>" alt="" class="img-responsive">
                </div>
                <div class="caption">
                    <h3><?php echo $array['user_name'].', '.$array['age'];?></h3>
                    <h4><?php echo $array['state'];?></h4>
                    <p><?php echo addDots($array['info'],100);?></p>
                 </div>
                <div class="buttons">
                    <a class="btn btn-primary" href="<?php echo ROOT_URL.'profile/show/'.$array['user_name'];
                    ?>">Zobacz zdjęcia</a>
                    <a class="btn btn-default" href="<?php echo ROOT_URL.'profile/message/'.$array['user_name'];
                    ?>">Wyślij wiadomość</a>
                </div>
            </div>
        </a>
    </div>
<?php }
?>