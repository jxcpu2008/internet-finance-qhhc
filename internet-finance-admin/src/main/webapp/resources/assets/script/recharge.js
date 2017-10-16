$(function(){
	$(document).scrollTop(400);
});
function rechargeSub() { // 充值提交
	if ($("#is_open_baofu").val() != 1) {
		ymPrompt.alert('开通宝付且进行授权才能充值',400,200, '提示');
		return;
	}
	var money = $("#amount").val();
	if (money == "") {
		ymPrompt.errorInfo('请填写充值金额！', 300, 170, '提醒', null);
		return false;
	} else {
		if (!/^\d+(.\d+)*$/.test(money)) {
			ymPrompt.errorInfo('您输入的数字包含非法字符！', 400, 200,
					'提醒', null);
			return;
		}
		if (parseInt(money) <= 0) {
			ymPrompt.errorInfo('充值金额必须大于等于1元！', 330, 170, '提醒', null);
			return false;
		} else {
			var w = window.open();
			$.ajax({
				url : '/recharge/ipsRecharge.htm',
				type : 'post',
				data : $("#recharge_form").serialize(),
				success : function(msg) {
					if (msg == "1") {
						$("#amount").val("");
						w.location = "/recharge/toIpsSubmit.htm";
					} else if (msg == "2") {
						ymPrompt.errorInfo('抱歉，处理失败，请联系客服！', 450, 200, '失败',
								function() {
								});
					} else if (msg == "3") {
						ymPrompt.errorInfo('您未注册宝付账户，不能进行充值！', 450, 200, '提醒',
								function() {
								});
					}
				}
			});
		}
	}
}
