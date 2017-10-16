$(function() {
	$("#submit").click(
		function(event) {
			var title = $("#title").val();
			var content = $("#content").val();
			
			if (title == '') {
				alertMsg.info('请输入消息标题！');
				return false;
			}
			
			if (content == '') {
				alertMsg.info('请输入消息内容！');
				return false;
			}
			
//			alertMsg.confirm("确定推送消息？", {
//				okCall : function() {
//					$("#form1").submit();
//				},
//				
//				cancelCall : function() {
//					event.preventDefault();
//				}
//			});
			
			if (window.confirm("确定推送消息？")) {
//				$("#form1").submit();
				return true;
			} else {
				return false;
			}
		});
});

//function myFunction(form) {
//	var title = form.title.value;
//	var content = form.content.value;
//	
//	if (title == '') {
//		alertMsg.info('请输入消息标题！');
//		return false;
//	}
//	
//	if (content == '') {
//		alertMsg.info('请输入消息内容！');
//		return false;
//	}
//	if (window.confirm("确定推送消息？")) {
//		$("#form1").submit();
//		return validateCallback(form, navTabAjaxDone);
//	} else {
//		return false;
//	}
//}