$(document).ready(function() {
					// 数据源面板
					$('#myUserHccoindetailList').omGrid({
						dataSource : '/hccoindetailQuery/userHccoindetailList',
						height : 336,
						limit : 10,
						colModel : [ {
							header : '序号',
							name : 'id',
							width : 50,
							align : 'center'
						}, {
							header : '员工姓名',
							name : 'name',
							width : 80,
							align : 'center'
						}, {
							header : '推荐注册人数',
							name : 'countgen',
							align : 'center',
							width : 80
						}, {
							header : '已认证注册人数',
							name : 'isAuthIpsCount',
							align : 'center',
							width : 90
						},{
							header : '推荐总投资额',
							name : 'sumtendermoney',
							align : 'center',
							width : 80
						}, {
							header : '所得红筹币数',
							name : 'sumnumber',
							width : 100,
							align : 'center'
						},  {
							header : '微课堂',
							name : 'sumwkt',
							width : 80,
							align : 'center'
						}, {
							header : '全勤奖',
							name : 'sumqqj',
							width : 80,
							align : 'center'
						}, {
							header : '图书馆',
							name : 'sumtsg',
							align : 'center',
							width : 80
						}, {
							header : '活动奖励',
							name : 'sumhdjl',
							align : 'center',
							width : 80
						},{
							header : '拍卖会',
							name : 'sumpmh',
							align : 'center',
							width : 80
						},{
							header : '其他',
							name : 'sumqt',
							align : 'center',
							width : 80
						} , {
							header : '红筹币总数',
							name : 'sumzs',
							align : 'center',
							width : 80
						} ,{
							header : '操作',
							name : 'id',
							align : 'center',
							width : 80,
							renderer : function(v, rowData, rowIndex) {
								return "<a class='edit'  style='color:red' onclick=openSaveHccoindetail("+rowData["id"]+") >编辑</a> <a class='edit'  style='color:red' onclick=openHccoindetailExcel("+rowData["id"]+") >导出</a>"
							}
						}],

						// 选中事件
						onRowSelect : function(index, rowData, event) {
							// 取到该行id值
							var id = rowData["id"];
							myGridHccoindetail(id);
						}
					});
					// 搜索面板
					$("#myHccoindetail-search-panel").omPanel({
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
					
					var disFn = function disFn(date) {
						var nowMiddle = new Date();
						if (date > nowMiddle) {
							return false;
						}
					};
					// 注册时间
					$("#start-timeH").omCalendar({
						disabledFn : disFn
					});
					$("#end-timeH").omCalendar({
						disabledFn : disFn
					});

					// 鼠标悬浮在面板头显示的信息
					$('.om-panel-title').omTooltip({
						html : '可以通过单击，展开高级搜索面板哦'
					});
					// 搜索按钮
					$('#myHccoindetail-button-search')
							.omButton(
									{
										icons : {
											left : '/resources/operamasks-ui/themes/default/images/search.png'
										},
										width : 70
									});

		
					$("#myHccoindetail-button-search").click(
							function() {
								var ajaxbg = $("#background,#progressBar");
								ajaxbg.show();
								var url = encodeURI("/hccoindetailQuery/userHccoindetailList?"+ $("#myHccoindetailsearchfrom").serialize());
								$('#myUserHccoindetailList').omGrid('setData', url);
							});

				});
/** **************数据源************* */
// 加载出借记录列表
var myGridHccoindetail = function(id) {
	$("#myGridHccoindetail").omGrid({
		dataSource : "/hccoindetailQuery/hccoindetailList?id=" + id,
		height : 360,
		limit : 10,
		title : '操作记录',
		colModel : [ {
			header : '真实用户名',
			name : 'name',
			width : 120,
			align : 'center'
		}, {
			header : '操作时间',
			name : 'receiveTime',
			width : 200,
			align : 'center'
		}, {
			header : '操作事由',
			name : 'remark',
			width : 150,
			align : 'center'
		}, {
			header : '红筹币增减',
			name : 'number',
			width : 150,
			align : 'center'
		} ]
	})
};





// 导出
$("#outUserHccoindetail-excel").click(function() {
					var messgae = "是否导出所有员工的红筹币到excel？";
					var url = encodeURI("/hccoindetailQuery/outUserHccoindetail?"+ $("#myHccoindetailsearchfrom").serialize());
					// 判断用户是否选中数据
					alertMsg.confirm(messgae, {
						okCall : function() {
							window.location.href = url;
							selectIds = [];
							$("#myUserHccoindetailList").omGrid("setSelections",selectIds);
						}
					});
				});

/**
 * 导出个人红筹币明细信息
 * @param v
 */
function openHccoindetailExcel(v){
	if(v!=null){
		window.location.href = "/hccoindetailQuery/outPutHccoindetailExcel?userId="+ v;
	}else{
		alertMsg.info("请选择一条信息进行导出");
	}
};

/***
 * 编辑
 * @param v
 */
function openSaveHccoindetail(v){
	if(v!=null){
		$.pdialog.open('/hccoindetailQuery/queryUser?userId='+v ,
				'addHccoindetail', '编辑红筹币', {
					width : 500,
					height : 220
				});
	}else{
		alertMsg.info("请选择一条信息进行导出");
	}
};


myGridHccoindetail(0);