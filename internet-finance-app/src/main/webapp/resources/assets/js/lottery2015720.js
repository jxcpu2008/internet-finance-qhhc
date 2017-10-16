$(function() {
	var table = $('.table-packet').find("table:eq(1)");
	var i = 0;
	if (table.find("tr").length > 4) {
		setInterval(function() {
			if (i < -47) {
				table.find("tr:first").appendTo(table);
				i = 0;
			}
			table.css('margin-top', function() {
				return --i;
			});
		}, 80);
	}
	//$("#start").bind('click', lottery);
	$("#diskbtn, #startbtn").rotate({bind:{click:lottery}});

});

var lottery = function() {
	var islogin = $("#islogin").val();
	if (islogin == "") {
		ymPrompt.errorInfo("抱歉，您还未登陆哦！", 450, 240, "失败", function(result) {
			$("#myModal").modal('show');
		});
		$('.ymPrompt_error').css('height', '140px');
		return;
	} else {
		var lotteryNum = $("#lotteryNumSpanId").html();
		if (lotteryNum > 0) {
			/*
			 * if (navigator.userAgent.indexOf('MSIE 8.0') > 0) {
			 * ymPrompt.errorInfo("抱歉，您当前正在使用的浏览器不支持转盘抽奖，请换个浏览器试试！", 450, 240,
			 * "提示", null); $('.ymPrompt_error').css('height', '140px'); return; }
			 */
			$
					.ajax({
						type : 'POST',
						url : '/visitor/toluckyDraw.htm',
						cache : false,
						error : function() {
							ymPrompt.errorInfo("抽奖失败，重新开始！", 450, 240, "提示",
									null);
							$('.ymPrompt_error').css('height', '140px');
							return false;
						},
						success : function(data) {
							/*$("#start>img").unbind('click')
									.css('cursor', 'default');*/
							$("#diskbtn, #startbtn").rotate({bind:{click:null}});
							var data = JSON.parse(data);
							$("#lotteryNumSpanId").html(data.lotteryNum);
							if (data.prize == "-1") {
								ymPrompt.errorInfo("该活动还未开始！", 450, 240, "提示",
										null);
								$('.ymPrompt_error').css('height', '140px');
							} else if (data.prize == "-2") {
								ymPrompt.errorInfo("该活动已结束！", 450, 240, "提示",
										null);
								$('.ymPrompt_error').css('height', '140px');
							} else if (data.prize == "-3") {
								ymPrompt.errorInfo("抱歉，您没抽奖机会了！", 450, 240,
										"提示", null);
								$('.ymPrompt_error').css('height', '140px');
							} else {
								$('#diskbtn')
										.rotate(
												{
													duration : 3000,
													angle : 0,
													animateTo : 1800 + Number(data.angle),
													easing : $.easing.easeOutSine,
													callback : function() {
														if (data.prize == 0) {
															ymPrompt
																	.succeedInfo(
																			"亲爱的用户，真遗憾您这次抽奖没有抽到任何奖品，没关系下次再来！",
																			450,
																			240,
																			"中奖信息",
																			null);
															$(
																	'.ymPrompt_succeed')
																	.css(
																			{
																				'height' : '140px',
																				'background' : 'url(/resources/assets/images/packets/banner01.jpg) no-repeat center',
																				'color' : '#fff',
																				'text-shadow' : '0 0 15px rgba(0,0,0,.5)'
																			});
														} else {
															ymPrompt
																	.succeedInfo(
																			"亲爱的用户，恭喜您中得"
																					+ data.msg
																					+ "一个，快去邀请你的好友来参与活动，赢更多的抽奖机会！",
																			450,
																			240,
																			"中奖信息",
																			null);
															$(
																	'.ymPrompt_succeed')
																	.css(
																			{
																				'height' : '140px',
																				'background' : 'url(/resources/assets/images/packets/banner01.jpg) no-repeat center',
																				'color' : '#fff',
																				'text-shadow' : '0 0 15px rgba(0,0,0,.5)'
																			});
														}
														/*$("#start>img").bind(
																'click',
																lottery).css(
																'cursor',
																'pointer');*/
														$("#diskbtn, #startbtn").rotate({bind:{click:lottery}});
													}
												});
							}
						}
					});
		} else {
			ymPrompt.errorInfo("抱歉，您没抽奖机会了！", 450, 240, "提示", null);
			$('.ymPrompt_error').css('height', '140px');
		}
	}
}
