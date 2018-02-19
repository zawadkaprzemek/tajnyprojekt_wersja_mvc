<?php
include (dirname(__FILE__).'/../pay_checkout.php');
?>
<div class="col-sm-12 text-center">

    <?php if($_SESSION['user_data']['account_type']==2) { ?>
       <video id="video" class="video-js" controls preload="auto" width="640" height="264"
               poster=<?php echo VIDEOS_PATH . DIRECTORY_SEPARATOR .$model[0]['dir'].DIRECTORY_SEPARATOR
                   .$model[0]['image']?>" data-setup="{}">
            <source src="<?php echo VIDEOS_PATH . DIRECTORY_SEPARATOR .$model[0]['dir'].DIRECTORY_SEPARATOR
            .$model[0]['video']?>" type='video/mp4'>
            <p class="vjs-no-js">
                To view this video please enable JavaScript, and consider upgrading to a web browser that
                <a href="http://videojs.com/html5-video-support/" target="_blank">supports HTML5 video</a>
            </p>
        </video>

<div class="video-list">
<?php
foreach ($model as $dir){?>
    <div class="col-sm-4">
        <?php
        ?>
        <a href="" data-movie="<?php echo VIDEOS_PATH . DIRECTORY_SEPARATOR .$dir['dir'].DIRECTORY_SEPARATOR.$dir['video']?>">
        <img src="<?php echo VIDEOS_PATH . DIRECTORY_SEPARATOR .$dir['dir'].DIRECTORY_SEPARATOR.$dir['image']?>"
             class="img-responsive">
        </a>
    </div>
<?php }
?>
</div>



        <script src="<?php ROOT_PATH?>assets/js/video.js"></script>
        <link href="<?php ROOT_PATH?>assets/css/video-js.css" rel="stylesheet">

        <!-- If you'd like to support IE8 -->
        <script src="<?php ROOT_PATH?>assets/js/videojs-ie8.min.js"></script>


<script>
    $(document).ready(function () {
        var width=$('#video').width();
        var height=parseInt(width)/16*9;
        $('#video').css('height',height+'px');
        var first=$('.video-list div').first();
        $(first).addClass('active');
        var fm=$(first).children('a').attr('data-movie');
        var fi=$(first).children('a').children('img').attr('src');
        $('#video_html5_api').attr('poster',fi);
        $('#video').attr('poster',fi);
        $('.vjs-poster').css('background-image','url("'+fi+'")');
        $('#video_html5_api').attr('src',fm);

        $('.video-list').on('click','a',function (e) {
            e.preventDefault();
            var movie=$(this).attr('data-movie');
            var img=$(this).children('img').attr('src');
            $('#video_html5_api').attr('poster',img);
            $('#video').attr('poster',img);
            $('.vjs-poster').css('background-image','url("'+img+'")');
            $('#video_html5_api').attr('src',movie);
            $('video')[0].play();
            $('.video-list .active').removeClass('active');
            $(this).parent().addClass('active');
            $('html, body').animate({
                scrollTop: $("#video").offset().top-70
            }, 10);
        });
    });
</script>
        <?php }else{
        echo '<p class="alert alert-warning">Opcja dostępna wyłącznie dla posiadaczy konta VIP, <a href="'.ROOT_URL
            .'doladuj">zmień swoje konto na VIP</a></p>';
    }?>

</div>