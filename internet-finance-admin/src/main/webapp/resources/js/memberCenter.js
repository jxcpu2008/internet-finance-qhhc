$(function() {
	function onload(pageNum) {
		if (pageNum == undefined || pageNum == null || pageNum == "") {
			pageNum = 1;
		}
		$.ajax({
			type : 'post',
			url : '/member_index/system_message',
			data : 'pageNum=' + pageNum,
			success : function(msg) {
				$('#systemmessage').append(msg);
			}
		});
	}

	onload();
	
	//宝付注册
	$("#openBf").click(function(){
		var cardId = $("#cardStatus").val();
		if (cardId == 0) {
			ymPrompt.alert('实名认证后才能进行该操作', 400,200, '提示');
			return;
		}
		$.ajax({
			url : '/registration/registBaofoo.htm',
			type : 'post',
			success : function(data) {
				if (data == 1) {
					ymPrompt.succeedInfo("您的宝付帐号开通成功，关闭窗口后完成对宝付的使用授权",440,200,"成功",
							function(result) {
								if (result=="ok") {
									accredit();
								} else {
									accredit();
								}
							});
				} else if (data == 3){
					ymPrompt.errorInfo('不是宝付注册返回的数据！', 349,null, '失败');
				} else {
					ymPrompt.errorInfo(data, 349,null, '失败');
				}
			}
		});
	});
});