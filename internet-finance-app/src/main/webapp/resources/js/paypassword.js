function valiLen(cur) {
	var temp = $("[name=" + cur + "]");
	if ($.trim(temp.val()).length < 6 || $.trim(temp.val()).length > 20) {
		temp.parent().next().text('密码长度必须为6-20位');
		temp.parent().next().show();
		return false;
	} else {
		temp.parent().next().hide();
		return true;
	}
}
// ajax请求：请求地址,参数,回调方法
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
function cancelUp(cur) {
	var temp = $("[name=" + cur + "]");
	temp.val('');
	temp.parent().next().text('');
	temp.parent().next().hide();
}
function checkOldPwd() {
	var flag = false;
	$.ajax({
		url : "/update_info/checkOldPwd",
		type : "post",
		data : { 
			oldPwd : $("[name=oldPwd]").val() 
		},
		success : function(data) {
			if (data=="false") {
				$("[name=oldPwd]").parent().next().text('原密码不匹配！');
				$("[name=oldPwd]").parent().next().show();
				flag =  false;
			} else {
				$("[name=oldPwd]").parent().next().hide();
				flag =  true;
			}
		}
	});
	return flag;
}
$(function() {
	// 取消按钮，清空数据
	$(".cancel").click(function() {
		cancelUp('newPwd');
		cancelUp('confirmPwd');
		cancelUp('valiCode');
	});
	$("#confirmUpdate")
			.click(
					function() {
						if (!valiLen('newPwd')) {// 新密码
							return;
						}
						if (!valiLen('confirmPwd')) {// 确认密码
							return;
						}
						if ($.trim($("[name=newPwd]").val()) != $.trim($(
						"[name=confirmPwd]").val())) {
							$("[name=confirmPwd]").parent().next().text(
									'两次密码输入不一致');
							$("[name=confirmPwd]").parent().next().show();
							return;
						}
						var code = /^\d{6}$/;
						var msgVerify = $("#msgVerify").val(); // 获取验证码
						if (!code.test(msgVerify)) {
							$("#msgVerify").parent().next().text('验证码无效！');
							$("#msgVerify").parent().next().show();
							return;
						} else {
							$("#msgVerify").parent().next().hide();
						}
						$
								.ajax({
									url : "/update_info/update_paypwd",
									type : "post",
									data : $("#payPwdForm").serialize(),
									success : function(data) {
										if (data == "mismatch") {
											$("[name=confirmPwd]").parent()
													.next().text('两次密码输入不匹配！');
											$("[name=confirmPwd]").parent()
													.next().show();
										} else if (data == "codeError") {
											$("#msgVerify").parent().next()
													.text('验证码不匹配！');
											$("#msgVerify").parent().next()
													.show();
										} else if (data == "error") {
											alert(data);
										} else {
											ymPrompt
													.alert(
															"交易密码修改成功，请谨记！",
															null,
															null,
															null,
															function(result) {
																if (result == "ok") {
																	window.location.href = "/member/toPayPassword?index=0_6_7";
																}
															});
										}
									}
								});
					});
	function handle() {
		fn_ajax("/member/sendSMSForReg", {
			phone : $("#phone").val()
		}, function(data) {
			if (data == "1") {
				ymPrompt.succeedInfo('验证码已成功发送至您的手机，请注意查收', 400, 200, '成功',
						null);
				$('#valiCode').unbind('click').css({
					'color' : '#666',
					'background-color' : '#bbb'
				});
				var time = 60;
				var code = setInterval(function() {
					if (time == 0) {
						clearInterval(code);
						$('#valiCode').css({
							'color' : '#fff',
							'background-color' : '#ce251f'
						}).text('免费获取验证码').bind('click', handle);
					} else {
						$('#valiCode').text(function() {
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
	$("#valiCode").click(handle);
});