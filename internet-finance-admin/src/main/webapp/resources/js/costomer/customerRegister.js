$(document).ready(
	   function() {
					var id = 0;
					// 查询面板初始化
					$("#customerRegister-search-panel").omPanel({
						title : "高级搜索",
						collapsible : true,
						width : 'fit'
					});
					$('span#customerRegisterList-button-search').omButton({
										icons : {
											left : '/resources/operamasks-ui/themes/default/images/search.png'
										},
										width : 70
									});

					$("#customerRegister").omGrid({
										dataSource : '/customerDate/customerRegisterList',
										title : '注册信息',
										height : 550,
										limit : 20,
										colModel : [
												{
													header : '用户名',
													name : 'userName',
													width : 150,
													align : 'center'
												},
												{
													header : '真实姓名',
													name : 'name',
													width : 150,
													align : 'center'
												},
												{
													header : '注册日期',
													name : 'createTime',
													align : 'center',
													width : 150
												},
												{
													header : '渠道来源',
													name : 'channelName',
													width : 150,
													align : 'center'
												}]
									});

					// 搜索面板
					$("#customerRegister-search-panel").omPanel({
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

					// 鼠标悬浮在面板头显示的信息
					$('.om-panel-title').omTooltip({
						html : '可以通过单击，展开高级搜索面板哦'
					});

					var disFn = function disFn(date) {
						var nowMiddle = new Date();
						if (date > nowMiddle) {
							return false;
						}
					};
					// 注册时间
					$("#start-time-register").omCalendar({
						editable : false,
						disabledFn : disFn
					});
					$("#end-time-register").omCalendar({
						editable : false,
						disabledFn : disFn
					});
					
					
					 $("#customerRegisterCom").omCombo({
							width : 150,
							forceSelection:true,
							editable : false,
							value:'2',
						   dataSource : [ 
                                          {text : '会员注册明细', value : '1'},
						                  {text : '员工注册明细', value : '2'},
						                  {text : '居间人注册明细', value : '4'}
						             ]
					});

					$("#customerRegisterList-button-search").click(
									function() {
										var ajaxbg = $("#background,#progressBar");
										ajaxbg.show();
										var url = encodeURI("/customerDate/customerRegisterList?"+ $("#customerRegisterListSearchFrom").serialize());
										$('#customerRegister').omGrid('setData', url);
									});
					
					var relaodFileTable = function() {
						$('#customerRegister').omGrid('reload');
						return true;
					};

});

// 导出
$("#outCustomerRegister").click(function() {
			var messgae = "是否导出记录到excel？";
			var url = "/customerDate/toExcelUserbasicsinfo?"+ $("#customerRegisterListSearchFrom").serialize();
			// 判断用户是否选中数据
			alertMsg.confirm(messgae, {
				okCall : function() {
					window.location.href = url;
					selectIds = [];
					$("#customerRegister").omGrid("setSelections", selectIds);
				}
			});
	})