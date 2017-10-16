function reset() {
	window.location.reload();
}

function checkLen(name){
	var current = $("input[name='"+name+"']");
	if (current.val().length < 6) {
		current.next().removeClass("muted").addClass("redded").html("(密码必须大于6位)");
		return false;
	} else {
		current.next().removeClass("redded").addClass("muted").html("");
		return true;
	}
}
$(function() {
	$("#mysubmit").click(
			function() {
				var flag = true;
				if ($("input[name='oldPwd']").val() == "") {
					$("input[name='oldPwd']").next().removeClass("muted")
							.addClass("redded").html("(请输入您的原密码)");
					flag = false;
				} else {
					if (!checkLen('oldPwd')) {
						return;
					}
				}
				if ($("input[name='pwd']").val() == "") {
					$("input[name='pwd']").next().removeClass("muted")
							.addClass("redded").html("(请输入您的新密码)");
					flag = false;
				} else {
					if (!checkLen('pwd')) {
						return;
					}
				}

				if ($("input[name='pwd2']").val() == "") {
					$("input[name='pwd2']").next().removeClass("muted")
							.addClass("redded").html("(请再次输入您的新密码)");
					flag = false;
				} else {
					if (!checkLen('pwd2')) {
						return;
					}
					if ($("input[name='pwd2']").val() != $("input[name='pwd']")
							.val()) {
						$("input[name='pwd2']").next().removeClass("muted")
								.addClass("redded").html("(请确认两次密码是否一致)");
						flag = false;
					} else {
						$("input[name='pwd2']").next().removeClass("redded")
								.addClass("muted");
					}

				}

				if (flag) {
					$('#myform').ajaxSubmit(
							{
								dataType : 'text',
								success : function(msg) {
									if (msg == "true") {
										ymPrompt.succeedInfo('修改成功', 260, 160,
												'成功', reset);
									} else if (msg == "different") {
										$("[name=oldPwd]").next().removeClass("muted").addClass("redded").html("原密码错误");
									} else {
										ymPrompt.errorInfo('修改失败！', 260, 160,
												'失败', reset);
									}
								}
							});
				}
			});

});