function submitLogin() {
	$('body').spinner('正在登录...');
	$(document).unbind('keydown', keydownHandler);
	$.ajax({
		url : '/registration/login',
		data : $("#loginForm").serialize(),
		type : 'post',
		success : function(msg) {
			if (msg == "errorValidate") {
				Login.getErrorInfo('验证码错误', 2);
				$(":password").parent().find('div.popover').remove();
				$("#captcha").val('');
				$("#code").trigger('click');
				$('body').removerSpinner();
				$(document).bind('keydown', keydownHandler);
			} else if (msg == "errorLock") {
				Login.getErrorInfo('密码错误5次,请联系相关人员！', 1);
				$('body').removerSpinner();
				$(document).bind('keydown', keydownHandler);
			} else if (msg == "errorPwd") {
				window.location.href = "/visitor/to-login?id=1&name="
						+ $("#loginName").val() + "&skip="+$("#skip").val();
				$('body').removerSpinner();
				$(document).bind('keydown', keydownHandler);
			} else if (msg == "adminLock") {
				Login.getErrorInfo('该会员被管理员禁用', 1);
				$('body').removerSpinner();
				$(document).bind('keydown', keydownHandler);
			} else if (msg == "isLock") {
				Login.getErrorInfo('该会员已被锁定,24小时后解锁！', 1);
				$('body').removerSpinner();
				$(document).bind('keydown', keydownHandler);
			} else if (msg == "success") {
				var skip = $("#skip").val();
				if ($.trim(skip)) {
					window.location.href = "/"+skip;
				} else {
					window.location.href = "/member_index/member_center.htm"
							+ "?index=0_0&nav=5";
				}
			}
		}
	});
}

function loginHandler() {
	if ($.trim($("#loginName").val()) == "") {
		Login.getErrorInfo('用户名不能为空', 0);
		return;
	} else if ($.trim($("#loginPwd").val()) == "") {
		Login.getErrorInfo('密码不能为空', 1);
		return;
	} else if ($.trim($("#captcha").val()) == "") {
		Login.getErrorInfo('验证码不能为空', 2);
		return;
	} else {
		$('input[data-id="login-man"]').trigger('blur');
		if ($('input[data-id="login-man"]').next().hasClass(
				'glyphicon-ok')) {
			submitLogin();
		}
	}
}
function keydownHandler(event) {
	if (event.which == 13) {
		loginHandler();	
	}
}

$(function() {
	Login.init();
	$("#pwdCount").val("");
	// 登陆提交
	$(document).bind('keydown', keydownHandler);
	$('input[data-id="login-man"]').trigger('blur');
	$("#formSubmit").click(function() { // 登录表单提交
		loginHandler();		
	});

	// 密码错误次数
	var errorPwd = $("#errorPwd").val();
	var isLogin = $("#isLogin").val();
	if (isLogin != "") {
		if (errorPwd != "") {
			errorPwd = 5 - parseInt(errorPwd);
			Login.getErrorInfo('密码错误，还有' + errorPwd + '次机会', 1);
		}
	}

});
