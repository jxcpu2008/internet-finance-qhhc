function calcAge() {
	var $cardId = $("#cardId").val();
	var date = new Date();
	var currentTime = date.getFullYear();
	var age = 0;
	if ($cardId.length == 15) { // 如果省份证号为15位
		age = parseInt(currentTime) - parseInt("19" + $cardId.substring(6, 8));
	} else {
		age = parseInt(currentTime) - parseInt($cardId.substring(6, 10));
	}
	if (age >= 18) {
		return true;
	} else {
		return false;
	}
}

$(function() {

	var $loanunit = $("#loanunit").val(); // 最低投资
	var $priority = $("#prioRestMoney").val();// 优先
	var $middle = $("#midRestMoney").val();// 夹层
	var $after = $("#afterRestMoney").val();// 劣后
	// 优先 加减金额
	$("#add").click(function() {
		var $moneyo = $("#moneyo").val();
		var realMoney = parseInt($moneyo) + parseInt($loanunit);
		if (realMoney <= (parseInt($priority) + parseInt($middle))) {
			$("#moneyo").val(realMoney);
		}
	});
	$("#subtract").click(function() {
		var $moneyo = $("#moneyo").val();
		var realMoney = parseInt($moneyo) - parseInt($loanunit);
		if (realMoney >= $loanunit) {
			$("#moneyo").val(realMoney);
		}
	});

	// 夹层加减
	$("#add1").click(function() {
		var $moneyt = $("#moneyt").val();
		var realMoney = parseInt($moneyt) + parseInt($loanunit);
		if (realMoney <= (parseInt($priority) + parseInt($middle))) {
			$("#moneyt").val(realMoney);
		}
	});
	$("#subtract1").click(function() {
		var $moneyt = $("#moneyt").val();
		var realMoney = parseInt($moneyt) - parseInt($loanunit);
		if (realMoney >= $loanunit) {
			$("#moneyt").val(realMoney);
		}
	});

	// 劣后加减
	$("#add2").click(function() {
		var $moneyt = $("#moneytr").val();
		var realMoney = parseInt($moneyt) + parseInt($loanunit);
		if (realMoney <= $after) {
			$("#moneytr").val(realMoney);
		}
	});
	$("#subtract2").click(function() {
		var $moneytr = $("#moneytr").val();
		var realMoney = parseInt($moneytr) - parseInt($loanunit);
		if (realMoney >= $loanunit) {
			$("#moneytr").val(realMoney);
		}
	});

	// 优先投资
	$("#suBnt_a")
			.click(
					function(event) {
						event.preventDefault();
						var $loanuserId = $("#loanuserId").val(); // 用户项目id
						var $userId = $("#userId").val(); // 当前用户
						var $moneyo = $("#moneyo").val();// 投资金额
						var $loanunit = $("#loanunit").val(); // 最低投资
						var $prioRestMoney = $("#prioRestMoney").val(); // 优先
						var $midRestMoney = $("#midRestMoney").val(); // 夹层
						var number = /^[0-9]*$/;
						var sumber = /^[+-]?(\d*)?\d+$/;
						if ($loanuserId == $userId) {
							ymPrompt.errorInfo('您不能投自己的项目！', 300, 170, '提示',
									function() {
									});
							return false;
						}
						if (!calcAge()) {
							ymPrompt.errorInfo('您的年龄必须年满18岁！', 300, 170, '提示',
									function() {
									});
							return false;
						}
						if (parseFloat($("#cashBalance").val()) < parseFloat($moneyo)) {
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
							return false;
						}

						if (isNaN($moneyo)) {
							ymPrompt.errorInfo('投资金额含有非法字符！', 300, 180, '提醒',
									null);
							return false;
						}

						if (parseInt($moneyo) <= 0) {
							ymPrompt.errorInfo('投资金额需大于0的金额！', 300, 180, '提醒',
									null);
							return false;
						}
						if (!number.test($moneyo)) {
							ymPrompt.errorInfo('投资金额必须为正整数！', 300, 180, '提醒',
									null);
							return false;
						}
						if ($moneyo % $loanunit != 0) {
							ymPrompt.errorInfo('投资金额需以最低投资金额的倍数！', 400, 200,
									'提示', function() {
									});
							return false;
						}

						if ($moneyo > (parseInt($prioRestMoney) + parseInt($midRestMoney))) {
							ymPrompt.errorInfo('投资金额不能大于剩余金额！', 400, 200, '提示',
									function() {
									});
							return false;
						}

						$('body').append('<div class="loading-cover"></div>');
						$('#suBnt_a').css("color", "#ce251f");
						$(this)
								.next('.loading')
								.append(
										'<img src="/resources/images/main/preloader-w8-cycle-white.gif"/>');
						var w = window.open();
						$.ajax({
							url : '/plank/toLoanPay.htm',
							type : 'post',
							data : $("#form1").serialize(),
							success : function(msg) {
								w.location = "/plank/toLoadLoanPay.htm";
								$(".loading-cover").remove();
								$('#suBnt_a').css("color", "#fff");
								$('#suBnt_a').next().children().remove();
								$('#investModal').animate({
									'top' : '-=749'
								}, '400', 'linear', function() {
									$('#invest-cover').fadeOut();
									$('html').css({
										'overflow-y' : 'auto'
									});
								});
							}

						});
					});

	// 夹层投资
	$("#suBnt_b")
			.click(
					function(event) {
						event.preventDefault();
						var $loanuserId = $("#loanuserId").val(); // 用户项目id
						var $userId = $("#userId").val(); // 当前用户
						var $moneyt = $("#moneyt").val();// 投资金额
						var $loanunit = $("#loanunit").val(); // 最低投资
						var $prioRestMoney = $("#prioRestMoney").val(); // 优先
						var $midRestMoney = $("#midRestMoney").val(); // 夹层
						var number = /^[0-9]*$/;
						var sumber = /^[+-]?(\d*)?\d+$/;
						if ($loanuserId == $userId) {
							ymPrompt.errorInfo('您不能投自己的项目！', 300, 170, '提示',
									function() {
									});
							return false;
						}
						if (!calcAge()) {
							ymPrompt.errorInfo('您的年龄必须年满18岁！', 300, 170, '提示',
									function() {
									});
							return false;
						}
						if (parseFloat($("#cashBalance").val()) < parseFloat($moneyt)) {
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
							return false;
						}

						if (isNaN($moneyt)) {
							ymPrompt.errorInfo('投资金额含有非法字符！', 300, 180, '提醒',
									null);
							return false;
						}

						if (parseInt($moneyt) <= 0) {
							ymPrompt.errorInfo('投资金额需大于0的金额！', 300, 180, '提醒',
									null);
							return false;
						}
						if (!number.test($moneyt)) {
							ymPrompt.errorInfo('投资金额必须为正整数！', 300, 180, '提醒',
									null);
							return false;
						}
						if ($moneyt % $loanunit != 0) {
							ymPrompt.errorInfo('投资金额需以最低投资金额的倍数！', 400, 200,
									'提示', function() {
									});
							return false;
						}

						if ($moneyt > (parseInt($prioRestMoney) + parseInt($midRestMoney))) {
							ymPrompt.errorInfo('投资金额不能大于剩余金额！', 400, 200, '提示',
									function() {
									});
							return false;
						}
						$('body').append('<div class="loading-cover"></div>');
						$('#suBnt_b').css("color", "#ce251f");
						$(this)
								.next('.loading')
								.append(
										'<img src="/resources/images/main/preloader-w8-cycle-white.gif"/>');
						var ww = window.open();
						$.ajax({
							url : '/plank/toLoanPay.htm',
							type : 'post',
							data : $("#form2").serialize(),
							success : function(msg) {
								ww.location = "/plank/toLoadLoanPay.htm";
								$(".loading-cover").remove();
								$('#suBnt_b').css("color", "#fff");
								$('#suBnt_b').next().children().remove();
								$('#investModal').animate({
									'top' : '-=749'
								}, '400', 'linear', function() {
									$('#invest-cover').fadeOut();
									$('html').css({
										'overflow-y' : 'auto'
									});
								});
							}

						});
					});

	// 劣后投资
	$("#suBnt_c")
			.click(
					function(event) {
						event.preventDefault();
						var $loanuserId = $("#loanuserId").val(); // 用户项目id
						var $userId = $("#userId").val(); // 当前用户
						var $moneytr = $("#moneytr").val();// 投资金额
						var $loanunit = $("#loanunit").val(); // 最低投资
						var $afterRestMoney = $("#afterRestMoney").val(); // 劣后
						var $isOrgPerson = $("#isOrgPerson").val();
						var $loanlines = $("#loanlines").val();
						var number = /^[0-9]*$/;
						var sumber = /^[+-]?(\d*)?\d+$/;
						if ($loanuserId == $userId) {
							ymPrompt.errorInfo('您不能投自己的项目！', 300, 170, '提示',
									function() {
									});
							return false;
						}
						if (!calcAge()) {
							ymPrompt.errorInfo('您的年龄必须年满18岁！', 300, 170, '提示',
									function() {
									});
							return false;
						}
						if (parseFloat($("#cashBalance").val()) < parseFloat($moneytr)) {
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
							return false;
						}
						if ($isOrgPerson != 1) {
							ymPrompt.errorInfo('您还未成为机构投资人！', 300, 170, '提示',
									function() {
									});
							return false;
						}
						if ($loanlines == "") {
							$loanlines = 0.00;
						}
						if (parseInt($moneytr) > parseInt($loanlines)) {

							ymPrompt.errorInfo('您已超过你的投资限额:' + $loanlines
									+ '元！', 300, 170, '提示', function() {
							});
							return false;
						}

						if (isNaN($moneytr)) {
							ymPrompt.errorInfo('投资金额含有非法字符！', 300, 180, '提醒',
									null);
							return false;
						}

						if (parseInt($moneytr) <= 0) {
							ymPrompt.errorInfo('投资金额需大于0的金额！', 300, 180, '提醒',
									null);
							return false;
						}
						if (!number.test($moneytr)) {
							ymPrompt.errorInfo('投资金额必须为正整数！', 300, 180, '提醒',
									null);
							return false;
						}
						if ($moneytr % $loanunit != 0) {
							ymPrompt.errorInfo('投资金额需以最低投资金额的倍数！', 400, 200,
									'提示', function() {
									});
							return false;
						}
						if ($moneytr > parseInt($afterRestMoney)) {
							ymPrompt.errorInfo('投资金额不能大于剩余金额！', 400, 200, '提示',
									function() {
									});
							return false;
						}

						$('body').append('<div class="loading-cover"></div>');
						$('#suBnt_c').css("color", "#ce251f");
						$(this)
								.next('.loading')
								.append(
										'<img src="/resources/images/main/preloader-w8-cycle-white.gif"/>');
						var www = window.open();
						$.ajax({
							url : '/plank/toLoanPay.htm',
							type : 'post',
							data : $("#form3").serialize(),
							success : function(msg) {
								www.location = "/plank/toLoadLoanPay.htm";
								$(".loading-cover").remove();
								$('#suBnt_c').css("color", "#fff");
								$('#suBnt_c').next().children().remove();
								$('#investModal').animate({
									'top' : '-=749'
								}, '400', 'linear', function() {
									$('#invest-cover').fadeOut();
									$('html').css({
										'overflow-y' : 'auto'
									});
								});
							}

						});
					});
});
