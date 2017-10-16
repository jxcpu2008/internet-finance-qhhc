$(function() {

	function load(y) {
		var state = $("#state" + y).val();
		var endyear = $("#endtime_year" + y).val();
		var endmonth = $("#endtime_month" + y).val();
		var endday = $("#endtime_day" + y).val();
		var endtime = $("#endtime_time" + y).val();
		if (state > 1) {
			if (y == 0) {
				clearInterval(timer0);
			} else if (y == 1) {
				clearInterval(timer1);
			} else if (y == 2) {
				clearInterval(timer2);
			} else if (y == 3) {
				clearInterval(timer3);
			} else if (y == 4) {
				clearInterval(timer4);
			}
			$("#showday" + y).hide();
			$("#showhour" + y).hide();
			$("#showminute" + y).hide();
			$("#showsecond" + y).hide();
			$("#exp" + y).append("<span class='m-rmb'>已结束</span>");

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
				$("#showday" + y).html(showData + "天");
				$("#showhour" + y).html(showHour + "时");
				$("#showminute" + y).html(showMinute + "分");
				$("#showsecond" + y).html(showSecond + "秒");
				$("#investGray" + y).hide();
			} else {

				if (y == 0) {
					clearInterval(timer0);
				} else if (y == 1) {
					clearInterval(timer1);
				} else if (y == 2) {
					clearInterval(timer2);
				} else if (y == 3) {
					clearInterval(timer3);
				} else if (y == 4) {
					clearInterval(timer4);
				}

				$("#showday" + y).hide();
				$("#showhour" + y).hide();
				$("#showminute" + y).hide();
				$("#showsecond" + y).hide();
				$("#investRed" + y).hide();
				$("#exp" + y).append("<span class='m-rmb'>已结束</span>");
				
			}
		}
	}

	timer0 = setInterval(function() {
		load(0);
	}, 1);
	timer1 = setInterval(function() {
		load(1);
	}, 1);
	timer2 = setInterval(function() {
		load(2);
	}, 1);
	timer3 = setInterval(function() {
		load(3);
	}, 1);
	timer4 = setInterval(function() {
		load(4);
	}, 1);
});
