$(function() {
	$(document).scrollTop(730);
	$("#withsubmit")
			.click(
					function() {
						if ($("#is_open_baofu").val() != 1) {
							ymPrompt.alert('开通宝付且进行授权才能提现', 400,200, '提示');
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
								/*var bool = $.ajax({url : '/withdraw/withdraw_vali',type : 'post',async : false}).responseText;
								if (bool == "exist") {
									ymPrompt.alert('您还有一笔提现记录状态为待确认，请查询状态后再提现？', 400, 200, '提示',
											function(result){
										if (result == "ok") {
											location.href = '/member_index/toMoneyRecord.htm?index=0_1&nav=5&sign=7';
										}
									});
								} else {*/
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
								/*}*/
							}
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
