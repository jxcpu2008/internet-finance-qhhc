var phone = /^1\d{10}$/;
var email = /^\w+@\w+(\.\w{2,3}){1,2}$/;
$(function() {

	$("#submit").click(
			function() {
				var issueLoan = $("#issueLoan").val();
				var priority = $("#priority").val();
				var middle = $("#middle").val();
				var after = $("#after").val();
				var loanUnit = $("#loanUnit").val();
				var borrower_name = $("#borrower_name").val();
				
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
					$("#priority").val("");
					return;
				}
				if (parseFloat(middle) % parseFloat(loanUnit) != 0) {
					alertMsg.info('夹层金额不符合！');
					$("#middle").val("");
					return;
				}
				if (parseFloat(after) % parseFloat(loanUnit) != 0) {
					alertMsg.info('劣后金额不符合！');
					$("#after").val("");
					return;
				}
				if (num1 != issueLoan) {
					alertMsg.info('优先、夹层、劣后金额不符合！');
					$("#priority").val("");
					$("#middle").val("");
					$("#after").val("");
					return;
				}

				if ($("#outDay").val() != null || $("#outDay").val() != "") {
					if ($("#outDay").val() >= $("#remonth").val()) {
						alertMsg.info('转让期限应小于回购期限！');
						return;
					}
				}
				
				var customerMsgPhone = $.trim($("#customerMsgPhone").val());
				var customerMsgEmail = $.trim($("#customerMsgEmail").val());
				if (customerMsgPhone == '' || !phone.test(customerMsgPhone)) {
					alertMsg.info('客户手机号格式有误！');
					return;
				}
				if (customerMsgEmail != '' && !email.test(customerMsgEmail)) {
					alertMsg.info('客户邮箱格式有误！');
					return;
				}
				
				var objArr = $("div[receiverNameList='a']");
				if(objArr.length < 1) {
					alertMsg.info('你还没有添加消息提醒人！');
					return;
				}
				converReceiverToJson();
				$("#form1").submit();
			});


	// 年份
	for (var i = 1980; i < 2016; i++) {
		var year = '<option  value="' + i + '" ';
		year += '>' + i + '</option>';
		$("#year").append(year);
	}
	// 获得月份
	for (var i = 1; i < 13; i++) {
		var month = '<option  value="' + i + '" ';
		month += '>' + i + '</option>';
		$("#month").append(month);
	}
	$("#year").change(function() {
		$("#month").empty();
		var date = new Date();
		// 月份
		for (var i = 1; i < 13; i++) {
			if ($("#year").val() == 2015) {
				if (i > (date.getMonth() + 1)) {
					break;
				} else {
					var month = '<option  value="' + i + '" ';
					month += '>' + i + '</option>';
					$("#month").append(month);
				}
			} else {
				var month = '<option  value="' + i + '" ';
				month += '>' + i + '</option>';
				$("#month").append(month);
			}
		}

	});

	// 省份级联城市
	$("#cityid-1").change(function() {
		var pId = $(this).val();
		$.ajax({
			type : "post",
			data : "pId=" + pId,
			url : "/loanSign/getProCityLists",
			success : function(msg) {
				$("#cityid-2").html(msg);
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
	$("#addMsgReminderBtn").click(
		function() {
			var reminderEmployeeName = $.trim($("#reminderEmployeeName").val());
			var reminderEmployeePhone = $.trim($("#reminderEmployeePhone").val());
			var reminderEmployeeEmail = $.trim($("#reminderEmployeeEmail").val());
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
			var reminderInfo = '<div style="float: left;"  receiverNameList="a" class="cancel"><span>' + reminderEmployeeName + '</span>' +
				'<input name="receiverName" type="hidden" value="' + reminderEmployeeName + '">' + 
				'<input name="receiverPhone" type="hidden" value="' + reminderEmployeePhone + '">' + 
				'<input name="receiverEmail" type="hidden" value="' + reminderEmployeeEmail + '">' + 
				'<input name="receivertype" type="hidden" value="2">' + 
				'<img src="/resources/assets/images/home/remove.png" onclick="deleteReminderInfo(this)"></div>';
			$("#employeeInfoParea").before(reminderInfo);
			
			var objArr = $("div[receiverNameList='a']");
			var len = objArr.length;
			if(len > 0) {
				$("#reminderEmployeeName").val('');
				$("#reminderEmployeePhone").val('');
				$("#reminderEmployeeEmail").val('');
				$("#addMsgReminderBtn").val("继续添加");
			}
		}
	);
});

/** 删除信息提醒人的相关信息 */
function deleteReminderInfo(obj) {
	var parent = $(obj).parent();
	$(obj).parent().remove();
}

/** 将信息接收人相关信息转换成json字符串 */
function converReceiverToJson() {
	var objArr = $("div[receiverNameList='a']");
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
	obj.receiverName=$("#customerMsgName").val();
	obj.receiverPhone=$("#customerMsgPhone").val();
	obj.receiverEmail=$("#customerMsgEmail").val();
	obj.type=$("#customerType").val();
	receiver[len]=obj;
	var jsonStr = JSON.stringify(receiver);
	$("#employeeReminderInfo").val(jsonStr);
}