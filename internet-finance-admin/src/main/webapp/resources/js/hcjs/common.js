//
var rrt = {};
rrt.callback_function = '';
rrt.callback_url = '';
/*
 params 为 json 格式
 [{"key":"back_url","value":"9"},{"key":"王家湾","value":"9"}]
 */
rrt.build_url = function(control,action,params){
    var param_str = ''
    if(params.length > 0){
        for(var o in params){
            param_str += '&'+ params[o].key + '=' +  params[o].value;
        }
    }
    return rooturl + 'index.php?_c='+control+'&_a='+action+param_str;
};
/*
 检测url地址
 */
rrt.check_url = function(str){
    var RegUrl = new RegExp();
    RegUrl.compile("^[A-Za-z]+://[A-Za-z0-9-_]+\\.[A-Za-z0-9-_%&\?\/.=]+$");
    if (!RegUrl.test(str)) {
        return false;
    }
    return true;
};
/*
 需要登录函数
 */
rrt.check_login = function(){
    if(!if_login){
        alert('本操作需要需要登录后才能进行！');
        this.goto_url(rrt.build_url('user','login',[{"key":"back_url","value":encodeURIComponent(window.location.href)}]));
        return false;
    }
};
/*
 检测数字
 */
rrt.check_qq = function(str){
    var RegUrl = new RegExp();
    RegUrl.compile("^[0-9]+$");
    if (!RegUrl.test(str)) {
        return false;
    }
    return true;
};
/*
 检测是否包含中文
 */

rrt.check_chinese = function(str){
    var re1 = new RegExp("([\u4E00-\uFA29]|[\uE7C7-\uE7F3])+");
    if (!re1.test(str)){
        return false;
    }
    return true;
};
/*
 自定义alert  begin -----------------
 */
rrt.alert = function(str,callback){
    this.callback_function = callback;
    $('#rrt_alert_str').html(str);
    $('#rrt_alert_true').unbind('click').click(function(){
        rrt.self_alert(this);
        return false;
    });
    //$( ".mtck").find('div[id!=self_confirm]').hide();
    $( ".rrt_alert_dialog" ).fadeToggle(300);
    //$('.rrt_confirm_dialog').show();
};
/*
 自定义弹窗confirm 确定
 */
rrt.self_alert = function(obj){
    eval(rrt.callback_function+'();');
    $(obj).parents( ".mtck").hide();
};
//end ----------------------------------------end
/*
 自定义弹窗confirm   begin--------------------
 */
rrt.self_confirm = function(str,callback){
    this.callback_function = callback;
    $('#rrt_confirm_str').html(str);
    $('#rrt_confirm_true').click(function(){
        rrt.self_confirm_true();
        return false;
    });
    $('#rrt_confirm_false').click(function(){
        rrt.self_confirm_false();
        return false;
    });
    //$( ".mtck").find('div[id!=self_confirm]').hide();
    $( ".rrt_confirm_dialog" ).fadeToggle(300);
    //$('.rrt_confirm_dialog').show();
};


/*
 自定义弹窗confirm 确定
 */
rrt.self_confirm_true = function(){
    eval(rrt.callback_function+'(1);');
    $( ".mtck").hide();
    $('#projvideos') && $('#projvideos').show();
}



/*
 自定义弹窗confirm 确定
 */
rrt.self_confirm_false = function(){
    eval(rrt.callback_function+'(0);');
    $( ".mtck").hide();
    $('#projvideos') && $('#projvideos').show();
}
/*
 confire call_back_a
 */
rrt.self_confirm_a = function(_a){
    if(_a == 1){
        rrt.goto_url(rrt.callback_url);
    }
}
//end ----------------------------------end
/*
 格式化价格
 */
rrt.format_price = function(price){
    var ls_str = price.split('.');
    price = (ls_str[0]+'').replace(/[^0-9]*/ig,'')+'';
    var price_len = price.length;
    var result = '';
    for(var i=0;i<price_len;i++){
        result = price[price_len-i-1]+result;
        if(i%3 == 2 && i+1<price_len){
            result = ','+result;
        }
    }
    return result;
}
/*
 价格输入框方法
 */
rrt.format_price_input = function(obj){
    var price_ = $(obj).val();
    $(obj).val(this.format_price(price_));
}
/*
 价格提交时格式转换
 */
rrt.format_price_douhao = function(obj){
    var price_ = $(obj).val();
    price_ = price_.replace(/[^0-9]*/ig,'')+'';
    $(obj).val(price_);
}

/*
 复制方法1
 */
rrt.copy_a = function(obj){
    var clip = new ZeroClipboard( obj, {
        moviePath: static_path + "s/js/ZeroClipboard.swf"
    } );
    // 复制内容到剪贴板成功后的操作
    clip.on( 'complete', function(client, args) {
        rrt.alert("复制成功，复制内容为："+ args.text);
    } );
}
/*
 复制方法
 */
rrt.copyToClipBoard = function (str){
    var txt =  str;
    if (window.clipboardData) {
        window.clipboardData.clearData();
        clipboardData.setData("Text", txt);
        alert("复制成功！");

    } else if (navigator.userAgent.indexOf("Opera") != -1) {
        window.location = txt;
    } else if (window.netscape) {
        try {
            netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
        } catch (e) {
            alert("被浏览器拒绝！\n请在浏览器地址栏输入'about:config'并回车\n然后将 'signed.applets.codebase_principal_support'设置为'true'");
        }
        var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
        if (!clip)
            return;
        var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
        if (!trans)
            return;
        trans.addDataFlavor("text/unicode");
        var str = new Object();
        var len = new Object();
        var str = Components.classes["@mozilla.org/supports-string;1"].createInstance(Components.interfaces.nsISupportsString);
        var copytext = txt;
        str.data = copytext;
        trans.setTransferData("text/unicode", str, copytext.length * 2);
        var clipid = Components.interfaces.nsIClipboard;
        if (!clip)
            return false;
        clip.setData(trans, null, clipid.kGlobalClipboard);
        alert("复制成功！");
    }
}
/*
 自定义a标签跳转
 */
rrt.goto_url = function(_url){
    document.location.href = _url;
}

// JavaScript Document
$( document ).ready(function(e) {
    $('input[is_price=yes]').bind('keyup',function(){rrt.format_price_input(this)});//价格格式输入
    $('input[need_login=yes]').unbind('click').click(function(){return rrt.check_login();});//需要登录按钮检测
    $('textarea[need_login=yes]').unbind('focus').unbind('click').click(function(){return rrt.check_login();});//需要登录输入框检测
    //复制按钮绑定事件
    $('a[copy_button=yes]').each(function(index,obj){
        rrt.copy_a(obj);
    })
    //清除浏览器记录的密码
    $('input[type=password]').val('');
    $('input').focus(function(){
        $(this).parent().parent().find('div.u_tb_red').hide();
    });
});

/*
 跳转到认证投资人页面
 */
rrt.goto_renzheng = function(goto_bool){
    if(goto_bool){
        rrt.goto_url(rrt.build_url('investor','index',{'forward_url':window.location.href}));
    }
}
/*
 跳转到登录人页面
 */
rrt.goto_login = function(goto_bool){
    if(goto_bool){
        rrt.goto_url(rrt.build_url('user','login',{'forward_url':window.location.href}));
    }
}
/*
 图片剪切窗口------------------------begin----------------------------
 */
rrt.img_resize_show = function(img_path,resize,callback){
    var theImage = new Image();
    var r_width = 100;
    var r_height = 100;
    var img_width = 0;
    var img_height = 0;
    theImage.src = static_path+img_path;
    $('#rrt_img_path').css('width','20px').css('height','20px').css('margin-left','265px').attr('src',static_path + 's/images/loading_c.gif');
    if(resize[0] && resize[1]){
        r_width = resize[0];
        r_height = resize[1];
    }
    if(r_width && r_height){
        $('#rrt_resize_tosize').html(r_width+'x'+r_height);
    }

    var img_resize_num = {h:95,w:95,x:5,x2:r_width,y:5,y2:r_height};
    theImage.onload = function(){
        var Width_ = img_width =  theImage.width;
        var Height_ = img_height =  theImage.height;
        var img_obj = $('#rrt_img_path');

        if(560/450 > img_width/img_height){

            if(Height_ > 450){
                Height_ = 450;
                img_obj.css('width','auto');
                img_obj.css('height',Height_);
            }else{
                img_obj.css('width',Width_);
                img_obj.css('height',Height_);
            }
        }else{
            if(Width_ > 560){
                Width_ = 560;
                img_obj.css('width',Width_);
                img_obj.css('height','auto');
            }else{
                img_obj.css('width',Width_);
                img_obj.css('height',Height_);
            }
        }

        img_obj.attr('src',static_path+img_path).show().css('visibility','visible');
        img_obj.Jcrop({
                bgColor:     'black',
                bgOpacity:   .4,
                aspectRatio: r_width/r_height,
                onSelect: updateCoords,
				maxSize:[311,160],//选框最大尺寸
            },
            function(){
                jcrop_api = this;
                jcrop_api.animateTo([5,5,r_width,r_height]);
                jcrop_api.setOptions({ allowMove:true });
                jcrop_api.setOptions({ allowResize:true });
                jcrop_api.setOptions({ cornerHandles:true });
                jcrop_api.setOptions({ drawBorders:true });
                jcrop_api.setOptions({ dragEdges:true });
                jcrop_api.setOptions({ boxWidth:500 });
                jcrop_api.setOptions({ boxHeight:500 });
                jcrop_api.setOptions({ minSize:[10,10] });
                jcrop_api.focus();
                if(parseInt(img_obj.css('width')) < 560){
                    $('div.jcrop-holder').css('margin-left',parseInt((560-parseInt(img_obj.css('width')))/2));
                }
            }
        );
    }
    function updateCoords(c)
    {
        img_resize_num = c
    }
    $('#rrt_resize_true,.rrt_img_resize .tk1 h3 a').unbind('click').click(function(){
        if(560/450 > img_width/img_height){
            if(img_height > 450){
                for(o in img_resize_num){
                    img_resize_num[o] = parseInt(img_resize_num[o]*img_height/450);
                }
            }
        }else{
            if(img_width > 560 ){
                for(o in img_resize_num){
                    img_resize_num[o] = parseInt(img_resize_num[o]*img_width/560);
                }
            }
        }
        $('#rrt_img_path').hide();
        //正在剪切,请稍候
        $('#rrt_img_path').css('width','20px').css('height','20px').css('margin-left','265px').attr('src',static_path + 's/images/loading_c.gif');
        $('.cutting_img').show();
        $('.img_resize_cut').hide();
        jcrop_api.destroy();
        //剪切图片
        $.post(
            rrt.build_url('upload','resize',[]),
            {'img_path':img_path,'resize':img_resize_num},
            function(result){
                callback(1,result.data.thumb);
                $( ".rrt_img_resize" ).fadeToggle(300,function(){$('.cutting_img').hide();$('.img_resize_cut').show();});
            },
            'json'
        );
        return false;
    });
    $( ".rrt_img_resize" ).fadeToggle(300);
}


/*
 图片剪切窗口------------------------end----------------------------
 */

function none(){

}

function redirect(res)
{
    if(res)
    {
        window.location.href = rooturl + 'index.php?_c=investor&_a=';
    }
    else
        return false;
}

rrt.len = function (as) {
    var l = 0;
    as = String(as);
    var a = as.split("");
    for (var i=0;i<a.length;i++) {
        if (a[i].charCodeAt(0)<299) {
            l++;
        } else {
            l+=2;
        }
    }
    return l;
}