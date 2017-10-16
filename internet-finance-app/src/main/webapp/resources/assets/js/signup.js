$(function() {
	Signup.init();
	$('.bg-signup').css('width', '43.7%');
	// 是否有推荐人
	if ($("#tgId").val() != "") {
		$('#invited-code').collapse('show');
		$("#number").attr('readonly', 'readonly');
	}

	// 注册校验
	$("input.form-control").blur(function() {
		checkSubmit(this);
	});

	$("#regSubmit")
			.click(
					function() {
						if (!checkSubmit($("input[name='userName']"))) {
							return;
						} else if (!checkSubmit($("input[name='pwd']"))) {
							return;
						} else if (!checkSubmit($("input[name='pwd2']"))) {
							return;
						} else if (!checkSubmit($("input[name='phone1']"))) {
							return;
						} else if (!checkSubmit($("input[name='pcode']"))) {
							return;
						} else if (!checkSubmit($("input[name='number']"))) {
							return;
						} else if (!checkSubmit($("input[name='imgcode']"))) {
							return;
						} else if (!$("input:checkbox").prop('checked')) {
							ymPrompt.errorInfo('请先同意前海红筹网站服务协议', 400, 200,
									'警告', null);
							return;
						} else {
							$('body').spinner('正在提交信息...');
							$
									.ajax({
										url : '/registration/register.htm',
										type : 'post',
										data : $("#regForm").serialize(),
										success : function(data) {
											$('body').removerSpinner();
											var dspResult=data.split("_");
											if (dspResult[0] == "1") {
												fancy_show(dspResult[1]);
											} else if (data == "4") {
												ymPrompt.errorInfo('校验码错误',
														null, null, null);
											} else if (data == "2") {
												ymPrompt.errorInfo('用户名或手机号已经注册过了',
														null, null, null);
											} else if (data == "3") {
												ymPrompt.errorInfo('保存失败',
														null, null, null);
											} else if (data == "0") {
												ymPrompt.errorInfo('注册失败',
														null, null, null);
											} else if (data == "cardIdExist") {
												ymPrompt.errorInfo('身份证号已存在',
														null, null, null);
											} else if (data == "8") {
												ymPrompt.errorInfo('验证码错误',
														null, null, null,
														function() {
															window.location
																	.reload();
															$("#imagecode")
																	.val('');
														});
											} else if (data == "10") {
												ymPrompt.errorInfo('校验码错误',
														null, null, null);
											} else if (data == "11") {
												Signup.getErrorInfo("6-18位字符,可由字母、数字或'_'组合", 1);
											}
										}
									});
						}

					});

	function checkOnly(name, value) {
		if (name == "userName") {
			return $.ajax({
						url : '/registration/checkOnly_username?fieldValue='
								+ value,
						async : false
					}).responseText
		} else if (name == "phone1" && $("input[name='phone']").val() != "") {
			return $.ajax({
				url : '/registration/checkOnly_phone?fieldValue=' + value,
				async : false
			}).responseText;
		} else if (name == "referrer" && $("input[name='number']").val() != "") {
			return $.ajax({
				url : '/registration/checkOnly_referrer?fieldValue=' + value,
				async : false
			}).responseText;
		}else if (name == "imagecode") {
			return $.ajax({
				url : '/registration/checkImageCode?imgcode=' + value,
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
		if (controlName == "userName") {
			if ($(obj).val() != "") {
				if (!nick.test($(obj).val())) {
					Signup.getErrorInfo("6-18位字符,可由字母、数字或'_'组合", 1);
					flag = false;
					return flag;
				} else {
					if (checkOnly('userName', $.trim($(obj).val())) == '[null,false]') {
						Signup.getErrorInfo("该用户名已被使用", 1);
						flag = false;
						return flag;
					} else {
						Signup.getErrorInfo("", 1);
					}
				}

			} else {
				Signup.getErrorInfo("用户名不能为空", 1);
				flag = false;
				return flag;
			}

		} else if (controlName == "pwd") {
			if ($.trim($(obj).val()) == "") {
				Signup.getErrorInfo("密码不能为空", 2);
				flag = false;
				return flag;
			} else {
				if (!pwdreg.test($(obj).val())) {
					Signup.getErrorInfo("6-18位字符，包括英文字母、数字或符号", 2);
					flag = false;
					return flag;
				}
			}

		} else if (controlName == "pwd2") {
			if ($(obj).val() == "") {
				Signup.getErrorInfo("密码不能为空", 3);
				flag = false;
				return flag;
			} else {
				if ($("#regPwd").val() != $(obj).val()) {
					Signup.getErrorInfo("两次输入密码不一致", 3);
					flag = false;
					return flag;
				}
			}
		} else if (controlName == "phone1") {
			if ($.trim($(obj).val()) == "") {
				Signup.getErrorInfo("手机号码不能为空", 4);
				flag = false;
				return flag;
			} else {
				if (!myreg.test($(obj).val())) {
					Signup.getErrorInfo("手机号码格式不正确", 4);
					flag = false;
					return flag;
				} else {
					if (checkOnly('phone1', $.trim($(obj).val())) == '[null,false]') {
						Signup.getErrorInfo("手机号码已存在", 4);
						flag = false;
						return flag;
					} else {
						Signup.getErrorInfo("", 4);
					}
				}
			}

		} else if (controlName == "pcode") {
			if ($(obj).val() == "") {
				Signup.getErrorInfo("验证码不能为空", 6);
				flag = false;
				return flag;
			}

		} else if (controlName == "number") {

			if ($(obj).val() != "") {
				var number = checkOnly("referrer", $("input[name='number']")
						.val());
				if (number == "null") {
					Signup.getErrorInfo("推荐人编号或手机不存在", 5);
					flag = false;
					return flag;
				} else {
					Signup.getErrorInfo("", 5);
					Signup.getNameInfo(number);
				}
			}

		} else if (controlName == "imgcode") {
			if ($(obj).val() == "") {
				Signup.getErrorInfo("验证码不能为空", 7);
				flag = false;
				return flag;
			}

		}

		return flag;

	}
	function handler() {
		var myreg = /^1[3,4,5,8,7]{1}[0-9]{1}[0-9]{8}$/;
		if ($("input[name='phone1']").val() == "") {
			Signup.getErrorInfo("手机号码不能为空", 4);
			return;
		} else {
			if (!myreg.test($("input[name='phone1']").val())) {
				Signup.getErrorInfo("手机号码格式不正确", 4);
				return;
			} else {
				if (checkOnly('phone1', $.trim($("input[name='phone1']").val())) == '[null,false]') {
					Signup.getErrorInfo("手机号码已存在", 4);
					return;
				} else {
					if($("input[name='pcode']").attr('disabled')){
						checkqrCode();
					}else{
						checkphoneCode();
					}
				}
			}
		}
	}
	
	function checkphoneCode(){
		var phone = $("input[name='phone1']").val();
		var CSRFToken = $("#CSRFToken").val();
		var imagecode = $("#imagecode").val();
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
					ymPrompt.succeedInfo('手机验证码发送成功，请注意查收!', 450,
							200, '成功', null);
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
							}).text('获取手机验证码').bind('click',
									handler);
						} else {
							$('#sendPCode').text(function() {
								--time;
								prefix = time < 10 ? '0' : '';
								return prefix + time + '秒后重新发送';
							});
						}
					}, '1000');
				} else if (data == "9") {
					ymPrompt.errorInfo('该手机号已被限制，请联系客服', 450, 200, '失败',
							null);
				} else {
					ymPrompt.errorInfo('手机验证码发送失败', 450, 200, '失败',
							null);
				}
			}
		});
	}

	function checkqrCode(){
		if ($("#imagecode").val() == "") {
			Signup.getErrorInfo("验证码不能为空", 7);
			flag = false;
			return flag;
		}else{
			if($("#imagecode").val().length < 4){
                Signup.getErrorInfo("验证码为4位有效数字", 7);
				$("input[name='pcode']").attr('disabled', true);
				return false;
			}else{
				var imgdata = checkOnly('imagecode',  $("input[name='imgcode']").val());
                if (imgdata == 1) {
                    Signup.getErrorInfo("", 7);
                    $("input[name='pcode']").attr('disabled', false);
                }else if(imgdata == -1){
                    $("input[name='pcode']").attr('disabled', true);
                    Signup.getErrorInfo("验证码错误", 7);
                }else{
                    $("input[name='pcode']").attr('disabled', true);
                    Signup.getErrorInfo("异常状态：验证失败", 7);
                }
			}
		}
	}
	// 发送手机
	$('#sendPCode').bind('click', handler);
	$('#imagecode').bind('keyup', checkqrCode);

	// 协议
	$("#regters").click(function(event) {
		event.preventDefault();
		$.ajax({
			url : '/visitor/getAgreeMent.htm',
			type : 'post',
			success : function(data) {
				$("#regModal .modal-body").html(data);
				$("#regModal").modal('show');
			}

		});
	});
});

// 注册成功弹出框
function fancy_show(isActivity){
	$.fancybox.open({
		href : "#record",
        padding : 0,
        margin:0,
        scrolling: 'no',
        closeBtn: true,
        wrapCSS: 'fancybox-transparent',
        helpers: {
              overlay : {
                  closeClick : false
              }
          },
          tpl:{
              closeBtn : '<a title="关闭" class="fancybox-custom-close" href="javascript:;" style="right:30px;top:25px;background:url(/resources/public/js/fancybox/close-gray_24x24.png);width:24px;height:24px;"></a>'
          }
    });
};