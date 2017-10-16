function rechargeRecord() { // 充值记录
	var $beginTime = $("[name=beginTime]").val();
	var $endTime = $("[name=endTime]").val();
	$.ajax({
		url : '/recharge/openRechargeRecord.htm',
		type : 'post',
		data : {
			beginTime : $beginTime,
			endTime : $endTime
		},
		success : function(msg) {
			$("#record").html(msg);
		}
	});
}

function rechargeSub() { // 充值提交
	var money = $("#amount").val();
	if (money == "") {
		ymPrompt.errorInfo('请填写充值金额！', 300, 170, '提醒', null);
		return false;
	}
	if (parseInt(money) <= 0) {
		ymPrompt.errorInfo('充值金额必须大于等于1元！', 330, 170, '提醒', null);
		return false;
	}
	if (isNaN(money)) {
		ymPrompt.errorInfo('金额输入非法字符,请重新输入！', 300, 180, '提醒', null);
	} else {
		var w = window.open();
		$.ajax({
			url : '/recharge/ipsRecharge.htm',
			type : 'post',
			data : $("#recharge_form").serialize(),
			success : function(msg) {
				if (msg == "1") {
					$("#amount").val("");
					w.location = "/shop/toIpsSubmit.htm";
				} else if (msg == "2") {
					ymPrompt.errorInfo('抱歉，处理失败，请联系客服', 400, 200, '失败',
							function() {
							});
				} else if (msg == "3") {
					ymPrompt.errorInfo('您未注册宝付账户，不能进行充值！', 400, 200, '提醒',
							function() {
							});
				}
			}
		});
	}
}

$(function() {
	var $token = $("#token").val();
	$(".deposit-tab a").each(function() {
		var cur = $(this).prop("href").split("#")[1];
		if ($token == cur) {
			$(this).click();
		}
	});
	$("#tranAmt").keyup(function() {
		var num = $(this).val();
		if (isNaN(num)) {
			$(this).val('');
		} else {
			if (num.indexOf(".") > 0) {
				if (num.substring(num.indexOf(".")).length > 3) {
					$(this).val(num.substring(0, num.indexOf(".") + 3));
				}
			}
		}
	});
	$("#tranAmt").blur(function() {
		var num = $(this).val();
		if (num <= 0) {
			$(this).val(100);
		}
		if (num > 1000000) {
			$(this).val(1000000);
		}
	});

	$("#success").click(function() {
		window.location.href = "/recharge/openRechargeRecord.htm";
	});

	$("#error").click(function() {
		window.location.href = "/recharge/openRechargeRecord.htm";
	});

	$("#rech").click(function() {
		var type = $("#bankinfo").val();
		var money = $("#tranAmt").val();
		if (money == "") {
			ymPrompt.succeedInfo('请选择充值金额！', 400, 200, '提醒', null);
			return false;
		}
		if (type == 0) {
			ymPrompt.succeedInfo('请选择需要充值银行！', 400, 200, '提醒', null);
			return false;
		} else {
			$("#recharge_creditor").submit();
			$.pdialog.closeCurrent();
		}
	});

	$("#close").click(function() {
		$.pdialog.closeCurrent();
	});
});

function selectpage(no) {
	var $beginTime = $("[name=beginTime]").val();
	var $endTime = $("[name=endTime]").val();
	$.ajax({
		url : '/recharge/openRechargeRecord.htm',
		type : 'post',
		data : {
			beginTime : $beginTime,
			endTime : $endTime,
			no : no
		},
		success : function(msg) {
			$("#record").html(msg);
		}
	});
}

function jumpPage(pageno, totalPage) {
	if (pageno <= 0 || pageno > totalPage) {
		return;
	}
	selectpage(pageno);
}

function toBeAffirm(rId, no) {
	$.ajax({
		url : '/recharge/ipsRechargeNum.htm',
		type : 'post',
		data : {
			rId : rId,
			no : no
		},
		success : function(msg) {
			$("#record").html(msg);
		}
	});
}