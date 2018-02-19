$(function () {
    var host="http://10.105.48.188/xplayroom2/";
    $("a[href=\"#\"]").click(function (event) {
        event.preventDefault();
        event.stopPropagation();
        return false;
    });

    $('#activateform').submit(function () {
        $('#activate_error').hide();
        var key=$('#activatekey').val();
        $.ajax({
            type:"POST",
            url: host+"api/activate",
            data:{key:key},
            success:function (result) {
                switch(result.trim()){
                    case '1':
                        $('#activatebox .close-modal').click();
                        break;
                    case '2':
                        $('#activate_error').show().html('Wprowadzono błędny kod aktywacyjny');
                        break;
                    default:
                        $('#activate_error').show().html('Wystąpił nieoczekiwany błąd, spróbuj ponownie później');
                        break;

                }
            }
        });
        return false;
    });

    $("form").submit(function(){
        var $inputs = $('#'+$(this).attr('id')+' :input[type="text"]');
        var $textareas=$('#'+$(this).attr('id')+' textarea');
        var $files=$('#'+$(this).attr('id')+' :input[type="file"]');
        var empty = 0;
        var values = {};
        $inputs.each(function() {
            $(this).val($.trim($(this).val()));
            if($(this).val()==''){
                empty+=1;
            }
            values[this.name] = $(this).val();
        });
        $textareas.each(function() {
            $(this).val($.trim($(this).val()));
            if($(this).val()==''){
                empty+=1;
            }
            values[this.name] = $(this).val();
        });
        $files.each(function() {
            if($(this).val()!=''){
                if($('#avatar').val()==''){
                    empty+=1;
                    $('#btnCrop').addClass('btn-danger');
                }else{
                    $('#btnCrop').removeClass('btn-danger');
                }
            }
            values[this.name] = $(this).val();
        });
        if(empty!=0){
            return false;
        }
    });
    $("textarea[name='message']").keypress(function (e) {
        if(e.which == 13) {
            if(!e.shiftKey){
                $(this).closest("form").submit();
                $(this).css({height:'30px'});
                e.preventDefault();
                return false;
            }else{
                if($(this).outerHeight()<'70'){
                    var nheight=$(this).outerHeight()+20;
                    $(this).css({height:''+nheight+ 'px'});
                }
            }

        }
    });
    $('#chat .panel-body').scrollTop($('.chat').height());
    $('#message-input').focus();

    $('.permissions_ask').click(function(e){
        e.preventDefault();
        var data = new FormData();
        data.append('user',$('input[name="guest"]').val());
        data.append('owner',$('input[name="owner"]').val());
        jQuery.ajax({
            url: host+"api/gallery_permissions/ask",
            data: data,
            cache: false,
            contentType: false,
            processData: false,
            method: 'POST',
            type: 'POST',
            success: function (data) {
                var resp=JSON.parse(data);
                if(resp.resp=='success'){
                    $('.private-gallery .panel-body .col-sm-8').append('<p class="alert-success alert">Wysłano prośbę o dostęp do galerii</p>')
                    $('.permissions_ask').remove();
                }
            }
        });
    });

    $('.lock').click(function () {
        $('.permissions_ask').trigger('click');
    });
    $('.permissions_answer button').click(function (e) {
        e.preventDefault();
        var parent=$(this).parent();
        var answer='no';
        if($(this).hasClass('btn-primary')){
            answer='yes';
        }
        var user=$(parent).children('input[name="user"]').val();
        var owner=$(parent).children('input[name="owner"]').val();
        var type=$(parent).children('input[name="type"]').val();
        var data = new FormData();
        data.append('user',user);
        data.append('owner',owner);
        data.append('notif_type',type);
        data.append('answer',answer);
        jQuery.ajax({
            url: host+"api/gallery_permissions/answer",
            data: data,
            cache: false,
            contentType: false,
            processData: false,
            method: 'POST',
            type: 'POST',
            success: function (data) {
                var resp=JSON.parse(data);
                if(resp.resp=='success'){
                    var cont=$(parent).parent();
                    if(answer=='yes'){
                        var mess='Zaakceptowano prośbę użytkownika <a href="profile.php?name='+user+'" target="_blank">'+user+'</a> o dostęp do prywatnej galerii';
                    }else{
                        var mess='Odrzucono prośbę użytkownika <a href="profile.php?name='+user+'" target="_blank">'+user+'</a> o dostęp do prywatnej galerii';
                    }
                    $(cont).html(mess);
                    $(cont).append('<button type="button" class="close close-notif" data-dismiss="panel" data-notif="'+resp.id+'" aria-hidden="true">×</button>')
                }
            }
        });
    });
    $('div.notification').on('click','.close.close-notif',function () {
        var notif=$(this).attr('data-notif');
        var parent=$(this).parent().parent();
        var not_cont=$(parent).parent().attr('id');
        var data = new FormData();
        data.append('type','delete');
        data.append('notif',notif);
        jQuery.ajax({
            url: host+"api/notifications/delete",
            data: data,
            cache: false,
            contentType: false,
            processData: false,
            method: 'POST',
            type: 'POST',
            success: function (data) {
                var resp=JSON.parse(data);
                if(resp.resp=='success'){
                   $(parent).remove();
                    if($('#'+not_cont+' .notification-panel').length==0){
                        $('#'+not_cont).append('<p class="alert alert-info">Brak powiadomień</p>');
                    }
                }
            }
        });
    });
    $('.pay_checkout button.check_vip').click(function () {
        var cookie=$('#cookie').val();
        var user=$('#user').val();
        var action='check_payment';
        var parent=$(this).parent();
        $(parent).children('.loading').css('display','flex');
        $.ajax({
            url:host+"api/check_payment",
            type:"POST",
            data: {user:user,cookie:cookie,action:action},
            success:function(result) {
                var resp=JSON.parse(result);
                if((resp.status==true)&&(resp.redir==true)){
                    window.location.href=host+'home';
                }else{
                    $(parent).children('p.pay_info').text('Twoja płatność jest w trakcie weryfikacji. Jeśli wybrałeś płatność' +
                        ' online, proces nie powinien trwać dłużej niż 24h. Spróbuj ponownie za jakiś czas.');
                }
                $(parent).children('.loading').hide();
            }


        });
    });
    $('.actions').on('click','span',function () {
        var user=$('#guest_name').val();
        var who=$('#user_name').val();
        var span=$(this);
        var action=$(this).attr('class').split(' ')[0];
        $.ajax({
            url:host+"api/"+action,
            type:"POST",
            data: {user:user,user2:who},
            success:function(result) {
                var resp=JSON.parse(result);
                if(resp.resp=='success'){
                    if(!span.hasClass('on')){
                        $(span).addClass('on');
                        if(action=='favorite'){
                            $(span).prop('title','Usuń z ulubionych');
                        }else{
                            $(span).prop('title','Odblokuj użytkownika');
                        }
                    }else{
                        $(span).removeClass('on');
                        if(action=='favorite'){
                            $(span).prop('title','Dodaj do ulubionych');
                        }else{
                            $(span).prop('title','Zablokuj użytkownika');
                        }
                    }
                }else{
                    alert('Wystąpił nieoczekiwany błąd, spróbuj ponownie');
                }
            }

        });
    });

    $('#vip-button').click(function(event){
        var parent=$(this).parent();
        $(parent).children('.loading').css('display','flex');
        event.preventDefault();
        var email=$("input[name='user_email']").val();
        var name=$("input[name='user_name']").val();
        $.ajax({
            url: host+"api/order",
            type:"POST",
            data: {email:email,name:name},
            success:function(result) {
                var resp=JSON.parse(result);
                if(resp.resp=='success'){
                    window.location.href=resp.link;
                }
            }
        });
    });

    $('#searchForm').submit(function(e){
        e.preventDefault();
        var parent=$(this).parent();
        $(parent).children('.loading').css('display','flex');
        var s=$('#code_input').val();
        var name=$("input[name='name']").val();
        $('.alert-container .alert').remove();
        jQuery.ajax({
            url: host+"api/check_code",
            type:"POST",
            data: {s:s,user:name},
            success:function(result) {
                var resp=JSON.parse(result);
                var alert, message;
                switch(resp['status']){
                    case 'OK':
                        alert='success';
                        message='Podany kod jest prawidłowy, punkty zostały dodane do Twojego konta!';
                        break;
                    case 'INACTIVE':
                        alert='warning';
                        switch (resp['code']){
                            case '2001':
                                message='Podany kod nie został jeszcze aktywowany';
                                break;
                            case '2002':
                                message='Podany kod został już użyty';
                                break;
                            case '2003':
                                message='Podany kod stracił ważność';
                                break;
                            case '2004':
                                message='Podano zły kod';
                                break;
                            default:
                                message='Podano zły kod';
                        }
                        break;
                    case 'ERROR':
                        alert='danger';
                        message='Wystąpił błąd, spróbuj ponownie';
                        break;
                    default:
                        alert='danger';
                        message='Wystąpił błąd, spróbuj ponownie';
                }
                $('.alert-container').append('<div class="alert alert-'+alert+'">'+message+'<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button></div>');
                if(resp.status=='OK'){
                    $('span.coins').html('<i class="fa fa-gg-circle" aria-hidden="true"></i> '+resp.coins+' ');
                    $('span.coins').prop('title','Posiadasz '+resp.coins+' punktów do wydania w naszym portalu');
                }
                $(parent).children('.loading').hide();
            }
        });
        return false;
    });



});