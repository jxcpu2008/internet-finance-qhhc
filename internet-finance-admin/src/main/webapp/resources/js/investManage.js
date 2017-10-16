// 宝付已受理  - 查询状态
function findState(loanId,obj){
	$(obj).css("color","#ce251f");
	$('body').append('<div class="loading-cover"></div>');
	$(obj).parent().next(".loading").append('<img src="/resources/images/main/preloader-w8-cycle-white.gif" style="width: 25px;height: 25px;"/>');
	$.ajax({
		url : '/plank/ipsPostLoanInfo.htm',
		type : 'post',
		data : {
			id : loanId
		},
		success : function(msg) {
			if(msg=="1") {
				ymPrompt.alert("宝付已受理查询投资信息请求,请稍后尝试刷新页面！",390,200,null,function(r){
					if(r=="ok"){
						window.location.reload();
					}
				});
			}else if(msg=="2") {
				ymPrompt.alert("宝付投资信息查询失败,请尝试刷新页面！",390,200,null,function(r){
					if(r=="ok"){
						window.location.reload();
					}
				});
			}else if(msg=="3") {
				ymPrompt.alert("非宝付投资信息查询返回数据,请尝试刷新页面！",390,200,null,function(r){
					if(r=="ok"){
						window.location.reload();
					}
				});
			}else if(msg=="4") {
				ymPrompt.alert("宝付投资信息查询处理失败,请尝试刷新页面！",390,200,null,function(r){
					if(r=="ok"){
						window.location.reload();
					}
				});
			}else if(msg=="-1"){
				ymPrompt.alert("宝付处理失败，请尝试刷新页面！",390,200,null,function(r){
					if(r=="ok"){
						window.location.reload();
					}
				});
			}else if(msg=="5"){
				ymPrompt.alert("刚投标未超过10分钟不允许进行宝付查询",390,200,null,function(r){
					if(r=="ok"){
						window.location.reload();
					}
				});
			}
			$(obj).css("color","white");
			$(obj).parent().next(".loading").find('img').remove();
			$('.loading-cover').remove();
		}
	});
}
// 继续支付
function conPay(order_id){
	$.ajax({
		url : '/plank/ipsContinueToPay.htm',
		type : 'post',
		data : {
			orderNum : order_id
		},
		success : function(data) {
			if (data == "3") {
				window.location.href = "/shop/toIpsSubmit.htm";
			} else if (data == "4") {
				ymPrompt.errorInfo('抱歉，您的参数有误！',
						400, 200, '成功', function() {
						});
			} else if (data == "1") {
				ymPrompt.errorInfo('抱歉，您的帐号余额不足！',
						330, 170, '成功', function(
								result) {
							if (result == "ok") {
								window.location.href="/recharge/openRecharge.htm?index=3_0_0&token=online";
							}
						});
			}
		}
	});
}
// 取消订单
function delRecord(order_id){
	ymPrompt.confirmInfo('确定取消该订单？',290,170 ,null, function(result) {
		if (result=="ok") {
			$.ajax({
				url : "/loaninfo/getLoanInfoLoanrecord.htm",
				type : "post",
				data : {
					orderNum : order_id
				},
				success : function (data){
					if (data=="true") { 
						ymPrompt.alert("操作成功！",230,170,null,function(r){
							if(r=="ok"){
								select(1,4);
							}
						});
					}else{
						ymPrompt.alert("操作失败！",230,170);
					}
				}
			});	
		}
	});
}
function select(no,obj) {
	var state=String($(obj).prop("href")).split('#')[1];
	if (obj != 4) {
		if(state==undefined){
			state=$("#state").val();
		}else{
			$(".dropmenu").children('a').html($(obj).text()+'<i class="center-icon center-icon-down"></i>');
		}
	} else {
		state = 4;  // 直接跳转到未完成的众持项目
	}
	var isSucceed = 1;
	if(parseInt(state)==4){ // 表示未完成的众持项目
		isSucceed = 0;
	}
	$.ajax({
		type : 'post',
		data : {
			no : no,
			state:state,
			isSucceed:isSucceed
		},
		url : '/loaninfo/getLoanMyRecord.htm',
		success : function(msg) {
			$("#lrecord").html(msg);
			$("#state").val(state);
			$("#isSucceed").val(isSucceed);
		}
	});
}

function jumpPage(pageno, totalPage) {

	if (pageno <= 0 || pageno > totalPage) {
		return;
	}
	select(pageno);
}