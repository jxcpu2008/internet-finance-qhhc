<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
var myOptions = {
	stacked : false,
	gutter : 20,
	axis : "0 0 1 1", // Where to put the labels (trbl)
	axisystep : 10 // How many x interval labels to render (axisystep does the same for the y axis)
};

// 时间控件
// 注册开始时间
$("#regStartTime").omCalendar({
	disabledFn : function disFn(date) {
		var nowMiddle = new Date();
		if (date > nowMiddle) {
			return false;
		}
	}
});

// 注册结束时间
$("#regEndTime").omCalendar({
	disabledFn : function disFn(date) {
		var nowMiddle = new Date();
		if (date > nowMiddle) {
			return false;
		}
	}
});

// 认购开始时间
$("#investStartTime").omCalendar({
	disabledFn : function disFn(date) {
		var nowMiddle = new Date();
		if (date > nowMiddle) {
			return false;
		}
	}
});

// 认购结束时间
$("#investEndTime").omCalendar({
	disabledFn : function disFn(date) {
		var nowMiddle = new Date();
		if (date > nowMiddle) {
			return false;
		}
	}
});

var myChart = Raphael("otherChartHolder");
$(function() {
	// 初始化图表
	initGraph(myChart, '各端口注册人数', '各端口认购人数', '各端口认购金额', '各端口注册认购占比');

	$("#otherSearch").click(function() {
		var regStartTime = $("#regStartTime").val();
		var regEndTime = $("#regEndTime").val();
// 		if (regStartTime == "") {
// 			alertMsg.warn("请填写开始时间!");
// 			return;
// 		}
// 		if (regEndTime == "") {
// 			alertMsg.warn("请填写结束时间!");
// 			return;
// 		}
		var regStartDate = new Date(Date.parse(regStartTime));
		var regEndDate = new Date(Date.parse(regEndTime));
		if (regStartDate.getTime() > regEndDate.getTime()) {
			alertMsg.warn("结束时间不得小于开始时间。");
			return false;
		}
		
		var userName = $("#userName").val();
		var phoneNum = $("#phoneNum").val();
		var regChannel = $("#regChannel").val();
		var regChannelName = $("#regChannel").find("option:selected").text();
		var regTerminal = $("#regTerminal").val();
		var investStartTime =  $("#investStartTime").val();
		var investEndTime =  $("#investEndTime").val();
		
		var param = new Object();
		param.userName = userName;
		param.phoneNum = phoneNum;
		param.regChannel = regChannel;
		param.regTerminal = regTerminal;
		param.investStartTime = investStartTime;
		param.investEndTime = investEndTime;
		param.regEndTime = regEndTime;
		param.regStartTime = regStartTime;
		param.regChannelName = regChannelName;
		var json = JSON.stringify(param);
		
		// 清空初始化的图表
		myChart.clear();
		
		// 根据查询的数据填充图标
		fillGraph(json);
		
		getInvestUserInfo(json);
	});
});

function fillGraph(param) {
	$.ajax( {
		url : '/statistics/queryChartData',
		type : 'post',
		data : {
			paramJsonStr : param
		},
		success : function(data) {
			data = JSON.parse(data);

			var terminalRegLabelNameArray = [];
			var terminalRegNumArray = [];
			for (i = 0; i < data.terminalRegNumRecords.length; i++) {
				var registerSource = data.terminalRegNumRecords[i].registerSource;
				terminalRegLabelNameArray[i] = getLabel(registerSource);
				terminalRegNumArray[i] = Number(data.terminalRegNumRecords[i].terminalRegNum);
			}

			var terminalInvNumLabelNameArray = [];
			var terminalInvMoneyLabelNameArray = [];
			var terminalInvMoneyPercentageLabelNameArray = [];
			var terminalInvNumArray = [];
			var terminalInvMoneyArray = [];
			var terminalInvMoneyPercentageArray = [];
			for (i = 0; i < data.terminalInvNumRecords.length; i++) {
				var registerSource = data.terminalInvNumRecords[i].registerSource;
				terminalInvNumLabelNameArray[i] = getLabel(registerSource);
				terminalInvMoneyLabelNameArray[i] = getLabel(registerSource);
				terminalInvMoneyPercentageLabelNameArray[i] = getPercentageLabel(registerSource, data.terminalInvNumRecords[i].percentage);
				terminalInvNumArray[i] = Number(data.terminalInvNumRecords[i].terminalInvNum);
				terminalInvMoneyArray[i] = Number(data.terminalInvNumRecords[i].investMoney);
				terminalInvMoneyPercentageArray[i] = Number(data.terminalInvNumRecords[i].percentage);
			}
			
			drawBar(myChart, '各端口注册人数', 250, 10, 100, 30, terminalRegNumArray, terminalRegLabelNameArray);
			drawBar(myChart, '各端口认购人数', 780, 10, 620, 30, terminalInvNumArray, terminalInvNumLabelNameArray);
			drawBar(myChart, '各端口认购金额', 250, 290, 100, 310, terminalInvMoneyArray, terminalInvMoneyLabelNameArray);
			
			drawPie(myChart, '各端口注册认购占比', 780, 290, 80, 780, 400, terminalInvMoneyPercentageArray, terminalInvMoneyPercentageLabelNameArray, 'east');
			
			var channelRegLabelNameArray = [];
			var channelRegNumArray = [];
			for (i = 0; i < data.channelRegNumRecords.length; i++) {
				var channelName = data.channelRegNumRecords[i].channelName;
				var channelRegNum = Number(data.channelRegNumRecords[i].channelRegNum);
				channelRegLabelNameArray[i] = channelName;
				channelRegNumArray[i] = channelRegNum;
			}
			
			var channelInvNumLabelNameArray = [];
			var channelInvMoneyLabelNameArray = [];
			var channelInvMoneyPercentageLabelNameArray = [];
			var channelInvNumArray = [];
			var channelInvMoneyArray = [];
			var channelInvMoneyPercentageArray = [];
			for (i = 0; i < data.channelInvNumRecords.length; i++) {
				channelInvNumLabelNameArray[i] = data.channelInvNumRecords[i].channelName;
				channelInvMoneyLabelNameArray[i] = data.channelInvNumRecords[i].channelName;
				channelInvMoneyPercentageLabelNameArray[i] = getChannelPercentageLabel(data.channelInvNumRecords[i].channelName, data.channelInvNumRecords[i].percentage);
				
				channelInvNumArray[i] = Number(data.channelInvNumRecords[i].channelInvNum);
				channelInvMoneyArray[i] = Number(data.channelInvNumRecords[i].investMoney);
				channelInvMoneyPercentageArray[i] = Number(data.channelInvNumRecords[i].percentage);
			}
			
			// 各渠道注册人数
			drawBar(myChart, '各渠道注册人数', 250, 570, 100, 590, channelRegNumArray, channelRegLabelNameArray);
			// 各渠道认购人数
			drawBar(myChart, '各渠道认购人数', 780, 570, 620, 590, channelInvNumArray, channelInvNumLabelNameArray);
			// 各渠道认购金额
			drawBar(myChart, '各渠道认购金额', 250, 860, 100, 880, channelInvMoneyArray, channelInvMoneyLabelNameArray);
			
			// 各渠道注册认购占比
			drawPie(myChart, '各渠道注册认购占比', 780, 860, 80, 780, 970, channelInvMoneyPercentageArray, channelInvMoneyPercentageLabelNameArray, 'east');
		}
	})
}

function getLabel(registerSource) {
	if (registerSource == 1) {
		return "PC";
	} else if (registerSource == 2) {
		return "H5";
	} else if (registerSource == 8) {
		return "安卓";
	} else if (registerSource == 9) {
		return "IOS";
	} else {
		// do nothing
	}
}

function getPercentageLabel(registerSource, percentage) {
	if (registerSource == 1) {
		return 'PC(' + percentage + '%)';
	} else if (registerSource == 2) {
		return 'H5(' + percentage + '%)';
	} else if (registerSource == 8) {
		return '安卓(' + percentage + '%)';
	} else if (registerSource == 9) {
		return 'IOS(' + percentage + '%)';
	} else {
		// do nothing
	}
}

function getChannelPercentageLabel(channelName, percentage) {
	return channelName + '(' + percentage + '%)';
}

function initGraph(chart, terminalRegNumComment, terminalInvNumComment, terminalInvMoneyComment, terminalRegInvPercentegeTitle) {
	var terminalLabelNames = ['PC', 'H5', '安卓', 'IOS'];
	var terminalNums = [0, 0, 0, 0];
	// 各端口注册人数
	drawBar(chart, terminalRegNumComment, 250, 10, 100, 30, terminalNums, terminalLabelNames);
	// 各端口认购人数
	drawBar(chart, terminalInvNumComment, 780, 10, 620, 30, terminalNums, terminalLabelNames);
	// 各端口认购金额
	drawBar(chart, terminalInvMoneyComment, 250, 290, 100, 310, terminalNums, terminalLabelNames);	
	
	var channelLabelNames = ['嗒嗒巴士', '易瑞特', '扶翼'];
	var channelNums = [0, 0, 0];
	// 各渠道注册人数
	drawBar(chart, '各渠道注册人数', 250, 570, 100, 590, channelNums, channelLabelNames);
	
	// 各渠道认购人数
	drawBar(chart, '各渠道认购人数', 780, 570, 620, 590, channelNums, channelLabelNames);
	
	// 各渠道认购金额
	drawBar(chart, '各渠道认购金额', 250, 860, 100, 880, channelNums, channelLabelNames);
	
	var pieData = terminalNums;
	var pieLegend = terminalLabelNames;
	var pieLegendPos = 'east';
	var titleXpos = 780;
	var titleYpos = 290;
	var pieRadius = 80;
	var pieXpos = 800;
	var pieYpos = 380;
	// 各端口注册认购占比
	drawPie(chart, terminalRegInvPercentegeTitle, titleXpos, titleYpos, pieRadius, pieXpos, pieYpos, pieData, pieLegend, pieLegendPos);
	
	// 各渠道注册认购占比
	drawPie(chart, '各渠道注册认购占比', 780, 860, 80, 800, 950, channelNums, channelLabelNames, 'east');
}

function drawBar(chart, title, titleXpos, titleYpos, barXpos, barYpos, barData, barLabelData) {
	myOptions.axisystep = 10;
	myOptions.stacked = false;
	var data3 = [ barData ];
	var chart3 = chart.barchart(barXpos, barYpos, 320, 220, data3, myOptions).hover(
		function() {
			this.flag = chart.popup(this.bar.x, this.bar.y, this.bar.value).insertBefore(this);
		}, function() {
			this.flag.animate({
				opacity : 0
			}, 500, ">", function() {
				this.remove();
			});
		});
	
	chart.text(titleXpos, titleYpos, title).attr({
		"font-size" : 20
	});

	chart3.label([ barLabelData ], true);
}

function drawPie(chart, title, titleXpos, titleYpos, pieRadius, pieXpos, pieYpos, pieData, pieLegend, pieLegendPos) {
	chart.text(titleXpos, titleYpos, title).attr({
		"font-size" : 20
	});

	var pie = chart.piechart(pieXpos, pieYpos, pieRadius, pieData, {
		legend : pieLegend,
		legendpos : pieLegendPos
	});
	
	pie.hover(function() {
		this.sector.stop();
		this.sector.scale(1.1, 1.1, this.cx, this.cy);
		if (this.label) {
			this.label[0].stop();
			this.label[0].attr({
				chart : 7.5
			});
			this.label[1].attr({
				"font-weight" : 800
			});
		}
	}, function() {
		this.sector.animate({
			transform : 's1 1 ' + this.cx + ' ' + this.cy
		}, 500, "bounce");
		if (this.label) {
			this.label[0].animate({
				chart : 5
			}, 500, "bounce");
			this.label[1].attr({
				"font-weight" : 400
			});
		}
	});
}

function getInvestUserInfo(param) {
	$("#investDetail").omGrid(
		{
			height : 485,
			dataSource : '/statistics/queryRegisterUserInvestRecords?&paramJsonStr=' + param,
			limit : 20,
			title : '表单明细',
			method : 'POST',
			showIndex : true,
			autoFit : true,
			emptyMsg : '暂时还没有您想要的数据',
			singleSelect : true,
			colModel : [ {
				header : '用户名',
				name : 'userName',
				width : 100,
				align : 'center'
			}, {
				header : '真实姓名',
				name : 'name',
				width : 120,
				align : 'center'
			}, {
				header : '手机号',
				name : 'phone',
				width : 120,
				align : 'center'
			}, {
				header : '注册时间',
				name : 'regTime',
				width : 120,
				align : 'center'
			},{
				header : '注册端口',
				name : 'registerSource',
				width : 100,
				align : 'center',
				renderer : function(v, rowData, rowIndex) {
					if (v == 1) {
						return "PC";
					} else if (v == 2) {
						return "H5";
					} else if (v == 8) {
						return "安卓";
					} else if (v == 9) {
						return "IOS";
					} else {
						return "";
					}
				}
			}, {
				header : '注册渠道',
				name : 'registerChannel',
				width : 100,
				align : 'center'
			}, {
				header : '宝付授权状态',
				name : 'isAuthIps',
				width : 100,
				align : 'center',
				renderer : function(v, rowData, rowIndex) {
					if (v == 0) {
						return "待确认";
					} else if (v == 1) {
						return "已授权";
					} else {
						return "未授权";
					}
				}
			}, {
				header : '投资项目',
				name : 'loanSignName',
				width : 100,
				align : 'center',
			}, {
				header : '认购金额',
				name : 'investMoney',
				width : 100,
				align : 'center',
			}, {
				header : '认购日期',
				name : 'investTime',
				width : 120,
				align : 'center',
			}, {
				header : '被推荐人',
				name : 'inviteName',
				width : 100,
				align : 'center'
			} ]
		});
}

$("#otherExcel").click(
	function() {
		var messgae = "是否导出用户明细到excel？";
		var begTime = $("#regStartTime").val();
		var endTime = $("#regEndTime").val();
		
		var userName = $("#userName").val();
		var phoneNum = $("#phoneNum").val();
		var regChannel = $("#regChannel").val();
		var regTerminal = $("#regTerminal").val();
		var investStartTime =  $("#investStartTime").val();
		var investEndTime =  $("#investEndTime").val();
		
		var param = new Object();
		param.userName = userName;
		param.phoneNum = phoneNum;
		param.regChannel = regChannel;
		param.regTerminal = regTerminal;
		param.investStartTime = investStartTime;
		param.investEndTime = investEndTime;
		param.regEndTime = endTime;
		param.regStartTime = begTime;
		var json = JSON.stringify(param);

		var url = "/statistics/downloadInvestUser?paramJsonStr=" + json;

		alertMsg.confirm(messgae, {
			okCall : function() {
				window.location.href = url;
// 				$("#getUserDetail").omGrid("setSelections", selectIds);
			}
		});

	});
</script>
<style>
.mybtnover {
	border-style: none;
	padding: 5px 20px;
	margin-right: 5px;
	background: #fff;
	color: #000;
	cursor: pointer;
	border: 1px solid #ccc;
}
</style>
<div style="overflow-y: scroll; height: 600px">
	<div style="padding: 20px 15px;" class="allpanel">
		<label class="mybtnover">用户名称：</label>
		<input type="text" name="userName" id="userName"/>
		<label class="mybtnover" style="margin-left:7px;">手机号：</label>
		<input type="text" name="phoneNum" id="phoneNum"/>
		<label class="mybtnover">注册时间：</label>
		<input type="text" style="width: 100px;" id="regStartTime" /> 一 <input type="text" style="width: 100px;" id="regEndTime" />
		<br>
		<label class="mybtnover">注册渠道：</label>
		<select name="regChannel" id="regChannel" style="width: 142px;">
			<option value="all">全部</option>
	 		<c:forEach items="${promoteChannelList}" var="promoteChannel">
	 			<option value="${promoteChannel.spreadId}">${promoteChannel.name}</option>
	 		</c:forEach>
		</select>
		<label class="mybtnover" style="margin-left:6px;padding-right: 6px;">注册端口：</label>
		<select name="regTerminal" id="regTerminal" style="width: 142px;">
			<option value="all">全部</option>
	 		<option value="1">PC</option>
	 		<option value="2">H5</option>
	 		<option value="8">安卓</option>
	 		<option value="9">IOS</option>
		</select>
		<label class="mybtnover">认购时间：</label>
		<input type="text" style="width: 100px;" id="investStartTime" /> 一 <input type="text" style="width: 100px;" id="investEndTime" />
		<button type="button" class="btnover" id="otherSearch">搜索</button>
		<button type="button" class="btnover" style="float: right;" id="otherExcel">导出统计表</button>
	</div>
	<hr style="color: #ccc;">
<!-- 	<div> -->
<!-- 		<span style="padding: 2px 80px; padding-right: 30px; font-size: 14px;" id="allcount"></span> -->
<!-- 		<b id="count" style="font-size: 24px; color: red;"></b> -->
<!-- 		<font style="font-size: 20px; color: red;">人</font> -->
<!-- 	</div> -->
	<div style="padding: 40px 0px; border-bottom: 1px solid #ccc; height: 1200px;">
		<div id="otherChartHolder" style="height: 1200px;"></div>
	</div>
	<div style="height:30px;"></div>
	<div id="investDetail"></div>
</div>