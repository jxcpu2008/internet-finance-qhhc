

$(function() {
	// 机构附件1
	$("#upbodyphoto1").change(function() {
		
		var srcc = $("#upbodyphoto1").val();
		start = srcc.lastIndexOf(".");
		end = srcc.length;
		ts = srcc.substring(start + 1, end);
		nts = ts.toLowerCase();
		
		if (srcc.length > 0) {
			if (nts != 'jpg' && nts != 'png' && nts != 'gif' && nts != 'jpeg') {
				document.getElementById("shenform1").reset();
				ymPrompt.errorInfo('图片格式错误！', 226, 150, '失败', null);
			} else {
				
				$("#shenform1").ajaxSubmit({
					type : 'post',
					url : '/member_index/attachfile',
					success : function(data) {
						$('#chanismfile1').val(data);
						$('#shenimg1').attr('src', data);
						
					}
				});
			}

		}
	});
	$("#upbodyphoto2").change(function() {
		
		var srcc = $("#upbodyphoto2").val();
		start = srcc.lastIndexOf(".");
		end = srcc.length;
		ts = srcc.substring(start + 1, end);
		nts = ts.toLowerCase();
		
		if (srcc.length > 0) {
			if (nts != 'jpg' && nts != 'png' && nts != 'gif' && nts != 'jpeg') {
				document.getElementById("shenform2").reset();
				ymPrompt.errorInfo('图片格式错误！', 226, 150, '失败', null);
			} else {
				
				$("#shenform2").ajaxSubmit({
					type : 'post',
					url : '/member_index/attachfile',
					success : function(data) {
						$('#chanismfile2').val(data);
						$('#shenimg2').attr('src', data);
					}
				});
			}

		}
	});
	$("#upbodyphoto3").change(function() {
		
		var srcc = $("#upbodyphoto3").val();
		start = srcc.lastIndexOf(".");
		end = srcc.length;
		ts = srcc.substring(start + 1, end);
		nts = ts.toLowerCase();
		
		if (srcc.length > 0) {
			if (nts != 'jpg' && nts != 'png' && nts != 'gif' && nts != 'jpeg') {
				document.getElementById("shenform3").reset();
				ymPrompt.errorInfo('图片格式错误！', 226, 150, '失败', null);
			} else {
				
				$("#shenform3").ajaxSubmit({
					type : 'post',
					url : '/member_index/attachfile',
					success : function(data) {
						$('#chanismfile3').val(data);
						$('#shenimg3').attr('src', data);
					}
				});
			}

		}
	});
	$("#upbodyphoto4").change(function() {
		
		var srcc = $("#upbodyphoto4").val();
		start = srcc.lastIndexOf(".");
		end = srcc.length;
		ts = srcc.substring(start + 1, end);
		nts = ts.toLowerCase();
		
		if (srcc.length > 0) {
			if (nts != 'jpg' && nts != 'png' && nts != 'gif' && nts != 'jpeg') {
				document.getElementById("shenform1").reset();
				ymPrompt.errorInfo('图片格式错误！', 226, 150, '失败', null);
			} else {
				
				$("#shenform4").ajaxSubmit({
					type : 'post',
					url : '/member_index/attachfile',
					success : function(data) {
						$('#chanismfile4').val(data);
						$('#shenimg4').attr('src', data);
					}
				});
			}

		}
	});

	

});










