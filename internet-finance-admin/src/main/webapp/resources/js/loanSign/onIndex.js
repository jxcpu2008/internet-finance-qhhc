$(document)
		.ready(
				function() {

					// 数据源面板
					$('#myLoansignOnIndex').omGrid({
						dataSource : '/loanSign/allLoanlistOnIndex',
						title : '项目众持列表',
						height : 360,
						limit : 10,
						colModel : [ {
							header : '序号',
							name : 'id',
							width : 50,
							align : 'center'
						}, {
							header : '项目名称',
							name : 'xname',
							width : 200,
							align : 'center'
						}, {
							header : '项目类型',
							name : 'type',
							align : 'center',
							width : 100,
							renderer : function(v, rowData, rowIndex) {
								if(v==2){
									return "普通众持";
								}else{
									return "短期众持";
								}
						   }
						}, {
							header : '借款人',
							name : 'uname',
							align : 'center',
							width : 100
						}, {
							header : '借款金额',
							name : 'issueLoan',
							width : 150,
							align : 'center'
						}, {
							header : '借款利率',
							name : 'realRate',
							width : 100,
							align : 'center',
							renderer : function(v, rowData, rowIndex) {
								return v * 100 + "%";
							}
						}, {
							header : '发布时间',
							name : 'releaseTime',
							align : 'center',
							width : 150
						}, {
							header : '回购期限',
							name : 'remonth',
							width : 50,
							align : 'center'
						},{
							header : '热门推荐',
							name : 'recommend',
							align : 'center',
							width : 60,
							renderer : function(v, rowData, rowIndex) {
								if (v == 0) {
									return "不推荐";
								} else if (v == 1) {
									return "推荐";
								}
							}
						}, {
							header : '首页推荐',
							name : 'onIndex',
							align : 'center',
							width : 60,
							renderer : function(v, rowData, rowIndex) {
								if (v == 0) {
									return "不推荐";
								} else if (v == 1) {
									return "推荐";
								}
							}
						}, {
							header : '操作',
							name : 'id',
							align : 'center',
							width : 100,
							renderer : function(v, rowData, rowIndex) {
								return "<a class='edit'  style='color:red' onclick=openUserQuickQuery("+rowData["id"]+") >查看详情</a>"
							}
						} ],

						// 选中事件
						onRowSelect : function(index, rowData, event) {
							// 取到该行id值
							var id = rowData["id"];
							myGridRecord(id);
						}
					});
					// 搜索面板
					$("#myloanlistOnIndex-search-panel").omPanel({
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
					// 搜索按钮
					$('#myloanlistOnIndex-button-search')
							.omButton(
									{
										icons : {
											left : '/resources/operamasks-ui/themes/default/images/search.png'
										},
										width : 70
									});

					// 借款金额查询
					$("#issueLoanfindOnIndex").omCombo({
						width : 120,
						forceSelection : true,
						dataSource : [ {
							text : '全部',
							value : '0'
						}, {
							text : '100000以内',
							value : '1'
						}, {
							text : '100000~1000000',
							value : '2'
						}, {
							text : '1000000以上',
							value : '3'
						} ]
					});
					$("#typefindOnIndex").omCombo({
						width : 70,
						forceSelection : true,
						dataSource : [ {
							text : '全部',
							value : '0'
						}, {
							text : '普通众持',
							value : '2'
						}, {
							text : '短期众持',
							value : '3'
						}

						]
					});
					
					$("#OnIndexType").omCombo({
						width : 70,
						forceSelection : true,
						dataSource : [ {
							text : '全部',
							value : '2'
						}, {
							text : '推荐',
							value : '1'
						}, {
							text : '不推荐',
							value : '0'
						}
						]
					});
					
					
					$("#recommendfindOnIndex").omCombo({
						width : 70,
						forceSelection : true,
						dataSource : [ {
							text : '全部',
							value : '2'
						}, {
							text : '推荐',
							value : '1'
						}, {
							text : '不推荐',
							value : '0'
						}

						]
					});
					$("#myloanlistOnIndex-button-search").click(
							function() {
								var ajaxbg = $("#background,#progressBar");
								ajaxbg.show();
								var url = encodeURI("/loanSign/allLoanlistOnIndex?"
										+ $("#myloanlistOnIndexsearchfrom")
												.serialize());
								$('#myLoansignOnIndex').omGrid('setData', url);
							});
					
					$("#currentOnIndex").omGrid({
						dataSource : '/loanSign/allLoanlistOnIndexNot',
						title : '当前首页项目列表',
						height : 340,
						limit : 10,
						colModel : [ {
							header : '序号',
							name : 'id',
							width : 50,
							align : 'center'
						}, {
							header : '项目名称',
							name : 'xname',
							width : 200,
							align : 'center'
						}, {
							header : '项目类型',
							name : 'type',
							align : 'center',
							width : 100,
							renderer : function(v, rowData, rowIndex) {
								if(v==2){
									return "普通众持";
								}else{
									return "短期众持";
								}
						   }
						}, {
							header : '借款人',
							name : 'uname',
							align : 'center',
							width : 100
						}, {
							header : '借款金额',
							name : 'issueLoan',
							width : 150,
							align : 'center'
						}, {
							header : '借款利率',
							name : 'realRate',
							width : 100,
							align : 'center',
							renderer : function(v, rowData, rowIndex) {
								return v * 100 + "%";
							}
						}, {
							header : '发布时间',
							name : 'releaseTime',
							align : 'center',
							width : 150
						},{
							header : '回购期限',
							name : 'remonth',
							width : 50,
							align : 'center'
						},{
							header : '热门推荐',
							name : 'recommend',
							align : 'center',
							width : 60,
							renderer : function(v, rowData, rowIndex) {
								if (v == 0) {
									return "不推荐";
								} else if (v == 1) {
									return "推荐";
								}
							}
						}, {
							header : '首页推荐',
							name : 'onIndex',
							align : 'center',
							width : 60,
							renderer : function(v, rowData, rowIndex) {
								if (v == 0) {
									return "不推荐";
								} else if (v == 1) {
									return "推荐";
								}
							}
						}, {
							header : '操作',
							name : 'id',
							align : 'center',
							width : 100,
							renderer : function(v, rowData, rowIndex) {
								return "<a class='edit'  style='color:red' onclick=openUserQuickQuery("+rowData["id"]+") >查看详情</a>"
							}
						} ]
					});					

				});



/*******************************************************************************/


/**
 * 项目推荐
 */
$("#loanEndsOnIndex").click(
				function() {
					var selections = $('#myLoansignOnIndex').omGrid(
							'getSelections', true);
					// 判断是否选中
					if (selections == null || selections == ""
							|| selections == undefined || selections.length < 1) {
						alertMsg.info("请选择要推荐到首页列表的项目！");
					} else {
						// 得到选中的第一条记录
						var dataRow = selections[0];
						// 得到id
						var id = dataRow.id;
						alertMsg.confirm("您确定要推荐此项目到首页列表？", {
							okCall : function() {
								if (dataRow.onIndex == 1) {
									alertMsg.info("项目已经首页推荐！");
									return false;
								}
								$.ajax({
									url : '/loanSign/getOnIndex',
									data : 'id=' + id,
									type : 'post',
									success : function(msg) {
										$('#myLoansignOnIndex').omGrid('reload');// 刷新当前页数据
										$('#currentOnIndex').omGrid('reload');// 刷新当前页数据
										if (msg == 1) {
											alertMsg.info("首页推荐的项目已满，请先取消");
										} else if(msg==2){
											alertMsg.correct("推荐首页项目成功!");
										}else{
											alertMsg.correct("推荐首页项目失败!");
										}
									}
								});
							}
						});
					}
				});


//取消推荐
$("#loanEndsnotOnIndex")
		.click(
				function() {
					var selections = $('#currentOnIndex').omGrid('getSelections', true);
					// 判断是否选中
					if (selections == null || selections == ""
							|| selections == undefined || selections.length < 1) {
						alertMsg.info("请选择要取消首页推荐的项目！");
					} else {
						// 得到选中的第一条记录
						var dataRow = selections[0];
						// 得到id
						var id = dataRow.id;
						alertMsg.confirm("您确定要取消首页推荐的项目？", {
							okCall : function() {
								if (dataRow.onIndex == 0) {
									alertMsg.info("项目未推荐到首页！");
									return false;
								}
								$.ajax({
									url : '/loanSign/getOnIndexNot',
									data : 'id=' + id,
									type : 'post',
									success : function(msg) {
										$('#myLoansignOnIndex').omGrid('reload');// 刷新当前页数据
										$('#currentOnIndex').omGrid('reload');// 刷新当前页数据
										if (msg == 2) {
											alertMsg.correct("取消首页推荐成功");
										} else {
											alertMsg.info("取消首页推荐失败!");
										}
									}
								});
							}
						});
					}
				});


$("#recommandOnIndex")
.click(
		function() {
			var selections = $('#myLoansignOnIndex').omGrid(
					'getSelections', true);
			// 判断是否选中
			if (selections == null || selections == ""
					|| selections == undefined || selections.length < 1) {
				alertMsg.info("请选择要热门推荐的项目！");
			} else {
				// 得到选中的第一条记录
				var dataRow = selections[0];
				// 得到id
				var id = dataRow.id;
				alertMsg.confirm("您确定此项目为热门推荐？", {
					okCall : function() {
						if (dataRow.recommend == 1) {
							alertMsg.info("项目已经为热门推荐！");
							return false;
						}
						$.ajax({
							url : '/loanSign/toHotRecommend',
							data : 'id=' + id,
							type : 'post',
							success : function(msg) {
								$('#myLoansignOnIndex').omGrid('reload');// 刷新当前页数据
								$('#currentOnIndex').omGrid('reload');// 刷新当前页数据
								if (msg == 1) {
									alertMsg.info("热门推荐项目已满，请先取消");
								} else if(msg==2) {
									alertMsg.correct("热门推荐项目成功!");
								}else{
									alertMsg.correct("热门推荐项目失败!");
								}
							}
						});
					}
				});
			}
		});

$("#cancelrecommandOnIndex")
.click(
		function() {
			var selections = $('#currentOnIndex').omGrid(
					'getSelections', true);
			// 判断是否选中
			if (selections == null || selections == ""
					|| selections == undefined || selections.length < 1) {
				alertMsg.info("请选择要取消热门推荐的项目！");
			} else {
				// 得到选中的第一条记录
				var dataRow = selections[0];
				// 得到id
				var id = dataRow.id;
				alertMsg.confirm("您确定取消此项目为热门推荐？", {
					okCall : function() {
						if (dataRow.recommend == 0) {
							alertMsg.info("此项目未推荐为热门项目！");
							return false;
						}
						$.ajax({
							url : '/loanSign/toNotHotRecommend',
							data : 'id=' + id,
							type : 'post',
							success : function(msg) {
								$('#myLoansignOnIndex').omGrid('reload');// 刷新当前页数据
								$('#currentOnIndex').omGrid('reload');// 刷新当前页数据
								if (msg == 2) {
									alertMsg.correct("取消热门推荐项目成功!");
								} else {
									alertMsg.info("取消热门推荐项目失败！");
								}
							}
						});
					}
				});
			}
		});

function openUserQuickQuery(v){
	if(v!=null){
		// 打开编辑页面属性一次为
		navTab.openTab("queryloanSign","/loanSign/getLoansignInfo?id="+ v, {
					title : "查看详情",
					fresh : true
				});
	}else{
		alertMsg.info("请选择一条信息查看");
	}
};

// 初始化
myGridRecord(0);
