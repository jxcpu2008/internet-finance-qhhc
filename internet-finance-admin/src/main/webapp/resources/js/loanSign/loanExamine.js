$(document).ready(
				function() {
					/** 项目复制 */
					$("#isReplication").click(
							function() {
								// 获取选中记录
								var selections = $('#myGridExamine').omGrid('getSelections', true);
								// 判断是否选中
								if (selections == null || selections == "" || selections.length < 1) {
									alertMsg.info("请选择标信息！");
								} else if (selections.length > 1) {
									alertMsg.info("请选择一条信息查看！");
								} else {
									// 得到选中的第一条记录
									var dataRow = selections[0];
									// 项目id
									var id = dataRow.id;
									var xname = dataRow.xname;//项目名称
									alertMsg.confirm("确认复制&nbsp;&nbsp;&nbsp;&nbsp;" + xname, {
										okCall : function() {
											// 打开编辑页面属性一次为
											navTab.openTab("queryloanSign",
													"/loanSign/copyLoansign?id=" + selections[0].id, {
														title : "修改项目详情",
														fresh : true
													});
										}
									});
									setTimeout(function () {
										$('#myGridExamine').omGrid('reload');// 刷新当前页
									}, 2000);
								}
							});

					/**
					 * 修改项目
					 */
					$("#updateExample").click(
							function() {
								// 获取选中记录
								var selections = $('#myGridExamine').omGrid(
										'getSelections', true);
								// 判断是否选中
								if (selections == null || selections == ""
										|| selections.length < 1) {
									alertMsg.info("请选择标信息！");
								} else if (selections.length > 1) {
									alertMsg.info("请选择一条信息修改！");
								} else {
									// 打开编辑页面属性一次为
									navTab.openTab("queryloanSign",
											"/loanSign/seeDetails?operNumber=2&id="
													+ selections[0].id, {
												title : "修改项目详情",
												fresh : true
											});
								}
							});

					// 数据源面板
					$('#myGridExamine').omGrid({
						dataSource : '/loanSign/loansignExamine',
						title : '众持项目申请列表',
						height : 345,
						limit : 10,
						// autoFit:true,
						colModel : [ {
							header : '序号',
							name : 'id',
							width : 45,
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
							width : 80,
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
							width : 80
						},

						{
							header : '借款金额',
							name : 'loanmoney',
							align : 'center',
							width : 150
						}, {
							header : '优先年利率',
							name : 'prate',
							align : 'center',
							width : 100,
							renderer : function(v, rowData, rowIndex) {
								return v * 100 + "%";
							}
						}, {
							header : '拨款方式',
							name : 'getMoneyWay',
							align : 'center',
							width : 120,
							renderer : function(v, rowData, rowIndex) {
								return "一次性全额到账";
							}
						},  {
							header : '回购期限',
							name : 'month',
							align : 'center',
							width : 80
						},{
							header : '创建时间',
							name : 'createTime',
							align : 'center',
							width : 120

						}, {
							header : '审核状态',
							name : 'state',
							align : 'center',
							width : 100,
							renderer : function(v, rowData, rowIndex) {
								if (v == 0) {
									return "未提交";
								} else if (v == 1) {
									return "待审核";
								} else if (v == 2) {
									return "审核通过";
								} else if (v == 3) {
									return "审核不通过";
								}
							}
						} , {
							header : '操作',
							name : 'id',
							align : 'center',
							width : 100,
							renderer : function(v, rowData, rowIndex) {
								return "<a class='edit'  style='color:red' onclick=openUserQuickQuery("+rowData["id"]+") >查看详情</a>"
							}
						}],
						// 选中事件
						onRowSelect : function(index, rowData, event) {
							// 取到该行id值
							var id = rowData["id"];
							myAttachment(id);
						}
					});

					// 搜索面板
					$("#loanExamine-search-panel").omPanel({
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
					$('#loanExamine-button-search')
							.omButton(
									{
										icons : {
											left : '/resources/operamasks-ui/themes/default/images/search.png'
										},
										width : 70
									});

					$("#loanExamine-button-search")
							.click(
									function() {
										var ajaxbg = $("#background,#progressBar");
										ajaxbg.show();
										var url = encodeURI("/loanSign/loansignExamine?"
												+ $("#searchExaminefrom")
														.serialize());
										$('#myGridExamine').omGrid('setData',
												url);
									});
				});
// 控制时间控件可选择的范围
var disFn = function disFn(date) {
	var nowMiddle = new Date();
	if (date > nowMiddle) {
		return false;
	}
}
// 申请开始时间
$("#createTime").omCalendar({
	editable : false,
	disabledFn : disFn
});
// 申请结束时间
$("#creditTime").omCalendar({
	editable : false,
	disabledFn : disFn
});

function delConfirmMsg() {
	var selections = $('#myGridExamine').omGrid('getSelections', true);
	// 判断是否选中
	if (selections == null || selections == "" || selections == undefined
			|| selections.length < 1) {
		alertMsg.info("请选择信息！");
	} else {
		// 得到选中的第一条记录
		var dataRow = selections[0];
		// 得到id
		var id = dataRow.id;
		alertMsg.confirm("您确定要删除当前记录？", {
			okCall : function() {
				$.ajax({
					url : '/loanSign/deleteLoansign',
					data : 'id=' + id,
					type : 'post',
					success : function(msg) {
						if (msg == '0') {
							$('#myGridExamine').omGrid('reload');// 刷新当前页
							alertMsg.correct("删除成功");
						} else if (msg == '1') {
							alertMsg.info("删除失败！");
						} else if (msg == '2') {
							alertMsg.info("不允许删除！");
						}
					}
				});
			}
		});

	}
}

// 附件
var myAttachment = function(id) {
	$("#myAttachment").omGrid({
		dataSource : "/baseLoanSign/attachmentList?id=" + id,
		title : '附件信息',
		height : 320,
		limit : 10,
		colModel : [ {
			header : '编号',
			name : 'id',
			width : 35,
			align : 'center'
		}, {
			header : '附件原始名称',
			name : 'originalName',
			width : 150,
			align : 'center'
		}, {
			header : '附件名称',
			name : 'attachmentName',
			width : 250,
			align : 'center'
		}, {
			header : '附件类型',
			name : 'attachmentType',
			align : 'center',
			width : 120
		}, {
			header : '上传时间',
			name : 'uploadTime',
			width : 120,
			align : 'center'
		}, {
			header : '上传人',
			name : 'realname',
			width : 120,
			align : 'center'
		} ]
	});
};

myAttachment(0);

/**
 * 上传标图
 */
$("#addAttachmentIcon").click(
		function() {
			// 取到选中记录
			var selections = $('#myGridExamine').omGrid('getSelections', true);
			// 判断是否选中
			if (selections == null || selections == ""
					|| selections == undefined || selections.length < 1) {
				alertMsg.info("请选择信息！");
			} else {
				// 得到选中的第一条记录
				var dataRow = selections[0];
				// 得到id
				var id = dataRow.id;
				$.pdialog.open("/attachment/openAddPage?id=" + id, "dialog",
						"添加标图", {
							max : false,
							width : 520,
							height : 380,
							mask : true,
							close : relaodFileTable
						});
			}
		});

var relaodFileTable = function() {
	$('#myAttachment').omGrid('reload');
	return true;
}

$("#deleteAttachment").click(
		function() {
			// 取到选中记录
			var selections = $('#myAttachment').omGrid('getSelections', true);
			// 判断是否选中
			if (selections == null || selections == ""
					|| selections == undefined || selections.length < 1) {
				alertMsg.info("请选择信息！");
			} else {
				// 得到选中的第一条记录
				var dataRow = selections[0];
				// 得到id
				var id = dataRow.id;
				alertMsg.confirm("您确定要删除当前记录？", {
					okCall : function() {
						$.ajax({
							url : '/attachment/delAttachment',
							data : 'id=' + id,
							type : 'post',
							success : function(msg) {
								if (msg) {
									$('#myAttachment').omGrid('reload');// 刷新当前页
									alertMsg.correct("删除成功");
								} else {
									alertMsg.info("删除失败！");
								}
							}
						});
					}
				});
			}
		});

$("#isPass").click(
		function() {
			var ids = "";
			// 获取选中行数据
			var selectedRecords = $('#myGridExamine').omGrid('getSelections',
					true);
			// 判断用户是否选中数据
			if (selectedRecords == null || selectedRecords == ""
					|| selectedRecords == undefined
					|| selectedRecords.length < 1) {
				alertMsg.info("请选择信息！");
			} else {
				alertMsg.confirm("是否同意选中的项目申请审核?", {
					okCall : function() {
						for ( var i in selectedRecords) {
							if (selectedRecords[i].state == 1) {
								ids += selectedRecords[i].id + ",";
							} else {
								alertMsg.info("存在提交过审核记录，不能重复提交！");
								return false;
							}
						}
						$.pdialog.open('/loanSign/queryLoanExamine?id=' + ids,
								'addExamine', '新增借款人利率', {
									width : 800,
									height : 420
								});
					}
				});
			}
		});

$("#notPass").click(function() {
	var ids = "";
	// 获取选中行数据
	var selectedRecords = $('#myGridExamine').omGrid('getSelections', true);
	// 判断用户是否选中数据
	if (selectedRecords.length > 0) {
		alertMsg.confirm("是否同意选中的项目申请审核不通过?", {
			okCall : function() {
				for ( var i in selectedRecords) {
					if (selectedRecords[i].state == 1) {
						ids += selectedRecords[i].id + ",";
					} else {
						alertMsg.info("已提交过审核记录，不能重复提交！");
						return false;
					}
				}
				$.ajax({
					url : '/loanSign/auditloansignot',
					data : 'ids=' + ids,
					type : 'post',
					success : function(msg) {
						if (msg == "2") {
							$('#myGridExamine').omGrid('reload');// 刷新当前页
							alertMsg.correct("修改成功！");
						} else {
							alertMsg.info("修改失败！");
						}
					}
				});
				// 防止打开链接
				event.preventDefault();
			}
		});
	} else {
		alertMsg.warn("请选择需要审核不通过的项目");
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
