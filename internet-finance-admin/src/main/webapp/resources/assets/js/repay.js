$(function() {
	RepayModal.init();
	// 确认还款按钮
	$("#confirm_rep").click(function(){
		ymPrompt.confirmInfo("您确定要对该项目还款吗？", 397, 180, "提示",
				function(result) {
					if (result == "ok") {
						$('body').spinner('正在还款...');
						$("#repayment_form").submit();  // 提交还款操作
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