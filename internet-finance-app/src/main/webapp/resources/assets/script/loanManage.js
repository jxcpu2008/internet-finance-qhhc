var tabpancel = '';
function submitSearch(name,search,begin,end,state,no){
	//alert('name:'+name+',search:'+search+',begin:'+begin+',end:'+end+',state:'+state+',no:'+no);
	if (tabpancel == 'finacing') {  // 融资管理分页
		$.ajax({
			url : '/loaninfo/getLoanSignList.htm',
			type : 'post',
			data : {
				search : search,
				beginTime : begin,
				endTime : end,
				loanName : $.trim(name),
				state : state,
				no : no
			},
			success : function(data) {
				$("#finance_record").html(data);
			}
		});
	}
	if (tabpancel == 'repayment') {  // 还款清单
		$.ajax({
			url : '/loaninfo/myRepaymentList.htm',
//			url : '/loaninfo/repaymentList.htm',
			type : 'post',
			data : {
				search : search,
				beginTime : begin,
				endTime : end,
				loanName : $.trim(name),
				state : state,
				no : no
			},
			success : function(data) {
				$("#repayment_record").html(data);
			}
		});
	}
}
var name = '';    // 项目名称
var state = '';   // 状态
var begin = '';  // 开始时间
var end = '';   // 结束时间
var search = '';  // 几个月
$(function() {
	$("#tabpanel li").click(function(){    // 切换选项卡查询相应数据
		tabpancel = $(this).children().prop("href").split("#")[1];
		if (tabpancel != 'applyment') {
			submitSearch('','','','','',1);
		}
	});
	$(".queryCom").click(function() {    // 查询 
		simplify(this,'');
		begin = $(this).prev().children("[name=beginTime]").val();
		end = $(this).prev().children("[name=endTime]").val();
		$(".all").addClass("btn-warning").removeClass('bg-gray-lighter text-label')
			.siblings().removeClass('btn-warning');
		$(this).parent().prev().find("input").val('');
		submitSearch('' , '' , begin , end , state);
	});
	$(".all").click(function(){     // 全部
		simplify(this,'');
		submitSearch('' , search , '' , '' , state);
	});
	$(".near_one").click(function(){     // 近一个月
		simplify(this,'1');
		submitSearch('' , search , '' , '' , state);
	});
	$(".near_three").click(function(){    // 近三个月
		simplify(this,'3');
		submitSearch('' , search , '' , '' , state);
	});
	$(".searchCom").click(function(){   // 名称搜索
		name = $(this).prev().find('input').val();
		$(this).parent().next().find("input").val('');
		submitSearch(name , '' , '' , '' , state);
	});
	$("#all_state li").click(function(){    // 融资状态
		$(this).addClass('active').siblings().removeClass('active');
		state = String($(this).find('a').prop('href')).split('#')[1];
		submitSearch(name , search , begin , end , state);
	});
});

function simplify(obj,sta){
	name = '';
	begin = '';
	end = '';
	search = sta;
	$(obj).addClass("btn-warning").removeClass('bg-gray-lighter text-label')
	.siblings().removeClass('btn-warning');
}

function select(no) {
	submitSearch(name , search , begin , end , state , no);
}

function jumpPage(pageno, totalPage) {
	if (pageno <= 0 || pageno > totalPage) {
		return;
	}
	select(pageno);
}