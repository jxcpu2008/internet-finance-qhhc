$(document).ready(
	   function() {
					var id = 0;
					// 查询面板初始化
					$("#customerGRegister-search-panel").omPanel({
						title : "高级搜索",
						collapsible : true,
						width : 'fit'
					});
					$('span#customerGRegisterList-button-search').omButton({
										icons : {
											left : '/resources/operamasks-ui/themes/default/images/search.png'
										},
										width : 70
									});

					$("#customerGRegister").omGrid({
										dataSource : '/customerDate/customerGRegisterList',
										title : '推荐注册信息',
										height : 550,
										limit : 20,
										colModel : [
												{
													header : '推荐人',
													name : 'name',
													width : 150,
													align : 'center'
												},
												{
													header : '被推荐人',
													name : 'userName',
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
					$("#customerGRegister-search-panel").omPanel({
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
					$("#start-time-registerG").omCalendar({
						editable : false,
						disabledFn : disFn
					});
					$("#end-time-registerG").omCalendar({
						editable : false,
						disabledFn : disFn
					});
					
					
					 $("#customerGRegisterCom").omCombo({
							width : 150,
							forceSelection:true,
							editable : false,
							value:'2',
						   dataSource : [ 
                                                {text : '会员推荐人注册明细', value : '1'},
								                {text : '员工推荐人注册明细', value : '2'},
								                {text : '居间人推荐注册明细', value : '4'}
								                
						                 ]
					});

					$("#customerGRegisterList-button-search").click(
									function() {
										var ajaxbg = $("#background,#progressBar");
										ajaxbg.show();
										var url = encodeURI("/customerDate/customerGRegisterList?"+ $("#customerGRegisterListSearchFrom").serialize());
										$('#customerGRegister').omGrid('setData', url);
									});
					
					var relaodFileTable = function() {
						$('#customerGRegister').omGrid('reload');
						return true;
					};

});

// 导出
$("#outCustomerGRegister").click(function() {
			var messgae = "是否导出记录到excel？";
			var url = "/customerDate/toExcelGUserbasicsinfo?"+ $("#customerGRegisterListSearchFrom").serialize();
			// 判断用户是否选中数据
			alertMsg.confirm(messgae, {
				okCall : function() {
					window.location.href = url;
					selectIds = [];
					$("#customerRegister").omGrid("setSelections", selectIds);
				}
			});
	})