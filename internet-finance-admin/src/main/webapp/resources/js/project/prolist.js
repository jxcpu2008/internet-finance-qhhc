function select(no){
	var $loanType=$(".conditionList dd[name='loanType']").find("span[class='active']").attr("value");
	var $city=$(".conditionList dd[name='city']").find("span[class='active']").attr("value");
	var $money=$(".conditionList dd[name='money']").find("span[class='active']").attr("value");
	$.ajax({
		type:'post',
		data:{loanType:$loanType,city:$city,money:$money,no:no},
		url:'loaninfo/getProjectList.htm',
		success:function(msg){
			$(".jiekuanList").html(msg);
			scrollTo(0,150);
		}
	});
}


$(function($){
	$.ajax({
		type:'post',
		data:'no='+1,
		url:'loaninfo/getProjectList.htm',
		success:function(msg){
			$(".jiekuanList").html(msg);
		}
	});
	$(".conditionList dd span").click(function(){
		select(1);
	});
	
	$("#project").click(function(){
		window.location.href="loaninfo/projectList.htm";
	});
	
	$("#projects").click(function(){
		window.location.href="loaninfo/projectList.htm";
	});
	
	$("#loan").click(function(){
		window.location.href="loaninfo/loanList.htm";
	});
});


function jumpPage(pageno,totalPage){

	if(pageno<=0 || pageno>totalPage){
		return;
	}
	select(pageno);
}

