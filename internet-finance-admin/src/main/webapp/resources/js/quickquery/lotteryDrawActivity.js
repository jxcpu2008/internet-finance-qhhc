$(document).ready(
	function() {
		// 数据显示列表相关
		$('#lotteryDrawActivityGride').omGrid({
			dataSource : '/lotteryDrawActivity/lotteryDrawActivityQuery',
			title : '抽奖排位活动统计',
			height : 520,
			limit : 20,
			colModel : [ {
				header : '真实姓名',
				name : 'userName',
				align : 'center',
				width : 100
			}, {
				header : '用户名',
				name : 'realName',
				align : 'center',
				width : 100
			}, {
				header : '手机号码',
				name : 'phone',
				align : 'center',
				width : 150
			}, {
				header : '类型',
				name : 'type',
				align : 'center',
				width : 150,
				renderer : function(v, rowData, rowIndex) {
					if (v == 4) {
						return "红包";
					} else if(v==11){
						return "现金";
					}else if(v==12){
						return "一鸣惊人";
					}else if(v==13){
						return "一锤定音";
					}else{
						return "加息";
					}
				}
			},{
				header : '奖品/奖金',
				name : 'rewardMoney',
				align : 'center',
				width : 150
			},{
				header : '项目名称',
				name : 'loanName',
				align : 'center',
				width : 150
			},{
				header : '获奖时间',
				name : 'createTime',
				align : 'center',
				width : 150
			}]
		});
		
		// 搜索面板
		$("#lotteryDrawActivity-search-panel").omPanel({
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
		$("#createTimeActivity").omCalendar({
			disabledFn : dadaDisFn
		});
		$("#examineTimeActivity").omCalendar({
			disabledFn : dadaDisFn
		});
		
		// 搜索按钮
		$('#lotteryDrawActivity-button-search').omButton({
			icons : {
				left : '/resources/operamasks-ui/themes/default/images/search.png'
			},
			width : 70
		});
		
		/** 搜索按钮点击 */
		$("#lotteryDrawActivity-button-search").click(
			function() {
				var ajaxbg = $("#background,#progressBar");
				ajaxbg.show();
				var url = encodeURI("/lotteryDrawActivity/lotteryDrawActivityQuery?" + $("#lotteryDrawActivitySearchForm").serialize());
				        $('#lotteryDrawActivityGride').omGrid('setData', url);
			});
});

/**** 导出excel***/
function lotteryDrawActivityCashFile() {
	var messgae = "是否导出抽奖排位活动统计到excel？";
	var url = encodeURI("/lotteryDrawActivity/outLotteryDrawActivityExcel?" + $("#lotteryDrawActivitySearchForm").serialize());
	// 判断用户是否选中数据
	alertMsg.confirm(messgae, {
		okCall : function() {
			window.location.href = url;
		}
	});
}

