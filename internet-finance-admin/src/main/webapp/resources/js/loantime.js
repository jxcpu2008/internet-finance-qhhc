$(function() {

	function load() {
		var state = $("#state").val();
		var endyear = $("#endtime_year").val();
		var endmonth = $("#endtime_month").val();
		var endday = $("#endtime_day").val();
		var endtime = $("#endtime_time").val();
		if (state != 1) {
			clearInterval(timer);
			$(".showtime").hide();
			$("#exp").append("<span class='m-rmb'>已结束</span>");
			$("#yetEnd").hide();
		} else {
			var sTime = new Date();
			var enddate = endyear + "/" + endmonth + "/" + endday + " "
					+ endtime;
			var eTime = new Date(enddate);
			var sumSecond = parseInt((eTime.getTime() - sTime.getTime()) / 1000);
			sumSecond = sumSecond + (24 * 60 * 60);
			var showSecond = sumSecond % 60;
			var sumMinute = (sumSecond - showSecond) / 60;
			var showMinute = sumMinute % 60;
			var sumHour = (sumMinute - showMinute) / 60;
			var showHour = sumHour % 24;
			var showData = (sumHour - showHour) / 24 - 1;
			if (showData >= 0) {
				$("#yetEnd").hide();
				$("#showday").html(showData + "天");
				$("#showhour").html(showHour + "时");
				$("#showminute").html(showMinute + "分");
				$("#showsecond").html(showSecond + "秒");
			} else {
				$("#noYetEnd").hide();
				clearInterval(timer);
				$(".showtime").hide();
				$("#exp").append("<span class='m-rmb'>已结束</span>");

			}
		}
	}

	timer = setInterval(function() {
		load();
	}, 1);

});
