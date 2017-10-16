$(document).ready(
	function() {
		// 数据显示列表相关
		$('#concertActivitiesGride').omGrid({
			dataSource : '/concertActivities/concertActivitiesDetailQuery',
			title : '演唱会活动统计',
			height : 500,
			limit : 50,
			colModel : [{	
				header : '用户名',
				name : 'userName',
				align : 'center',
				width : 120
			},{
				header : '真实姓名',
				name : 'name',
				align : 'center',
				width : 100
			}, {
				header : '手机号',
				name : 'mobilePhone',
				align : 'center',
				width : 145
			},{
				header : '注册时间',
				name : 'createTime',
				align : 'center',
				width : 150
			}, {
				header : '认购金额',
				name : 'tenderMoney',
				align : 'center',
				width : 120
			},{
				header : '认购时间',
				name : 'tenderTime',
				align : 'center',
				width : 150
			} , {
				header : '认购产品',
				name : 'loanSignName',
				align : 'center',
				width : 150
			},{
				header : '门票张数',
				name : 'ticketNumber',
				align : 'center',
				width : 100,
				renderer : function(v, rowData, rowIndex) {
					if(v == 1){
						return "1张";
					}else if(v == 2){
						return "2张";
					}
				}
			},{
				header : '注册渠道',
				name : 'registerSource',
				align : 'center',
				width : 100
			}]
		});
		
		var dadaDisFn = function disFn(date) {
			var nowMiddle = new Date();
			if (date > nowMiddle) {
				return false;
			}
		};
		// 注册时间
		$("#startTime").omCalendar({
			disabledFn : dadaDisFn
		});
		$("#stopTime").omCalendar({
			disabledFn : dadaDisFn
		});
		
		// 搜索按钮
		$('#concertActivities-button-search').omButton({
			icons : {
				left : '/resources/operamasks-ui/themes/default/images/search.png'
			},
			width : 70
		});
		
		
		/** 搜索按钮点击 */
		$("#concertActivities-button-search").click(
				function() {
					var ajaxbg = $("#background,#progressBar");
					ajaxbg.show();
					var url = encodeURI("/concertActivities/concertActivitiesDetailQuery?" + $("#concertActivitiesSearchForm").serialize());
					        $('#concertActivitiesGride').omGrid('setData', url);
				});
});

/**** 导出excel***/
function concertActivitiesCashFile() {
	var messgae = "是否导出演唱会活动统计到excel？";
	var url = encodeURI("/concertActivities/outConcertDetailExcel?" + $("#concertActivitiesSearchForm").serialize());
	// 判断用户是否选中数据
	alertMsg.confirm(messgae, {
		okCall : function() {
			window.location.href = url;
		}
	});
}



