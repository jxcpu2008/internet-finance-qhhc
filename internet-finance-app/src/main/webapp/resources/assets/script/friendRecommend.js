$(function() {
	$.ajax({
		url : "/generalize/promote_record.htm",
		type : "post",
		data : {
			no : 1
		},
		success : function(msg) {
			$(".col-md-12").html(msg);
		}
	});
	// 复制推广链接
	$('#copy_url').zclip({
		path : '/resources/js/lib/ZeroClipboard.swf',
		copy : $('#promote_link').val(),
		afterCopy : function() {
			ymPrompt.succeedInfo("链接已复制", 380, 180, "提示");
		}
	});
	// 复制推广码
	$('#copy_code').zclip({
		path : '/resources/js/lib/ZeroClipboard.swf',
		copy : $('#promote_code').val(),
		afterCopy : function() {
			ymPrompt.succeedInfo("推广码已复制", 380, 180, "提示");
		}
	});
});

function jumpPage(pageno, totalPage) {
	if (pageno <= 0 || pageno > totalPage) {
		return;
	}
	$.ajax({
		url : "/generalize/promote_record.htm",
		data : {
			no : pageno
		},
		type : 'post',
		success : function(msg) {
			$(".col-md-12").html(msg);
		}
	});
}
