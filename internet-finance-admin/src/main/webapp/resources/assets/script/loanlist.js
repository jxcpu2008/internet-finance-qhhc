var type = "";
var state = "";
var month = "";
var rate = "";

$(function() {
	// 初始化
	selectpage(type, state, month, rate, 1);
	//筛选
	$(".bg-container li").find('a').click(
			function(event) {
				event.preventDefault();
				var flag = $(this).parents("ul").attr('data-id');
				var url = $(this).prop('href');
				var $value = String(url).split('#')[1];
				if (flag == "type") {
					type = $value;
				} else if (flag == "month") {
					month = $value;
				} else if (flag == "state") {
					state = $value;
				} else if (flag == "rate") {
					rate = $value;
				}
				// 样式
				$(this).removeClass('btn btn-link').addClass('btn btn-danger').parent().siblings().find('a').removeClass('btn btn-danger').addClass('btn btn-link');

				selectpage(type, state, month, rate, 1);

			});

});

function jumpPage(pageno, totalPage) {
	if (pageno <= 0 || pageno > totalPage) {
		return;
	}
	selectpage(type, state, month, rate, pageno);
}

function selectpage(type, state, month, rate, no) {
	//alert('type:'+type+",state:"+state+",month:"+month+",rate:"+rate+",no:"+no);
	// 列表页面
	$.ajax({
		url : '/loaninfo/getLoanList.htm',
		type : 'post',
		data : {
			type : type,
			state : state,
			month : month,
			rate : rate,
			no : no
		},
		success : function(data) {
			$("#loanlist").html(data);
		}

	})
}