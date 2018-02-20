$(function () {
    var host ="http://10.105.48.188/xplayroom2/";
    function jednostki(howmany){
        var jed='';
        if(howmany==1){
            jed='zdjęcie';
        }else{
            howmany=howmany.toString();
            var l=howmany.length;
            if((howmany.charAt((l-1))>1)&&(howmany.charAt((l-1))<5)){
                if((l==2)&&(howmany.charAt(0))==1){
                    jed='zdjęć';
                }else{
                    jed='zdjęcia';
                }
            }else{
                jed='zdjęć';
            }
        }
        return howmany+' '+jed;
    }

    $('#addfiles').change(function (e) {
        if(this.files.length>20){
            alert('Wybrano za dużą ilość plików, maksymalnie możesz przesłać 20 plików');
        }else{
            var size_ok=true;
            var up_size=0;
            for(a=0;a<this.files.length;a++){
                up_size+=parseInt(this.files[a].size);
                if(this.files[a].size>5242880) {
                    size_ok=false;
                }
            }
            if(!size_ok){
                alert('Maksymalna wielkość wgrywanego zdjęcia to 2MB');
            }else if(up_size>22367934){
                alert('Maksymalnie możesz wgrać pliki o łącznej wielkości 20MB');
            }else{
                var data = new FormData();
                data.append('gallery', $('input[name="gallery"]:checked').val());
                data.append('user', $('input[name="user"]').val());
                jQuery.each(jQuery(this)[0].files, function (i, file) {
                    data.append('files[]', file);
                });
                $('.loading').show();
                jQuery.ajax({
                    url: host+"api/gallery/upload",
                    data: data,
                    cache: false,
                    contentType: false,
                    processData: false,
                    method: 'POST',
                    type: 'POST', // For jQuery < 1.9
                    success: function (data) {
                        var resp = JSON.parse(data);
                        $('.loading').hide();
                        if(typeof resp=='object'){
                            window.location.href = window.location.href;
                        }
                    }
                });
            }
        }

    });
    $('.private-gallery').on('click','label',function(){
        $('#private').attr('checked',true);
    });
    $('.galleries .delete').click(function (event) {
       event.preventDefault();
        var parent=$(this).parent();
        var link=$(parent).children()[0];
        var gallery_div=$(this).parent().parent().parent().attr('class');
        var gallery='';
        if(gallery_div=='public-gallery'){
            gallery='public';
        }else{
            gallery='private';
        }
        var image=$(link).attr('data-image');
        var data = new FormData();
        data.append('method',$(this).attr('data-type'));
        data.append('image',image);
        data.append('user',$('input[name="user"]').val());
        data.append('gallery',gallery);
        jQuery.ajax({
            url: host+"api/gallery/delete",
            data: data,
            cache: false,
            contentType: false,
            processData: false,
            method: 'POST',
            type: 'POST', // For jQuery < 1.9
            success: function(data){
                var resp=JSON.parse(data);
                if(resp.success>0){
                    $(parent).remove();
                    var images=$('.'+gallery_div+' .preview').length;
                    if(images==0){
                        if($('input[name="user"]').val()==$('.user_name a').text()){
                            var to_append='<p>Nie posiadasz jeszcze żadnych zdjęć w galerii, <label for="addfiles">dodaj je</label> teraz aby bardziej przyciągnąć do siebie randkowiczów</p>';
                        }else{
                            var to_append='<p>Użytkownik nie posiada jeszcze zdjęć w galerii</p>';
                        }

                        $('.'+gallery_div+' .panel-body').append(to_append);
                        $('.'+gallery_div+' .panel-title span').remove();
                    }else{
                        $('.'+gallery_div+' .panel-title span').html('('+jednostki(images)+')');
                    }

                }

            }
        });
    });
});