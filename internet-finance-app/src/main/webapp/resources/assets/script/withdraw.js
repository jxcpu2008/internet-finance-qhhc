$(function() {
	$(document).scrollTop(730);
	$("#withsubmit")
			.click(
					function() {
						if ($("#is_open_baofu").val() != 1) {
							ymPrompt.alert('您还未开通宝付，请完成开通后再进行操作，请立即开通第三方宝付账户！',400,200, '提示', function(result) {
								if(result=="ok"){
									$("#open_bf").trigger('click');
								}
							});
							return;
						}
						var cashBalance = $("#cashBalance").val();
						var money = $("#wmoney").val();
						if (money == "") {
							ymPrompt.errorInfo('请填写提现金额！', 400, 200, '提醒', null);
							return;
						} else {
							if (!/^\d+(.\d+)*$/.test(money)) {
								ymPrompt.errorInfo('您输入的数字包含非法字符！', 400, 200,
										'提醒', null);
								return;
							}
							if (parseFloat(money) <= 0) {
								ymPrompt.errorInfo('请填写大于0的提现金额！', 400, 200,
										'提醒', null);
								return false;
							} else if (parseFloat(cashBalance) < parseFloat(money)) {
								ymPrompt.errorInfo('提现的金额大于您的提现额度！', 400, 200,
										'提醒', null);
								return;
							} else {
								$.ajax({url : '/withdraw/ipsWithdraw.htm',type : 'post',async : false,
									data : $("#withdraw_form").serialize(),
									success : function(msg) {
										if (msg == "1") {
											var w = window.open('about:blank');
											$("#wmoney").val("");
											w.location = "/recharge/toIpsSubmit.htm";
										} else if (msg == "2") {
											ymPrompt.errorInfo('抱歉，处理失败，请联系客服', 400, 200, '失败',
													null);
										}
									}
								});
							}
						}

					});
	var tempId = $("#temp_id").val();
	$("#withdraw_id").val('');
	$("#withdraw_cbx").click(function() {
		if ($(this).is(":checked")) {
			$("#withdraw_id").val(tempId);
		} else {
			$("#withdraw_id").val('');
		}
	});
	$("#wmoney").keyup(function() {
		if (!/^\d+(.\d+)*$/.test($(this).val())) {
			return;
		}
		if ($.trim($(this).val())) {
			// 获取平台服务费
			var fee = $.ajax({url : '/withdraw/getWithdrawFee.htm',type : 'post',data : {money : $(this).val()},async : false}).responseText;
			if (fee != "0.0") {
				$("#plat_fee").html("&yen; "+fee);
			} else {
				$("#plat_fee").html("&yen; 0.0");
			}
		} else {
			$("#plat_fee").html("&yen; 0.0");
		}
	});
});
