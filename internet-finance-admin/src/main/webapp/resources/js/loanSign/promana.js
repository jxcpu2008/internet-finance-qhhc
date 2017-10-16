function select(no){
	$.ajax({
		type:'post',
		data:{no:no},
		url:'visitor/protmanagetable',
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
		url:'visitor/protmanagetable',
		success:function(msg){
			$(".jiekuanList").html(msg);
		}
	});
});


function jumpPage(pageno,totalPage){

	if(pageno<=0 || pageno>totalPage){
		return;
	}
	select(pageno);
}
