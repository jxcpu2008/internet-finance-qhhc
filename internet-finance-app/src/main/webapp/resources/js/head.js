//ajax请求：请求地址,参数,回调方法
function fn_ajax(_url, _param, _callback) {
	$.ajax({
		url : _url,
		type : "post",
		data : _param,
		contentType : "application/x-www-form-urlencoded;charset=utf-8",
		success : function(_msg) {
			if (_callback) {
				_callback(_msg);
			}
		}
	});
}

$(function() {
	
	$(".df_loginBnt").click(function() {
		var userName = $("#username").val();
		var pwd = $("#pwd").val();
		var captcha = $("#captcha").val();

		if (userName.length <= 0) {
			$("#username").focus();
			alert("请输入用户名！");
			return false;
		}

		if (pwd.length <= 0) {
			$("#pwd").focus();
			alert("请输入密码！");
			return false;
		}
		
		if (captcha.length <= 0) {
			$("#captcha").focus();
			alert("请输入验证码！");
			return false;
		}

		var parmer = $("#login_form").serialize();
		var _url = $("#login_form").attr("action");
		$.ajax({
			url : _url,
			type : "POST",
			data : parmer,
			success : function(msg) {
				if (msg == 1) {
					window.location.reload();
				} else {
					alert(msg);
					$("#captcha").val("");
					$("#verify_img").attr("src","/cic/code?name=user_login&id="+new Date());
				}
			}
		});
	});

	// 安全认证返回的结果
	var security_verifiy = $("#security_verifiy").val();
	if (security_verifiy != '' && security_verifiy != null) {
//		 alert(security_verifiy);
		if (security_verifiy.length == 1) {
			$(".layerBodyBox").css("display", "none");
			if (security_verifiy == 1) {
				$("#verify_phone").css("display", "block");
			}
			if (security_verifiy == 2) {
				$("#verify_email").css("display", "block");
			}
			if (security_verifiy == 3) {
				$("#verify_identify").css("display", "block");
			}
			if (security_verifiy == 4) {
				$("#verify_safequestion").css("display", "block");
			}
			$(".wrapBox").show();
			$(".layerBox").show();
			$("#security_verifiy").val("");
		} else {
			ymPrompt.alert(security_verifiy, 400, 200, '提示', null);
		}
	}

});

// 弹窗认证 欢迎页中点击“立即认证”触发的事件
function fun_click(id) {
	if (id = "go_verify") {
		$(".layerBodyBox").css("display", "none");
		$("#verify_phone").css("display", "block");
	}
}

var ver_phone = /^(((1[0-9]{1}[0-9]{1}))+\d{8})$/;// 手机验证
var ver_email = /^[0-9a-zA-Z]+?@[0-9a-zA-Z]{1,20}\.([cC][oO][mM]|[nN][eE][tT]|[Cc][nN])$/;// 邮箱验证

// 手机认证
function submit_phone() {
	var phone = $.trim($("#phone").val());// 手机号
	var smscode = $.trim($("#sms_code").val());// 手机验证码
	if (!ver_phone.test(phone)) {
		ymPrompt.alert("请输入有效的手机号码！", 400, 200, '提示', null);
		return;
	}
	if (smscode == "") {
		ymPrompt.alert("请输入手机验证码！", 400, 200, '提示', null);
		return;
	}
	fn_ajax("/member/validatePhone", {
		phone : phone,
		smscode : smscode
	}, function(data) {
		if (data == "1") {
//			ymPrompt.succeedInfo('手机验证成功！', 400, 200, '成功', null);
			window.location.href = "/member/mail";
			//window.location.reload();
		} else {
			ymPrompt.errorInfo('手机验证失败！', 400, 200, '失败', null);
		}
	});
}

function check_per() {
	
	
	var phone = $.trim($("#telephones").val());// 手机号
	var smscode = $.trim($("#investor_code").val());// 手机验证码
	var $checked=$("#checked").attr("checked");
	if (!ver_phone.test(phone)) {
		ymPrompt.alert("请输入有效的手机号码！", 400, 200, '提示', null);
		return;
	}
	if (smscode == "") {
		ymPrompt.alert("请输入手机验证码！", 400, 200, '提示', null);
		return false;
	}
	
	if($checked!="checked"){
		ymPrompt.alert("请先同意认证投资人使用协议！", 400, 200, '提示', null);
		return;
	}
	fn_ajax("/member/validatePhone", {
		phone : phone,
		smscode : smscode,
	}, function(data) {
		if (data == "1") {
			window.location.href = "/visitor/to-shenfenginfo3";		
		} else {
			ymPrompt.errorInfo('手机验证失败！', 400, 200, '失败', null);
		}
	});

}

// 安全问题认证
function submit_question() {
	var question01 = $("#question01 option:selected").val();
	var anwser01 = $.trim($("#anwser01").val());
	var question02 = $("#question02 option:selected").val();
	var anwser02 = $.trim($("#anwser02").val());
	if (question01 == "" || anwser01 == "" || question02 == ""
			|| anwser02 == "") {
		ymPrompt.alert('请填写完整信息！', 400, 200, '提示', null);
		return;
	}
	if (question01 == question02) {
		ymPrompt.alert('请选择不同的安全问题！', 400, 200, '提示', null);
		return;
	}
	fn_ajax("/member/setSafetyProblem", {
		question01 : question01,
		anwser01 : anwser01,
		question02 : question02,
		anwser02 : anwser02
	}, function(data) {
		if (data == "1") {
//			ymPrompt.succeedInfo('安全问题设置成功！', 400, 200, '成功', null);
//			fun_safeverify();
			$(".layerBodyBox").css("display", "none");
			$("#verify_ips").css("display", "block");
		} else {
			ymPrompt.errorInfo('安全问题设置失败！', 400, 200, '失败', null);
		}
	});
}

//注册环迅账户
function regist_ips(){
	window.location.href = "/member/ipsRegistration";
}

// 发送手机验证码
function send_smscode() {

	var phone = $("#telephones").val();// 手机号

	if (!ver_phone.test(phone)) {
		ymPrompt.alert("请输入有效的手机号码！", 400, 200, '提示', null);
		return;
	} else {
		fn_ajax("/member/sendSMS", {
			phone : phone
		}, function(data) {
//			alert(data);
			if (data == "1") {
				ymPrompt.succeedInfo('手机验证码已成功发送至您的手机，请注意查收', 400, 200, '成功',
						null);
			} else {
				ymPrompt.errorInfo('手机验证码发送失败！', 400, 200, '失败', null);
			}
		});
	}
}

//发送激活邮件
function fun_replymail(){
	fn_ajax("/member/replymail", {}, function(data) {
		if (data == "1") {
			ymPrompt.succeedInfo('我们已将激活邮件发送至您的邮箱，请注意查收', 400, 200, '成功',
					function(){
						if(gotoEmail($.trim($("#e-mail").val()))!='null'){
							window.open(gotoEmail($.trim($("#e-mail").val())));
						}
					});
		} else if(data=="2") {
			ymPrompt.errorInfo('请求过于频繁，请等待两分钟！', 400, 200, '提示', null);
		} else {
			ymPrompt.errorInfo('激活邮件发送失败！', 400, 200, '失败', null);
		}
	});
}
 
//实名认证
function fun_verifyidentity(){
	var userName = $.trim($("#userName").val());//用户名
	var cardId = $.trim($("#cardId").val());//身份证号码
	if(userName == "" || userName == null){
		ymPrompt.alert('请输入真实姓名！', 400, 200, '提示', null);
		return ;
	}
	if(userName.length > 3){
		ymPrompt.alert('真实姓名长度不能超过3位！', 400, 200, '提示', null);
		return ;
	}
	if(cardId == "" || cardId == null){
		ymPrompt.alert('请输入身份证号！', 400, 200, '提示', null);
		return ;
	}
	if(checkIdcard(cardId)){
		fn_ajax("/member/identityValidateImpl", {name:userName,cardId:cardId}, function(data) {
			if (data == "1") {
				window.location.reload();
			} else {
				ymPrompt.errorInfo('实名认证失败！', 400, 200, '失败', null);
			}
		});
	}
}

// 身份证验证
function checkIdcard(num) {
	num = num.toUpperCase();
	// 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X。
	if (!(/(^\d{15}$)|(^\d{17}([0-9]|X)$)/.test(num))) {
		// alert('输入的身份证号长度不对，或者号码不符合规定！\n15位号码应全为数字，18位号码末位可以为数字或X。');
		ymPrompt.alert('请输入正确的身份证号码！', 400, 200, '失败', null);
		return false;
	}
	// 校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
	// 下面分别分析出生日期和校验位
	var len, re;
	len = num.length;
	if (len == 15) {
		re = new RegExp(/^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/);
		var arrSplit = num.match(re);

		// 检查生日日期是否正确
		var dtmBirth = new Date('19' + arrSplit[2] + '/' + arrSplit[3] + '/'
				+ arrSplit[4]);
		var bGoodDay;
		bGoodDay = (dtmBirth.getYear() == Number(arrSplit[2]))
				&& ((dtmBirth.getMonth() + 1) == Number(arrSplit[3]))
				&& (dtmBirth.getDate() == Number(arrSplit[4]));
		if (!bGoodDay) {
			// alert('输入的身份证号里出生日期不对！');
			ymPrompt.alert('请输入正确的身份证号码！', 400, 200, '失败', null);
			return false;
		} else {
			// 将15位身份证转成18位
			// 校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
			var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5,
					8, 4, 2);
			var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4',
					'3', '2');
			var nTemp = 0, i;
			num = num.substr(0, 6) + '19' + num.substr(6, num.length - 6);
			for (i = 0; i < 17; i++) {
				nTemp += num.substr(i, 1) * arrInt[i];
			}
			num += arrCh[nTemp % 11];
			return true;
		}
	}
	if (len == 18) {
		re = new RegExp(/^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/);
		var arrSplit = num.match(re);

		// 检查生日日期是否正确
		var dtmBirth = new Date(arrSplit[2] + "/" + arrSplit[3] + "/"
				+ arrSplit[4]);
		var bGoodDay;
		bGoodDay = (dtmBirth.getFullYear() == Number(arrSplit[2]))
				&& ((dtmBirth.getMonth() + 1) == Number(arrSplit[3]))
				&& (dtmBirth.getDate() == Number(arrSplit[4]));
		if (!bGoodDay) {
			// alert(dtmBirth.getYear());
			// alert(arrSplit[2]);
			// alert('输入的身份证号里出生日期不对！');
			ymPrompt.alert('请输入正确的身份证号码！', 400, 200, '失败', null);
			return false;
		} else {
			// 检验18位身份证的校验码是否正确。
			// 校验位按照ISO 7064:1983.MOD 11-2的规定生成，X可以认为是数字10。
			var valnum;
			var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5,
					8, 4, 2);
			var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4',
					'3', '2');
			var nTemp = 0, i;
			for (i = 0; i < 17; i++) {
				nTemp += num.substr(i, 1) * arrInt[i];
			}
			valnum = arrCh[nTemp % 11];
			if (valnum != num.substr(17, 1)) {
				// alert('18位身份证的校验码不正确！应该为：' + valnum);
				ymPrompt.alert('请输入正确的身份证号码！', 400, 200, '失败', null);
				return false;
			}
			return true;
		}
	}
	return false;
}

//安全认证
function fun_safeverify(){
	window.location.href = "/member/safeVerify";
}

//修改邮箱
function uptEmail(){
	var reg = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/; //验证邮箱的正则表
	var e1 = $.trim($("#e-mail").val());
	var e2 = $.trim($("#e-mail2").val());
	if(e1 == ""){
		ymPrompt.alert('请输入邮箱！', 400, 200, '提示', null);
		return false;
	}
	if(!reg.test(e1))
    {
		ymPrompt.alert('您输入的新邮箱有误！', 400, 200, '提示', null);
        return false;
    }
	if(e2 == ""){
		ymPrompt.alert('请输入确认邮箱！', 400, 200, '提示', null);
		return false;
	}
	if(!reg.test(e2))
    {
		ymPrompt.alert('您输入的确认邮箱有误！', 400, 200, '提示', null);
        return false;
    }
	if(e1 != e2){
		ymPrompt.alert('两次邮箱不一致！', 400, 200, '提示', null);
		return false;
	}else{
    	fn_ajax("/member/uptEmail",{id:$("#login_userid").val(), email:e1},function(data){
    		if(data=="1")
    		{
    			ymPrompt.succeedInfo('邮箱绑定成功，我们已将激活邮件发送至您的邮箱，请注意查收！', 400, 200, '成功', function(){
    				fun_replymail();
    			});
    		}
    		else{
    			ymPrompt.errorInfo('邮箱修改失败！', 400, 200, '失败', null);
    		}
    	});
    }
	
}

//显示修改邮箱的table
function show_uptemail(){
	$("#email_context1").hide();
	$("#send_email").hide();
	$("#tab_uptemail").show();
	$("#update_email").show();
}

//显示微信二维码
function show_weixin(){
	var content = "";
	content+="<div id=\"message\">";
	content+="<div id=\"msgbg\" style=\"position:absolute;top:0%;left:0%;width:100%;height:"+($(document.body).height()<document.documentElement.clientHeight?(document.documentElement.clientHeight+"px"):($(document.body).height()+"px"))+";background-color:black;z-index:1002;-moz-opacity: 0.4;opacity:.40;filter: alpha(opacity=40);\"></div>";
	content+="<div id=\"msg\" style=\"position:fixed;left:"+($(document.body).width()-360)/2+"px;top:"+((document.documentElement.clientHeight-340)/2-20)+"px;z-index:1003;overflow: auto;\">";
	content+="<div";
	content+="	style=\"width: 360px; height: 341px; background-color:#fff;border-radius: 5px;\">";
	content+="	<div";
	content+="		style=\"height: 40px;line-height: 40px;position: relative;padding: 0 10px;font-size: 14px;border-bottom: 1px solid #e7ecee;\">";
	content+="	  <h2 style=\"float:left;\">关注前海红筹官方微信</h2>";
	content+="	  <a href=\"javascript:void(0)\" onclick=\"$('#message').remove()\" style=\"float:right;background:none;margin-top:8px;\"><img src=\"/resources/images/img/close.jpg\" /></a>";
	content+="	</div>";
	content+="	<div>";
	content+="	  <p style=\"padding:15px 0;\">";
	content+="	  <img style=\"display:block;margin:0 auto;width:220px;height:220px\" src=\"/resources/images/img/2weima.png\" />";
	content+="	  </p>";
	content+="	  <div style=\"background: #e7ecee;height: 50px;border-radius:0 0 5px 5px;\">";
	content+="	    <p style=\"padding:7px 10px 0 10px;font-size:12px;line-height:20px;\">打开微信，点击底部的″发现″，使用″扫一扫″即可关注前海红筹官方微信。</p>";
	content+="	  </div>";
	content+="	</div>";
	content+="</div>";
	content+="</div>";
	content+="</div>";
	content+="</div>";
	$("#erweima").html(content);
}

//收藏本站
function AddFavorite(title, url) {
    try {
        window.external.addFavorite(url, title);
    }
    catch (e) {
        try {
            window.sidebar.addPanel(title, url, "");
        }
        catch (e) {
            alert("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请使用Ctrl+D进行添加");
        }
    }
}

//跳转邮箱
function gotoEmail(email){
	var hash={ 
		'qq.com': 'http://mail.qq.com', 
		'gmail.com': 'http://mail.google.com', 
		'sina.com': 'http://mail.sina.com.cn', 
		'163.com': 'http://mail.163.com', 
		'126.com': 'http://mail.126.com', 
		'yeah.net': 'http://www.yeah.net/', 
		'sohu.com': 'http://mail.sohu.com/', 
		'tom.com': 'http://mail.tom.com/', 
		'sogou.com': 'http://mail.sogou.com/', 
		'139.com': 'http://mail.10086.cn/', 
		'hotmail.com': 'http://www.hotmail.com', 
		'live.com': 'http://login.live.com/', 
		'live.cn': 'http://login.live.cn/', 
		'live.com.cn': 'http://login.live.com.cn', 
		'189.com': 'http://webmail16.189.cn/webmail/', 
		'yahoo.com.cn': 'http://mail.cn.yahoo.com/', 
		'yahoo.cn': 'http://mail.cn.yahoo.com/', 
		'eyou.com': 'http://www.eyou.com/', 
		'21cn.com': 'http://mail.21cn.com/', 
		'188.com': 'http://www.188.com/', 
		'foxmail.com': 'http://www.foxmail.com' 
	}; 
	var mail=email.split('@')[1]; 
	if(mail in hash){
		return hash[mail];
	}
	return 'null';
}