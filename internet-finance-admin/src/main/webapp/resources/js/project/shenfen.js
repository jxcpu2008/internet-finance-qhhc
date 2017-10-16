


$(function(){
	
	$("#upbodyphoto").change(function() {
		
		var srcc = $("#upbodyphoto").val();
		start = srcc.lastIndexOf(".");
		end = srcc.length;
		ts = srcc.substring(start + 1, end);
		nts = ts.toLowerCase();
	
		
		if (srcc.length > 0) {
			if (nts != 'jpg' && nts != 'png' && nts != 'gif' && nts != 'jpeg') {
				document.getElementById("form1").reset();
				ymPrompt.errorInfo('图片格式错误！', 226, 150, '失败', null);
			} else {
				
				$("#shenform1").ajaxSubmit({
					type : 'post',
					url : '/project/uploadFile',
					success : function(data) {
						
						$('#shenimg1').attr('src', data);
					}
				});
			}

		}
	});
	
	$("#upbodyphotof").change(function() {
	
		var srcc = $("#upbodyphotof").val();
		start = srcc.lastIndexOf(".");
		end = srcc.length;
		ts = srcc.substring(start + 1, end);
		nts = ts.toLowerCase();
		if (srcc.length > 0) {
			if (nts != 'jpg' && nts != 'png' && nts != 'gif' && nts != 'jpeg') {
				document.getElementById("form1").reset();
				ymPrompt.errorInfo('图片格式错误！', 226, 150, '失败', null);
			} else {
				$("#shenform2").ajaxSubmit({
					type : 'post',
					url : '/project/uploadFile',
					success : function(data) {
						
						$('#shenimg2').attr('src', data);
					}
				});
			}

		}
	});
});

function checktoushen(){
	
	var $realname=$("#realname").val();
	var $card=$("#u_body_num").val();
	var $img1=$("#upbodyphoto").val();
	var $img2=$("#upbodyphotof").val();
	var ccard = /^[1-9]{1}[0-9]{16}[0-9(X|x)]{1}$/;
	
	if($realname==""||$realname==null){
		ymPrompt.errorInfo('真实姓名不能为空！', 226, 150, '失败', null);
		return;
	}
	
	if($card==""||$card==null){
		ymPrompt.errorInfo('身份证不能为空！', 226, 150, '失败', null);
		return;
	}
	if(!ccard.test($card)){
		ymPrompt.errorInfo('身份证格式不正确！', 226, 150, '失败', null);
		return;
	}
	
	if($img1==""||$img1==null){
		ymPrompt.errorInfo('请选择文件！', 226, 150, '失败', null);
		return;
	}
	if($img2==""||$img2==null){
		ymPrompt.errorInfo('请选择文件2！', 226, 150, '失败', null);
		return;
	}
	$.ajax({
		url : '/project/touzishenfen',
		type : 'post',
		data : {
			realName : $realname,
			cardId : $card,
			cardimg1 : $("#shenimg1").attr("src"),
			cardimg2 : $("#shenimg2").attr("src")			
		},
		success : function() {
			window.location.href = "/member_index/member_center.htm";
					
		}
	});
	
}