var t = {};
t.datum = {};
t.wheelSurf = {};

t.wheelSurf.self = $("#roulette");
t.datum.prize = ["20元嗒嗒巴士代金卷","5元红包","ipad&nbsp;&nbsp;mini2","红筹台历","50元嗒嗒巴士代金卷","Kindle&nbsp;&nbsp;电子书阅读器","10元嗒嗒巴士代金卷","3元红包"];//奖品目录  
t.datum.length = t.datum.prize.length;//奖品总数
t.datum.easing = 0.05;//旋转缓冲速度 值越小缓冲时间越长
t.datum.winning = false;
t.datum.inval = false; 

//初始化转盘
t.wheelSurf.init = function(){
	if(t.datum.inval)return false;
	t.wheelSurf.getNumber();
};
//获取中奖代码
t.wheelSurf.getNumber = function(){
	if ($("#session_user").val() == '') {
		layer.alert('亲，您还没有登录',{title:'提示',icon:0},function(index){
			window.location.href = '/to-login?skip=newyear/lottery.htm';
			layer.close(index);
		});
	} else {
		$.ajax({type : 'post',url : '/newyear/newyearLottery.htm',dataType : 'json',success : function(data) {
				var l_num = data.lotteryNum;
				var prize = data.prize;
				if (prize == -4) {
					layer.alert('亲，您还没有登录',{title:'提示',icon:0},function(index){
						window.location.href = '/to-login?skip=newyear/lottery.htm';
						layer.close(index);
					});
					return;
				} else if (prize == 0) {
					layer.open({title : '提示',icon : 6,content:'抽奖失败，点击重新抽奖',
						btn:'继续抽奖',btn1:function(index){
							layer.close(index);
						}
					});
					return false;
				} else if (prize == -1) {
					layer.alert("抽奖活动尚未开始，感谢您的支持",{title:'提示',icon:0});
					return false;
				} else if (prize == -2) {
					layer.alert("抽奖活动已结束，感谢您的支持",{title:'提示',icon:0});
					return false;
				} else if (prize == -3) {
					layer.open({title : '提示',icon : 0,content:'您的机会已经用完了，单笔投资优先或夹层每满2000再送1次，多投多送，而且推荐注册并完成首投的，也可以赠送机会哦',
						btn:'去投资',btn1:function(index){
							location.href = '/loaninfo/loanList.htm?nav=2';
							layer.close(index);
						}
					});
				} else if (prize == -5) {
					layer.open({title : '提示',icon : 0,content:'您还没有抽奖机会，投资优先或夹层即送1次抽奖机会',
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
					if (prize == 1) {   // 处理奖品返回值
						t.datum.winning = 2;
					} else if (prize == 2) {
						t.datum.winning = 5;
					} else if (prize == 4) {
						t.datum.winning = 7;
					} else if (prize == 5) {
						t.datum.winning = 1;
					} else if (prize == 7) {
						t.datum.winning = 0;
					} else if (prize == 8) {
						t.datum.winning = 4;
					} else {
						t.datum.winning = prize;
					}
					t.wheelSurf.animated(t.datum.length,
							t.datum.winning, t.datum.easing);
					$("#lottery_num").text(l_num);
				}
			}
		});
	}
};
t.wheelSurf.animated = function(len,win,easing){
	var goal = 360 / len * win + 360 * 5;
	var dan = 0;
	 t.datum.inval = setInterval(function(){
			dan = dan + easing * (goal - dan) + 0.1;
			if(dan >= goal){
				clearInterval(t.datum.inval);
				t.datum.inval = false;
				if (win == 1 || win == 7) {   // 5元 3元红包
					layer.open({title : '提示',icon : 6,content:'恭喜您，获得'+t.datum.prize[win]+'一个，单笔复投2000再送一次抽奖机会',
						btn:'去投资',btn1:function(index){
							location.href = '/loaninfo/loanList.htm?nav=2';
							layer.close(index);
						}
					});
				} else if (win == 2 || win == 5) {  // ipad kindle
					layer.open({title : '提示',icon : 6,content:'恭喜您，获得'+t.datum.prize[win]+'一台，我们客服会在活动结束后与您取得联系',
						btn:'继续抽奖',btn1:function(index){
							layer.close(index);
						}
					});
				} else if (win == 3) {  // 台历
					layer.open({title : '提示',icon : 6,content:'恭喜您，获得'+t.datum.prize[win]+'一个，我们客服会在活动结束后与您取得联系',
						btn:'继续抽奖',btn1:function(index){
							layer.close(index);
						}
					});
				} else {
					layer.open({title : '提示',icon : 6,content:'恭喜您成功获得'+t.datum.prize[win]+'，请去嗒嗒巴士APP会员中心查看使用，单笔复投2000再赠送一次抽奖机会',
						btn:'继续抽奖',btn1:function(index){
							layer.close(index);
						}
					});
				}
			}else{
				t.wheelSurf.self.find(".prize").rotate({angle: dan});
			}
			
	 },50);
};
$(function(){
	t.wheelSurf.self.find(".btn-begin").click(function(){
		t.wheelSurf.init();
	});
});
$(function(){
	$(".myprizeBox").click(function(){
		$(".myprizePopup").show();
		});
	$(".myprizeBox").mouseleave(function(){
		$(".myprizePopup").hide();
		});
	

	var slider = $("#slider");	
	var listMin = 8;
	var listLen = slider.find("li").length;
	if(listLen <= listMin)return false;
	
	var listHeight = slider.find("li").innerHeight();
	slider.css({"height":listHeight * listMin,"overflow":"hidden"});
	slider.append(slider.find("ul").clone())
	var num = 0;
	var inval = setInterval(function(){
		if(Math.abs(num) >= listHeight * listLen)num = 0;
		slider.children().first().css("margin-top",num--);
	},30)
});