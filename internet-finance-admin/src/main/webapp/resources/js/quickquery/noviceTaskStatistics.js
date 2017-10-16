$(document).ready(
	function() {
		// 数据显示列表相关
		$('#noviceTaskStatisticGride').omGrid({
			dataSource : '/noviceTaskStatistics/noviceTaskStatisticsQuery',
			title : '新手任务统计',
			height : 400,
			showIndex:false,
			limit : 20,
			colModel : [{	
				header : '用户ID',
				name : 'id',
				align : 'center',
				width : 50
			},{	
				header : '用户名',
				name : 'userName',
				align : 'center',
				width : 100
			},{
				header : '真实姓名',
				name : 'name',
				align : 'center',
				width : 100
			}, {
				header : '手机号',
				name : 'mobilePhone',
				align : 'center',
				width : 120
			}, {
				header : '注册时间',
				name : 'createTime',
				align : 'center',
				width : 150
			}, {
				header : '宝付授权状态',
				name : 'isAuthIps',
				align : 'center',
				width : 120,
				renderer: function(v,rowData,rowIndex){
					if(v == 0){
						return "等待确认";
					}else if(v ==1){
						return "是";
					}else if(v==-1){
						return "失败";
					}else{return "";}
				}
			}, {
				header : '推荐人用户名',
				name : 'recommendUserName',
				align : 'center',
				width : 120,
			}, {
				header : '推荐人真实姓名',
				name : 'recommendName',
				align : 'center',
				width : 100
			}, {
				header : '推荐人部门',
				name : 'department',
				align : 'center',
				width : 150,
				renderer:function(v,rowData,rowIndex){
					if(v == 1){
						return "总裁办";
					}else if(v ==2){
						return "财务部";
					}else if(v==3){
						return "行政部";
					}else if(v==4){
						return "副总办";
					}else if(v==5){
						return "运营中心";
					}else if(v ==6){
						return "培训部";
					}else if(v == 7){
						return "风控部";
					}else if(v==8){
						return "IT部";
					}else if(v==9){
						return "摄影部";
					}else if(v ==10){
						return "推广部";
					}else if(v == 11){
						return "项目部";
					}else if(v==12){
						return "客服部";
					}else if(v==13){
						return "事业一部";
					}else if(v ==14){
						return "事业二部";
					}else if(v == 15){
						return "离职员工";
					}else{return "无";}
				}
			}, {
				header : '来源',
				name : 'registerSource',
				align : 'center',
				width : 100,
				renderer: function(v,rowData,rowIndex){
					if(v == 1){
						return "PC";
					}else if(v ==2){
						return "H5";
					}else if(v==8){
						return "android";
					}else if(v==9){
						return "ios";
					}else{return "";}
				}
			}, {
				header : '任务完成进度',
				name : 'taskCompleteSchedule',
				align : 'center',
				width : 120,
				renderer: function(v,rowData,rowIndex){
					if(v == 1){
						return "已完成";
					}else if(v ==2){
						return "未完成";
					}
				}
			}],
		// 选中事件
		onRowSelect : function(index, rowData, event) {
			// 取到该行id值
			var id = rowData["id"];
			taskCompletionScheduleGride(id);
		}
		});
		

		var dadaDisFn = function disFn(date) {
			var nowMiddle = new Date();
			if (date > nowMiddle) {
				return false;
			}
		};
		// 注册时间
		$("#beginTime").omCalendar({
			disabledFn : dadaDisFn
		});
		$("#endTime").omCalendar({
			disabledFn : dadaDisFn
		});
	
		
		// 搜索按钮
		$('#noviceTaskStatistic-button-search').omButton({
			icons : {
				left : '/resources/operamasks-ui/themes/default/images/search.png'
			},
			width : 70
		});
		
		/** 搜索按钮点击 */
		/** 搜索按钮点击 */
		$("#noviceTaskStatistic-button-search").click(
			function() {
				var ajaxbg = $("#background,#progressBar");
				ajaxbg.show();
				var url = encodeURI("/noviceTaskStatistics/noviceTaskStatisticsQuery?" + $("#noviceTaskStatisticSearchForm").serialize());
				        $('#noviceTaskStatisticGride').omGrid('setData', url);
			});
});


/** **************数据源************* */
//任务完成速度表
var taskCompletionScheduleGride = function(id) {
	$("#taskCompletionScheduleGride").omGrid({
		dataSource : "/noviceTaskStatistics/taskTailList?id=" + id,
		height : 360,
		limit : 10,
		title : '任务完成进度',
		colModel : [ {
			header : '任务进度',
			name : 'taskProgress',
			width : 120,
			align : 'center'
		}, {
			header : '完成时间',
			name : 'completeTime',
			width : 200,
			align : 'center'
		}, {
			header : '获得奖励',
			name : 'prizeDetail',
			width : 380,
			align : 'center'
		}, {
			header : '奖励领取',
			name : 'receiveStus',
			width : 150,
			align : 'center'
		},{
			header : '领取时间',
			name : 'receiveTime',
			width : 150,
			align : 'center'
		} ]
	})
};


/**** 导出excel***/
function noviceTaskStatisticCashFile() {
	var messgae = "是否导出新手任务统计功能到excel？";
	var url = encodeURI("/noviceTaskStatistics/outNoviceTaskExcel?" + $("#noviceTaskStatisticSearchForm").serialize());
	// 判断用户是否选中数据
	alertMsg.confirm(messgae, {
		okCall : function() {
			window.location.href = url;
		}
	});
}
taskCompletionScheduleGride(-1);