$(function() {
	// 投资
	$("#formSubmit").click(
			function() {
				$('body').spinner();
				// 判断是否使用了红包
				if (!$("#isuse_redenve").is(":checked")) {
					$("#redenve_id").val('');
				}
				$.ajax({
					url : '/plank/ipsGetLoanInfo.htm',
					data : $("#payForm").serialize(),
					type : 'post',
					success : function(data) {
						$("#pcode").val('');
						var result = JSON.parse(data);
						if (result.code == 0) {
							$('body').removerSpinner();
							if (result.juChengActivityFlag == 1) {   	// 聚橙网抽奖活动情况下
								var num = 0;
								var investOrderNum = result.investOrderNum;
								$.ajax(
										{
										url : '/juchengactivity/queryJuChengPrizeNum.htm',
									type : 'post',
									data:{investOrderNum: investOrderNum},
									success : function(msg) {
									msg = JSON.parse(msg);
									num = msg.prizeNum;
									if (num > 0) {
										$("#jucnum").html(num);
										$.fancybox.open({
											href : '#record-Juc',
											padding : 0,
								            margin:0,
								            scrolling: 'no',
								            closeBtn: true,
								            wrapCSS: 'fancybox-transparent',
								            helpers: {
								                  overlay : {
								                      closeClick : false
								                  }
								              },
								              tpl:{
								                  closeBtn : '<a title="关闭" class="fancybox-custom-close" href="javascript:;" style="right:-50px;top:105px;background:url(${oss}/resources/public/js/fancybox/arrowjuc.png);width:50px;height:50px;"></a>'
								              }
								        })
									} else {
										ymPrompt.succeedInfo("恭喜您，购买成功！", 349, null, "成功",
												function(result) {
													window.location.reload();
												});
									}
								}});
							} else {
								ymPrompt.succeedInfo("恭喜您，购买成功！", 349, null, "成功",
										function(result) {
											window.location.reload();
										});
							}
						} else {
							$('body').removerSpinner();
							ymPrompt.errorInfo(result.msg, 349, null, "失败");
							$("#imageCode").click();
						}
					}
				});

			});
	// 投资check
	$("#loanInvest").click(function() {
		var priority = $.trim($("#priority").val());
		var sandwich = $.trim($("#middle").val());
		var inferior = $.trim($("#after").val());
		var loanId = $.trim($("#loanId").val());
		$("#loansignId").val(loanId);
		if (!$("#delete-book input:checkbox").prop('checked')) {
			ymPrompt.errorInfo('请先同意<<授权委托书>>', 400, 200,
					'警告', null);
			return;
		}
		// 判断是否使用了红包
		if (!$("#isuse_redenve").is(":checked")) {
			$("#redenve_id").val('');
			$("#contain_redenv").hide();
		} else {
			$("#contain_redenv").show().css('display',"block");
		}
		// 判断是否使用了加息券
		if ($("#isuse_interest").is(":checked")) {
			$("#interest_id").val(interest_id);
		} else {
			$("#interest_id").val('');
		}
		if ($("#isuse_redenve").is(":checked") && $("#isuse_interest").is(":checked")) {
			ymPrompt.alert("加息券和红包不能同时使用！", 400, null, "提示");
		}
		$.ajax({
			url : '/loaninfo/checkLoan.htm',
			type : 'post',
			data : {
				proMoney : priority,
				midMoney : sandwich,
				afterMoney : inferior,
				loanId : loanId,
				redenve_id : $("#isuse_redenve").is(":checked") ? red_id : ''
			},
			success : function(data) {
				if (data == "true") {
					$("#redenve_id").val(red_id);
					if ($("#loanType_id").val() == 5) {
						$(".modal-content .label-priority").removeClass('label-priority');
					}
					$('#zcModal').modal('show');  
					$('#loanInfoValidCoodeId').html('<img id="imageCode" src="/cic/code?name=user_tend" onclick="this.src=\'/cic/code?name=user_tend&amp;id=\'+new Date();" title="看不清，点击换一张" class="img-responsive" style="width: 60px; height: 30px; margin-top: -7px; margin-left: 10px;" />');
				} else {
					ymPrompt.errorInfo(data, 400, null, "失败" ,function (result) {
						if (result == "ok") {
							window.location.reload();
						}
					});
				}
			}
		});
	});
	
	// 确定选择红包
	$("#sure_redenve").click(function(){
		var curr_redenve = 0.0;
		var curr_id = '';  // 获取红包id
		// 获取当前选中的红包金额
		$("[name=pick]").each(function(index,element){
			if ($(this).is(":checked")) {
				curr_id = $(this).val();
				red_id = curr_id;  // 将全局红包id设置为当前选择的
				curr_redenve = $.trim($(this).parent().parent().next().text());
			}
		});
		$(".how-much").text(curr_redenve);
		$("#redenve_id").val(curr_id);
	});
	
	// 确定选择加息券
	$("#sure_interest").click(function(){
		var curr_interest = 0.0;
		var curr_id = '';  // 获取加息券id
		// 获取当前选中的加息面值
		$("[name=pick]").each(function(index,element){
			if ($(this).is(":checked")) {
				curr_id = $(this).val();
				interest_id = curr_id;  // 将全局加息券id设置为当前选择的
				curr_interest = $.trim($(this).parent().parent().next().text());
			}
		});
		$(".interest_rate").text(curr_interest);
		$("#interest_id").val(curr_id);
	});
	
	//免责声明
	$("#protocol").click(function(event){
		event.preventDefault();
		$.ajax({
			url : '/visitor/getPayProtocol.htm',
			type : 'post',
			success : function(data) {
				$("#protocolModal .modal-body").html(data);
				$("#protocolModal").modal('show');
			}
		});
		
	});
	
	//授权委托书
	$("#delegate").click(function(event){
		event.preventDefault();
		$.ajax({
			url : '/visitor/getDelegate.htm',
			type : 'post',
			success : function(data) {
				$("#delegateModal .modal-body").html(data);
				$("#delegateModal").modal('show');
			}
		});
		
	});
});