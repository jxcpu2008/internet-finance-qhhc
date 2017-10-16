var t = {};
t.datum = {};
t.wheelSurf = {};

t.wheelSurf.self = $("#roulette");
t.datum.prize = [ "Kindle 电子书", "15元红包", "智能航拍无人机", "9元红包", "蝙蝠侠抱枕",
		"7元红包", "小米迷你风扇+移动电源", "5元红包" ];//奖品目录  
t.datum.length = t.datum.prize.length;//奖品总数
t.datum.easing = 0.05;//旋转缓冲速度 值越小缓冲时间越长
t.datum.winning = false;
t.datum.inval = false;

//初始化转盘
t.wheelSurf.init = function() {
	if (t.datum.inval)
		return false;
	t.wheelSurf.getNumber();
};
//获取中奖代码
t.wheelSurf.getNumber = function() {
	if ("${session_user}" == '') {
		layer.alert('亲，您还没有登录',{title:'提示',icon:0},function(index){
			window.location.href = '/to-login?skip=november/lotteryNov.htm';
			layer.close(index);
		});
	} else {
		$.ajax({type : 'post',url : '/november/novemberLottery.htm',dataType : 'json',success : function(data) {
				var l_num = data.lotteryNum;
				var prize = data.prize;
				if (prize == -4) {
					layer.alert('亲，您还没有登录',{title:'提示',icon:0},function(index){
						window.location.href = '/to-login?skip=november/lotteryNov.htm';
						layer.close(index);
					});
					return;
				} else if (prize == 0) {
					layer.alert("系统异常，请稍后重试",{title:'提示',icon:0});
					return false;
				} else if (prize == -1) {
					layer.alert("抽奖活动尚未开始，感谢您的支持",{title:'提示',icon:0});
					return false;
				} else if (prize == -2) {
					layer.alert("抽奖活动已结束，感谢您的支持",{title:'提示',icon:0});
					return false;
				} else if (prize == -3) {
					layer.open({title : '提示',icon : 0,content:'您的机会已经用完了，单笔投资优先每满2000再送1次，多投多送，而且推荐注册并完成首投的，也可以赠送机会哦',
						btn:'去投资',btn1:function(index){
							location.href = '/loaninfo/loanList.htm?nav=2';
							layer.close(index);
						}
					});
				} else if (prize == -5) {
					layer.open({title : '提示',icon : 0,content:'您还没有抽奖机会，投资优先层即送1次抽奖机会哦',
						btn:'去投资',btn1:function(index){
							location.href = '/loaninfo/loanList.htm?nav=2';
							layer.close(index);
						}
					});
				} else if (prize == -6) {
					layer.open({title : '提示',icon : 0,content:'您还没有开通宝付或未授权宝付账户',
						btn:'开通授权',btn1:function(index){
							location.href = '/member_index/member_center.htm?index=0_0_3&nav=5';
							layer.close(index);
						}
					});
				} else {
					if (prize == 7) {
						t.datum.winning = 4;
					} else if (prize == 8) {
						t.datum.winning = 6;
					} else if (prize == 9) {
						t.datum.winning = 0;
					} else if (prize == 10) {
						t.datum.winning = 2;
					} else if (prize == 11) {
						t.datum.winning = 5;
					} else if (prize == 12) {
						t.datum.winning = 3;
					} else if (prize == 13) {
						t.datum.winning = 1;
					} else {
						t.datum.winning = 7;
					}
					t.wheelSurf.animated(t.datum.length,
							t.datum.winning, t.datum.easing);
					$("#lottery_num").text(l_num);
				}
			}
		});
	}
};
t.wheelSurf.animated = function(len, win, easing) {
	var goal = 360 / len * win + 360 * 5;
	var dan = 0;
	t.datum.inval = setInterval(
			function() {
				dan = dan + easing * (goal - dan) + 0.1;
				if (dan >= goal) {
					clearInterval(t.datum.inval);
					t.datum.inval = false;
					t.datum.prize[win]
					var msg = '';
					if (win == 7 || win == 5 || win == 3 || win == 1) {
						msg = "恭喜您，获得" + t.datum.prize[win]
								+ "一个，赶紧去投资吧！";
						layer.open({title : '提示',icon : 6,content:msg,
							btn:'去投资',btn1:function(index){
								location.href = '/loaninfo/loanList.htm?nav=2';
								layer.close(index);
							}
						});
						return;
					} else if (win == 4) {
						msg = "恭喜您，获得“" + t.datum.prize[win]
								+ "”一个，我们客服会在活动结束后与您联系！";
					} else if (win == 6) {
						msg = "恭喜您，获得“" + t.datum.prize[win]
								+ "”一套，我们客服会在活动结束后与您联系！";
					} else if (win == 0 || win == 2) {
						msg = "恭喜您，获得“" + t.datum.prize[win]
								+ "”一台，我们客服会在活动结束后与您联系！";
					}
					layer.open({title : '提示',icon : 6,content:msg,btn:'继续抽奖'});
				} else {
					t.wheelSurf.self.find(".prize").rotate({
						angle : dan
					});
				}

			}, 50);
};
$(function() {
	t.wheelSurf.self.find(".btn-begin").click(function() {
		t.wheelSurf.init();
	});
	window.setTimeout(function() {
		var table = $('.table-list').find("table:eq(1)");
		var i = 0;
		if (table.find("tr").length > 10) {
			setInterval(function() {
				if (i < -40) {
					table.find("tr:first").appendTo(table);
					i = 0;
				}
				table.css('margin-top', function() {
					return --i;
				});
			}, 80);
		}
	}, 3000);
	$.scrollIt({
        topOffset: -20
    });
});