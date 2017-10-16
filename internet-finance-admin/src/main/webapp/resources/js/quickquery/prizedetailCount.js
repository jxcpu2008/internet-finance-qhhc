$(document).ready(
	function() {
		// 数据显示列表相关
		$('#prizedetailCountGride').omGrid({
			dataSource : '/prizedetailCount/prizedetailCountQuery',
			title : '攀爬活动统计',
			height : 520,
			limit : 20,
			colModel : [ {
				header : '真实姓名',
				name : 'name',
				align : 'center',
				width : 100
			}, {
				header : '手机号码',
				name : 'phone',
				align : 'center',
				width : 150
			}, {
				header : '投资累计金额',
				name : 'tenderMoney',
				align : 'center',
				width : 150
			}, {
				header : '奖品/奖金',
				name : 'prizeType',
				align : 'center',
				width : 150,
				renderer : function(v, rowData, rowIndex) {
					if (v == 13) {
						return "50元京东购物卡";
					} else if(v==14){
						return "飞利浦电动牙刷";
					}else if(v==15){
						return "富士相机";
					}else if(v==16){
						return "小米套装";
					}else if(v==8){
						return "10元红包";
					}
				}
			},{
				header : '获奖时间',
				name : 'receiveTime',
				align : 'center',
				width : 150
			}]
		});
		
		// 搜索面板
		$("#prizedetailCount-search-panel").omPanel({
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
		$("#authIpsTimePrizedetail").omCalendar({
			disabledFn : dadaDisFn
		});
		$("#loginTimePrizedetail").omCalendar({
			disabledFn : dadaDisFn
		});
		
		// 搜索按钮
		$('#prizedetailCount-button-search').omButton({
			icons : {
				left : '/resources/operamasks-ui/themes/default/images/search.png'
			},
			width : 70
		});
		
		/** 搜索按钮点击 */
		$("#prizedetailCount-button-search").click(
			function() {
				var ajaxbg = $("#background,#progressBar");
				ajaxbg.show();
				var url = encodeURI("/prizedetailCount/prizedetailCountQuery?" + $("#prizedetailCountSearchForm").serialize());
				        $('#prizedetailCountGride').omGrid('setData', url);
			});
});

/**** 导出excel***/
function prizedetailCountCashFile() {
	var messgae = "是否导出攀爬活动统计到excel？";
	var url = encodeURI("/prizedetailCount/outPrizedetailCountExcel?" + $("#prizedetailCountSearchForm").serialize());
	// 判断用户是否选中数据
	alertMsg.confirm(messgae, {
		okCall : function() {
			window.location.href = url;
		}
	});
}

