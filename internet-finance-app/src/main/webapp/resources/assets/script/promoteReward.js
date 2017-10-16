function submitSearch(search,begin,end,no){
	$.ajax({
		url : '/generalize/getPromoteReward.htm',
		type : 'post',
		data : {
			search : search,
			beginTime : begin,
			endTime : end,
			no : no
		},
		success : function(data) {
			$("#promote_reward").html(data);
		}
	});
}
var begin = '';
var end = '';
var search = '';
$(function() {
	$.ajax({
		url : '/generalize/getPromoteReward.htm',
		type : 'post',
		success : function(data) {
			$("#promote_reward").html(data);
		}
	});
	// 查询
	$("#queryCom").click(function() {
		begin = $("[name=beginTime]").val();
		end = $("[name=endTime]").val();
		submitSearch('' , begin , end);
	});
	$("#all").click(function(){
		simplify(this,'');
		submitSearch(search , '' , '');
	});
	$("#near_one").click(function(){
		simplify(this,'1');
		submitSearch(search , '' , '');
	});
	$("#near_three").click(function(){
		simplify(this,'3');
		submitSearch(search , '' , '');
	});
});

function simplify(obj,sta){
	begin = '';
	end = '';
	search = sta;
	$(obj).addClass("btn-warning").removeClass('bg-gray-lighter text-label')
	.siblings().removeClass('btn-warning');
}

function select(no) {
	submitSearch(search , begin , end , no);
}

function jumpPage(pageno, totalPage) {

	if (pageno <= 0 || pageno > totalPage) {
		return;
	}
	select(pageno);
}