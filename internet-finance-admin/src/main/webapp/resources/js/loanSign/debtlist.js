function select(no){
	var $money=$(".conditionList dd[name='money']").find("span[class='active']").attr("value");
	var $deadline=$(".conditionList dd[name='deadline']").find("span[class='active']").attr("value");
	
	$.ajax({
		type:'post',
		data:{money:$money,month:$deadline,no:no},
		url:'loaninfo/loanCirLists.htm',
		success:function(msg){
			$(".jiekuanList").html(msg);
			scrollTo(0,350);
		}
	});
}

$(function(){
	$.ajax({
		type:'post',
		data:'no='+1,
		url:'loaninfo/loanCirLists.htm',
		success:function(msg){
			$(".jiekuanList").html(msg);
		}
	});
	$(".conditionList dd span").click(function(){
		select(1);
	});
});

function jumpPage(pageno,totalPage){
	if(pageno<=0 || pageno>totalPage){
		return;
	}
	select(pageno);
}
