var nick = /^\w{6,18}$/;
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
	$("#exist").click(function(){     // 推荐人取消后清楚相应的提示
		if(!$(this).prop('checked')){
			$("input[name='number']").parent('div').next().children('small').text(
					'');
			$("input[name='number']").parent('div').next().removeClass("reg-tips");
			$("input[name='number']").parent('div').next().removeClass("referrer");
		}
	});
	$("#investment").click(function(){
		$("#regName").val('');
		$("#regAddr").val('');
		$("#regRealName").val('');
		$("#regCardId").val('');
	});
	$("#regRecom").blur(function() {
		checkReferrer();
	});
	$(".loginTx").focus(
			function() {
				if ($(this).attr("name") == "userName") {
					$(this).parent('div').next().children('small').text(
							'6-18位字符,可由字母、数字及"_"组合');
					$(this).parent('div').next().addClass("reg-tips");
				} else if ($(this).attr("name") == "pwd") {
					$(this).parent('div').next().children('small').text(
							"密码长度为6-18位");
					$(this).parent('div').next().addClass("reg-tips");
				} else if ($(this).attr("name") == "pwd2") {
					$(this).parent('div').next().children('small').text(
							"请输入相同的密码");
					$(this).parent('div').next().addClass("reg-tips");
				}
			});
	$(".loginTx")
			.focusout(
					function() {
						if ($(this).val() == "") {
							$(this).parent('div').next().children('small')
									.text("该项不能为空");
							$(this).parent('div').next().addClass("reg-tips");
						} else {
							if ($(this).attr('name') == "userName") { // 用户名失去焦点
								var strname = $("input[name='userName']").val();
								if (!nick.test(strname)) {
									$("input[name='userName']").parent('div').next().addClass("reg-tips");
									$("input[name='userName']").parent('div').next().children('small')
											.text('6-18位字符,可由字母、数字及"_"组合');
									$("input[name='userName']").focus();
									return;
								}
								if (checkOnly("userName", $(
										"input[name='userName']").val()) == "[null,false]") {
									$("input[name='userName']").parent('div')
											.next().addClass("reg-tips");
									$("input[name='userName']").parent('div')
											.next().children('small').text(
													"该用户名已被使用");

									return;
								} else {
									$(this).parent('div').next().children(
											'small').text("");
									$(this).parent('div').next().removeClass(
											"reg-tips");
								}
							} else {
								$(this).parent('div').next().children('small')
										.text("");
								$(this).parent('div').next().removeClass(
										"reg-tips");
							}

							if ($(this).attr('name') == "phone1") { // 手机号失去焦点
								var userName = $.trim($("input[name='userName']").val());
								if (userName=='') {
									$("input[name='phone1']").parent('div').next().addClass("reg-tips");
									$("input[name='phone1']").parent('div').next().children('small')
											.text("请先填写用户名");
									$("input[name='userName']").focus();
									return;
								}
								var myreg = /^1[3,4,5,8,7]{1}[0-9]{1}[0-9]{8}$/;
								if (!myreg
										.test($("input[name='phone1']").val())) {
									$("input[name='phone1']").parent('div')
											.next().addClass("reg-tips");
									$("input[name='phone1']").parent('div')
											.next().children('small').text(
													"请输入正确的手机号");
									return;
								}

								if (checkOnly("phone1", $(
										"input[name='phone1']").val()) == "[null,false]") {
									$("input[name='phone1']").parent('div')
											.next().addClass("reg-tips");
									$("input[name='phone1']").parent('div')
											.next().children('small').text(
													"该手机号码已存在");
									return;
								}
							} else {
								$(this).parent('div').next().children('small')
										.text("");
								$(this).parent('div').next().removeClass(
										"reg-tips");
							}
							
							if ($(this).attr('name') == "pcode") { //验证码失去焦点
								var num = /^\d{6}$/;
								if (!num.test($("input[name='pcode']").val())) {
									$("input[name='pcode']").parent('div')
											.next().addClass("reg-tips");
									$("input[name='pcode']").parent('div')
											.next().children('small').text(
													"请输入6位有效数字");
									return;
								}
								var valiResult = checkOnly("valiCode", $("input[name='pcode']").val());
								if (valiResult == "0") {
									$("input[name='pcode']").parent('div')
											.next().addClass("reg-tips");
									$("input[name='pcode']").parent('div')
											.next().children('small').text(
													"请先获取手机验证码");
									return;
								}
								if (valiResult == "-1") {
									$("input[name='pcode']").parent('div')
											.next().addClass("reg-tips");
									$("input[name='pcode']").parent('div')
											.next().children('small').text(
													"验证码不匹配");
									return;
								}
							} else {
								$(this).parent('div').next().children('small')
										.text("");
								$(this).parent('div').next().removeClass(
										"reg-tips");
							}
						}

					});

});

function checkOnly(name, value) {
	if (name == "userName") {
		return $.ajax({
			url : '/registration/regCheckOnly_username?fieldValue=' + value,
			async : false
		}).responseText;

	} else if (name == "phone1" && $("input[name='phone1']").val() != "") {
		return $.ajax({
			url : '/registration/checkOnly_phone?fieldValue=' + value,
			async : false
		}).responseText;
		/*
		 * } else if (name == "email1d" && $("input[name='email1']").val() !=
		 * "") { return $.ajax({ url :
		 * '/registration/checkOnly_email?fieldValue=' + value, async : false
		 * }).responseText;
		 */
	} else if (name == "referrer" && $("input[name='number']").val() != "") {
		return $.ajax({
			url : '/registration/checkOnly_referrer?fieldValue=' + value,
			async : false
		}).responseText;
	} else if (name == "valiCode" && $("input[name='pcode']").val() != "") {
		return $.ajax({
			url : '/registration/checkValiCode?fieldValue=' + value,
			async : false
		}).responseText;
	}
}

function checkReferrer() {
	var isChecked = $("#exist").prop('checked');
	if (isChecked) {
		var referrer = /^(\d+)|([TG or tg]-\d+)|(1\d{10})$/;
		var name = '';
		$("input[name='number']").parent('div').next().removeClass("referrer");
		$("input[name='number']").parent('div').next().addClass("reg-tips");
		if ($("input[name='number']").val() == "") {
			$("input[name='number']").parent('div').next().children('small')
					.text("该项不能为空");
			return false;
		}
		if (!referrer.test($("input[name='number']").val())) {
			$("input[name='number']").parent('div').next().children('small')
					.text("请输入推荐人编号或手机号");
			return false;
		}
		if ((name = checkOnly("referrer", $("input[name='number']").val())) == "null") {
			$("input[name='number']").parent('div').next().children('small')
					.text("推荐人编号或手机不存在");
			return false;
		} else {
			$("input[name='number']").parent('div').next().removeClass(
					"reg-tips");
			$("input[name='number']").parent('div').next().addClass("referrer");
			$("input[name='number']").parent('div').next().children('small')
					.text(name);
			return true;
		}
	} else {
		$("input[name='number']").parent('div').next().children('small').text(
				'');
		$("input[name='number']").parent('div').next().removeClass("reg-tips");
		$("input[name='number']").parent('div').next().removeClass("referrer");
		return true;
	}
}

function check() {
	var type = $("#type").val();
	var real = /.*[\u4e00-\u9fa5]+.*$/;
	var isNotcard = $("#isNotcard").val();
	if ($("input[name='userName']").val() == "") {
		$("input[name='userName']").parent('div').next().addClass("reg-tips");
		$("input[name='userName']").parent('div').next().children('small')
				.text("该项不能为空");
		return;
	}
	var strname = $("input[name='userName']").val();
	if (!nick.test(strname)) {
		$("input[name='userName']").parent('div').next().addClass("reg-tips");
		$("input[name='userName']").parent('div').next().children('small')
				.text('6-18位字符,可由字母、数字及"_"组合');
		$("input[name='userName']").focus();
		return;
	}
	if ($("input[name='userName']").parent('div').next().hasClass("reg-tips")) {
		$("input[name='userName']").focus();
		return;
	}

	if ($("input[name='pwd']").val() == "") {
		$("input[name='pwd']").parent('div').next().addClass("reg-tips");
		$("input[name='pwd']").parent('div').next().children('small').text(
				"该项不能为空");
		return;
	}

	if ($("input[name='pwd']").val().length < 6
			|| $("input[name='pwd']").val().length > 18) {
		$("input[name='pwd']").parent('div').next().addClass("reg-tips");
		$("input[name='pwd']").parent('div').next().children('small').text(
				"密码长度为6-18位");
		return;
	}
	if ($("input[name='pwd2']").val() == "") {
		$("input[name='pwd2']").parent('div').next().addClass("reg-tips");
		$("input[name='pwd2']").parent('div').next().children('small').text(
				"该项不能为空");
		return;
	}
	if ($("input[name='pwd2']").val() != $("input[name='pwd']").val()) {
		$("input[name='pwd2']").parent('div').next().addClass("reg-tips");
		$("input[name='pwd2']").parent('div').next().children('small').text(
				"两次输入密码不一致");
		return;
	}
	if (type == "2") {
		if ($("input[name='comName']").val() == "") {
			$("input[name='comName']").parent('div').next()
					.addClass("reg-tips");
			$("input[name='comName']").parent('div').next().children('small')
					.text("该项不能为空");
			return;
		}

		if ($("input[name='address']").val() == "") {
			$("input[name='address']").parent('div').next()
					.addClass("reg-tips");
			$("input[name='address']").parent('div').next().children('small')
					.text("该项不能为空");
			return;
		}
	}
	if (!checkReferrer()) { // 检查推荐人是否存在
		return;
	}
	/*
	 * var reg =
	 * /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	 * if ($("input[name='email1']").val() == "") {
	 * $("input[name='email1']").parent('div').next().addClass("reg-tips");
	 * $("input[name='email1']").parent('div').next().children('small').text(
	 * "该项不能为空"); return; }
	 * 
	 * if (!reg.test($("input[name='email1']").val().trim())) {
	 * $("input[name='email1']").parent('div').next().addClass("reg-tips");
	 * $("input[name='email1']").parent('div').next().children('small').text(
	 * "邮箱格式不正确"); return; }
	 * 
	 * if (checkOnly("email1d", $("input[name='email1']").val()) ==
	 * "[null,false]") {
	 * $("input[name='email1']").parent('div').next().addClass("reg-tips");
	 * $("input[name='email1']").parent('div').next().children('small').text(
	 * "该邮箱已存在"); return; }
	 */
	if (type == "2") {
		if (isNotcard == "0") {
			$("#regCardId").parent('div').next().addClass("reg-tips");
			$("#regCardId").parent('div').next().children('small').text(
					"身份证校验错误");
			return;
		} else if (isNotcard == "2") {
			if ($("#regRealName").val() == "") {
				$("#regRealName").parent('div').next().addClass("reg-tips");
				$("#regRealName").parent('div').next().children('small').text(
						"该项不能为空");
				return;
			}
			if (!real.test($("#regRealName").val())) {
				$("#regRealName").parent('div').next().addClass("reg-tips");
				$("#regRealName").parent('div').next().children('small').text(
						"请输入中文");
				alert('请输入中文');
				return;
			}
			var card = /^[1-9]{1}[0-9]{16}[0-9(X|x)]{1}$/;
			if ($("#regCardId").val() == ""
					|| !card.test($("#regCardId").val())) {
				$("#regCardId").parent('div').next().addClass("reg-tips");
				$("#regCardId").parent('div').next().children('small').text(
						"身份证格式不正确");
				return;
			}

		}
	}

	if ($("input[name='phone1']").val() == "") {
		$("input[name='phone1']").parent('div').next().addClass("reg-tips");
		$("input[name='phone1']").parent('div').next().children('small').text(
				"该项不能为空");
		return;
	}

	var myreg = /^1[3,4,5,8,7]{1}[0-9]{1}[0-9]{8}$/;
	if (!myreg.test($("input[name='phone1']").val())) {
		$("input[name='phone1']").parent('div').next().addClass("reg-tips");
		$("input[name='phone1']").parent('div').next().children('small').text(
				"请输入正确的手机号");
		return;
	}

	if (checkOnly("phone1", $("input[name='phone1']").val()) == "[null,false]") {
		$("input[name='phone1']").parent('div').next().addClass("reg-tips");
		$("input[name='phone1']").parent('div').next().children('small').text(
				"该手机号码已存在");
		return;
	}

	if ($("input[name='pcode']").val() == "") {
		$("input[name='pcode']").parent('div').next().addClass("reg-tips");
		$("input[name='pcode']").parent('div').next().children('small').text(
				"该项不能为空");
		return;
	}

	if (!$("#checkAgree").attr('checked')) {
		ymPrompt.alert("您还未同意前海红筹网站服务协议");
		return;
	} else {
		$('body').append('<div class="loading-cover"></div>');
		$('.reg-last>a').css("color", "#ce251f");
		$('.reg-last>.loading')
				.append(
						'<img src="/resources/images/main/preloader-w8-cycle-white.gif" />');
		$
				.ajax({
					url : '/registration/register.htm',
					type : 'post',
					data : $("#df_rigster").serialize(),
					success : function(data) {
						if (data == "1") {
							ymPrompt.confirmInfo("注册成功！小9偷偷告诉你，推广给朋友，还能获得推广奖励哦~~", 458, 200, "提示", function(result) {
								if (result == "ok") {
									window.location.href = "/member_index/member_center.htm";
								} else {
									window.location.href = "/visitor/to-login";
								}
							});
						} else if (data == "4") {
							ymPrompt.errorInfo('验证码错误！', null, null, null);
						} else if (data == "2") {
							ymPrompt.errorInfo('发送邮件失败！', null, null, null);
						} else if (data == "3") {
							ymPrompt.errorInfo('保存失败！', null, null, null);
						} else if (data == "0") {
							ymPrompt.errorInfo('注册失败！', null, null, null);
						} else if (data == "cardIdExist") {
							ymPrompt.errorInfo('身份证号已存在！', null, null, null);
						}
						$('.reg-last>.loading').find('img').remove();
						$('.reg-last>a').css("color", "#fff");
						$('.loading-cover').remove();
					}
				});
	}
}



// 跳转邮箱
function gotoemail1(email1) {
	var hash = {
		'qq.com' : 'http://mail.qq.com',
		'gmail.com' : 'http://mail.google.com',
		'sina.com' : 'http://mail.sina.com.cn',
		'163.com' : 'http://mail.163.com',
		'126.com' : 'http://mail.126.com',
		'yeah.net' : 'http://www.yeah.net/',
		'sohu.com' : 'http://mail.sohu.com/',
		'tom.com' : 'http://mail.tom.com/',
		'sogou.com' : 'http://mail.sogou.com/',
		'139.com' : 'http://mail.10086.cn/',
		'hotmail.com' : 'http://www.hotmail.com',
		'live.com' : 'http://login.live.com/',
		'live.cn' : 'http://login.live.cn/',
		'live.com.cn' : 'http://login.live.com.cn',
		'189.com' : 'http://webmail16.189.cn/webmail/',
		'yahoo.com.cn' : 'http://mail.cn.yahoo.com/',
		'yahoo.cn' : 'http://mail.cn.yahoo.com/',
		'eyou.com' : 'http://www.eyou.com/',
		'21cn.com' : 'http://mail.21cn.com/',
		'188.com' : 'http://www.188.com/',
		'foxmail.com' : 'http://www.foxmail.com'
	};
	var mail = email1.split('@')[1];
	if (mail in hash) {
		return hash[mail];
	}
	return 'null';
}

// 发送手机 send_smscode
$(function() {
	function handler() {
		var userName = $.trim($("input[name='userName']").val());
		if (userName=='') {      // 用户名不为空才发送短信请求
			$("input[name='phone1']").parent('div').next().addClass("reg-tips");
			$("input[name='phone1']").parent('div').next().children('small').text(
					"请先填写用户名");
			$("input[name='userName']").focus();
			return;
		}
		var phone = $("#regPhone").val();// 手机号

		if ($("input[name='phone1']").val() == "") {
			$("input[name='phone1']").parent('div').next().addClass("reg-tips");
			$("input[name='phone1']").parent('div').next().children('small')
					.text("该项不能为空");
			return;
		}

		var myreg = /^1[3,4,5,8,7]{1}[0-9]{1}[0-9]{8}$/;
		if (!myreg.test($("input[name='phone1']").val())) {
			$("input[name='phone1']").parent('div').next().addClass("reg-tips");
			$("input[name='phone1']").parent('div').next().children('small')
					.text("请输入正确的手机号");
			return;
		}

		if (checkOnly("phone1", $("input[name='phone1']").val()) == "[null,false]") {
			$("input[name='phone1']").parent('div').next().addClass("reg-tips");
			$("input[name='phone1']").parent('div').next().children('small')
					.text("该手机号码已存在");
			return;
		}
		fn_ajax("/member/sendSMSForReg", {
			phone : phone
		}, function(data) {
			if (data == "1") {
				ymPrompt.succeedInfo('手机验证码已成功发送至您的手机，请注意查收', 400, 200, '成功',
						null);
				$('#phoneCode').unbind('click').css({
					'color' : '#666',
					'background-color' : '#bbb'
				});
				var time = 60;
				var code = setInterval(function() {
					if (time == 0) {
						clearInterval(code);
						$('#phoneCode').css({
							'color' : '#fff',
							'background-color' : '#ce251f'
						}).text('获取手机验证码').bind('click', handler);
					} else {
						$('#phoneCode').text(function() {
							--time;
							prefix = time < 10 ? '0' : '';
							return prefix + time + '秒后重新发送';
						});
					}
				}, '1000');
			} else if (data == "0") {
				ymPrompt.errorInfo('手机验证码发送失败！', 400, 200, '失败', null);
			}
		});

	}
	$('#phoneCode').bind('click', handler);
});

$(function() {
	// 身份接口认证
	function handler() {
		var real = /^[\u4e00-\u9fa5]+$/;
		var realName = $("#regRealName").val();
		var cardId = $("#regCardId").val();
		if (realName == "") {
			$("#regRealName").parent('div').next().addClass("reg-tips");
			$("#regRealName").parent('div').next().children('small').text(
					"该项不能为空");
			return false;
		}
		if (!real.test(realName)) {
			$("#regRealName").parent('div').next().addClass("reg-tips");
			$("#regRealName").parent('div').next().children('small').text(
					"请输入中文");
			return false;
		}
		var card = /^[1-9]{1}[0-9]{16}[0-9(X|x)]{1}$/;
		if (cardId == "" || !card.test(cardId)) {
			$("#regCardId").parent('div').next().addClass("reg-tips");
			$("#regCardId").parent('div').next().children('small').text(
					"身份证格式不正确");
			return false;
		}
		$('#inteCard').unbind('click').css({
			'color' : '#666',
			'background-color' : '#bbb'
		});
		$('body').append('<div class="loading-cover"></div>');
		$('#inteCard').css("color", "#bbb");
		$('#cardid>div.controls>div.loading')
				.append(
						'<img src="/resources/images/main/preloader-w8-cycle-white.gif"/>');
		$.ajax({
			url : '/member/verifyID',
			type : 'post',
			data : {
				initcard : cardId,
				iname : realName
			},
			success : function(data) {
				if (data == 1) {
					$("#isNotcard").val(1);
					ymPrompt.succeedInfo('校验成功', 400, 200, '成功', null);
				} else if (data == 0) {
					$("#isNotcard").val(0);
					ymPrompt.errorInfo('校验失败', 400, 200, '失败', null);
					$('#inteCard').css({
						'color' : '#fff',
						'background-color' : '#ce251f'
					}).bind('click', handler);
				}
				$('#cardid>div.controls>div.loading').find('img').remove();
				$('#inteCard').css("color", "#fff");
				$('.loading-cover').remove();
			}
		});

	}
	$('#inteCard').bind('click', handler);
});
