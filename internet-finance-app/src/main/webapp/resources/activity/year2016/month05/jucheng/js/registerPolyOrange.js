$(function() {
	  var registryFlag;
	  //注册校验 
	  $("input.fl-l").blur(function(){ 
		 checkSubmit(this); 
	  });
	  //判断是否同意协议
	  $(".input-checkbox").click(function(){
		  $(this).toggleClass("checked");
		  registryFlag = $("#registryFlag").val();
		  if(registryFlag==1) {
			  registryFlag = 0;
		  } else {
			  registryFlag = 1;
		  }
		  $("#registryFlag").val(registryFlag);
	  });
	// 聚橙网注册验证
	$("#registSubmit").click(function() {
		if (!checkSubmit($("input[name='userName']"))) {
			return;
		} else if (!checkSubmit($("input[name='pwd']"))) {
			return;
		}else if (!checkSubmit($("input[name='phone1']"))) {
			return;
		}else if ($("input[name='pcode']")=="") {
			alert('验证码不能为空');
			return;
		}else if (registryFlag!=1) {
			alert('请先同意前海红筹网站服务协议');
			return;
		} else {	
		$.ajax({
				url : '/registration/register.htm',
				type : 'post',
				data : $("#regForm1").serialize(),
				success : function(data) {
					// $('body').removerSpinner();
					var dspResult=data.split("_");
					if (dspResult[0] == "1") {
						fancy_show(dspResult[1]);		//注册成功显示弹框
					} else if (data == "4") {
						// ymPrompt.errorInfo('校验码错误',null, null, null);
						alert('手机验证码错误');
					} else if (data == "2") {
						// ymPrompt.errorInfo('用户名或手机号已经注册过了',null, null, null);
						alert('用户名或手机号已经注册过了');
					} else if (data == "3") {
						// ymPrompt.errorInfo('保存失败',null, null, null);
						alert('保存失败');
					} else if (data == "0") {
						// ymPrompt.errorInfo('注册失败',null, null, null);
						alert('注册失败');
					} else if (data == "cardIdExist") {
						// ymPrompt.errorInfo('身份证号已存在',null, null, null);
						alert('身份证号已存在');
					} else if (data == "10") {
						// ymPrompt.errorInfo('校验码错误',null, null, null);
						alert('校验码错误');
					} else if (data == "11") {
						// Signup.getErrorInfo("6-18位字符,可由字母、数字或'_'组合", 1);
						alert('6-18位字符,可由字母、数字或_组合');
					}
				}
			});
		}
	});
	
	// 验证手机号码和用户名
	function checkOnly(name, value) {
		if (name == "userName") {
			return 
			$.ajax({
				url : '/registration/checkOnly_username?fieldValue='+ value,
			    async : false
			}).responseText
		} else if (name == "phone1" && $("input[name='phone1']").val() != "") {
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
		if (controlName == "userName") {
			if ($(obj).val() != "") {
				if (!nick.test($(obj).val())) {
					alert('6-18位字符,可由字母、数字或_组合');
					//Signup.getErrorInfo("6-18位字符,可由字母、数字或'_'组合", 1);
					flag = false;
					return flag;
				} else {
					if (checkOnly('userName', $.trim($(obj).val())) == '[null,false]') {
						//Signup.getErrorInfo("该用户名已被使用", 1);
						alert('该用户名已被使用');
						flag = false;
						return flag;
					} else {
						//Signup.getErrorInfo("", 1);
					}
				}
			} else {
				alert('用户名不能为空');
				//Signup.getErrorInfo("用户名不能为空", 1);
				flag = false;
				return flag;
			}

		} else if (controlName == "pwd") {
			if ($.trim($(obj).val()) == "") {
				alert('密码不能为空');
				flag = false;
				return flag;
			} else {
				if (!pwdreg.test($(obj).val())) {
					//Signup.getErrorInfo("6-18位字符，包括英文字母、数字或符号", 2);
					alert('6-18位字符，包括英文字母、数字或符号');
					flag = false;
					return flag;
				}
			}

		}else if (controlName == "phone1") {
			if ($.trim($(obj).val()) == "") {
				//Signup.getErrorInfo("手机号码不能为空", 4);
				alert('手机号码不能为空');
				flag = false;
				return flag;
			} else {
				if (!myreg.test($(obj).val())) {
					//Signup.getErrorInfo("手机号码格式不正确", 4);
					alert('手机号码格式不正确');
					flag = false;
					return flag;
				} else {
					if (checkOnly('phone1', $.trim($(obj).val())) == '[null,false]') {
						//Signup.getErrorInfo("手机号码已存在", 4);
						alert('手机号码已存在');
						flag = false;
						return flag;
					} else {
						//Signup.getErrorInfo("", 4);
					}
				}
			}

		} /*else if (controlName == "pcode") {
			if ($(obj).val() == "") {
				//Signup.getErrorInfo("验证码不能为空", 6);
				alert('验证码不能为空');
				flag = false;
				return flag;
			}
		} */
		return flag;

	}
	
	
	function handler() {
		var myreg = /^1[3,4,5,8,7]{1}[0-9]{1}[0-9]{8}$/;
		if ($("input[name='phone1']").val() == "") {
			//Signup.getErrorInfo("手机号码不能为空", 4);
			alert('手机号码不能为空');
			return;
		} else {
			if (!myreg.test($("input[name='phone1']").val())) {
				// Signup.getErrorInfo("手机号码格式不正确", 4);
				alert('手机号码格式不正确');
				return;
			} else {
				if (checkOnly('phone1', $.trim($("input[name='phone1']").val())) == '[null,false]') {
					// Signup.getErrorInfo("手机号码已存在", 4);
					alert('手机号码已存在');
					return;
				} else {
					if($("input[name='pcode']").attr('disabled')){
						//checkqrCode();    图形验证码验证
					}else{
						checkphoneCode();
					}
				}
			}
		}
	}
	//发送手机验证码
	function checkphoneCode() {
		var phone = $("input[name='phone1']").val();	// 注册手机号码
		var CSRFToken = $("#CSRFToken").val();
		var imagecode = $("#imgcode").val();		// 图片验证码
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
					alert('手机验证码发送成功，请注意查收!');
					//ymPrompt.succeedInfo('手机验证码发送成功，请注意查收!', 450, 200, '成功',null);
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
					alert('该手机号已被限制，请联系客服');
					//ymPrompt.errorInfo('该手机号已被限制，请联系客服', 450, 200, '失败', null);
				} else {
					alert('手机验证码发送失败');
					//ymPrompt.errorInfo('手机验证码发送失败', 450, 200, '失败', null);
				}
			}
		});
	}

	// 发送手机
	$('#sendPCode').bind('click', handler);
	
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
	//领取刷新
	$("#Lqload").click(function(event) {
		window.location.reload();
	});
	//弹出页面点击开通宝付时刷新
	$("#KtLoad").click(function(event) {
		window.location.reload();
	});
});

// 注册成功弹出框
function fancy_show(isActivity) {
	$.fancybox
			.open({
				href : "#record",
				padding : 0,
				margin : 0,
				scrolling : 'no',
				closeBtn : true,
				wrapCSS : 'fancybox-transparent',
				helpers : {
					overlay : {
						closeClick : false
					}
				},
				tpl : {
					closeBtn : '<a title="关闭" class="fancybox-custom-close" href="" style="right:30px;top:25px;background:url(/resources/public/js/fancybox/close-gray_24x24.png);width:24px;height:24px;"></a>'
				},
				  afterClose : function () {
					  window.location.reload();
				  }
			});
};