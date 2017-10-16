$(function() {
	var queryStr = window.location.search;
	if (queryStr) {
		$('#navigation').find('a').eq(Number(queryStr.substring(queryStr.length-1)) - 1).addClass('active');
	} else {
		$('#navigation').find('a').eq(0).addClass('active');
	}
	
	var now = new Date(), hour = now.getHours();
	if (hour >= 0 && hour <= 12) {
		$("#sayHello").text("上午好");
	}
	if (hour > 12 && hour <= 17) {
		$("#sayHello").text("下午好");
	}
	if (hour > 17 && hour < 24) {
		$("#sayHello").text("晚上好");
	}
	
	// 注销
	if($("#loginOut_new").size()){  // new
		$("#loginOut_new").bind("click",function(){
			$.fancybox.open({
				href: "#loginOutBox",
				padding:0,
				margin:0,
				width: 320,
				closeBtn:false,
				wrapCSS: 'fancybox-transparent'
			})
		})
	} else {
		$("#loginOut").click(function() {
			ymPrompt.confirmInfo('是否确认安全退出？', 400, 200, '是否退出', function(tp) {// 320, 160, 
				if (tp == 'ok') {
					window.location.href = '/update_info/login_out';
				}
			});
		});
	}
	
	// 导航条选中
	if($("#navId").size() && $("#navId").val() != ""){
		$("#navigation").find("a").eq($("#navId").val()).css({'background-color':'#d9534f','color':'#fff'}).siblings().css({'background-color':'#fff','color':'#333'});
	};
	
});