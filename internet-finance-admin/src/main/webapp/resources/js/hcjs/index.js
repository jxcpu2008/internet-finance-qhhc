$(document).ready(function() {
	$(".TempList-Body").mouseover(function() {
		$(this).find('.posstitemp a').css({
			display : "block"
		});
	});
	$(".TempList-Body").mouseout(function() {
		$(this).find(".posstitemp a").css({
			display : "none"
		});
	});
	$(".TempList-Body").mouseover(function() {
		$(this).find('.posstitemp-ry a').css({
			display : "block"
		});
	});
	$(".TempList-Body").mouseout(function() {
		$(this).find(".posstitemp-ry a").css({
			display : "none"
		});
	});
	$(".TempList-Body").mouseover(function() {
		$(this).find('.posstitemp-succ a').css({
			display : "block"
		});
	});
	$(".TempList-Body").mouseout(function() {
		$(this).find(".posstitemp-succ a").css({
			display : "none"
		});
	});
	$(".TempList-Body").mouseenter(function() {
		$(this).children().next(".bottom-info").css({
			background : "#da3939",
			color : "#fff"
		});
	});
	$(".TempList-Body").mouseleave(function() {
		$(this).children().next(".bottom-info").css({
			background : "",
			color : ""
		});
	});
	$(".prots-rz-List .TempList-Body").mouseenter(function() {
		$(this).children().next(".bottom-info02").css({
			background : "#f8a047",
			color : "#fff"
		});
	});
	$(".prots-rz-List .TempList-Body").mouseleave(function() {
		$(this).children().next(".bottom-info02").css({
			background : "",
			color : ""
		});
	});
	$(".centerhuiyuan").mouseover(function() {
		$(".dropuserdown").css({
			display : "block"
		});
	});
	$(".centerhuiyuan").mouseout(function() {
		$(".dropuserdown").css({
			display : "none"
		});
	});
});

// 立即投资
function AutoScroll(obj) {
	$(obj).find("ul:first").animate({
		marginTop : "-25px"
	}, 500, function() {
		$(this).css({
			marginTop : "0px"
		}).find("li:first").appendTo(this);
	});
}

$(document).ready(function() {
	setInterval('AutoScroll("#news-list")', 3000);
	// 立即投资 close-x begin
	$('#investModal').on('click', '.close-x', function() {
		$('#investModal').animate({
			'top' : '-=749'
		}, '400', 'linear', function() {
			$('#invest-cover').fadeOut();
			$('html').css({
				'overflow-y' : 'auto'
			});
		});
	});
	// 立即投资 close-x end
});
function loanInvest(loanId, investId) {
	var isLogin = $("#isLogin").val();
	if (isLogin == "true") { // 判断是否有登录
		ymPrompt.confirmInfo("您还没有登录，是否跳转到登录？", 330, 180, "提示", function(tp) {
			if (tp == "ok") {
				var url = window.location.href;
				window.location.href = "/visitor/to-login?memory=" + url;
			}
		});
	} else {
		$('body').append('<div class="loading-cover"></div>');
		$('#investRed' + investId).find("span").css("color", "#ce251f");
		$('#investRed' + investId)
				.next('div.loading')
				.append(
						'<img src="/resources/images/main/preloader-w8-cycle-white.gif"/>');
		$.ajax({
			url : "/loaninfo/loanInvest.htm",
			type : "post",
			data : {
				loanId : loanId
			},
			success : function(msg) {
				$('#investRed' + investId).next('div.loading').find('img')
						.remove();
				$('.loading-cover').remove();
				$("#investModal").html(msg);
				$('html').css({
					'overflow-y' : 'hidden'
				});
				$('#investRed' + investId).find("span").css("color", "#fff");
				$('#invest-cover').fadeIn();
				$('#investModal').animate({
					'top' : '+=749'
				}, '400', 'linear');
			}
		});
	}
}
