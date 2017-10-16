$(document).ready(
	function() {
		// 数据显示列表相关
		$('#activityMonkeyExamineGride').omGrid({
			dataSource : '/activityMonkey/activityMonkeyInit',
			title : '待审核的现金奖励',
			height : 550,
			limit : 20,
			showIndex : true,
			emptyMsg : '暂时还没有您想要的数据',
			singleSelect : false,			
			colModel : [{
				header : '获奖id',
				name : 'id',
				align : 'center',
				width : 80
			},{
				header : '真实用户',
				name : 'name',
				align : 'center',
				width : 100
			}, {
				header : '手机号码',
				name : 'mobilePhone',
				align : 'center',
				width : 100
			}, {
				header : '投资金额',
				name : 'money',
				align : 'center',
				width : 120
			}, {
				header : '奖励类型',
				name : 'type',
				align : 'center',
				width : 200,
				renderer : function(v, rowData, rowIndex) {
					if (v == 1) {
						return "猴声大噪(一鸣惊人)";
					}  else if (v == 2) {
						return "猴声大噪(一锤定音)";
					}else if (v == 3) {
						return "金袍加身(周第一名)";
					}else if (v == 4) {
						return "金袍加身(周第二名)";
					}else if (v == 5) {
						return "金袍加身(周第三名)";
					}else if(v==6){
						return "达人第一名(iPhone 6s)";
					}else if(v==7){
						return "达人第二名(Apple Watch Sport)";
					}else if(v==8){
						return "达人第三名(Kindle 电子书)";
					}else if(v==9){
						return "红筹理财师";
					}else if(v==10){
						return "桃花朵朵开";
					}else if(v==11){
						return "翻牌抽奖";
					}else if(v==12){
						return "一鸣惊人";
					}else if(v==13){
						return "一锤定音";
					} else if (v == 14) {
						return "5月首投活动";
					} else if (v == 15) {
						return "5月榜单统计";
					}
				}
			}, {
				header : '项目名称',
				name : 'loanName',
				align : 'center',
				width : 140
			}, {
				header : '奖品/奖金',
				name : 'rewardMoney',
				align : 'center',
				width : 100
			}, {
				header : '获奖时间',
				name : 'createTime',
				align : 'center',
				width : 150
			}, {
				header : '审核状态',
				name : 'examineStatus',
				align : 'center',
				width : 80,
				renderer : function(v, rowData, rowIndex) {
					if (v == 0) {
						return "待审核";
					} else if (v == 1) {
						return "已审核";
					}
				}
			}, {
				header : '操作人',
				name : 'realname',
				align : 'center',
				width : 120
			}, {
				header : '审核时间',
				name : 'examineTime',
				align : 'center',
				width : 150
			}]
		});
		
		// 搜索面板
		$("#activityMonkeyE-search-panel").omPanel({
			title : "高级搜索",
			collapsible : true,
			collapsed : true,
			onBeforeCollapse : function(event) {
				$('.om-panel-title').omTooltip({
					html : '可以通过单击，展开高级搜索面板哦'
				});
			},
			onBeforeExpand : function(event) {
				$('.om-panel-title').omTooltip({
					html : '可以通过单击，收缩高级搜索面板哦'
				});
			}
		});

		var dadaDisFn = function disFn(date) {
			var nowMiddle = new Date();
			if (date > nowMiddle) {
				return false;
			}
		};
		// 获奖时间
		$("#createtime-timeE").omCalendar({
			disabledFn : dadaDisFn
		});
		$("#examineTime-timeE").omCalendar({
			disabledFn : dadaDisFn
		});
		
		// 鼠标悬浮在面板头显示的信息
		$('.om-panel-title').omTooltip({
			html : '可以通过单击，展开高级搜索面板哦'
		});
		
		// 搜索按钮
		$('#activityMonkeyE-button-search').omButton({
			icons : {
				left : '/resources/operamasks-ui/themes/default/images/search.png'
			},
			width : 70
		});
		
		/** 搜索按钮点击 */
		$("#activityMonkeyE-button-search").click(
			function() {
				var ajaxbg = $("#background,#progressBar");
				ajaxbg.show();
				var url = encodeURI("/activityMonkey/activityMonkeyInit?" + $("#activityMonkeyESearchForm").serialize());
				$('#activityMonkeyExamineGride').omGrid('setData', url);
			});
});

//审核状态
$("#activityMonkeyExamine").click(function() {
		var selections = $('#activityMonkeyExamineGride').omGrid('getSelections', true);
		
		// 判断是否选中
		if (selections == null || selections == ""|| selections == undefined || selections.length < 1) {
			alertMsg.info("您没有选择要审核通过的奖励数据！");
			return false;
		} 
		var amIds = [];
		for (var i = 0; i < selections.length; i++) {
			amIds.push(selections[i].id);
		}
			alertMsg.confirm("是否让选中的奖励数据审核通过？",{
						okCall : function() {
//							for ( var i in selections) {
//							if (selections[i].examineStatus == 0) {
									$.ajax({
											url : '/activityMonkey/activityMonkeyExamine',
											data : 'id='+amIds,
											type : 'post',
											success : function(msg) {
												if (msg == 1) {
													alertMsg.correct("奖励数据审核通过成功");
												} else {
													alertMsg.correct("奖励数据审核失败");
												}
												$('#activityMonkeyExamineGride').omGrid('reload');
											}
										});
//								} else {
//									alertMsg.info("只有待审核的奖励数据才能申请审核通过！");
//									return false;
//								}
//							}
						}
					});
		
		});

//批量审批20条
$("#updateBatchActivityMonkey").click(function() {
		alertMsg.confirm("是否进行批量审核通过前20条数据？",{okCall : function() {
			$.ajax({
				url : '/activityMonkey/updateBatchActivityMonkey',
				type : 'post',
				success : function(msg) {
					if (msg == 1) {
						alertMsg.correct("奖励数据审核通过成功");
					}else if(msg==3){
						alertMsg.correct("无奖励数据需要进行批量审核");
					}else if(msg==4){
						alertMsg.correct("请勿操作，后台正在进行批量审核中！");
					} else {
						alertMsg.correct("奖励数据审核失败");
					}
					$('#activityMonkeyExamineGride').omGrid('reload');
				}
			});
		}});
	});
