$(document).ready(
	function() {
		var mobilePhone=$("#mobilePhone").val();
		// 数据显示列表相关
		$('#mayTopListStaticsGride').omGrid({
			dataSource : '/activityManage/mayTopListStaticsQuery',
			title : '5月榜单统计',
			height : 400,
			limit : 90,
			method : 'POST',
			showIndex : false,
			emptyMsg : '暂时还没有您想要的数据',
			singleSelect : true,
			colModel : [{	
				header : '名次',
				name : 'ranking',
				align : 'center',
				width : 80
			},{
				header : '用户名 ',
				name : 'userName',
				align : 'center',
				width : 120
			}, {
				header : '真实姓名',
				name : 'name',
				align : 'center',
				width : 140
			},{
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
				header : '累计认购金额',
				name : 'weekMoney',
				align : 'center',
				width : 120
			}, {
				header : '累计认购年化金额',
				name : 'weekYearMoney',
				align : 'center',
				width : 150
			},{
				header : '奖励',
				name : 'rewardMoney',
				align : 'center',
				width : 200
			},{
				header : '获奖时间',
				name : 'weekNum',
				align : 'center',
				width : 206,
				renderer : function(v, rowData, rowIndex) {
					if (v == 1) {
						return "第一周";
					} else if(v==2){
						return "第二周";
					}else if(v==3){
						return "第三周";
					}else if(v==4){
						return "第四周";
					}else if(v==5){
						return "第五周";
					}else if(v==6){
						return "第六周";
					}else if(v==7){
						return "第七周";
					}else if(v==8){
						return "第八周";
					}else if(v==9){
						return "总榜";
					}
				}	
			}]
		});
	
		// 搜索按钮
		$('#mayTopListStatics-button-search').omButton({
			icons : {
				left : '/resources/operamasks-ui/themes/default/images/search.png'
			},
			width : 70
		});
		
		
		/** 搜索按钮点击 */
		$("#mayTopListStatics-button-search").click(
			function() {
				var ajaxbg = $("#background,#progressBar");
				ajaxbg.show();
				var url = encodeURI("/activityManage/mayTopListStaticsQuery?" + $("#mayTopListStaticsSearchForm").serialize());
				        $('#mayTopListStaticsGride').omGrid('setData', url);
			});
		
});

/**** 导出excel***/
function mayTopListStaticsCashFile() {
	var messgae = "是否导出5月榜单到excel？";
	var url = encodeURI("/activityManage/outMayTopExcel?" + $("#mayTopListStaticsSearchForm").serialize());
	// 判断用户是否选中数据
	alertMsg.confirm(messgae, {
		okCall : function() {
			window.location.href = url;
		}
	});
}
