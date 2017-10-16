$(function() {
	$("#state").val("");
	$("#timeno").val("");
	// 初始化加载
	getrecord();
	// panle切换
	$("a[data-toggle='tab']").click(function(event) {
		event.preventDefault();
		var url = $(this).prop("href");
		var flag = String(url).split('#')[1];
		if (flag == "details") {
			$.ajax({
				url : '/loaninfo/getLoanIncome.htm',
				type : 'post',
				success : function(data) {
					$("#income").html(data);
				}

			});
		}

	});

	// tab切换
	$("div[data-type='tab_loan']").find('a').click(function(event) {
		event.preventDefault();
		var url = $(this).prop('href');
		var state = String(url).split('#')[1];
		$("#state").val(state);
		getrecord(state, 1, $("#timeno").val());
		$(this).parent().addClass('active').siblings().removeClass('active');
	});

	// 未来1-3个月
	$("div[role='tabpanel']").find('button').click(
			function() {
				$("#state").val("");
				var timeno = $(this).attr('data-id');
				$("#query").val(0);
				$("#timeno").val(timeno);
				getrecord('', 1, timeno);
				$(this).addClass("btn-warning").removeClass(
						'bg-gray-lighter text-label').siblings().removeClass(
						'btn-warning');
			});

	// 时间范围查询
	$("a[data-query='queryTime']").click(function(event) {
		event.preventDefault();
		$("#query").val(1);
		$("#state").val("");
		$("#timeno").val("");
		getrecord();
	});

});
function getrecord(state, no, timeno) {

	$("li[role='presentation']").each(function() {
		if ($(this).hasClass('active')) {
			var url = $(this).children('a').attr('href');
			var flag = String(url).split('#')[1];
			if (flag == "project") {
				if ($("#query").val() == "1") {
					if ($("#in11").val() != "") {
						var beginTime = $("#in11").val();
					}
					if ($("#in12").val() != "") {
						var endTime = $("#in12").val();
					}
				}

				$.ajax({
					url : '/loaninfo/getLoanMyRecord.htm',
					type : 'post',
					data : {
						state : state,
						no : no,
						timeno : timeno,
						beginTime : beginTime,
						endTime : endTime
					},
					success : function(data) {
						$("#loanrecord").html(data);
					}

				});
			} else if (flag == "details") {
				if ($("#query").val() == "1") {
					if ($("#in1").val() != "") {
						var beginTime = $("#in1").val();
					}
					if ($("#in2").val() != "") {
						var endTime = $("#in2").val();
					}
				}
				$.ajax({
					url : '/loaninfo/getLoanIncome.htm',
					type : 'post',
					data : {
						no : no,
						timeno : timeno,
						beginTime : beginTime,
						endTime : endTime
					},
					success : function(data) {
						$("#income").html(data);
					}

				});
			}
		}
	});

}
function jumpPage(pageno, totalPage) {

	if (pageno <= 0 || pageno > totalPage) {
		return;
	}
	getrecord($("#state").val(), pageno, $("#timeno").val());
}
