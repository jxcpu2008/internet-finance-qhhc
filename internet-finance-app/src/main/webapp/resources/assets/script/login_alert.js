var user_exist = true;
$(function() {
	$("#loginName").blur(function() {
		if ($.trim($(this).val()) != "") {
			var checkName = $.ajax({
				url : '/registration/checkOnly_username',
				data : {
					fieldValue : $(this).val()
				},
				type : 'post',
				async : false
			}).responseText;
			if (checkName == '[null,true]') {
				$("#ln_error").text('用户不存在');
				$("#ln_error").css('visibility', 'visible');
				user_exist = false;
			} else {
				$("#ln_error").css('visibility', 'hidden');
				user_exist = true;
			}
		}
	});
	// 登陆提交
	$(document).bind('keydown', keydownHandler);
	$("#formSubmit").click(loginHandler); // 登录表单提交
});

function submitLogin() {
	 $('body').spinner('正在登录...');
	$(document).unbind('keydown', keydownHandler);
	$.ajax({
		url : '/registration/login',
		data : $("#loginForm").serialize(),
		type : 'post',
		success : function(msg) {
			if (msg == "errorValidate") {
				$("#val_error").text('验证码错误');
				$("#val_error").css('visibility', 'visible');
				$("#captcha").val('');
				$("#code").trigger('click');
				 $('body').removerSpinner();
				$(document).bind('keydown', keydownHandler);
			} else if (msg == "errorLock") {
				$("#val_error").text('密码错误5次,请联系客服人员');
				$("#val_error").css('visibility', 'visible');
				 $('body').removerSpinner();
				$(document).bind('keydown', keydownHandler);
			} else if (msg == "errorPwd") {
				$("#pw_error").text('用户名或密码不匹配').css("color","red");
				$("#pw_error").css('visibility', 'visible');
				 $('body').removerSpinner();
				$(document).bind('keydown', keydownHandler);
			} else if (msg == "adminLock") {
				$("#val_error").text('该会员被管理员禁用');
				$("#val_error").css('visibility', 'visible');
				 $('body').removerSpinner();
				$(document).bind('keydown', keydownHandler);
			} else if (msg == "isLock") {
				$("#val_error").text('该会员已被锁定,24小时后解锁');
				$("#val_error").css('visibility', 'visible');
				 $('body').removerSpinner();
				$(document).bind('keydown', keydownHandler);
			} else if (msg == "success") {
				$("#loginName").val('');
				$("#captcha").val('');
				window.location.reload();
			}
		}
	});
}
function loginHandler() {
	if ($.trim($("#loginName").val()) == "") {
		$("#ln_error").css('visibility', 'visible');
		return;
	} else if (!user_exist) {
		$("#ln_error").text('用户不存在');
		$("#ln_error").css('visibility', 'visible');
		return;
	} else if ($.trim($("#loginPwd").val()) == "") {
		$("#ln_error").css('visibility', 'hidden');
		$("#pw_error").text('密码不能为空').css("color","red");
		$("#pw_error").css('visibility', 'visible');
		return;
	} else if ($.trim($("#captcha").val()) == "") {
		$("#pw_error").css('visibility', 'hidden');
		$("#val_error").text('验证码不能为空');
		$("#val_error").css('visibility', 'visible');
		return;
	} else {
		$("#pw_error").css('visibility', 'hidden');
		$("#val_error").css('visibility', 'hidden');
		submitLogin();
	}
}
function keydownHandler(event) {
	// 登录框显示才触发登录方法
	if ($("#zcModal_login").is(":visible")) {
		if (event.which == 13) {
			loginHandler();
		}
	}
}