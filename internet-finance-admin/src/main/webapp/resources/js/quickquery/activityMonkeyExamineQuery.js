$(document).ready(
	function() {
		// 数据显示列表相关
		$('#activityMExamineQueryGride').omGrid({
			dataSource : '/activityMonkey/activityMExamineQuery',
			title : '红筹理财师统计',
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
				header : '宝付授权状态',
				name : 'isAuthIps',
				align : 'center',
				width : 120,
				renderer : function(v, rowData, rowIndex) {
					if (v == 1) {
						return "已授权";
					}  else if (v == 0) {
						return "待授权";
					}  else if (v == 2) {
						return "授权失败";
					}
				}
			}, {
				header : '推荐投资金额',
				name : 'money',
				align : 'center',
				width : 200
			},  {
				header : '已达现金奖励标准',
				name : 'rewardMoney',
				align : 'center',
				width : 150
			}, {
				header : '注册时间',
				name : 'createTime',
				align : 'center',
				width : 150
			}, {
				header : '渠道来源',
				name : 'channelName',
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
		$("#activityMExamine-search-panel").omPanel({
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
		$("#createTimeMExamine").omCalendar({
			disabledFn : dadaDisFn
		});
		$("#examineTimeMExamine").omCalendar({
			disabledFn : dadaDisFn
		});
		// 鼠标悬浮在面板头显示的信息
		$('.om-panel-title').omTooltip({
			html : '可以通过单击，展开高级搜索面板哦'
		});
		
		// 搜索按钮
		$('#activityMExamine-button-search').omButton({
			icons : {
				left : '/resources/operamasks-ui/themes/default/images/search.png'
			},
			width : 70
		});
		
		/** 搜索按钮点击 */
		$("#activityMExamine-button-search").click(
			function() {
				var ajaxbg = $("#background,#progressBar");
				ajaxbg.show();
				var url = encodeURI("/activityMonkey/activityMExamineQuery?" + $("#activityMExamineSearchForm").serialize());
				$('#activityMExamineQueryGride').omGrid('setData', url);
			});
});

/**** 导出excel***/
function activityMExamineCashFile() {
	var messgae = "是否导出红筹理财师活动数据明细到excel？";
	var url = encodeURI("/activityMonkey/outActivityMExamineExcel?" + $("#activityMExamineSearchForm").serialize());
	// 判断用户是否选中数据
	alertMsg.confirm(messgae, {
		okCall : function() {
			window.location.href = url;
		}
	});

}