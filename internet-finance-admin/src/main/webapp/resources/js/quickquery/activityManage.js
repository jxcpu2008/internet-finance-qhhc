$(document).ready(
	function() {
		// 数据显示列表相关
		$('#activityManageGride').omGrid({
			dataSource : '/activityManage/firstInvestStaticsQuery',
			title : '首投活动统计',
			height : 400,
			limit : 40,
			colModel : [{	
				header : '首投用户名',
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
				header : '认购时间',
				name : 'tenderTime',
				align : 'center',
				width : 150
			}, {
				header : '认购金额',
				name : 'tenderMoney',
				align : 'center',
				width : 120
			}, {
				header : '认购产品',
				name : 'loanSignName',
				align : 'center',
				width : 150
			},{
				header : '产品属性',
				name : 'subType',
				align : 'center',
				width : 100,
				renderer: function(v,rowData,rowIndex){
					if(v == 1){
						return "优先";
					}else if(v ==2){
						return "夹层";
					}else if(v==3){
						return "列后";
					}else if(v==4){
						return "vip众筹";
					}else if(v==5){
						return "股东众筹";
					}
				}
			},{
				header : '奖励金额',
				name : 'rewardMoney',
				align : 'center',
				width : 100,
				renderer : function(v, rowData, rowIndex) {
					if (v == 10) {
						return "10元";
					} else if(v==30){
						return "30元";
					}else if(v==60){
						return "60元";
					}else{
						return "";
					}
				}
			},{
				header : '活动类型',
				name : 'type',
				align : 'center',
				width : 100,
				renderer : function(v,rowData,rowIndex){
					if(v == 14){
						return "5月首投活动";
					}else{
						return "";
					}
				}
			}]
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
		$("#tenderTimeActivity").omCalendar({
			disabledFn : dadaDisFn
		});
		
		// 搜索按钮
		$('#activityManage-button-search').omButton({
			icons : {
				left : '/resources/operamasks-ui/themes/default/images/search.png'
			},
			width : 70
		});
		
		
		/** 搜索按钮点击 */
		$("#activityManage-button-search").click(
			function() {
				var ajaxbg = $("#background,#progressBar");
				ajaxbg.show();
				var url = encodeURI("/activityManage/firstInvestStaticsQuery?" + $("#activityManageSearchForm").serialize());
				        $('#activityManageGride').omGrid('setData', url);
			});
});

/**** 导出excel***/
function activityManageCashFile() {
	var messgae = "是否导出首投活动统计到excel？";
	var url = encodeURI("/activityManage/outActivityManageExcel?" + $("#activityManageSearchForm").serialize());
	// 判断用户是否选中数据
	alertMsg.confirm(messgae, {
		okCall : function() {
			window.location.href = url;
		}
	});
}



