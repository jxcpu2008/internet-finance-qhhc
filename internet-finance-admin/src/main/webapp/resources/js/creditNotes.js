$(function() {
	$.ajax({
		url : '/visitor/toCreditNotesAjax',
		data : {
			no : 1
		},
		type : 'post',
		success : function(msg) {
			$("#creditList").html(msg);
		}
	});
});

function select(no) {

	$.ajax({
		url : '/visitor/toCreditNotesAjax',
		data : {
			no : no
		},
		type : 'post',
		success : function(msg) {
			$("#creditList").html(msg);
		}
	});

}

function jumpPage(pageno, totalPage) {

	if (pageno <= 0 || pageno > totalPage) {
		return;
	}
	select(pageno);
}
