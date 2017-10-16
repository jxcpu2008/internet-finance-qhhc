function hide() {
	$('#invest-cover').hide();
	$('html').css({
		'overflow-y' : 'auto'
	});
	var winNode = $("#win");
	winNode.fadeOut("slow");
	winNode.hide("slow");
}
// 支付协议
function showProtocol() {
	$('#invest-cover').show();
	$('html').css({
		'overflow-y' : 'hidden'
	});
	$.ajax({
		url : '/visitor/getPayProtocol.htm',
		type : 'post',
		success : function(data) {
			var winNode = $("#win");
			winNode.fadeIn("slow");
			$("#content").html(data);
		}
	});
}
$(function() {
	$('.change').bind('click', function() {
		$("#code").trigger('click');
	});
	$("#pcode").blur(function() {
		if ($(this).val().trim() != '') {
			$.ajax({
				url : "/plank/checkCode",
				async : false,
				data : {
					input : $(this).val()
				},
				success : function(flag) {
					if (flag == "false") {
						$(".change").next().text('验证码不匹配');
						$(".change").next().show();
					} else {
						$(".change").next().hide();
					}
				}
			});
		}
	});
	$("#mysubmit")
			.click(
					function() {
						if ($("#tpwd").val() == "") {
							$("#tpwd").next().text("此项不能为空");
							return false;
						} else {
							$("#tpwd").next().text("");
						}

						if ($("#pcode").val() == "") {
							$("#pcode").parent().next().next().text("此项不能为空");
							return false;
						} else {
							$("#pcode").parent().next().next().text("");
						}
						if ($("#checkProtocol").is(":checked")) { // 如果同意支付协议
							$('body').append(
									'<div class="loading-cover"></div>');
							$("#mysubmit").text('正在提交...').css({
								"color" : "#fff",
								"font-size" : "12px"
							});
							$('.btns>div.loading')
									.append(
											'<img src="/resources/images/main/preloader-w8-cycle-white.gif" style="width:22px;height:22px;"/>');
							$
									.ajax({
										url : '/plank/ipsGetLoanInfo.htm',
										data : $("#payform").serialize(),
										success : function(data) {
											$("#pcode").val('');
											if (data == "2") {
												ymPrompt.errorInfo(
														'抱歉，购买金额大于可投资金额！', 400,
														200, '失败', function() {
															window.location
																	.reload();
														});
											} else if (data == "110") {

												ymPrompt
														.succeedInfo(
																"恭喜您，购买成功！",
																349,
																null,
																"成功",
																function(result) {
																	if (result == "ok") {
																		window.location.href = "/loaninfo/toLoanMyRecord.htm?index=1_0_0&isSucceed=1";
																	} else {
																		window.location.href = "/loaninfo/toLoanMyRecord.htm?index=1_0_0&isSucceed=1";
																	}
																});
											} else if (data == "6") {
												ymPrompt.errorInfo(
														'抱歉，该项目融资已满！', 400,
														200, '失败', function() {
															window.location
																	.reload();
														});
											} else if (data == "4") {
												ymPrompt.errorInfo('抱歉，参数错误！',
														400, 200, '失败',
														function() {
															window.location
																	.reload();
														});
											} else if (data == "1") {
												ymPrompt
														.errorInfo(
																'抱歉，您的帐号余额不足！',
																330,
																170,
																'失败',
																function(result) {
																	if (result == "ok") {
																		window.location.href = "/recharge/openRecharge.htm?index=3_0_0&token=online";
																	}
																});

											} else if (data == "9") {
												ymPrompt.errorInfo(
														'抱歉，验证码错误，请重新输入！', 400,
														200, '失败', function() {
															window.location
																	.reload();
														});
											} else if (data == "10") {
												ymPrompt.errorInfo(
														'抱歉，交易密码错误，请重新输入！',
														400, 200, '失败',
														function() {
															window.location
																	.reload();
														});
											} else if (data == "redirect:/visitor/to-login") {

												window.location.href = "/visitor/to-login";
											}

											$('.btns>div.loading').find('img')
													.remove();
											$("#mysubmit").removeAttr("style")
													.text('确认');
											$('.loading-cover').remove();
										}

									});
						} else {
							ymPrompt.alert("您还未同意前海红筹网站服务协议");
						}
					});
});
