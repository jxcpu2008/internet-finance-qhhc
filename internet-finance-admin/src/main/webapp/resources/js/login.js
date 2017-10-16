$(function() {

	$('.change').bind('click', function() {
		$("#code").trigger('click');
	});

	// 登录与注册
	var inputlight = {
		'border-color' : '#ce251f',
		'box-shadow' : '0 0 4px rgba(206,37,31,.6)'
	};

	$(".lanceTx").focusout(function() {
		if ($(this).val() == "") {
			$(this).parent('div').next().show();
			$(this).css(inputlight);
			if ($(this).attr("name") == "userName") {
				$(this).parent('div').next().addClass("tips user-tips");
				$(this).parent('div').next().children('small').text("请输入用户名");
			}
			if ($(this).attr("name") == "pwd") {
				$(this).parent('div').next().addClass("tips passwd-tips");
				$(this).parent('div').next().children('small').text("请输入密码");
			}
			if ($(this).attr("name") == "captcha") {
				$(this).parent('div').next().addClass("tips ver-tips");
				$(this).parent('div').next().children('small').text("请输入验证码");
			}

		} else {
			$(this).removeAttr('style');
			$(this).parent('div').next().hide();
		}
	});

});

function checkOnly(name, value) {
	if (name == "userName") {
		return $.ajax({
			url : '/registration/checkOnly_username',
			data : {
				fieldValue : value
			},
			type : 'post',
			async : false
		}).responseText;
	}
}
var inputlight = {
	'border-color' : '#ce251f',
	'box-shadow' : '0 0 4px rgba(206,37,31,.6)'
};
function checkLogin() {

	if ($("#loginName").val() == "") {
		$("#loginName").parent('div').next().show();
		$("#loginName").css(inputlight);
		$("#loginName").parent('div').next().addClass("tips user-tips");
		$("#loginName").parent('div').next().children('small').text("用户名不能为空");
		return false;
	}

	if (checkOnly("userName", $("#loginName").val()) == "[null,true]") {
		$("input[name='userName']").parent('div').next().show();
		$("input[name='userName']").css(inputlight);
		$("input[name='userName']").parent('div').next().addClass(
				"tips user-tips");
		$("input[name='userName']").parent('div').next().children('small')
				.text("不存在该用户");
		return false;
	}

	/*
	 * if(checkOnly("email",$("#loginName").val())=="[null,false]"){
	 * $("input[name='userName']").parent('div').next().show();
	 * $("input[name='userName']").css(inputlight);
	 * $("input[name='userName']").parent('div').next().addClass("tips
	 * user-tips");
	 * $("input[name='userName']").parent('div').next().children('small').text("邮箱还未激活");
	 * return false; }
	 */

	if ($("#loginPwd").val() == "") {
		$("#loginPwd").parent('div').next().show();
		$("#loginPwd").css(inputlight);
		$("#loginPwd").parent('div').next().addClass("tips passwd-tips");
		$("#loginPwd").parent('div').next().children('small').text("密码不能为空");
		return false;
	}
	if ($("input[name='captcha']").val() == "") {
		$("#captcha").parent('div').next().show();
		$("#captcha").css(inputlight);
		$("#captcha").parent('div').next().addClass("tips ver-tips");
		$("#captcha").parent('div').next().children('small').text("验证码不能为空");
		return false;
	}
	return true;
}