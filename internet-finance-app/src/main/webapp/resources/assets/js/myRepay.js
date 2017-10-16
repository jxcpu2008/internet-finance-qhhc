$(function() {
	normalRepayModule.init();
	repayModule.init();
	inadvanceRepayModule.init();
	overdueRepayModule.init();
	monthsRepayModule.init();
	
	// 正常还款（不允许提前还款的情况）
	$("#normalRepayConfirmBtn").click(function() {
		ymPrompt.confirmInfo("您确定要对该项目还款吗？", 397, 180, "提示",
			function(result) {
				if (result == "ok") {
					$('body').spinner('正在还款...');
					$("#normalRepayForm").submit();  // 提交还款操作
				}
			});
	});
	
	// 申请还款按钮
	$("#applyInAdvanceRepayBtn").click(function() {
		
		// 判断融资用户的余额是否足够
		var repayAmount = $("#repayAmountHidden").val();
		var balance = $("#balance").val();
		repayAmount = parseFloat(repayAmount);
		balance = parseFloat(balance);
		if (repayAmount > balance) {
			ymPrompt.alert('您的账户余额不足，请先充值！', 450, 200, '失败', null);
			return false;
		}
		
		ymPrompt.confirmInfo("您确定要对该项目提前还款吗？", 397, 180, "提示",
			function(result) {
				if (result == "ok") {
					$('body').spinner('正在申请提前还款...');
					// 提交申请提前还款操作
					$("#inadvanceRepayForm").submit();
				}
		});
	});
	
	// 逾期还款按钮
	$("#confirmOverdueRepayBtn").click(function() {
		
		// 判断融资用户的余额是否足够
		var repayAmount = $("#repayAmountHidden1").val();
		var balance = $("#balance").val();
		repayAmount = parseFloat(repayAmount);
		balance = parseFloat(balance);
		if (repayAmount > balance) {
			ymPrompt.alert('您的账户余额不足，请先充值！', 450, 200, '失败', null);
			return false;
		}
		
		ymPrompt.confirmInfo("您确定要对该项目还款吗？", 397, 180, "提示",
			function(result) {
				if (result == "ok") {
					$('body').spinner('正在还款...');
					$("#overdueRepayForm").submit();
				}
		});
	});
	
	// 还款按钮
	$("#confirmRepayBtn").click(function() {
		
		// 判断融资用户的余额是否足够
		var repayAmount = $("#repayAmountHidden2").val();
		var balance = $("#balance").val();
		repayAmount = parseFloat(repayAmount);
		balance = parseFloat(balance);
		if (repayAmount > balance) {
			ymPrompt.alert('您的账户余额不足，请先充值！', 450, 200, '失败', null);
			return false;
		}
		
		ymPrompt.confirmInfo("您确定要对该项目还款吗？", 397, 180, "提示",
			function(result) {
				if (result == "ok") {
					$('body').spinner('正在还款...');
					$("#repayForm").submit();
				}
		});
	});
	
	// 多月标还款按钮
	$("#confirmMonthsRepayBtn").click(function() {
		
		var flag = $("#flagHidden").val();
		
		// 判断融资用户的余额是否足够
		var repayAmount = $("#repayAmountHidden3").val();
		var balance = $("#balance").val();
		repayAmount = parseFloat(repayAmount);
		balance = parseFloat(balance);
		if (repayAmount > balance) {
			ymPrompt.alert('您的账户余额不足，请先充值！', 450, 200, '失败', null);
			return false;
		}
		
		ymPrompt.confirmInfo("您确定要对该项目还款吗？", 397, 180, "提示",
			function(result) {
				if (result == "ok") {
					if (flag == "applyRepay") {
						$('body').spinner('正在申请提前还款...');
					} else {
						$('body').spinner('正在还款...');
					}
					
					$("#monthsRepayForm").submit();
				}
		});
	});
});

// 还款信息框
function repaymentInfo(loanId, repayId) {
	$.ajax({
		url : '/loaninfo/repayment.htm',
		type : 'post',
		data : {
			loanId : loanId,
			id : repayId
		},
		dataType : 'json',
		success : function(rep) {
			$("#loan_name").text(rep.repayment.name);
			$("#issueLoan").html("(项目总额：&yen;"+rep.repayment.issueLoan+"元)");
			$("#repaySum").val(rep.repayment.needMoney);
			$("#repayId").val(rep.repayment.rid);
			if (rep.repayment.refunway=="1") {
				$("#repayType").text('按月付息到期还本');
			} else if (rep.repayment.refunway=="4") {
				$("#repayType").text('等本等息');
			} else {
				$("#repayType").text('按季付息到期还本');
			}
		}
	});
}

// 正常还款
function repay(loanId, repayRecordId, repayAmount) {
	var loanName = $("#loanName_" + repayRecordId).val();
	var overdueDays = $("#overdueDays_" + repayRecordId).val();
	// for test
	overdueDays = 0;
	
	var feeState = $("#feeState_" + repayRecordId).val();
	var repayPeriod = $("#repayPeriod_" + repayRecordId).val();
	var loanPeriods = $("#loanPeriods_" + repayRecordId).val();
	var refundWay = $("#refundWay_" + repayRecordId).val();
	
	var loanType = $("#loanType_" + repayRecordId).val();
	
	// 标的名称
	$("#loanName").text(loanName);
	// 还款金额
	$("#repayAmount").text(repayAmount + "元");
	
	if (loanType == 3) {	// 天标
		$("#loanPeriods").text(loanPeriods + "天");
	} else if (loanType == 2) {	// 月标
		$("#loanPeriods").text(loanPeriods + "个月");
	} else {
	}
	
	if (refundWay == 1) {
		$("#refundWay").text('按月付息到期还本');
	} else if (refundWay == 2) {
		$("#refundWay").text('按季付息到期还本');
	} else if (refundWay == 3) {
		$("#refundWay").text('天标还款');
	} else {
	}
	
	// 对应的还款记录主键id
	$("#repayAmountHidden2").val(repayAmount);
	$("#repayRecordIdHidden2").val(repayRecordId);
	$("#overdueDaysHidden2").val(overdueDays);
	$("#loanNameHidden2").val(loanName);
	$("#loanIdHidden2").val(loanId);
	$("#feeStateHidden2").val(feeState);
	$("#repayPeriodHidden2").val(repayPeriod);
	$("#loanPeriodsHidden2").val(loanPeriods);
	$("#refundWayHidden2").val(refundWay);
	$("#loanTypeHidden2").val(loanType);
}

function monthsRepay(loanId, repayRecordId, repayAmount) {
	var loanName = $("#loanName_" + repayRecordId).val();
	var loanPeriods = $("#loanPeriods_" + repayRecordId).val();
	var refundWay = $("#refundWay_" + repayRecordId).val();
	var repayPeriod = $("#repayPeriod_" + repayRecordId).val();
	var feeState = $("#feeState_" + repayRecordId).val();
	var loanType = $("#loanType_" + repayRecordId).val();
	var overdueDays = $("#overdueDays_" + repayRecordId).val();
	
	// 标的名称
	$("#monthsLoanName").text(loanName);
	// 还款金额
	$("#monthsRepayAmount").text(repayAmount + "元");
	$("#monthsRepayPeriod").text("第" + repayPeriod + "期");
	
	if (refundWay == 1) {
		$("#monthsRefundWay").text('按月付息到期还本');
	} else if (refundWay == 2) {
		$("#monthsRefundWay").text('按季付息到期还本');
	} else {
	}
	
	// 对应的还款记录主键id
	$("#repayAmountHidden3").val(repayAmount);
	$("#repayRecordIdHidden3").val(repayRecordId);
	$("#overdueDaysHidden3").val(overdueDays);
	$("#loanNameHidden3").val(loanName);
	$("#loanIdHidden3").val(loanId);
	$("#feeStateHidden3").val(feeState);
	$("#repayPeriodHidden3").val(repayPeriod);
	$("#loanPeriodsHidden3").val(loanPeriods);
	$("#refundWayHidden3").val(refundWay);
	$("#loanTypeHidden3").val(loanType);
	$("#realInterestHidden3").val(0);
	
	if ($(".tab-controls").size()) {
		$(".tab-controls").each(function(index, element) {
			var $this = $(this);
			$this.find("a").click(function() {
				if ($(this).hasClass("active")) {
					return false;
				}
				$(this).addClass("active").siblings().removeClass("active");
				var index = $(this).index();
				if (typeof($(this).attr("data-tabindex")) != "undefined") {
					index = $(this).attr("data-tabindex");
				}
				$this.nextAll(".tab-content").find(".tab-item").eq(index).stop().css("opacity",0).show().animate({opacity:1},500).siblings().hide();
				
				var id =  $(this).attr("id");
				if (id == "inadvanceMonthsRepayTabPage") {
					$("#flagHidden").val("applyRepay");
					$("#confirmMonthsRepayBtn").text("申请还款");
					
					$.ajax({
						url : '/loaninfo/inadvanceMonthsRepay.htm',
						type : 'post',
						data : {
							loanId : loanId,
							repayAmount : repayAmount,
							periods : repayPeriod,
							loanPeriods : loanPeriods,
						},
						dataType : 'json',
						success : function(data) {
							// 还款金额
							$("#monthsInadvanceRepayAmount").text(data.repayment.realRepayAmount + "元");
							// 实付本息
							$("#monthsExpectRepayAmount").text(data.repayment.realAmount + "元");
							// 额外利息
							$("#monthsPenaltyAmount").text(data.repayment.penaltyInterest + "元");
							// 节省利息
							$("#monthsSavedInterest").text(data.repayment.savedInterest);
							
							// 对应的还款记录主键id
							$("#repayAmountHidden3").val(data.repayment.realRepayAmount);
							// 实付利息
							$("#realInterestHidden3").val(data.repayment.realRepayInterest);
						}
					});
				} else {
					$("#flagHidden").val("repay");
					$("#confirmMonthsRepayBtn").text("确认还款");
				}
			});
			
			$this.find("a:first").click();
        });
	};
}

// 提前还款
function inadvanceRepay(loanId, repayRecordId, repayAmount, realDays) {
	var loanName = $("#loanName_" + repayRecordId).val();
	var loanAmount = $("#loanAmount_" + repayRecordId).val();
	var loanDays = $("#loanDays_" + repayRecordId).val();
	var overdueDays = $("#overdueDays_" + repayRecordId).val();
	
	var feeState = $("#feeState_" + repayRecordId).val();
	var repayPeriod = $("#repayPeriod_" + repayRecordId).val();
	var loanPeriods = $("#loanPeriods_" + repayRecordId).val();
	var refundWay = $("#refundWay_" + repayRecordId).val();
	var loanType = $("#loanType_" + repayRecordId).val();
	
	// 标的名称
	$("#inadvanceLoanName").text(loanName);
	// 预期期限
	$("#expectDays").text(loanDays + "天");
	// 实际期限
	$("#realDays").text(realDays + "天");
	
	// 部分费用放到后台计算
	$.ajax({
		url : '/loaninfo/inadvanceRepay.htm',
		type : 'post',
		data : {
			repayAmount : repayAmount,
			loanAmount : loanAmount,
			loanDays : loanDays,
			realDays : realDays,
		},
		dataType : 'json',
		success : function(data) {
			// 还款金额
			$("#inadvanceRepayAmount").text(data.repayment.realRepayAmount + "元");
			// 应付利息
			$("#expectInterest").text(data.repayment.expectInterest + "元");
			// 实付利息
			$("#realInterest").text(data.repayment.realInterest + "元");
			// 节省利息
			$("#savedInterest").text(data.repayment.savedInterest);
			
			// 对应的还款记录主键id
			$("#repayAmountHidden").val(data.repayment.realRepayAmount);
			$("#expectInterestHidden").val(data.repayment.expectInterest);
			$("#realInterestHidden").val(data.repayment.realInterest);
			
			$("#repayRecordIdHidden").val(repayRecordId);
			$("#overdueDaysHidden").val(overdueDays);
			$("#loanNameHidden").val(loanName);
			$("#loanIdHidden").val(loanId);
			$("#feeStateHidden").val(feeState);
			$("#repayPeriodHidden").val(repayPeriod);
			$("#loanPeriodsHidden").val(loanPeriods);
			$("#refundWayHidden").val(refundWay);
			$("#loanTypeHidden").val(loanType);
		}
	});
}

// 逾期还款
function overdueRepay(loanId, repayRecordId, repayAmount, overdueRate) {
	var loanName = $("#loanName_" + repayRecordId).val();
	var overdueDays = $("#overdueDays_" + repayRecordId).val();
	var expectRepayDate = $("#expectRepayDate_" + repayRecordId).val();
	
	var feeState = $("#feeState_" + repayRecordId).val();
	var repayPeriod = $("#repayPeriod_" + repayRecordId).val();
	var loanPeriods = $("#loanPeriods_" + repayRecordId).val();
	var refundWay = $("#refundWay_" + repayRecordId).val();
	var loanType = $("#loanType_" + repayRecordId).val();
	
	// 标的名称
	$("#overdueLoanName").text(loanName);
	// 应还日期
	$("#expectRepayDate").text(expectRepayDate);
	// 逾期天数
	$("#overdueDays").text(overdueDays + "天");
	// 应付本息
	$("#expectRepayAmount").text(repayAmount + "元");
	
	// 部分费用放到后台计算
	$.ajax({
		url : '/loaninfo/overdueRepay.htm',
		type : 'post',
		data : {
			repayAmount : repayAmount,
			overdueDays : overdueDays,
			overdueRate : overdueRate,
		},
		dataType : 'json',
		success : function(data) {
			// 还款金额
			$("#overdueRepayAmount").text(data.repayment.realRepayAmount + "元");
			// 罚付利息
			$("#penaltyAmount").text(data.repayment.penaltyAmount + "元");
			
			// 对应的还款记录主键id
			$("#repayAmountHidden1").val(data.repayment.realRepayAmount);
			$("#repayRecordIdHidden1").val(repayRecordId);
			$("#overdueDaysHidden1").val(overdueDays);
			$("#loanNameHidden1").val(loanName);
			$("#loanIdHidden1").val(loanId);
			$("#feeStateHidden1").val(feeState);
			$("#repayPeriodHidden1").val(repayPeriod);
			$("#loanPeriodsHidden1").val(loanPeriods);
			$("#refundWayHidden1").val(refundWay);
			$("#loanTypeHidden1").val(loanType);
		}
	});
}