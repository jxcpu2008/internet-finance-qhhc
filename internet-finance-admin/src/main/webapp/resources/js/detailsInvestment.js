$(function() {
	$.ajax({
		url : "/member_index/moneyWater.htm",
		type : "post",
		data : {
			no : 1
		},
		success : function(msg) {
			$("#moneyWater").html(msg);
		}
	});
});
function jumpPage(pageno, totalPage) {
	if (pageno <= 0 || pageno > totalPage) {
		return;
	}
	$.ajax({
		url : "/member_index/moneyWater.htm",
		type : "post",
		data : {
			no : pageno
		},
		success : function(msg) {
			$("#moneyWater").html(msg);
		}
	});
}