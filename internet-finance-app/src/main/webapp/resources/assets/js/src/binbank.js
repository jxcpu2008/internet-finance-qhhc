$(function() {
	showLocation();

	// 绑定发送按钮
	$('.getPhoneCode').bind('click', handler);

	// 开户地址
	$("#loc_province").change(
			function() {
				if ($("#loc_province option:selected").text() == '请选择') {
					$("input[name=proValue]").val(''); // 省
				} else {
					$("input[name=proValue]").val(
							$("#loc_province option:selected").text()); // 省
				}
				$("input[name=cityValue]").val(''); // 市
			});
	$("#loc_city").change(
			function() {
				if ($("#loc_city option:selected").text() == '请选择') {
					$("input[name=cityValue]").val(''); // 市
				} else {
					$("input[name=cityValue]").val(
							$("#loc_city option:selected").text()); // 市
				}
			});

	// 同步银行卡
	$("#refreshBank").click(
			function() {
				$('body').spinner('正在同步银行卡...');
				$.ajax({
					url : '/userBank/synchronizeUserBank.htm',
					type : 'post',
					success : function(data) {
						$('body').removerSpinner();
						if (data == "2") {
							ymPrompt.succeedInfo('银行卡同步成功！', 400, 200, '成功',
									function() {
										window.location.reload();
									});
						} else if (data == "1") {
							ymPrompt.errorInfo('您还没未注册或未授权宝付会员哦！', 400, 200,
									'失败', function() {
										window.location.reload();
									});
						} else if (data == "6") {
							ymPrompt.errorInfo('您还未绑定银行卡！', 400, 200, '失败',
									function() {
										window.location.reload();
									});
						} else {
							ymPrompt.errorInfo('银行卡同步失败！', 400, 200, '失败',
									function() {
										window.location.reload();
									});
						}

					}

				});

			});

	// 添加银行卡
	$("#mysub").click(function() {
		if ($.trim($("input[name=bankCardNo]").val()) == "") {
			ymPrompt.errorInfo('银行卡号不能为空！', 400, 200, '提示',null);
			return false;
		} else {
			var number = /^[0-9]*$/; // 正整数
			var reg = /^(\d{16}|\d{19})$/;
			if (!number.test($.trim($("input[name=bankCardNo]").val()))
					|| !reg.test($.trim($("input[name=bankCardNo]").val()))) {
				ymPrompt.errorInfo('请输入正确的银行卡号！', 400, 200,'提示', null);
				return false;
			}
		}
		if (!$("input[name=proValue]").val()
				|| !$("input[name=cityValue]").val()
				|| !$.trim($("input[name=bankAddress]").val())) {
			ymPrompt.errorInfo('请填写完整的开户地址！', 400, 200, '提示',null);
			return false;
		}
		if ($("#bankName option:selected").val() == "") {
			ymPrompt.errorInfo('开户行不能为空！', 400, 200, '提示', null);
			return false;
		}
		if ($.trim($("input[name=validCode]").val()) == "") {
			ymPrompt.errorInfo('手机验证码不能为空！', 400, 200, '提示',null);
			return false;
		}
		if ($.trim($("input[name=imageCode]").val()) == "") {
			ymPrompt.errorInfo('验证码不能为空！', 400, 200, '提示', null);
			return false;
		}
		$('body').spinner('正在添加银行卡...');
		$.ajax({
			url : '/bankcard/bindBankCard',
			data : $("#form1").serialize(),
			type : 'post',
			success : function(data) {
				$('body').removerSpinner();
				data = JSON.parse(data);
				if (data.code == 0) {
					ymPrompt.succeedInfo(data.msg, 400, 200,'成功', function() {
						window.location.reload();
					});
				} else {
					ymPrompt.errorInfo(data.msg, 400, 200,'提示');
				}
			}
		});
	});

});

// 发送手机验证码
function handler() {
	$.ajax({
		type : 'post',
		url : '/bankcard/sendSmsCodeForBindCard',
		success : function(data) {
			data = JSON.parse(data);
			if (data.code == 0) {
				$('.getPhoneCode').unbind('click').css({
					'border-color' : '#bbb',
					'background-color' : '#bbb'
				});
				var time = 120;
				var code = setInterval(function() {
					if (time == 0) {
						clearInterval(code);
						$('.getPhoneCode').css({
							'border-color' : '#d43f3a',
							'background-color' : '#d9534f'
						}).text('获取手机验证码').bind('click', handler);
					} else {
						$('.getPhoneCode').text(function() {
							--time;
							prefix = time < 10 ? '0' : '';
							return prefix + time + '秒后重新发送';
						});
					}
				}, '1000');
				ymPrompt.succeedInfo('手机验证码已成功发送至您的手机，请注意查收！', 400, 200, '成功',
						null);
			} else {
				ymPrompt.errorInfo(data.msg, 400, 200, '失败', null);
			}
		}
	});
}
// 删除银行卡
function delectBank() {
	if ($("#form2").find('input[name="validate_code"]').val() == "") {
		ymPrompt.errorInfo('手机验证码不能为空！', 400, 200, '失败', null);
		return;
	} else {
		ymPrompt.confirmInfo('您确定要删除绑定的银行卡吗？', 400, 200, null,
				function(result) {
					if (result == "ok") {
						$.ajax({
							url : '/userBank/ipsOpBankCard.htm?type=0',
							type : 'post',
							data : $("#form2").serialize(),
							success : function(data) {
								if (data == "1") {
									ymPrompt.succeedInfo('银行卡删除成功！', 400, 200,
											'成功', function() {
												window.location.reload();
											});

								} else if (data == "2") {
									ymPrompt.errorInfo('银行卡删除失败！', 400, 200,
											'失败', null, function() {
												window.location.reload();
											});
								} else if (data == "3") {
									ymPrompt.errorInfo('参数解析错误！', 400, 200,
											'失败', null, function() {
												window.location.reload();
											});
								} else {
									ymPrompt.errorInfo(data, 400, 200, '失败',
											function() {
												window.location.reload();
											});
								}
							}

						});
					}
				});
	}
}
function deleteDiro(id, card) {
	$("#bankId").val(id);
	$("#deleteModel .cleargap span").text(card.replace(card.substring(5,card.length-5),'*****'));
	$('#deleteModel').modal('show');
}
$('#deleteModel').on('hidden.bs.modal', function() {
	$("input[name='validate_code']").val("");
});