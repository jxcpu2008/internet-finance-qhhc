$(function() {
	$.ajax({
		url : '/generalize/getCommissionRecord.htm',
		type : 'post',
		success : function(data) {
			$("#comrecord").html(data);
		}
	});
	$("#queryCom").click(function() {
		$.ajax({
			url : '/generalize/getCommissionRecord.htm',
			type : 'post',
			data : $("#myform").serialize(),
			success : function(data) {
				$("#comrecord").html(data);
			}
		});
	});

	$("#search").on('click', 'a', function(event) {
		event.preventDefault();
		event.stopImmediatePropagation();
		$(this).parent('li').siblings().removeClass("searching").addClass('default');
		$(this).parent('li').removeClass("default").addClass("searching");
		var url = $(this).prop('href');
		url = String(url).split('#')[1];
		$.ajax({
			url : '/generalize/getCommissionRecord.htm',
			type : 'post',
			data : {
				search : url
			},
			success : function(data) {
				$("#comrecord").html(data);
			}
		});
	});
});

function select(no, obj) {
	$.ajax({
		url : '/generalize/getCommissionRecord.htm?no=' + no,
		type : 'post',
		data : $("#myform").serialize(),
		success : function(data) {
			$("#comrecord").html(data);
		}
	});
}

function jumpPage(pageno, totalPage) {

	if (pageno <= 0 || pageno > totalPage) {
		return;
	}
	select(pageno);
}