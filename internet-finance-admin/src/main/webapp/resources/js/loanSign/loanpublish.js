$(function() {

	// 失去焦点校验
	$(".lanceTx").focusout(function() {
		if ($(this).val() == "") {
			if ($(this).attr("name") == "name") {
				$(this).next().text("请输入项目名");
				return false;
			}
			if ($(this).attr("name") == "person") {
				$(this).next().text("请输入正确的企业人数");
				return false;
			}
			if ($(this).attr("name") == "remark") {
				$(this).next().text("请输入项目简介");
				return false;
			}

		} else if ($(this).attr("name") == "name") {
			var reg = /^.{6,20}$/;
			if (!reg.test($("input[name='name']").val())) {
				$("input[name='name']").next().text("项目名为：6-20个字");
			} else {
				$(this).next().text("");
			}
		} else if ($(this).attr("name") == "person") {
			var number = /^[0-9]*$/;
			if (!number.test($("input[name='person']").val())) {
				$("input[name='person']").next().text("请输入正确的企业人数");
			} else {
				$(this).next().text("");
			}
		}

	});

	// 表单提交校验
	$("#mysubmit").click(function() {
		if ($("#name").val() == "") {
			document.getElementById("name").focus();
			$("#name").next().text("请输入项目名");
			return false;
		}

		var reg = /^.{6,20}$/;
		if (!reg.test($("#name").val())) {
			document.getElementById("name").focus();
			$("#name").next().text("项目名为：6-20个字");
			return false;
		}

		if ($("#industry_id").val() == "") {
			document.getElementById("industry_id").focus();
			$("#industry_id").next().text("请选择项目行业");
			return false;
		} else {
			$("#industry_id").next().text("");
		}

		if ($("#phase_id").val() == "") {
			document.getElementById("phase_id").focus();
			$("#phase_id").next().text("请选择项目阶段");
			return false;
		} else {
			$("#phase_id").next().text("");
		}

		if ($("#year").val() == "") {
			document.getElementById("year").focus();
			$("#year").next().text("请选择企业时间年份");
			return false;
		} else {
			$("#year").next().text("");
		}

		if ($("#month").val() == "") {
			document.getElementById("month").focus();
			$("#month").next().text("请选择企业时间月份");
			return false;
		} else {
			$("#month").next().text("");
		}

		var number = /^[0-9]*$/;
		if (!number.test($("#person").val()) || $("#person").val() == "") {
			document.getElementById("person").focus();
			$("#person").next().text("请输入正确的企业人数");
			return false;
		}

		if ($("#cityid-1").val() == "") {
			document.getElementById("cityid-1").focus();
			$("#cityid-1").next().next().text("请选择所属省份");
			return false;
		} else {
			$("#cityid-1").next().next().text("");
		}
		if ($("#cityid-2").val() == "") {
			document.getElementById("cityid-2").focus();
			$("#cityid-2").next().text("请选择所属城市");
			return false;
		} else {
			$("#cityid-2").next().text("");
		}

		if ($("#is_company").val() == "") {
			document.getElementById("is_company").focus();
			$("#is_company").next().text("请选择公司状态");
			return false;
		} else {
			$("#is_company").next().text("");
		}
		if ($("#remark").val() == "") {
			document.getElementById("remark").focus();
			$("#remark").next().text("请选择公司简介");
			return false;
		}
		if ($("#loanImage").val() == "") {
			$("#image").text("请上传项目图片");
			return false;
		} else {
			$("#image").text("");
		}
		$("#Myform").submit();
	});

	/**
	 * 省市级联
	 */
	$("#cityid-1").change(function() {
		var pId = $(this).val();
		$.ajax({
			type : "post",
			data : "pId=" + pId,
			url : "/loaninfo/getProCityLists",
			success : function(msg) {
				$("#cityid-2").html(msg);
			}
		});
	});

	$("#loanpic").change(function() {
		var srcc = $("#loanpic").val();
		start = srcc.lastIndexOf(".");
		end = srcc.length;
		ts = srcc.substring(start + 1, end);
		nts = ts.toLowerCase();
		if (srcc.length > 0) {
			if (nts != 'jpg' && nts != 'png' && nts != 'gif' && nts != 'jpeg') {
				document.getElementById("loanform").reset();
				ymPrompt.errorInfo('图片格式错误！', 226, 150, '失败', null);
			} else {
				$("#loanform").ajaxSubmit({
					type : 'post',
					url : '/loanSign/loanUploadFile',
					success : function(data) {
						$('#loanImage').val(data);
						$('#loanimg').attr('src', data).css({
							'width' : '132px',
							'height' : '145px'
						}).removeClass('loanImage');

					}
				});
			}

		}
	});

	// 获得当前年份
	var curYear = $("#curYear").val();
	// 年份
	for (var i = 1980; i < 2016; i++) {
		var year = '<option  value="' + i + '" ';
		if (curYear == i) {
			year += ' selected="selected"';
		}
		year += '>' + i + '</option>';
		$("#year").append(year);
	}
	// 获得当前月份
	var curMonth = $("#curMonth").val();
	// 月份
	for (var i = 1; i < 13; i++) {
		var month = '<option  value="' + i + '" ';
		if (curMonth == i) {
			month += ' selected="selected"';
		}
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
					if (curMonth == i) {
						month += ' selected="selected"';
					}
					month += '>' + i + '</option>';
					$("#month").append(month);
				}
			} else {
				var month = '<option  value="' + i + '" ';
				if (curMonth == i) {
					month += ' selected="selected"';
				}
				month += '>' + i + '</option>';
				$("#month").append(month);
			}
		}

	});

});

function p_d_change(textareaName, spanName) {
	document.getElementById(spanName).innerHTML = 300 - document
			.getElementById(textareaName).value.length;
}

// 第三步

$(function() {
	var number = /^[0-9]*$/; // 正整数
	var sumber = /^[+-]?(\d*)?(\.)?\d+$/; // 金额
	// -------------失去焦点校验开始--------------------

	$(".asset-mount,.asset-percent,.asset-total")
			.focusout(
					function() {
						if ($(this).val() == "") {
							if ($(this).attr("id") == "remonth") {
								$(this).next().next().text("请输入回购期限");
							}

							if ($(this).attr("id") == "validity") {
								$(this).next().text("请输入有效期");
							}

							if ($(this).attr("id") == "loanUnit") {
								$(this).next().text("请输入最低投资金额");
							}

							if ($(this).attr("id") == "outDay") {
								$(this).next().text("请输入转让月份");
							}

							return false;
						} else if ($(this).attr("id") == "remonth") {
							var isNormal = $("#general").is(":checked");
							if (isNormal) { // 如果为普通标
								if (!number.test($("#remonth").val())) {
									$("#remonth").next().text("请输入正整数");
								} else if (!($("#remonth").val() > 0 && $(
										"#remonth").val() < 13)) {
									$("#remonth").next().next().text(
											"普通众筹回购期限为12个月制!");
								} else if (parseInt($(
										':radio[name="refunway"]:checked')
										.val()) == 2) {
									if (parseInt($("#remonth").val()) % 3 != 0) {
										$("#remonth").next().next().text(
												"月份与季度不合法！");
									} else {
										$(this).next().next().text("");
									}
								} else {
									$(this).next().next().text("");
								}
							} else { // 天标
								if (!number.test($("#remonth").val())) {
									$("#remonth").next().text("请输入正整数");
								} else if (!($("#remonth").val() > 4 && $(
										"#remonth").val() < 31)) {
									$("#remonth").next().next().text(
											"短期众筹回购期限为5-30天!");
								} else if (parseInt($(
										':radio[name="refunway"]:checked')
										.val()) == 2) {
									if (parseInt($("#remonth").val()) % 3 != 0) {
										$("#remonth").next().next().text(
												"月份与季度不合法！");
									} else {
										$(this).next().next().text("");
									}
								} else {
									$(this).next().next().text("");
								}
							}
						} else if ($(this).attr("id") == "validity") {
							if (!number.test($("#validity").val())) {
								$("#validity").next().text("请输入正整数");
							} else {
								(this).next().text("");
							}
						} else if (($(this).attr("id") == "priority")) {
							if (!sumber.test($("#priority").val())
									|| $("#priority").val() == 0) {
								$("#priority").next().text("请输入正确的金额");
							} else {
								$(this).next().text("");
							}
						} else if (($(this).attr("id") == "middle")) {
							if (!sumber.test($("#middle").val())
									|| $("#middle").val() == 0) {
								$("#middle").next().text("请输入正确的金额");
							} else {
								$(this).next().text("");
							}
						} else if (($(this).attr("id") == "after")) {
							if (!sumber.test($("#after").val())
									|| $("#after").val() == 0) {
								$("#after").next().text("请输入正确的金额");
							} else {
								$(this).next().text("");
							}
						} else if (($(this).attr("id") == "prioRate")) {
							var num = $("#prioRate").val();
							if (!sumber.test(num)) {
								$("#prioRate").next().next().text("请输入正整数");
							} else if (num < 4 || num > 24) {
								$("#prioRate").next().next().text(
										"年化率需在4%-24%之间！");
							} else {
								$(this).next().next().text("");
							}
						} else if (($(this).attr("id") == "prioAwordRate")) {
							var num = parseFloat($("#prioAwordRate").val());

							if (!sumber.test(num)) {
								$("#prioAwordRate").next().next()
										.text("请输入正整数");

							} else if (num < 0 || num > 10) {
								$("#prioAwordRate").next().next().text(
										"奖励需在0%-10%之间！");
							} else {
								$(this).next().next().text("");
							}
						} else if (($(this).attr("id") == "afterRate")) {
							var sum = ($("#afterRate").val());
							if (!number.test(sum)) {
								$("#afterRate").next().next().text("请输入正整数");

							} else {
								$(this).next().next().text("");
							}
						} else if (($(this).attr("id") == "loanUnit")) {

							if (!number.test($("#loanUnit").val())) {

								$("#loanUnit").next().text("请输入正整数");
							} else if ($("#loanUnit").val() <= 0) {
								$("#loanUnit").next().text("最低投资金额不能低于0");
							} else {
								$(this).next().text("");
							}
						} else if (($(this).attr("id") == "outDay")) {
							if (!number.test($("#outDay").val())) {
								$("#outDay").next().text("请输入正整数");
							} else if (parseInt($("#outDay").val()) >= parseInt($(
									"#remonth").val())) {
								$("#outDay").next().text("必须小于回购期限！");
							} else {
								$(this).next().text("");
							}
						}

					});
	// -------------失去焦点校验结束--------------------

	// -------------------众筹表单提交开始------------------
	// 表单提交
	$("#next1")
			.click(
					function() {
						var isNormal = $("#general").is(":checked");

						// 回购期限提交验证
						var $remonth = $("#remonth").val();
						if ($remonth == "") {
							document.getElementById("remonth").focus();
							$("#remonth").next().next().text("请输入回购期限");
							return false;
						} else {
							if (isNormal) { // 如果为普通标
								if (!number.test($("#remonth").val())) {
									document.getElementById("remonth").focus();
									$("#remonth").next().next().text("请输入正整数");
									return false;
								} else if (!($remonth > 0 && $remonth < 13)) {
									$("#remonth").next().next().text(
											"普通众筹回购期限为12个月制!");
									return false;
								} else {
									$("#remonth").next().next().text("");
								}
							} else { // 天标
								if (!number.test($("#remonth").val())) {
									document.getElementById("remonth").focus();
									$("#remonth").next().next().text("请输入正整数");
									return false;
								} else if (!($remonth > 4 && $remonth < 31)) {
									$("#remonth").next().next().text(
											"短期众筹回购期限为5-30天!");
									return false;
								} else {
									$("#remonth").next().next().text("");
								}
							}

						}

						// 有效期提交验证
						if ($("#validity").val() == "") {
							document.getElementById("validity").focus();
							$("#validity").next().text("请输入发布有效期");
							return false;
						} else {
							if (!number.test($("#validity").val())) {
								document.getElementById("validity").focus();
								$("#validity").next().text("请输入正整数");
								return false;
							} else {
								$("#validity").next().text("");
							}

						}

						// 优先提交验证
						if ($("#priority").val() == ""
								|| $("#priority").val() <= 0) {
							document.getElementById("priority").focus();
							$("#priority").next().text("请输入大于0的金额");
							return false;
						} else {
							if (!sumber.test($("#priority").val())) {
								document.getElementById("priority").focus();
								$("#priority").next().text("请输入正确的金额");
								return false;
							} else {
								$("#priority").next().text("");
							}

						}

						if (!sumber.test($("#prioRate").val())) {
							document.getElementById("prioRate").focus();
							$("#prioRate").next().next().text("请输入正整数");
							return false;

						} else if ($("#prioRate").val() < 4
								|| $("#prioRate").val() > 24) {
							document.getElementById("prioRate").focus();
							$("#prioRate").next().next().text("年化率需在4%-24%之间！");
							return false;

						}

						if (!sumber.test(parseFloat($("#prioAwordRate").val()))) {
							document.getElementById("prioAwordRate").focus();
							$("#prioAwordRate").next().next().text("请输入正整数");
							return false;

						} else if (parseFloat($("#prioAwordRate").val()) < 0
								|| parseFloat($("#prioAwordRate").val()) > 10) {
							document.getElementById("prioAwordRate").focus();
							$("#prioAwordRate").next().next().text(
									"奖励需在0%-10%之间！");
							return false;
						}

						// //夹层提交验证
						if ($("#middle").val() == "") {
							document.getElementById("middle").focus();
							$("#middle").next().text("请输入金额");
							return false;
						}
						//			
						if (!sumber.test($("#middle").val())) {
							document.getElementById("middle").focus();
							$("#middle").next().text("请输入正确的金额");
							return false;
						}

						// //劣后提交验证
						if ($("#after").val() == "") {
							document.getElementById("after").focus();
							$("#after").next().text("请输入金额");
							return false;
						}
						if (!sumber.test($("#after").val())) {
							document.getElementById("after").focus();
							$("#after").next().text("请输入正确的金额");
							return false;
						}

						if ($("#afterRate").val() <= 0
								|| $("#afterRate").val() > 100) {
							$("#afterRate").next().next().text("请输入大于0的百分比");
							return false;
						}

						// 最低投资提交验证
						if ($("#loanUnit").val() == "") {
							document.getElementById("loanUnit").focus();
							$("#loanUnit").next().text("请输入金额");
							return false;
						}

						if (!number.test($("#loanUnit").val())) {
							document.getElementById("loanUnit").focus();
							$("#loanUnit").next().text("请输入正整数");
							return false;
						}

						if ($("#loanUnit").val() <= 0) {
							document.getElementById("loanUnit").focus();
							$("#loanUnit").next().text("最低投资金额不能低于0");
							return false;
						} else if ($("#loanUnit").val() >= 0) {
							var loanpro = parseInt($("#priority").val());
							var loanmid = parseInt($("#middle").val());
							var loanaft = parseInt($("#after").val());
							var loanUnit = parseInt($("#loanUnit").val());

							if (loanpro % loanUnit != 0) {
								document.getElementById("loanUnit").focus();
								$("#loanUnit").next().text("优先与最低金额不能整除");
								return false;
							} else if (loanmid % loanUnit != 0) {
								document.getElementById("loanUnit").focus();
								$("#loanUnit").next().text("夹层与最低金额不能整除");
								return false;

							} else if (loanaft % loanUnit != 0) {
								document.getElementById("loanUnit").focus();
								$("#loanUnit").next().text("劣后与最低金额不能整除");
								return false;
							}
						}
						if (isNormal) { // 如果为普通标
							// 转让月份提交验证
							if ($("#outDay").val() == "") {
								document.getElementById("outDay").focus();
								$("#outDay").next().text("请输入转让月份");
								return false;
							}

							if (!number.test($("#outDay").val())) {
								document.getElementById("outDay").focus();
								$("#outDay").next().text("必须是正整数");
								return false;
							}

							if (parseInt($("#outDay").val()) >= parseInt($(
									"#remonth").val())) {
								document.getElementById("outDay").focus();
								$("#outDay").next().text("必须小于回购期限！");
								return false;
							}

						}
						if (parseInt($(':radio[name="refunway"]:checked').val()) == 2) {
							if (parseInt($("#remonth").val()) % 3 != 0) {
								document.getElementById("remonth").focus();
								$("#remonth").next().text("按季不能整除！");
								return false;
							}
						}
						if ($("#escrow").val() == "") {
							$("#remonth").next().text("请选择第三方担保！");
						}

						$("#loanForm").submit();
					});
	// -------------------众筹表单提交结束------------------

	// -----------优先,夹层,劣后,夹层,劣后 失去焦点计算值开始-----------------
	// $('#priority,#middle,#after,#prioAwordRate,#midRate,#afterRate').blur(
	$('#priority,#middle,#after,#prioRate,#afterRate').blur(
			function() {
				var priority = $('#priority').val();
				var middle = $('#middle').val();
				var after = $('#after').val();
				var prioRate = $('#prioRate').val(); // 夹层
				// var midRate = $('#midRate').val();
				var afterRate = $('#afterRate').val();

				if (priority == "") {
					priority = 0;
					$('#priority').val(0);
				}

				if (middle == "") {
					middle = 0;
					$('#middle').val(0);
				}
				if (after == "") {
					after = 0;
					$('#after').val(0);
				}
				if (prioRate == "") {
					prioRate = 0;
					$('#prioRate').val(0);
				}
				/*
				 * if (midRate == "") { midRate = 0; $('#midRate').val(0); }
				 */
				if (afterRate == "") {
					afterRate = 0;
					$('#afterRate').val(0);

				}

				if (priority >= 0 && middle >= 0 && after >= 0) {
					$('#issueLoan').val(
							parseFloat(priority) + parseFloat(middle)
									+ parseFloat(after));
				} else {
					$('#issueLoan').val(0);
				}

			});
	// 众持类型切换
	$('input:radio')
			.bind(
					'change',
					function() {
						switch ($(this).prop('id')) {
						case 'others':
							$(this).parents('li').append(
									'<input type="text" />');
							break;
						case 'general':
							$('.post-holding')
									.find('li')
									.each(
											function() {
												if ($(this).hasClass('active')) {
													$(this).show();
													switch ($(this).find(
															'input:radio')
															.prop('id')) {
													case 'refun':
														$(this)
																.find(
																		'input:radio')
																.prop(
																		'checked',
																		true);
														break;
													case 'refunone':
														$(this)
																.find(
																		'input:radio')
																.prop(
																		'checked',
																		false);
														break;
													}
													if ($(this).find(
															'input:text').val() != '') {
														$(this).find(
																'input:text')
																.val('');
													}
												}
											});
							$('.asset-mount').next('span.active').text('月');
							break;
						case 'short-term':
							$('.post-holding').find('li').each(function() {
								if ($(this).hasClass('active')) {
									$(this).hide();
								}
							});
							$('.asset-mount').next('span.active').text('天');
							break;
						default:
							if ($(this).parents('ul').children('li').last()
									.children('input').length > 0) {
								$(this).parents('ul').children('li').last()
										.children('input').remove();
							}
							break;
						}
					});
	var $loanType = $("[name=loanType]").val();
	if ($loanType == "2") {
		$("#general").prop('checked', true);
	} else if ($loanType == "3") {
		$("#short-term").prop('checked', true);
		$("#short-term").trigger('change');
	}
});