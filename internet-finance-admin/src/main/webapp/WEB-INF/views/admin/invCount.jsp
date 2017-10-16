<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	var options = {
		stacked : false,
		gutter : 20,
		axis : "0 0 1 1", // Where to put the labels (trbl)
		axisystep : 10
	// How many x interval labels to render (axisystep does the same for the y axis)
	};

	//时间控件
	$("#inv_startreg-time").omCalendar({
		disabledFn : disFn
	});
	$("#inv_endreg-time").omCalendar({
		disabledFn : disFn
	});
	var disFn = function disFn(date) {
		var nowMiddle = new Date();
		if (date > nowMiddle) {
			return false;
		}
	};
	
	var r = Raphael("inv_chartHolder");
	//console.log(r);
	var type = 1; // 1、今日  2、昨日 3、一周 4、本月
	var beg = '';
	var end = '';
	$(function() {
		queryType(type,'','');  // 缺省为今日
		$("#inv_today").click(
				function() {
					$(this).addClass('btndown').removeClass('btnover')
							.siblings().addClass('btnover');
					r.clear();
					type = 1;
					queryType(type,'','');
					$("#inv_startreg-time").val('');
					$("#inv_endreg-time").val('');
				});
		$("#inv_ystoday").click(
				function() {
					$(this).addClass('btndown').removeClass('btnover')
							.siblings().addClass('btnover');
					r.clear();
					type = 2;
					queryType(type,'','');
					$("#inv_startreg-time").val('');
					$("#inv_endreg-time").val('');
				});
		$("#inv_rounday").click(
				function() {
					$(this).addClass('btndown').removeClass('btnover')
							.siblings().addClass('btnover');
					r.clear();
					type = 3;
					queryType(type,'','');
					$("#inv_startreg-time").val('');
					$("#inv_endreg-time").val('');
				});
		$("#inv_monthday").click(
				function() {
					$(this).addClass('btndown').removeClass('btnover')
							.siblings().addClass('btnover');
					r.clear();
					type = 4;
					queryType(type,'','');
					$("#inv_startreg-time").val('');
					$("#inv_endreg-time").val('');
				});

		// 导出
		$("#inv_export").click(function(){
			window.location.href = '/statistics/downInvestUserList?type='+type+"&beginTime="+beg+"&endTime="+end;
		});
		
		// 搜索
		$("#inv_search").click(function() {
			beg = $("#inv_startreg-time").val();
			end = $("#inv_endreg-time").val();
			if (beg == "") {
				alertMsg.warn("请填写开始时间!");
				return;
			}
			if (end == "") {
				alertMsg.warn("请填写结束时间!");
				return;
			}
			var date1 = new Date(Date.parse(beg));
			var date2 = new Date(Date.parse(end));
			if (date1.getTime() > date2.getTime()) {
				alertMsg.warn("结束时间不得小于开始时间。");
				return false;
			}
			
			r.clear();
			type = '';
			queryType(type,beg,end);
		});
	});

	function queryType(type,beg,end) {
		$
				.ajax({
					url : '/statistics/investMoney',
					type : 'post',
					data : {
						type : type,
						beginTime : beg,
						endTime : end
					},
					success : function(data) {
						//alert(data);
						data = JSON.parse(data);
						var what_day = '';
						if (data.type == "1") {
							what_day = '今日';
							$("#inv_today").addClass('btndown').removeClass('btnover')
								.siblings().addClass('btnover');
						} else if (data.type == "2") {
							what_day = '昨日';
							$("#inv_ystoday").addClass('btndown').removeClass('btnover')
								.siblings().addClass('btnover');
						} else if (data.type == "3") {
							what_day = '一周';
							$("#inv_rounday").addClass('btndown').removeClass('btnover')
								.siblings().addClass('btnover');
						} else {
							what_day = '本月';
							$("#inv_monthday").addClass('btndown').removeClass('btnover')
								.siblings().addClass('btnover');
						}
						queryInvestUserList(type,beg,end); // 认购明细
						// 设置文字信息
						$("#what_day").text(what_day);
						// 设置当前投资总额
						$("#inv_count").text(data.totalInvestMoney);
						// 设置统计描述信息
						$("#inv_staticsMsg").html(data.staticsMsg);
						var array = [];//定义一个数组
						var regarray = [];//定义一个数组
						for (i = 0; i < data.investBarGrapList.length; i++) {
							array[i] = data.investBarGrapList[i].lableName;
							regarray[i] = Number(data.investBarGrapList[i].investMoney);
						}
						
						// 柱状图
						getbarchart(r, array, regarray, what_day);
						
						// 认购业绩来源
						var pieLegend = [];
						var pieData = [];
						for (i = 0; i < data.investSourceAreaList.length; i++) {
							pieLegend[i] = data.investSourceAreaList[i].lableName;
							pieData[i] = Number(data.investSourceAreaList[i].investMoney);
						}
						chartHolder(r, "认购业绩来源占比", 650, 10, 80, 650, 130,
								pieData, pieLegend, "east");
						
						// 认购期限
						var pieLegend1 = [];
						var pieData1 = [];
						for (i = 0; i < data.investPeriodAreaList.length; i++) {
							pieLegend1[i] = data.investPeriodAreaList[i].lableName;
							pieData1[i] = Number(data.investPeriodAreaList[i].investMoney);
						}
						chartHolder(r, "认购期限占比", 1100, 10, 80, 1100, 130,
								pieData1, pieLegend1, "east");
						
						// 认购类型
						var pieLegend2 = [];
						var pieData2 = [];
						for (i = 0; i < data.investTypeAreaList.length; i++) {
							pieLegend2[i] = data.investTypeAreaList[i].lableName;
							pieData2[i] = Number(data.investTypeAreaList[i].investMoney);
						}
						//alert(pieLegend2+"--"+pieData2);
						chartHolder(r, "认购类型占比", 230, 330, 80, 220, 460,
								pieData2, pieLegend2, "east");
					}

				})

	}

	// 柱体
	function getbarchart(r, chardata, reldata ,what_day) {
		options.axisystep = 10;
		options.stacked = false;
		var data3 = [ reldata ];
		var chart3 = r.barchart(100, 30, 320, 220, data3, options).hover(
				function() {
					this.flag = r.popup(this.bar.x, this.bar.y, this.bar.value)
							.insertBefore(this);
				}, function() {
					this.flag.animate({
						opacity : 0
					}, 500, ">", function() {
						this.remove();
					});
				});
		r.text(250, 10, what_day+"投资额").attr({
			"font-size" : 20
		});
		chart3.label([ chardata ], true);
	}

	//饼图
	function chartHolder(r, title, titleXpos, titleYpos, pieRadius, pieXpos,
			pieYpos, pieData, pieLegend, pieLegendPos) {
		//馅饼
		r.text(titleXpos, titleYpos, title).attr({
			"font-size" : 20
		});

		var pie = r.piechart(pieXpos, pieYpos, pieRadius, pieData, {
			legend : pieLegend,
			legendpos : pieLegendPos
		});
		pie.hover(function() {
			this.sector.stop();
			this.sector.scale(1.1, 1.1, this.cx, this.cy);
			if (this.label) {
				this.label[0].stop();
				this.label[0].attr({
					r : 7.5
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
					r : 5
				}, 500, "bounce");
				this.label[1].attr({
					"font-weight" : 400
				});
			}
		});
	}

	function queryInvestUserList(type,beg,end){
		$("#inv_getUserDetail").omGrid({
			height : 485,
			dataSource : '/statistics/queryInvestUserList?type='+type+"&beginTime="+beg+"&endTime="+end,
			limit : 20,
			title : '认购明细',
			method : 'POST',
			showIndex : false,
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
			},{
				header : '用户类型',
				name : 'userType',
				width : 100,
				align : 'center',
				renderer : function(v, rowData, rowIndex) {
					if (v == 1) {
						return "普通用户";
					} else if (v == 2) {
						return "员工";
					}else if (v == 3) {
						return "特别企业";
					}else if (v == 4) {
						return "居间人";
					}else if (v == 6) {
						return "理财师";
					}else {
						return "暂无";
					}
				}
			},  {
				header : '项目名称',
				name : 'loanSignName',
				width : 100,
				align : 'center'
			}, {
				header : '认购金额',
				name : 'investMoney',
				width : 100,
				align : 'center'
			}, {
				header : '认购时间',
				name : 'investTime',
				width : 150,
				align : 'center'
			}, {
				header : '认购类型',
				name : 'loanType',
				width : 100,
				align : 'center',
				renderer : function(v,rowData,rowIndex){
					if (v=="1") {
						return "优先";
					} else if (v=="2") {
						return "夹层";
					} else {
						return "劣后";
					}
				}
			}, {
				header : '推荐人',
				name : 'generalizerName',
				width : 100,
				align : 'center',
				renderer : function(v, rowData, rowIndex) {
					if (v == '') {
						return "无";
					} else {
						return v;
					}
				}
			}, {
				header : '推荐人部门',
				name : 'generalizerDepartment',
				width : 100,
				align : 'center',
				renderer : function(v, rowData, rowIndex) {
					if (v == 1) {
						return "总裁办";
					} else if (v == 2) {
						return "财务部";
					} else if (v == 3) {
						return "行政部";
					} else if (v == 4) {
						return "副总办";
					} else if (v == 5) {
						return "运营中心";
					} else if (v == 6) {
						return "培训部";
					} else if (v == 7) {
						return "风控部";
					} else if (v == 8) {
						return "IT部";
					} else if (v == 9) {
						return "摄影部";
					} else if (v == 10) {
						return "推广部";
					} else if (v == 11) {
						return "项目部";
					} else if (v == 12) {
						return "客服部";
					} else if (v == 13) {
						return "事业一部";
					} else if (v == 14) {
						return "事业二部";
					} else if (v == 15) {
						return " 离职员工";
					} else {
						return "暂无";
					}
				}
			}, {
				header : '推荐人用户类型',
				name : 'generalizeUserType',
				width : 100,
				align : 'center',
				renderer : function(v, rowData, rowIndex) {
					if (v == 1) {
						return "普通用户";
					} else if (v == 2) {
						return "员工";
					}else if (v == 3) {
						return "特别企业";
					}else if (v == 4) {
						return "居间人";
					}else if (v == 6) {
						return "理财师";
					}else {
						return "暂无";
					}
				}
			}, {
				header : '佣金',
				name : 'commissionMoney',
				width : 100,
				align : 'center',
				renderer : function(v, rowData, rowIndex) {
					if (v == '') {
						return "暂无";
					} else {
						return v;
					}
				}
			}, {
				header : '上次登陆时间',
				name : 'lastLoginTime',
				width : 150,
				align : 'center'
			} ]
		});
	}
	
</script>
<style>
.btndown {
	border-style: none;
	padding: 5px 20px;
	margin-right: 5px;
	background: #0099CC;
	color: #fff;
	cursor: pointer;
	border: 1px solid #ccc;
}

.btnover {
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
		<button type="button" class="btnover" id="inv_today">今日投资额</button>
		<button type="button" class="btnover" id="inv_ystoday">昨日投资额</button>
		<button type="button" class="btndown" id="inv_rounday">一周投资额</button>
		<button type="button" class="btnover" id="inv_monthday">本月投资额</button>
		<label>时间搜索：</label><input type="text"
			style="width: 100px;" id="inv_startreg-time" />一<input type="text"
			style="width: 100px;" id="inv_endreg-time" />
		<button type="button" id="inv_search">搜索</button>
		<button type="button" style="float: right;" id="inv_export">导出统计表</button>
	</div>
	<hr style="color: #ccc;">
	<div>
		<span style="padding: 2px 80px; padding-right: 30px; font-size: 14px;"><span id="what_day">一周</span>投资额:</span><b
			id="inv_count" style="font-size: 24px; color: red;"></b><font
			style="font-size: 20px; color: red;">元</font>
	</div>

	<div
		style="padding: 40px 0px; border-bottom: 1px solid #ccc; height: 600px;">
		<div id="inv_chartHolder" style="height: 600px;"></div>
	</div>
	<div>
		<p>&nbsp;</p>
		<h1>统计信息</h1>
		<p>&nbsp;</p>
		<p id="inv_staticsMsg" style="margin-left: 10px;"></p>
	</div>
	<div style="height: 30px;"></div>
	<div id="inv_getUserDetail"></div>
</div>
