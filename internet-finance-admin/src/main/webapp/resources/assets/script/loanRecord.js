$(function() {
	var loanId = $("#loanId").val();
	// 投资记录
	$.ajax({
		url : '/loaninfo/loanrecordList.htm',
		type : 'post',
		dataType : 'text',
		data : {
			loanId : loanId
		},
		success : function(data) {
			$("#record").html(data);
		}
	});
});
