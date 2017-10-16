var iType = 0; // 0表示全部
function submitSearch(search,begin,end,no){
	//alert("iType:"+iType+",search:"+search+",begin:"+begin+",end:"+end+",no:"+no);
	if (iType == 0) {
		iType = '';
	}
	if (iType == 7) {  // 提现
		$.ajax({
			url : '/withdraw/withdrawRecoed.htm',
			type : 'post',
			data : {
				search : search,
				beginTime : begin,
				endTime : end,
				no : no
			},
			success : function(data) {
				$("#trade_record").html(data);
			}
		});
	} else {   
		$.ajax({
			url : '/loaninfo/tradeRecord.htm',
			type : 'post',
			data : {
				search : search,
				beginTime : begin,
				endTime : end,
				type : iType,
				no : no
			},
			success : function(data) {
				$("#trade_record").html(data);
			}
		});
	}
}
var begin = '';
var end = '';
var search = '';
$(function() {
	// 交易类型
	$("#investType li").click(function(){ 
		iType = String($(this).find("a").prop("href")).split("#")[1];
		$(this).addClass("active").siblings().removeClass("active");
		submitSearch(search,begin,end,1);
	});
	var str = location.href;
	var index = str.indexOf("sign");
	var sign = str.substring(index+5,index+6);
	if (sign == "7") {  // 跳转到提现记录
		$("#withdraw").trigger("click");
		$(window).scrollTop(500);
	}
	submitSearch(search,begin,end,1);  // 默认加载提现记录
	$("#queryCom").click(function() {    // 查询 
		simplify(this,'');
		begin = $(this).prev().children("[name=beginTime]").val();
		end = $(this).prev().children("[name=endTime]").val();
		$("#all").addClass("btn-warning").removeClass('bg-gray-lighter text-label')
			.siblings().removeClass('btn-warning');
		submitSearch('' , begin , end , 1);
	});
	$("#all").click(function(){     // 全部
		$("[name=beginTime]").val('');
		$("[name=endTime]").val('');
		simplify(this,'');
		submitSearch('' , '' , '' , 1);
	});
	$("#near_one").click(function(){     // 近一个月
		$("[name=beginTime]").val('');
		$("[name=endTime]").val('');
		simplify(this,'1');
		submitSearch(search , '' , '' , 1);
	});
	$("#near_three").click(function(){    // 近三个月
		$("[name=beginTime]").val('');
		$("[name=endTime]").val('');
		simplify(this,'3');
		submitSearch(search , '' , '' , 1);
	});
})
function simplify(obj,sta){
	begin = '';
	end = '';
	search = sta;
	$(obj).addClass("btn-warning").removeClass('bg-gray-lighter text-label')
	.siblings().removeClass('btn-warning');
}
function withdrSearch(wId,no){
	$('body').spinner('正在查询...');
	$.ajax({
		url : '/withdraw/ipsWithdrawNum.htm?wId='+wId,
		type : 'post',
		success : function(msg) {
			$('body').removerSpinner();
			if(msg=="1"){
				ymPrompt.succeedInfo("提现查询成功！", 400, 200, null, function() {
					jumpPage(no);
				});
			}else{
				ymPrompt.errorInfo("提现查询失败！", 400, 200, null, function() {
					jumpPage(no);
				});
			}
		}
	});
}
function rechSearch(rId, no) {
	$.ajax({
		url : '/recharge/ipsRechargeNum.htm',
		type : 'post',
		data : {
			rId : rId,
			no : no
		},
		success : function(msg) {
			if (msg == "-1") {
				ymPrompt.errorInfo('非宝付充值查询返回数据!', 400,200, '失败');
			} else if (msg == "-2") {
				ymPrompt.errorInfo('宝付充值查询失败!', 400,200, '失败');
			} else {
				ymPrompt.alert('充值查询成功！',380,200,'成功',function(){
					$("#trade_record").html(msg);
				});
			}
		}
	});
}
function jumpPage(pageno, totalPage) {
	if (pageno <= 0 || pageno > totalPage) {
		return;
	}
	submitSearch(search , begin , end , pageno);
}
