// 服务协议
function showAgree() {
	$.ajax({
		url : '/visitor/getAgreeMent.htm',
		type : 'post',
		success : function(data) {
			var winNode = $("#win");
			winNode.fadeIn("slow");
			$("#content").html(data);
		}

	});

}


function hide() {
	$('#invest-cover').hide();
	$('html').css({
		'overflow-y' : 'auto'
	});
	var winNode = $("#win");
	winNode.fadeOut("slow");
	winNode.hide("slow");

}