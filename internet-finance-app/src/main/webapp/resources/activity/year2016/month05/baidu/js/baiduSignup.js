$(function() {
	var registryFlag;
	//注册校验 
	$("input.fl-l").blur(function() {
		checkSubmit(this);
	});
	//判断是否同意协议
	$(".input-checkbox").click(function() {
		$(this).toggleClass("checked");
		registryFlag = $("#registryFlag").val();
		if (registryFlag == 1) {
			registryFlag = 0;
		} else {
			registryFlag = 1;
		}
		$("#registryFlag").val(registryFlag);
	});
	//百度推广注册验证
	$("#registSubmit").click(function() {
		if (!checkSubmit($("input[name='phone1']"))) { //手机号码
			return;
		} else if (!checkSubmit($("input[name='pwd']"))) { //密码
			return;
		} else if (!checkSubmit($("input[name='imgcode']"))) { //图片验证码
			return;
		} else if (!checkSubmit($("input[name='pcode']"))) { //手机验证码
			return;
		} else if (!checkSubmit($("input[name='number']"))) { //推荐人
			return;
		} else if (registryFlag != 1) {
			jDialog.alert('请先同意前海红筹网站服务协议');
			return;
		} else {
			$("#userName").val($("#phone1").val());
			$.ajax({
				url : '/registration/register.htm',
				type : 'post',
				data : $("#regForm").serialize(),
				success : function(data) {
					var dspResult = data.split("_");
					if (dspResult[0] == "1") {
						fancy_show(dspResult[1]); //注册成功显示弹框
					} else if (data == "4") {
						jDialog.alert('手机验证码错误');
					} else if (data == "2") {
						jDialog.alert('用户名或手机号已经注册过了');
					} else if (data == "3") {
						jDialog.alert('保存失败');
					} else if (data == "0") {
						jDialog.alert('注册失败');
					} else if (data == "8") {
						jDialog.alert('图形验证码错误');
					} else if (data == "10") {
						jDialog.alert('校验码错误');
					} else if (data == "11") {
						jDialog.alert('6-18位字符,可由字母、数字或_组合');
					}
				}
			});
		}
	});

	//向后台验证数据
	function checkOnly(name, value) {
		if (name == "imgcode") { //验证图形验证码
			return $.ajax({
				url : '/registration/checkImageCode?imgcode=' + value,
				async : false
			}).responseText; //referrer
		} else if (name == "number" && $("input[name='number']").val() != "") { //验证推荐人是否存在
			return $.ajax({
				url : '/registration/checkOnly_referrer?fieldValue=' + value,
				async : false
			}).responseText;
		} else if (name == "phone1" && $("input[name='phone1']").val() != "") { //手机号码唯一
			return $.ajax({
				url : '/registration/checkOnly_phone?fieldValue=' + value,
				async : false
			}).responseText;
		}
	}

	function checkSubmit(obj) {
		var controlName = $(obj).attr('name');
		var myreg = /^1[3,4,5,8,7]{1}[0-9]{1}[0-9]{8}$/;// 手机号正则
		var nick = /^[A-Za-z_0-9]{6,18}$/; // 用户名
		var pwdreg = /^[\S]{6,18}$/; // 密码
		var flag = true;
		if (controlName == "phone1") {
			if ($.trim($(obj).val()) == "") {
				$('.prompt-1').css("display", "block");
				$('.prompt-1').html('请输入手机号码');
				flag = false;
				return flag;
			} else {
				if (!myreg.test($(obj).val())) {
					$('.prompt-1').css("display", "block");
					$('.prompt-1').html('手机号码格式不正确');
					flag = false;
					return flag;
				} else {
					if (checkOnly('phone1', $.trim($(obj).val())) == '[null,false]') {
						$('.prompt-1').css("display", "block");
						$('.prompt-1')
								.html(
										'手机号码已存在,<a href="/visitor/to-login" class="clr-links">立即登录</a>');
						flag = false;
						return flag;
					} else {
						$('.prompt-1').css("display", "none");
					}
				}
			}
		} else if (controlName == "pwd") {
			if ($.trim($(obj).val()) == "") {
				$('.prompt-2').css("display", "block");
				$('.prompt-2').html('请输入密码').css("line-height", "42px");
				flag = false;
				return flag;
			} else {
				if (!pwdreg.test($(obj).val())) {
					$('.prompt-2').css("display", "block");
					$('.prompt-2').html('6-18位字符，包括英文<br/>字母、数字或符号').css(
							"line-height", "20px");
					flag = false;
					return flag;
				} else {
					$('.prompt-2').css("display", "none");
				}
			}
		} else if (controlName == "pcode") {
			if ($(obj).val() == "") {
				$('.prompt-4').css("display", "block");
				$('.prompt-4').html('请输入验证码');
				flag = false;
				return flag;
			} else {
				$('.prompt-4').css("display", "none");
			}

		} else if (controlName == "number") {
			if ($(obj).val() != "") {
				var number = checkOnly("number", $("input[name='number']")
						.val());
				if (number == "null") {
					$('.prompt-5').css("display", "block");
					$('.prompt-5').html('推荐人编号或手机不存在');
					flag = false;
					return flag;
				} else {
					$('.prompt-5').css("display", "none");
					//Signup.getNameInfo(number);
				}
			}

		} else if (controlName == "imgcode") {
			if ($(obj).val() == "") {
				$('.prompt-3').css("display", "block");
				$('.prompt-3').html('请输入图形验证码');
				flag = false;
				return flag;
			}
		}
		return flag;
	}

	function handler() {
		var myreg = /^1[3,4,5,8,7]{1}[0-9]{1}[0-9]{8}$/;
		if ($("input[name='phone1']").val() == "") {
			$('.prompt-1').css("display", "block");
			$('.prompt-1').html('请输入手机号码');
			return;
		} else {
			if (!myreg.test($("input[name='phone1']").val())) {
				$('.prompt-1').css("display", "block");
				$('.prompt-1').html('手机号码格式不正确');
				return;
			} else {
				if (checkOnly('phone1', $.trim($("input[name='phone1']").val())) == '[null,false]') {
					$('.prompt-1').css("display", "block");
					$('.prompt-1').html(
							'手机号码已存在,<a href="/visitor/to-login">立即登录</a>');
					return;
				} else {
					if ($("input[name='pcode']").attr('disabled')) {
						checkqrCode(); //图形验证码验证
					} else {
						checkphoneCode();
					}
				}
			}
		}
	}
	//发送手机验证码
	function checkphoneCode() {
		var phone = $("input[name='phone1']").val(); // 注册手机号码
		var CSRFToken = $("#CSRFToken").val();
		var imagecode = $("#imgcode").val(); // 图片验证码
		$.ajax({
			url : '/smsEmail/sendRegisterCode',
			type : 'post',
			data : {
				phone : phone,
				CSRFToken : CSRFToken,
				imagecode : imagecode
			},
			success : function(data) {
				if (data == "1") {
					jDialog.alert('手机验证码发送成功，请注意查收!');
					$('#sendPCode').unbind('click').css({
						'border-color' : '#bbb',
						'background-color' : '#bbb'
					});
					var time = 90;
					var code = setInterval(function() {
						if (time == 0) {
							clearInterval(code);
							$('#sendPCode').css({
								'border-color' : '#d43f3a',
								'background-color' : '#d9534f'
							}).text('获取手机验证码').bind('click', handler);
						} else {
							$('#sendPCode').text(function() {
								--time;
								prefix = time < 10 ? '0' : '';
								return prefix + time + '秒后重新发送';
							});
						}
					}, '1000');
				} else if (data == "9") {
					jDialog.alert('该手机号已被限制，请联系客服');
				} else {
					jDialog.alert('手机验证码发送失败');
				}
			}
		});
	}
	//验证图形验证码
	function checkqrCode() {
		if ($("#imgcode").val() == "") {
			$('.prompt-3').css("display", "block");
			$('.prompt-3').html('请输入图形验证码');
			flag = false;
			return flag;
		} else {
			if ($("#imgcode").val().length < 4) {
				$('.prompt-3').css("display", "block");
				$('.prompt-3').html('验证码为4位有效数字');
				$("input[name='pcode']").attr('disabled', true);
				return false;
			} else {
				var imgdata = checkOnly('imgcode', $("input[name='imgcode']")
						.val());
				if (imgdata == 1) {
					$('.prompt-3').css("display", "none");
					$("input[name='pcode']").attr('disabled', false);
				} else if (imgdata == -1) {
					$("input[name='pcode']").attr('disabled', true);
					$('.prompt-3').css("display", "block");
					$('.prompt-3').html('图形验证码错误');
				} else {
					$("input[name='pcode']").attr('disabled', true);
					$('.prompt-3').css("display", "block");
					$('.prompt-3').html('异常状态：验证失败');
				}
			}
		}
	}

	// 发送手机
	$('#sendPCode').bind('click', handler);
	//点击图形验证码换图
	$('#imgcode').bind('keyup', checkqrCode);
	// 协议
	$("#protocol").click(function(event) {
		event.preventDefault();
		$.ajax({
			url : '/visitor/getAgreeMent.htm',
			type : 'post',
			success : function(data) {
				$("#showXy").html(data);
			}
		});
	});
});

// 注册成功弹出框
function fancy_show(isActivity) {
	$.fancybox.open({
		href : "#record",
		padding : 0,
		margin : 0,
		scrolling : 'no',
		closeBtn : false,
		wrapCSS : 'fancybox-transparent',
	});
};