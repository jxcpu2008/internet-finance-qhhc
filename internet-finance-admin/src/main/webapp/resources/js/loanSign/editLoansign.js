var phone = /^1\d{10}$/;
var email = /^\w+@\w+(\.\w{2,3}){1,2}$/;
$(function() {

	$("#submit1").click(
			function() {
				var issueLoan = $("#issueLoan1").val();
				var priority = $("#priority1").val();
				var middle = $("#middle1").val();
				var after = $("#after1").val();
				var loanUnit = $("#loanUnit1").val();

				var borrower_name = $("#borrower_name_edit").val();
				
				if (borrower_name == '') {
					alertMsg.info('请先选择借款人！');
					return;
				}
				
				var num = parseFloat(issueLoan) % parseFloat(loanUnit);
				var num1 = parseFloat(priority) + parseFloat(middle)
						+ parseFloat(after);
				if (num != 0) {
					alertMsg.info('最低投资金额不符合！');
					return;
				}

				if (parseFloat(priority) % parseFloat(loanUnit) != 0) {
					alertMsg.info('优先金额不符合！');
					$("#priority1").val("");
					return;
				}
				if (parseFloat(middle) % parseFloat(loanUnit) != 0) {
					alertMsg.info('夹层金额不符合！');
					$("#middle1").val("");
					return;
				}
				if (parseFloat(after) % parseFloat(loanUnit) != 0) {
					alertMsg.info('劣后金额不符合！');
					$("#after1").val("");
					return;
				}
				if (num1 != issueLoan) {
					alertMsg.info('优先、夹层、劣后金额不符合！');
					$("#priority1").val("");
					$("#middle1").val("");
					$("#after1").val("");
					return;
				}

				if ($("#outDay1").val() != null || $("#outDay1").val() != "") {
					if ($("#outDay1").val() >= $("#remonth1").val()) {
						alertMsg.info('转让期限应小于回购期限！');
						return;
					}

				}

				var customerMsgPhone = $.trim($("#customerMsgPhoneForUpdate").val());
				var customerMsgEmail = $.trim($("#customerMsgEmailForUpdate").val());
				if (customerMsgPhone == '' || !phone.test(customerMsgPhone)) {
					alertMsg.info('客户手机号格式有误！');
					return;
				}
				if (customerMsgEmail != '' && !email.test(customerMsgEmail)) {
					alertMsg.info('客户邮箱格式有误！');
					return;
				}
				
				var loansignName = $.trim($("#loansignNameId").val());
				var orginalLoansignName = $.trim($("#orginalLoansignNameId").val());
				if(orginalLoansignName != '' && orginalLoansignName.length > 0) {
					if(loansignName == orginalLoansignName || loansignName==orginalLoansignName +'_复制') {
						alertMsg.info('复制的项目，项目名称不能和原始项目名相同，请修改！');
						return;
					}
				}
				
				var objArr = $("div[receiverNameListForUpdate='e']");
				if(objArr.length < 1) {
					alertMsg.info('你还没有添加消息提醒人！');
					return;
				}
				converReceiverToJsonForUpdate();
				$("#form2").submit();

			});

	// 获得当前年份
	var curYear = $("#curYear1").val();
	// 年份
	for (var i = 1980; i < 2016; i++) {
		var year = '<option  value="' + i + '" ';
		if (curYear == i) {
			year += ' selected="selected"';
		}
		year += '>' + i + '</option>';
		$("#year1").append(year);
	}
	// 获得当前月份
	var curMonth = $("#curMonth1").val();
	for (var i = 1; i < 13; i++) {
		var month = '<option  value="' + i + '" ';
		if (curMonth == i) {
			month += ' selected="selected"';
		}
		month += '>' + i + '</option>';
		$("#month1").append(month);
	}
	$("#year1").change(function() {
		$("#month1").empty();
		var date = new Date();
		// 月份
		for (var i = 1; i < 13; i++) {
			if ($("#year1").val() == 2015) {
				if (i > (date.getMonth() + 1)) {
					break;
				} else {
					var month = '<option  value="' + i + '" ';
					if (curMonth == i) {
						month += ' selected="selected"';
					}
					month += '>' + i + '</option>';
					$("#month1").append(month);
				}
			} else {
				var month = '<option  value="' + i + '" ';
				if (curMonth == i) {
					month += ' selected="selected"';
				}
				month += '>' + i + '</option>';
				$("#month1").append(month);
			}
		}

	});

	// 省份级联城市
	$("#cityid-3").change(function() {
		var pId = $(this).val();
		$.ajax({
			type : "post",
			data : "pId=" + pId,
			url : "/loaninfo/getProCityLists",
			success : function(msg) {
				$("#cityid-4").html(msg);
			}
		});
	});

	$("select[name='type']").change(function() {
		if ($("select[name='type']").val() == 2) {
			$("input[name='outDay']").removeClass('readonly');
			$("input[name='outDay']").attr('disabled', false);
		} else if ($("select[name='type']").val() == 3) {
			$("input[name='outDay']").val('');
			$("input[name='outDay']").addClass('readonly');
			$("input[name='outDay']").attr('disabled', true);
		}

	});

	/** 添加项目联系人 */
	$("#addMsgReminderBtnForUpdate").click(
		function() {
			var reminderEmployeeName = $.trim($("#reminderEmployeeNameForUpdate").val());
			var reminderEmployeePhone = $.trim($("#reminderEmployeePhoneForUpdate").val());
			var reminderEmployeeEmail = $.trim($("#reminderEmployeeEmailForUpdate").val());
			//console.info(reminderEmployeeName+"----"+reminderEmployeePhone+"----"+reminderEmployeeEmail);
			if (reminderEmployeeName == '') {
				alertMsg.info('提醒人姓名不能为空！');
				return;
			}
			if (reminderEmployeePhone == '' || !phone.test(reminderEmployeePhone)) {
				alertMsg.info('提醒人手机号格式有误！');
				return;
			}
			if (reminderEmployeeEmail != '' && !email.test(reminderEmployeeEmail)) {
				alertMsg.info('提醒人邮箱格式有误！');
				return;
			}
			var reminderInfo = '<div style="float: left;"  receiverNameListForUpdate="e" class="cancel"><span>' + reminderEmployeeName + '</span>' +
				'<input name="receiverName" type="hidden" value="' + reminderEmployeeName + '">' + 
				'<input name="receiverPhone" type="hidden" value="' + reminderEmployeePhone + '">' + 
				'<input name="receiverEmail" type="hidden" value="' + reminderEmployeeEmail + '">' + 
				'<input name="receivertype" type="hidden" value="2">' + 
				'<img src="/resources/assets/images/home/remove.png" onclick="deleteReminderInfo(this)"></div>';
			$("#employeeInfoPareaForUpdate").before(reminderInfo);
			
			var objArr = $("div[receiverNameListForUpdate='e']");
			var len = objArr.length;
			if(len > 0) {
				$("#reminderEmployeeNameForUpdate").val('');
				$("#reminderEmployeePhoneForUpdate").val('');
				$("#reminderEmployeeEmailForUpdate").val('');
				$("#addMsgReminderBtnForUpdate").val("继续添加");
			}
		}
	);
	
	var objArr = $("div[receiverNameListForUpdate='e']");
	var len = objArr.length;
	if(len > 0) {
		$("#addMsgReminderBtnForUpdate").val("继续添加");
	}
});

/** 删除信息提醒人的相关信息 */
function deleteReminderInfo(obj) {
	var parent = $(obj).parent();
	$(obj).parent().remove();
}

/** 将信息接收人相关信息转换成json字符串 */
function converReceiverToJsonForUpdate() {
	var objArr = $("div[receiverNameListForUpdate='e']");
	var len = objArr.length;
	var receiver = new Array(); 
	for(i = 0; i < len; i++) {
		var obj = new Object();
		obj.receiverName=$(objArr[i]).children("input[name='receiverName']").val();
		obj.receiverPhone=$(objArr[i]).children("input[name='receiverPhone']").val();
		obj.receiverEmail=$(objArr[i]).children("input[name='receiverEmail']").val();
		obj.type=$(objArr[i]).children("input[name='receivertype']").val();
		receiver[i]=obj;
	}
	var obj = new Object();
	obj.receiverName=$("#customerMsgNameForUpdate").val();
	obj.receiverPhone=$("#customerMsgPhoneForUpdate").val();
	obj.receiverEmail=$("#customerMsgEmailForUpdate").val();
	obj.type=$("#customerTypeForUpdate").val();
	receiver[len]=obj;
	var jsonStr = JSON.stringify(receiver);
	$("#employeeReminderInfoForUpdate").val(jsonStr);
}