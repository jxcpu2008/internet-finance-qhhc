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
	$("#startreg-time").omCalendar({
		disabledFn : disableFunc
	});
	$("#endreg-time").omCalendar({
		disabledFn : disableFunc
	});
	var disableFunc = function disFunc(date) {
		var now = new Date();
		if (date > now) {
			return false;
		}
	};

	/***end***/

	/**** 导出excel***/
	$("#outexecl").click(
			function() {
				var messgae = "是否导出用户明细到excel？";
				var beg = $("#startreg-time").val();
				var end = $("#endreg-time").val();
				if (beg == "" && end == "") {
					$(".allpanel").find("button").each(function() {
						if ($(this).hasClass('btndown')) {
							type = $(this).attr('data-id');
							return;
						}
					});
				} else {
					type = "";
				}
				//alert(type);
				var url = "/statistics/downloadRegisterUser?type=" + type
						+ "&beginTime=" + beg + "&endTime=" + end;
				// 判断用户是否选中数据
				alertMsg.confirm(messgae, {
					okCall : function() {
						window.location.href = url;
						$("#getUserDetail").omGrid("setSelections", selectIds);
					}
				});

			});

	/*********end*****/

	var r = Raphael("chartHolder");
	//r.image("/resources/assets/images/home/inv_guide.png",100,100,100,100);
	//console.log(r);
	$(function() {
		$("#allcount").html('今日总注册量：');
		//初始化图表
		queryType(1, "", "", "今日注册量");
		//初始化用户列表
		getGrid(1, "", "");

		$("#today").click(
				function() {
					$(this).addClass('btndown').removeClass('btnover')
							.siblings().removeClass('btndown').addClass(
									'btnover');
					r.clear();
					$("#allcount").html('今日总注册量：');
					queryType(1, "", "", "今日注册量");
					getGrid(1, "", "");
				});
		$("#ystoday").click(
				function() {
					$(this).addClass('btndown').removeClass('btnover')
							.siblings().removeClass('btndown').addClass(
									'btnover');
					r.clear();
					$("#allcount").html('昨日总注册量：');
					queryType(2, "", "", "昨日注册量");
					getGrid(2, "", "");
				});
		$("#rounday").click(
				function() {
					$(this).addClass('btndown').removeClass('btnover')
							.siblings().removeClass('btndown').addClass(
									'btnover');
					r.clear();
					$("#allcount").html('本周总注册量：');
					queryType(3, "", "", "本周注册量");
					getGrid(3, "", "");
				});
		$("#monthday").click(
				function() {
					$(this).addClass('btndown').removeClass('btnover')
							.siblings().removeClass('btndown').addClass(
									'btnover');
					$("#allcount").html('本月总注册量：');
					r.clear();
					queryType(4, "", "", "本月注册量");
					getGrid(4, "", "");
				});

		$("#search").click(function() {
			var beg = $("#startreg-time").val();
			var end = $("#endreg-time").val();
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
			queryType("", beg, end, "");
			getGrid("", beg, end);
		});

	});

	function queryType(type, beginTime, endTime, comment) {
		$
				.ajax({
					url : '/statistics/registerNum',
					type : 'post',
					data : {
						type : type,
						beginTime : beginTime,
						endTime : endTime
					},
					success : function(data) {
						// Creates canvas
						//alert(data);
						data = JSON.parse(data);
						$("#count").html(data.totalRegisterNum);
						$("#staticsMsg").html(data.staticsMsg);
						//alert(data.registerBuyBarGraphList[0].lableName);
						if (data.type == "1") {
							$("#today").addClass('btndown').removeClass(
									'btnover').siblings().addClass('btnover');
							comment = "今日注册量";
						} else if (data.type == "2") {
							$("#ystoday").addClass('btndown').removeClass(
									'btnover').siblings().addClass('btnover');
							comment = "昨日注册量";
						} else if (data.type == "3") {
							$("#rounday").addClass('btndown').removeClass(
									'btnover').siblings().addClass('btnover');
							comment = "本周注册量";
						} else if (data.type == "4") {
							$("#monthday").addClass('btndown').removeClass(
									'btnover').siblings().addClass('btnover');
							comment = "本月注册量";
						}

						var array = [];//定义一个数组
						var regarray = [];//定义一个数组
						//alert(data.registerBarGraphList.length);
						for (i = 0; i < data.registerBarGraphList.length; i++) {
							array[i] = data.registerBarGraphList[i].lableName;
							regarray[i] = Number(data.registerBarGraphList[i].registerNum);
						}

						var arraybuy = [];//定义一个数组
						var arrayregbuy = [];//定义一个数组
						var arrayregbuy1 = [];//定义一个数组
						for (i = 0; i < data.registerBuyBarGraphList.length; i++) {
							arraybuy[i] = data.registerBuyBarGraphList[i].lableName;
							arrayregbuy[i] = Number(data.registerBuyBarGraphList[i].registerNum);
							arrayregbuy1[i] = Number(data.registerBuyBarGraphList[i].registerBuyNum);

						}

						//alert(regarray[0] + 'e'+regarray[1]+'ee' + regarray[3]);
						getbarchart1(r, array, regarray, comment);
						getbarchart2(r, arraybuy, arrayregbuy, arrayregbuy1);

						//馅饼
						/* Pie Data */
						var pieLegend = [];
						var pieData = [];
						for (i = 0; i < data.userRegisterTypeArea.length; i++) {
							pieLegend[i] = data.userRegisterTypeArea[i].lableName;
							pieData[i] = Number(data.userRegisterTypeArea[i].registerNum);
						}
						chartHolder(r, "用户属性比例", 650, 10, 80, 650, 130,
								pieData, pieLegend, "east");

						/******end ****/
						var pieLegend1 = [];
						var pieData1 = [];
						for (i = 0; i < data.channelMemberArea.length; i++) {
							pieLegend1[i] = data.channelMemberArea[i].lableName;
							pieData1[i] = Number(data.channelMemberArea[i].registerNum);
						}
						chartHolder(r, "推广注册会员比例", 1100, 10, 80, 1100, 130,
								pieData1, pieLegend1, "east");
						/******end ****/
						var pieLegend2 = [];
						var pieData2 = [];
						for (i = 0; i < data.registerBuyRate.length; i++) {
							pieLegend2[i] = data.registerBuyRate[i].lableName;
							pieData2[i] = Number(data.registerBuyRate[i].registerNum);
						}
						chartHolder(r, "注册用户认购占比", 650, 300, 80, 650, 460,
								pieData2, pieLegend2, "east");
					}

				})

	}

	//柱体1
	function getbarchart1(r, chardata, reldata, comment) {
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
		r.text(250, 10, comment).attr({
			"font-size" : 20
		});

		chart3.label([ chardata ], true);
	}

	//柱体2
	function getbarchart2(r, chardata, reldata, reldata1) {
		var data = [ reldata, reldata1 ]
		// stacked: false
		var chart1 = r.barchart(100, 320, 320, 220, data, options).hover(
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

		r.text(220, 300, "注册会员中认购比").attr({
			"font-size" : 20
		});
		r.text(370, 300, "(注册人数/认购人数)").attr({
			"font-size" : 14
		});

		chart1.label([ chardata, [ " ", " ", " ", " ", " ", " ", " " ] ], true);
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

	function getGrid(type, beg, end) {
		$("#getUserDetail").omGrid(
				{
					height : 485,
					dataSource : '/statistics/queryRegisterUserList?type='
							+ type + "&beginTime=" + beg + "&endTime=" + end,
					limit : 20,
					title : '用户明细',
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
					}, {
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
					}, {
						header : '用户余额',
						name : 'cashBalance',
						width : 100,
						align : 'center'
					}, {
						header : '宝付状态',
						name : 'ipsAccountStatus',
						width : 100,
						align : 'center',
						renderer : function(v, rowData, rowIndex) {
							if (v == 1) {
								return "是";
							} else if (v == 0) {
								return "否";
							}
						}

					}, {
						header : '推荐人',
						name : 'generalizerName',
						width : 100,
						align : 'center'
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
							}else {
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
						header : '上次登陆时间',
						name : 'lastLoginTime',
						width : 150,
						align : 'center'
					}, {
						header : '注册时间',
						name : 'createTime',
						width : 150,
						align : 'center'
					} ]
				})
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
		<button type="button" class="btndown" id="today" data-id="1">今日注册量</button>
		<button type="button" class="btnover" id="ystoday" data-id="2">昨日注册量</button>
		<button type="button" class="btnover" id="rounday" data-id="3">一周注册量</button>
		<button type="button" class="btnover" id="monthday" data-id="4">本月注册量</button>
		<label class="btnover">时间搜索：</label><input type="text"
			style="width: 100px;" id="startreg-time" />一<input type="text"
			style="width: 100px;" id="endreg-time" />
		<button type="button" class="btnover" id="search">搜索</button>
		<button type="button" class="btnover" style="float: right;"
			id="outexecl">导出统计表</button>
	</div>
	<hr style="color: #ccc;">
	<div>
		<span style="padding: 2px 80px; padding-right: 30px; font-size: 14px;"
			id="allcount"></span><b id="count"
			style="font-size: 24px; color: red;"></b><font
			style="font-size: 20px; color: red;">人</font>
	</div>

	<div
		style="padding: 40px 0px; border-bottom: 1px solid #ccc; height: 600px;">
		<div id="chartHolder" style="height: 600px;"></div>
	</div>
	<div>
		<p>&nbsp;</p>
		<h1>统计信息</h1>
		<p>&nbsp;</p>
		<p id="staticsMsg" style="margin-left: 10px;"></p>

	</div>
	<div style="height: 30px;"></div>
	<div id="getUserDetail"></div>
</div>
