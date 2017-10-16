var $dustry = "";
var $city = "";
var $money = "";
var $status = "";
var $order = "";

function selectpage(no) {
	var $state = "";
	$('ul.nav').children('li').each(function() {
		if ($(this).hasClass('active')) {
			$state = String($(this).find('a').prop('href')).split('#')[1];
			return false;
		}
	});
	$status = String($(".nav .active a").prop("href")).split('#')[1];
	$.ajax({
		type : 'post',
		data : {
			dustry : $dustry,
			city : $city,
			money : $money,
			status : $status,
			order : $order,
			no : no
		},
		url : '/loaninfo/getLoanList.htm',
		success : function(msg) {
			$("#loanList").html(msg);
		}
	});
}

$(function($) {
	$.ajax({
		type : 'post',
		data : 'no=' + 1,
		url : '/loaninfo/getLoanList.htm',
		success : function(msg) {
			$("#loanList").html(msg);
		}
	});

	// 子选项
	$('.cate-loan').on('click', 'a', function(event) {
		event.preventDefault();
		event.stopImmediatePropagation();
		var action = $(this).parents('ul').prop('id');
		if (action == "order") {
			$(this).parent().siblings().children('a').removeClass("true");
			$(this).addClass("true");
		} else {
			$(this).parent().siblings().children('a').removeClass("over");
			$(this).addClass("over");
		}
		var no = 1;
		// 获取当前选择的栏目项
		$(".nav").children('li').each(function() {
			if ($(this).hasClass('active')) {

				var url = $(this).children('a').prop('href');
				$status = String(url).split('#')[1];
			}
		});
		if (action == "dustry") {
			$dustry = String(this).split('#')[1];
		} else if (action == "city") {
			$city = decodeURIComponent(String(this).split('#')[1]);
		} else if (action == "money") {
			$money = String(this).split('#')[1];
		} else if (action == "order") {
			$order = String(this).split('#')[1];
		}
		// 联合查询
		$(this).parents('ul').siblings().each(function() {
			var typeId = $(this).prop('id');
			if (typeId == "") {
				return false;
			}
			$(this).children('li').each(function() {
				if ($(this).children('a').hasClass('over')) {
					var url = $(this).children('a').prop('href');
					$dustry = String($("#dustry .over").prop("href")).split('#')[1];
					$city = decodeURIComponent(String($("#city .over").prop("href")).split('#')[1]);
					$money = String($("#money .over").prop("href")).split('#')[1];
					$order = String($("#order .true").prop("href")).split('#')[1];;  // 设置排序条件
					return false;
				}

			});
		});
		//alert('dustry:'+$dustry+',city:'+$city+',money:'+$money+',status:'+$status+',order:'+$order);
		$.ajax({
			type : 'post',
			data : {
				dustry : $dustry,
				city : $city,
				money : $money,
				status : $status,
				order : $order,
				no : no
			},
			url : '/loaninfo/getLoanList.htm',
			success : function(msg) {
				$("#loanList").html(msg);
			}
		});
	});

	// 融资，完成li
	$('.nav').on('click', 'a', function(event) {
		event.preventDefault();
		event.stopImmediatePropagation();
		var $state = (String(this).split('#')[1]);
		$(this).parents('ul.nav').children('li').each(function() {
			if ($(this).hasClass('active')) {
				$(this).removeClass('active');
				return false;
			}

		}).end().end().parent('li').addClass('active');
		$.ajax({
			type : 'post',
			data : {
				status : $state,
				no : 1
			},
			url : '/loaninfo/getLoanList.htm',
			success : function(msg) {
				$("#loanList").html(msg);
			}
		});
	});
});

function jumpPage(pageno, totalPage) {

	if (pageno <= 0 || pageno > totalPage) {
		return;
	}
	selectpage(pageno);
}
