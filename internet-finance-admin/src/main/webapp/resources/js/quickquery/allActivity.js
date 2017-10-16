/** 2016年5月新手任务相关关注微信根据手机号标注领取 */
function newWebChatAttentionReceive() {
	var phone = $("#telephone").val();
	$.ajax({
		url : '/allActivity/newWebChatAttentionReceive.htm',
		type : 'post',
		data : {phone:phone},
		success : function(data) {
			data = JSON.parse(data);
			alertMsg.info(data.msg);
		}
	});
}


/** 2016-05参与母亲节发放红包 */
function monthersDay() {
	var phone = $("#MonthersDayPhone").val();
	$.ajax({
		url : '/cachemanage/MonthersDayHb.htm',
		type : 'post',
		data : {phone:phone},
		success : function(data) {
			data = JSON.parse(data);
			alertMsg.info(data.msg);
		}
	});
}