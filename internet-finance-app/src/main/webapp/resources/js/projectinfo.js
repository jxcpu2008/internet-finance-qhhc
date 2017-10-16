$(function() {
	$(".certModal").click(function() {

		$("#myimg").prop('src', $(this).children('img').prop('src'));
	});

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
			$(".pro-table").html(data);
		}
	});
})

function Collectloan(Id, userId, loanuserId) {
	if (userId == "") {
		ymPrompt.errorInfo('您还未登录,请先登录在执行此操作!', 400, 200, '提示', function() {
			window.location.href = "/visitor/to-login";
		});
		return;
	}
	if (loanuserId == userId) {
		ymPrompt.errorInfo('您不能收藏自己的项目!', 350, 180, '提示', function() {
		});
		return;
	}
	$.ajax({
		url : '/loaninfo/loanCollection.htm',
		type : 'post',
		data : 'loanId=' + Id,
		success : function(msg) {
			if (msg == '1') {
				/*
				 * ymPrompt.succeedInfo('收藏成功！', 300, 150, '成功', function() {
				 * location.reload(); });
				 */
				$("#add_collect").html("取消收藏");
			} else if (msg == '2') {
				/* ymPrompt.errorInfo('您已经收藏过项目！', 300, 150, '失败', null); */
				$("#add_collect").html("收藏项目");
			}
		}
	});
}

// 合同协议
function showContant() {
	$.ajax({
		url : '/visitor/getContant.htm',
		type : 'post',
		success : function(data) {
			var winNode = $("#win");
			winNode.fadeIn("slow");
			$("#content").html(data);
		}

	});

}

function hide() {
	$('html').css({
		'overflow-y' : 'auto'
	});
	var winNode = $("#win");
	winNode.fadeOut("slow");
	winNode.hide("slow");

}

