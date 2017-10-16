// 提交提现申请
function withdraw() {
	var money = $.trim($("#wmoney").val());
	var balance = $("#balance").val();
	var isNum = /^\d+(\.\d+)?$/;
	if(!isNum.test(money)){    // 提现金额必须为有效数字
		ymPrompt.alert("提现金额为大于等于1的数字！",300,170);
		return false;
	}
	if (parseInt(money) <= 0) {
		ymPrompt.errorInfo('提现金额必须大于等于1元！', 300, 170, '提醒', null);
		return false;
	}
	if(parseFloat(money) > parseFloat(balance) - 2){   // 申请金额必须小于可用金额
		ymPrompt.alert("申请提现金额必须小于可用余额！",340,170);
		return false;
	}
	var w = window.open();
	$.ajax({
		url : '/withdraw/ipsWithdraw.htm',
		type : 'POST',
		data : {
			money : money
		},
		success : function(msg) {
			if (msg == "1") {
				$("#amount").val("");
				w.location = "/shop/toIpsSubmit.htm";
			}
			if (msg == "2") {
				ymPrompt.errorInfo('抱歉，处理失败，请联系客服', 400, 200, '失败',
						function() {
						});
			}
			/*if (msg == "-1") {
				ymPrompt.alert("您已经有一笔提现申请在审核中，请不要继续提交，等待审核结果",400, 200, null, function(
						result) {
					$("#wmoney").val("");
				});
			}
			if (msg == "-2") {
				ymPrompt.alert("您已经有一笔提现申请通过了审核，现在可以去提现或者先取消这笔申请",400, 200, null, function(
						result) {
					$("#wmoney").val("");
				});
			}
			if (msg == "success") {
				ymPrompt.succeedInfo("提现申请已提交，等待审核！", 400, 200, null, function(
						result) {
					$("#wmoney").val("");
					window.location.reload();
				});
			}*/
		}
	});
}
// 输入框验证
$(".applyDiv input[name='money']").bind("input propertychange", checkMoney);
function checkMoney() {
	var balance = parseFloat($("#balance").text());
	if (isNaN($(this).val())) {
		$(this).val($(this).val().replace(/[^\d]$/g, ''));
	} else if (/[.][\d]{3}$/.test($(this).val())) {
		ymPrompt.alert("只能保留到两位有效小数！", null, null, "提示", null);
		$(this).val($(this).val().replace(/[\d]$/g, ''));
	} else if (parseInt($(this).val()) > balance) {
		ymPrompt.alert("提现金额不得超过账户余额！", null, null, "提示", null);
		$(this).val(balance);
	} else if (/^0/.test($(this).val())) {
		ymPrompt.alert("最小值为1，请重新输入！", null, null, "提示", null);
		$(this).val(1);
	}
}

function sms_ajax(_url, _param, _callback) {
	$.ajax({
		url : _url,
		type : "post",
		data : _param,
		contentType : "application/x-www-form-urlencoded;charset=utf-8",
		success : function(_msg) {
			ymPrompt.succeedInfo(_msg, 400, 200, null, null);
		}
	});
}

function submits() {
	var type = $("#bankCode").text();
	alert(type);
	$('#userbankfrom').ajaxSubmit({
		dataType : 'text',
		success : function(msg) {
			if (msg == 1) {
				ymPrompt.succeedInfo("验证码已过期", 400, 200, '提示', null);
			} else if (msg == 2) {
				ymPrompt.succeedInfo("验证码输入错误", 400, 200, '提示', null);
			} else {
				ymPrompt.succeedInfo("添加成功", 400, 200, '提示', null);
			}
		}
	});
}