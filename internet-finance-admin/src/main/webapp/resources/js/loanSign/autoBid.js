function clearNoNum(event, obj) {
	event = window.event || event;
	if (event.keyCode == 37 | event.keyCode == 39) {
		return;
	}
	obj.value = obj.value.replace(/[^\d.]/g, "");
	obj.value = obj.value.replace(/^\./g, "");
	obj.value = obj.value.replace(/\.{2,}/g, ".");
	obj.value = obj.value.replace(".", "$#$").replace(/\./g, "").replace("$#$",
			".");
}
function checkNum(obj) {
	obj.value = obj.value.replace(/\.$/g, "");
}

function jumpPage(pageno, totalPage) {
	if (pageno <= 0 || pageno > totalPage) {
		return;
	}
	$.ajax({
		type : 'post',
		data : {
			no : pageno
		},
		url : '/member_index/autoBidList.htm',
		success : function(data) {
			$(".check_record").html(data);
		}
	});
}
// 修改
function autoUpdate(id) {
	$.ajax({
		url : "/member_index/autoUpdate.htm",
		data : {
			id : id
		},
		async : false,
		success : function(data) {
			$("#tenderingModal").html(data);
			$("#agree").hide();
		}
	});
}
// 删除
function autoDel(id) {
	ymPrompt.confirmInfo("您确定要删除该记录吗？", 330, 180, "提示", function(tp) {
		if (tp == "ok") {
			$.ajax({
				url : "/automatic/delAutomatic?id=" + id,
				type : "post",
				success : function(data) {
					if (data == "true") {
						ymPrompt.succeedInfo('删除成功!', 400, 200, '成功',
								function() {
									window.location.reload();
								});
					} else {
						ymPrompt.errorInfo('删除失败!', 400, 200, '失败', function() {
							window.location.reload();
						});
					}
				}
			});
		}
	});

}

// 保存自动投标
function autoSubmit() {
	// 标题
	if ($("input[name='autoName']").val() == "") {
		$("input[name='autoName']").next().children().text("此项不能为空！");
		return;
	} else {
		$("input[name='autoName']").next().children().text("");
	}
	// 金额类型
	if ($("input[name='autoMoneyType']:checked").val() == 2) {
		if ($("input[name='pSAmtQuota']").val() == "") {
			$("input[name='pSAmtQuota']").next().children().text("此项不能为空！");
			return;
		} else {
			$("input[name='pSAmtQuota']").next().children().text("");
		}
	}

	// 期限类型
	if ($("input[name='autoVildType']:checked").val() == 1) {
		if ($("input[name='pSTrdCycleValue']").val() == "") {
			$("input[name='pETrdCycleValue']").next().children()
					.text("此项不能为空！");
			return;
		} else {
			if ($("input[name='pSTrdCycleValue']").val() >= $(
					"input[name='pETrdCycleValue']").val()) {
				$("input[name='pETrdCycleValue']").next().children().text(
						"不符合限定范围！");
				return;
			}
			$("input[name='pETrdCycleValue']").next().children().text("");
		}
	}

	// 投资方式
	if ($("input[name='autoLoanType']:checked").val() == 1) {
		if ($("input[name='pSIRQuota']").val() == "") {
			$("input[name='pEIRQuota']").next().children().text("此项不能为空！");
			return;
		} else {
			if (parseInt($("input[name='pSIRQuota']").val()) >= parseInt($("input[name='pEIRQuota']").val())) {
				$("input[name='pEIRQuota']").next().children().text("不符合限定范围！");
				return;
			}
			$("input[name='pEIRQuota']").next().children().text("");
		}
	}
	if ($("#type").val() == "1") {
		if ($("input[name='agreeAuto']:checked").val() == undefined) {
			ymPrompt.errorInfo('请先同意自动投标协议!', 400, 200, '失败', null);
			return;
		}
		$.ajax({
			url : "/automatic/saveAutomatic",
			data : encodeURI($("#autoForm").serialize()),
			success : function(msg) {
				if (msg == "1") {
					ymPrompt.succeedInfo('添加成功!', 400, 200, '成功', function() {
						window.location.reload();
					});
				} else {
					ymPrompt.errorInfo('添加失败!', 400, 200, '失败', function() {
						window.location.reload();
					});
				}
			}
		});
	} else {
		$.ajax({
			url : "/automatic/updateAutomatic",
			data : encodeURI($("#autoForm").serialize()),
			success : function(msg) {
				if (msg == "1") {
					ymPrompt.succeedInfo('修改成功!', 400, 200, '成功', function() {
						window.location.reload();
					});
				} else {
					ymPrompt.errorInfo('修改失败!', 400, 200, '失败', function() {
						window.location.reload();
					});
				}
			}
		});
	}
}
$(function() {

	$(".incenfr_nr").on('click', '.tendering', function() { // 改变弹出框的类型
		$("#type").val('1');
		$("#agree").show();
	});

	$.ajax({
		url : "/member_index/autoBidList.htm",
		type : "post",
		data : {
			no : 1
		},
		success : function(data) {
			$(".check_record").html(data);
		}
	});
});
