var param = {};
window.onload = function() {
	var queryStr = QueryURI.getQuery();
	if (queryStr['index'] != '0_0' && queryStr['index'] != '0_0_3') {
		return;
	}
	function $(id) {
		return typeof id === "string" ? document.getElementById(id) : id;
	}
	var newDate = document.getElementById("newDate");
	var nowDate = document.getElementById("nowDate");
	var nDate = new Date();
	if (nDate.getMonth() + 1 == 12) {
		viewDate(nowDate, nDate.getFullYear(), nDate.getMonth() + 1, true);
	} else {
		viewDate(nowDate, nDate.getFullYear(), nDate.getMonth() + 1, true);
	}
	showBtn();

	function showBtn() {
		var nowEm = nowDate.getElementsByTagName("em");
		var leftMonth = parseInt(nowEm[0].innerHTML);
		var leftYear = parseInt(nowEm[1].innerHTML);
		var rightMonth = parseInt(nowEm[3].innerHTML);
		var rightYear = parseInt(nowEm[1].innerHTML);

		nowEm[0].parentNode.onclick = function() {
			if (leftMonth == 12) {
				viewDate(nowDate, leftYear - 1, leftMonth, true);
				param = {};
				param["paramMap.yearDate"] = leftYear - 1;
				param["paramMap.monthDate"] = leftMonth;
				// setMonthChange(param);
			} else {
				viewDate(nowDate, leftYear, leftMonth, true);
				param = {};
				param["paramMap.yearDate"] = leftYear;
				param["paramMap.monthDate"] = leftMonth;
				// setMonthChange(param);
			}
			showBtn();
			getAllDays(param);
		};
		$("rightBtn").onclick = function() {
			if (rightMonth == 1) {
				viewDate(nowDate, rightYear + 1, rightMonth, true);
				param = {};
				param["paramMap.yearDate"] = rightYear + 1;
				param["paramMap.monthDate"] = rightMonth;
				// setMonthChange(param);
			} else {
				viewDate(nowDate, rightYear, rightMonth, true);
				param = {};
				param["paramMap.yearDate"] = rightYear;
				param["paramMap.monthDate"] = rightMonth;
				// setMonthChange(param);
			}
			showBtn();
			getAllDays(param);
		};
	}

	function lightBoxShow(title, str, date) {
		var oWin = $("win");
		$("otitlestr").innerHTML = title;
		oWin.style.display = "block";
		switch (date) {
		case 0:
			$("dateView").innerHTML = "星期天";
			break;
		case 1:
			$("dateView").innerHTML = "星期一";
			break;
		case 2:
			$("dateView").innerHTML = "星期二";
			break;
		case 3:
			$("dateView").innerHTML = "星期三";
			break;
		case 4:
			$("dateView").innerHTML = "星期四";
			break;
		case 5:
			$("dateView").innerHTML = "星期五";
			break;
		case 6:
			$("dateView").innerHTML = "星期六";
			break;
		}
	}

	function viewDate(obj, year, month, bBtn) {
		var nDate = new Date();
		var dayNum = 0;
		if (!obj.bBtn) {
			obj.Header = document.createElement("div");
			obj.Header.className = "Header";
			obj.appendChild(obj.Header);
			var Weeks = document.createElement("div");
			Weeks.className = "Weeks";
			obj.appendChild(Weeks);
			var weeksArr = [ '日', '一', '二', '三', '四', '五', '六' ];
			for (var i = 0; i < 7; i++) {
				var nSpan = document.createElement("span");
				nSpan.innerHTML = weeksArr[i];
				if (i == 0 || i == 6) {
					nSpan.style.color = "#999";
				}
				Weeks.appendChild(nSpan);
			}
			var mDiv = document.createElement("div");
			mDiv.id = "mDiv";
			obj.appendChild(mDiv);
			for (var i = 0; i < 7; i++) {
				var mSpan = document.createElement("span");
				mSpan.className = "yuefen";
				mSpan.style.color = "#d9534f";
				mDiv.appendChild(mSpan);
			}
			var nUl = document.createElement("ul");
			for (var i = 0; i < 42; i++) {
				var nLi = document.createElement("li");
				nUl.appendChild(nLi);
				nLi.innerHTML = "<div class='clock clock_right' style='visibility:hidden;'>&nbsp;</div><div class='day' id='"
						+ i
						+ "' ></div><div class='tips tips_H' style='visibility:hidden;color:#d9534f;padding-top:2px;' >●</div>";
			}
			obj.appendChild(nUl);
			obj.bBtn = true;
		}
		// var yuefen=document.getElementById("yuefen");
		// yuefen.innerHTML=month;
		obj.Header.innerHTML = (bBtn ? '<div class="l">&lt; <em style="display:none;">'
				+ (month - 1) + '</em></div>'
				: '<div class="r" ><em >' + (month + 1) + '</em> &gt;</div>')
				+ '<div class="c"><em style="color:#d9534f;">'
				+ year
				+ '年</em><em style="display:none;">'
				+ month
				+ '</em></div>'
				+ '<div class="r" ><em >' + (month + 1) + '</em> &gt;</div>';
		var aLi = obj.getElementsByTagName("li");
		for (var i = 0; i < aLi.length; i++) {
			/* aLi[i].innerHTML = ""; */
			// 处理天数的标签
			var aSpan = aLi[i].childNodes;
			for (var k = 0; k < aSpan.length; k++) {
				aSpan[1].innerHTML = "";
			}
			aLi[i].style.background = "#fff";
			aLi[i].style.color = "#000";
			aLi[i].childNodes[2].style.visibility = "hidden";
			aLi[i].childNodes[0].style.visibility = "hidden";
			aLi[i].childNodes[1].style.color = "#000";

		}
		for (var i = 0; i < 7; i++) {
			var yuefen = $("mDiv").getElementsByTagName("span");
			yuefen[i].innerHTML = "";
		}

		if (month == 1 || month == 3 || month == 5 || month == 7 || month == 8
				|| month == 10 || month == 12) {
			dayNum = 31;
		} else if (month == 4 || month == 6 || month == 9 || month == 11) {
			dayNum = 30;
		} else if (month == 2 && isLeapYear(year)) {
			dayNum = 29;
		} else {
			dayNum = 28;
		}

		nDate.setFullYear(year);
		nDate.setMonth(month - 1, 1);
		// nDate.setDate(1);

		function Today(count) {
			var tDate = new Date();
			var tEm = aLi[count].parentNode.parentNode
					.getElementsByTagName("em");
			var tMonth = parseInt(tEm[2].innerHTML);
			var tYear = parseInt(tEm[1].innerHTML);
			param = {};
			param["paramMap.yearDate"] = tYear;
			param["paramMap.monthDate"] = tMonth;
			param["paramMap.dayDate"] = aLi[count].childNodes[1].innerHTML;
			// 当天
			if (aLi[count].childNodes[1].innerHTML == tDate.getDate()
					&& tYear == tDate.getFullYear()
					&& tMonth == tDate.getMonth() + 1) {
				aLi[count].style.color = "#000";
				aLi[count].childNodes[1].style.color = "#fff";
				// aLi[count].style.background="url(images/circle.png) no-repeat
				// 10px 10px ";
				aLi[count].style.background = "rgb(217, 83, 79)";
				aLi[count].style.backgroundSize = "20px";
				lightBoxShow(aLi[count].childNodes[1].innerHTML, "今天是多少号",
						tDate.getDay());
				setNowDay(param);
				getAllDays(param);
			}
		}

		switch (nDate.getDay()) {
		case 0:
			for (var i = 0; i < dayNum; i++) {
				aLi[i].childNodes[1].innerHTML = i + 1;
				nDate.setDate(i + 1);
				if (nDate.getDay() == 0 || nDate.getDay() == 6) {
					aLi[i].childNodes[1].style.color = "#777";
				}
				Today(i);
			}
			break;
		case 1:
			for (var i = 0; i < dayNum; i++) {
				aLi[i + 1].childNodes[1].innerHTML = i + 1;
				nDate.setDate(i + 1);
				if (nDate.getDay() == 0 || nDate.getDay() == 6) {
					aLi[i + 1].childNodes[1].style.color = "#777";
				}
				Today(i + 1);
			}
			break;
		case 2:
			for (var i = 0; i < dayNum; i++) {
				aLi[i + 2].childNodes[1].innerHTML = i + 1;
				nDate.setDate(i + 1);
				if (nDate.getDay() == 0 || nDate.getDay() == 6) {
					aLi[i + 2].childNodes[1].style.color = "#777";
				}
				Today(i + 2);
			}
			break;
		case 3:
			for (var i = 0; i < dayNum; i++) {
				aLi[i + 3].childNodes[1].innerHTML = i + 1;
				nDate.setDate(i + 1);
				if (nDate.getDay() == 0 || nDate.getDay() == 6) {
					aLi[i + 3].childNodes[1].style.color = "#777";
				}
				Today(i + 3);
			}
			break;
		case 4:
			for (var i = 0; i < dayNum; i++) {
				aLi[i + 4].childNodes[1].innerHTML = i + 1;
				nDate.setDate(i + 1);
				if (nDate.getDay() == 0 || nDate.getDay() == 6) {
					aLi[i + 4].childNodes[1].style.color = "#777";
				}
				Today(i + 4);
			}
			break;
		case 5:
			for (var i = 0; i < dayNum; i++) {
				aLi[i + 5].childNodes[1].innerHTML = i + 1;
				nDate.setDate(i + 1);
				if (nDate.getDay() == 0 || nDate.getDay() == 6) {
					aLi[i + 5].childNodes[1].style.color = "#777";
				}
				Today(i + 5);
			}
			break;
		case 6:
			for (var i = 0; i < dayNum; i++) {
				aLi[i + 6].childNodes[1].innerHTML = i + 1;
				nDate.setDate(i + 1);
				if (nDate.getDay() == 0 || nDate.getDay() == 6) {
					aLi[i + 6].childNodes[1].style.color = "#777";
				}
				Today(i + 6);
			}
			break;
		}

		var yuefen_T = true;
		for (var i = 0; i < 42; i++) {
			if (aLi[i].childNodes[1].innerHTML != "") {
				if (yuefen_T) {
					var yuefen = $("mDiv").getElementsByTagName("span");
					yuefen[i].innerHTML = month + "月";
					yuefen_T = false;
				}
				aLi[i].style.borderTop = "1px solid #c7c7c7";
			} else {
				aLi[i].style.borderTop = "1px solid #fff";
			}
		}
		if (month == 1 && bBtn) {
			obj.Header.getElementsByTagName('em')[0].innerHTML = 12;
		} else if (month == 12 && !bBtn) {
			obj.Header.getElementsByTagName('em')[0].innerHTML = 1;
		}

		// 增加右侧的月份判断
		if (month == 1 && !bBtn) {
			obj.Header.getElementsByTagName('em')[3].innerHTML = 12;
		} else if (month == 12 && bBtn) {
			obj.Header.getElementsByTagName('em')[3].innerHTML = 1;
		}

	}

	function isLeapYear(year) {
		if (year % 4 == 0 && year % 100 != 0) {
			return true;
		} else {
			if (year % 400 == 0) {
				return true;
			} else {
				return false;
			}
		}
	}

	function nowDay() {
		var tLi = newDate.getElementsByTagName("li");
		var tDate = new Date();

		for (var i = 0; i < tLi.length; i++) {
			tLi[i].onmouseover = function() {
				var tEm = this.parentNode.parentNode.getElementsByTagName("em");
				var tMonth = parseInt(tEm[2].innerHTML);
				var tYear = parseInt(tEm[1].innerHTML);
				var tDate = new Date();
				if (this.childNodes[1].innerHTML != "") {
					if (this.childNodes[1].innerHTML == tDate.getDate()
							&& tYear == tDate.getFullYear()
							&& tMonth == tDate.getMonth() + 1) {
						this.style.color = "#000";
						this.style.background = "rgb(217, 83, 79)";
					} else {
						this.style.color = "#000";
						this.style.background = "#bbb";
					}
				}
			}
			tLi[i].onmouseout = function() {
				var tEm = this.parentNode.parentNode.getElementsByTagName("em");
				var tMonth = parseInt(tEm[2].innerHTML);
				var tYear = parseInt(tEm[1].innerHTML);
				var tDate = new Date();
				if (this.childNodes[1].innerHTML != "") {
					if (this.childNodes[1].innerHTML == tDate.getDate()
							&& tYear == tDate.getFullYear()
							&& tMonth == tDate.getMonth() + 1) {
						this.style.color = "#000";
						this.style.background = "rgb(217, 83, 79)";
					} else {
						this.style.color = "#000";
						this.style.background = "#fff";
					}
				}
			}
			tLi[i].onclick = function() {
				var tEm = this.parentNode.parentNode.getElementsByTagName("em");
				var tMonth = parseInt(tEm[2].innerHTML);
				var tYear = parseInt(tEm[1].innerHTML);
				var tDate = new Date();
				if (this.childNodes[1].innerHTML != "") {
					// 处理星期
					var fDate = new Date();
					fDate.setFullYear(tYear);
					fDate.setMonth(tMonth - 1);
					fDate.setDate(this.childNodes[1].innerHTML);
					lightBoxShow(this.childNodes[1].innerHTML, "是不是有回款", fDate
							.getDay());
					param = {};
					param["paramMap.yearDate"] = tYear;
					param["paramMap.monthDate"] = tMonth;
					param["paramMap.dayDate"] = this.childNodes[1].innerHTML;
					if (this.childNodes[1].innerHTML == tDate.getDate()
							&& tYear == tDate.getFullYear()
							&& tMonth == tDate.getMonth() + 1) {
						// 如果是当天
						setNowDay(param);
					} else {
						setOtherDay(param);
						this.style.color = "#000";
						this.style.background = "#bbb";
					}
				}
			}
		}
		for (var j = tLi.length / 2; j < tLi.length; j++) {
			if (tLi[j].childNodes[1].innerHTML == tDate.getDate()) {
				tLi[j].style.color = "#000";
			}
		}
	}

	nowDay();
	// 以后添加投资记录用
	// setMonthChange(param);
}

function setMonthChange(param) {
	$
			.post(
					"homeDateInter.act",
					param,
					function(data) {
						var investInfoStr = data.investInfoStr;
						var returnInfoStr = data.returnInfoStr;
						var aLi = document.getElementById("nowDate")
								.getElementsByTagName("li");
						if (investInfoStr != undefined && investInfoStr != '') {
							var infoArr = investInfoStr.split(":");
							for (var c = 0; c < infoArr.length; c++) {
								for (var i = 0; i < aLi.length; i++) {
									if (aLi[i].childNodes[1].innerHTML == infoArr[c]) {
										aLi[i].style.color = "#000";
										aLi[i].childNodes[2].style.visibility = "visible";
									}
								}
							}
						}
						if (returnInfoStr != undefined && returnInfoStr != '') {
							var infoArr = returnInfoStr.split(":");
							for (var c = 0; c < infoArr.length; c++) {
								for (var i = 0; i < aLi.length; i++) {
									if (aLi[i].childNodes[1].innerHTML == infoArr[c]) {
										aLi[i].style.color = "#000";
										aLi[i].childNodes[0].style.visibility = "visible";
									}
								}
							}
						}
						/*
						 * if(data.investInfoStr!=null ){ aLi[count].style.color =
						 * "#000";
						 * aLi[count].childNodes[2].style.visibility="visible"; }
						 * if(data.returnInfo>0){ aLi[count].style.color =
						 * "#000";
						 * aLi[count].childNodes[0].style.visibility="visible"; }
						 */
					});
}
function setOtherDay(param) {
	param["paramMap.checkType"] = 1; // 1: 表示非当天
	$.ajax({
		url : '/member_index/nowDate.htm',
		data : {
			year : param["paramMap.yearDate"],
			month : param["paramMap.monthDate"],
			day : param["paramMap.dayDate"]
		},
		type : 'post',
		dataType : 'json',
		success : function(data) {
			var htm = "<p>您今天有待回款" + data[0] + "笔</p><p>您今天有待还款" + data[1]
					+ "笔</p>";
			$("#showstr").html(htm);
		}
	});

}
function setNowDay(param) {
	$.ajax({
		url : '/member_index/nowDate.htm',
		data : {
			year : param["paramMap.yearDate"],
			month : param["paramMap.monthDate"],
			day : param["paramMap.dayDate"]
		},
		type : 'post',
		dataType : 'json',
		success : function(data) {
			var htm = "<p>您今天有待回款" + data[0] + "笔</p><p>您今天有待还款" + data[1]
					+ "笔</p>";
			$("#showstr").html(htm);
		}
	});
}
function getAllDays(param) {
	$.ajax({
		url : '/member_index/queryDate.htm',
		data : {
			year : param["paramMap.yearDate"],
			month : param["paramMap.monthDate"]
		},
		type : 'post',
		success : function(data) {

			data = JSON.parse(data);
			$.each(data, function(key, values) {
				if(!values){
					return;
				}
				$(values).each(
						function(index) {
							var oneday = values[index];
							oneday = oneday.split('-')[2].substring(0, 2);
							$('#nowDate').children('ul').find('li').each(
									function(index) {
										var len = $(this).children('div[id]')
												.text();
										if (len != "") {
											if (len.length < 2) {
												len = "0" + len;
											}
											if (len == oneday) {
												$(this).children('div[id]')
														.next().css(
																'visibility',
																'visible');
											}
										}
									});
						});
			});

		}

	});

}
