function checkEmail() {     // 检查邮箱是否存在
	if ($.trim($("#email_val").val()) == '') {
		return;
	}
	var isExist = $.ajax({
		url : '/registration/checkOnly_email?fieldValue='
				+ $("#email_val").val(),
		async : false
	}).responseText;
	if (isExist == "[null,false]") {
		NavCenter.getErrorInfo('该邮箱已存在',1);
		return false;
	} else {
		return true;
	}
}
function reset() {
	window.location.reload();
}
function checkLen(obj,name,type){
	var current = $("#"+obj+" input[name='"+name+"']");
	if (current.val().length >= 6 && current.val().length <= 18) {
		return true;
	} else {
		NavCenter.getErrorInfo('密码必须为6-18位',type);
		return false;
	}
}
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
function handle(t_phone,obj) {
	fn_ajax("/member/sendSMSForReg", {phone : t_phone,CSRFToken : $("#CSRFToken").val()}, function(data) {
		if (data == "1") {
			ymPrompt.succeedInfo('手机验证码发送成功，请注意查收!',450, 200, '成功', null);
			$(obj).unbind('click').css({
				'background-color' : '#cccccc',
				'border-color' : '#cccccc'
			});
			var time = 60;
			var code = setInterval(function() {
				if (time == 0) {
					clearInterval(code);
					$(obj).css({
						'background-color' : '#d9534f',
						'border-color' : '#d43f3a'}).text('获取手机验证码').bind('click', function(){
							handle(t_phone,obj);
						});
				} else {
					$(obj).text(function() {
						--time;
						prefix = time < 10 ? '0' : '';
						return prefix + time + '秒后重新发送';
					});
				}
			}, '1000');
		} else if (data == "0") {
			ymPrompt.errorInfo('手机验证码发送失败!',450, 200, '失败', null);
		}
	});
}
$(function() {
	// 修改邮箱绑定 begin
	$("#uptEmail").click(function() {
		var reg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		var email = $("#email_val").val();
		if (!reg.test(email)) {
			NavCenter.getErrorInfo('请输入正确的邮箱',1);
			return false;
		} else {
		}
		if (checkEmail()) {
			$.ajax({
				url : '/member/resetMail?email='+email,
				type : 'post',
				success : function(data) {
					if (data == "1") {
						ymPrompt.succeedInfo('邮箱发送成功，注意查收！',420, 200, '成功',reset);
					} else {
						ymPrompt.errorInfo('邮箱发送失败！', 420, 200, '失败', reset);
					}
					$("#email_val").val('');
				}
			});
		}
	});
	// 修改邮箱绑定 end
	// 修改登录密码 begin
	$("#uptLoginPwd").click(function() {
			var flag = true;
			// 原密码
			var login_oldPwd = $.trim($("#form_uptLoginPwd [name=oldPwd]").val());
			// 新密码
			var login_newPwd = $.trim($("#form_uptLoginPwd [name=newPwd]").val());
			// 确认新密码
			var login_surePwd = $.trim($("#form_uptLoginPwd [name=surePwd]").val());
			if (!checkLen('form_uptLoginPwd','oldPwd',5)) {
				return;
			}
			if (!checkLen('form_uptLoginPwd','newPwd',6)) {
				return;
			}
			if (!checkLen('form_uptLoginPwd','surePwd',7)) {
				return;
			}
			if (login_surePwd != login_newPwd) {
				NavCenter.getErrorInfo('两次密码不一致',7);
				// 请确认两次密码是否一致
				flag = false;
			}
			if (flag) {
				$('#form_uptLoginPwd').ajaxSubmit({dataType : 'text',success : function(msg) {
						if (msg == "true") {
							ymPrompt.succeedInfo('修改成功', 300, 160,'成功', reset);
						} else if (msg == "different") {
							NavCenter.getErrorInfo('原密码错误',5);
						} else if (msg == "notFit") {
							ymPrompt.errorInfo('两次密码输入不一致！', 400, 200,'失败', null);
						} else {
							ymPrompt.errorInfo('修改失败！', 300, 160,'失败', null);
						}
					}
				});
			}
	});
	// 修改登录密码 end
	// 修改交易密码    begin
	$("#uptTradePwd").click(function() {
		// 新密码
		var login_newPwd = $.trim($("#form_uptTradePwd [name=newPwd]").val());
		// 确认新密码
		var login_surePwd = $.trim($("#form_uptTradePwd [name=surePwd]").val());
		if (!checkLen('form_uptTradePwd','newPwd',8)) {
			return;
		}
		if (!checkLen('form_uptTradePwd','surePwd',9)) {
			return;
		}
		if (login_surePwd != login_newPwd) {
			NavCenter.getErrorInfo('两次密码不一致',9);
			return;
		}
		// 获取验证码
		if (!/^\d{6}$/.test($.trim($("#verifyCode").val()))) {
			NavCenter.getErrorInfo('验证码无效',10);
			return; 
		}
		$.ajax({
			url : "/update_info/update_paypwd",
			type : "post",
			data : $("#form_uptTradePwd").serialize(),
			success : function(data) {
				if (data == "notFit") {
					ymPrompt.errorInfo('两次密码输入不匹配！',400 , 200, '失败' , null);
				} else if (data == "codeNotFit") {
					ymPrompt.errorInfo('验证码不匹配！', 400, 200, '失败', null);
				} else if (data == "error") {
					ymPrompt.errorInfo(data, 400, 200, '失败', null);
				} else {
					ymPrompt.succeedInfo('交易密码修改成功，请谨记！', 400, 200, '成功', reset);
				}
			}
		});
	});
	// 修改交易密码
	$("#getPhoneCode").click(function(){
		handle($("#phone").val(),this);
	});
	// 修改绑定手机
	$("#phone_getCode").click(function(){
		var regPhone = /^1[3,4,7,5,8]{1}[0-9]{9}$/;
		var newPhone = $("#newPhone").val();
		if (!regPhone.test(newPhone)) {
			NavCenter.getErrorInfo('请输入正确的手机号码',2);
		} else {
			var isExist = $.ajax({url : '/registration/checkOnly_phone?fieldValue=' + newPhone,async : false}).responseText;
			if (isExist == '[null,false]') {
				NavCenter.getErrorInfo('该手机号码已被使用',2);
				return;
			}
			handle(newPhone,this);
		}
	});
	// 修改交易密码 end
	// 绑定手机 begin
	$("#bindPhone").click(function() {
		var regPhone = /^1[3,4,7,5,8]{1}[0-9]{9}$/;
		var newPhone = $("#newPhone").val();// 新手机号
		var verifyCode = $("#p_valifyCode").val();  // 短信验证码
		var trade_pwd = $("#trade_pwd").val();  // 交易密码
		if (!regPhone.test(newPhone)) {
			NavCenter.getErrorInfo('请输入正确的手机号码',2);
			return;
		}
		// 获取验证码
		if (!/^\d{6}$/.test($.trim($("#p_valifyCode").val()))) {
			NavCenter.getErrorInfo('验证码无效',3);
			return; 
		}
		if (!checkLen('form_bindPhone','tradePwd',4)) {
			return;
		}
		$.ajax({
			url : '/member/bindPhone.htm',
			type : 'post',
			data : $("#form_bindPhone").serialize(),
			success : function(data) {
				if (data == "5") {
					ymPrompt.succeedInfo('手机绑定成功！', 400, 200, '成功', reset);
				} else if (data == "1") {
					ymPrompt.errorInfo('手机验证码错误！', 400, 200, '失败', null);
				} else if (data == "0") {
					ymPrompt.errorInfo('手机验证码超时！', 400, 200, '失败', null);
				} else if (data == "2") {
					ymPrompt.errorInfo('手机绑定失败！', 400, 200, '失败', null);
				} else if (data == "3") {
					ymPrompt.errorInfo('交易密码错误！', 400, 200, '失败', null);
				}
			}
		});
	});
	// 绑定手机 end
});