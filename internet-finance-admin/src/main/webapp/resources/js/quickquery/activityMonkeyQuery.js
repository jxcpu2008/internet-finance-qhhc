$(document).ready(
	function() {
		// 数据显示列表相关
		$('#activityMonkeyQueryGride').omGrid({
			dataSource : '/activityMonkey/activityMonkeyQuery',
			title : '金猴活动统计列表',
			height : 550,
			limit : 20,
			colModel : [{
				header : '真实用户',
				name : 'name',
				align : 'center',
				width : 80
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
					}
				}
			}, {
				header : '奖品/奖金',
				name : 'rewardMoney',
				align : 'center',
				width : 100
			}, {
				header : '项目名称',
				name : 'loanName',
				align : 'center',
				width : 150
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
			},  {
				header : '发放状态',
				name : 'status',
				align : 'center',
				width : 80,
				renderer : function(v, rowData, rowIndex) {
					if (v == 0) {
						return "待发放";
					} else if (v == 1) {
						return "已发放";
					}else if(v==2){
						return "发放待确认";
					}else if(v==-1){
						return "发放失败";
					}
				}
			}]
		});
		
		// 搜索面板
		$("#activityMonkeyQ-search-panel").omPanel({
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
		// 注册时间
		$("#createtime-timeH").omCalendar({
			disabledFn : dadaDisFn
		});
		$("#examineTime-timeH").omCalendar({
			disabledFn : dadaDisFn
		});
		// 鼠标悬浮在面板头显示的信息
		$('.om-panel-title').omTooltip({
			html : '可以通过单击，展开高级搜索面板哦'
		});
		
		// 搜索按钮
		$('#activityMonkeyQ-button-search').omButton({
			icons : {
				left : '/resources/operamasks-ui/themes/default/images/search.png'
			},
			width : 70
		});
		
		/** 搜索按钮点击 */
		$("#activityMonkeyQ-button-search").click(
			function() {
				var ajaxbg = $("#background,#progressBar");
				ajaxbg.show();
				var url = encodeURI("/activityMonkey/activityMonkeyQuery?" + $("#activityMonkeyQSearchForm").serialize());
				$('#activityMonkeyQueryGride').omGrid('setData', url);
			});
});

/**** 导出excel***/
function activityMonkeyQCashFile() {
	var messgae = "是否导出金猴活动统计明细到excel？";
	var url = encodeURI("/activityMonkey/outLoanrecordExcel?" + $("#activityMonkeyQSearchForm").serialize());
	// 判断用户是否选中数据
	alertMsg.confirm(messgae, {
		okCall : function() {
			window.location.href = url;
		}
	});

}