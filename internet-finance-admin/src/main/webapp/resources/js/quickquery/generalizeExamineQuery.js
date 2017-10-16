$(document).ready(
	function() {
		// 数据显示列表相关
		$('#generalizeExamineQueryGride').omGrid({
			dataSource : '/generalizeExamine/generalizeExamineQuery',
			title : '客户关联审核列表',
			height : 550,
			limit : 20,
			colModel : [{
				header : 'id',
				name : 'id',
				align : 'center',
				width : 50
			}, {
				header : '申请人',
				name : 'name',
				align : 'center',
				width : 100
			}, {
				header : '申请人手机号',
				name : 'phone',
				align : 'center',
				width : 120
			}, {
				header : '被关联客户',
				name : 'uuname',
				align : 'center',
				width : 100
			}, {
				header : '客户手机号',
				name : 'uphone',
				align : 'center',
				width : 120
			}, {
				header : '申请时间',
				name : 'adddate',
				align : 'center',
				width : 150
			}, {
				header : '状态',
				name : 'state',
				align : 'center',
				width : 100,
				renderer : function(v, rowData, rowIndex) {
					if (v == 0) {
						return "待审核";
					} else if (v == 1) {
						return "关联成功";
					}else if (v == 2) {
						return "关联通过";
					}else if (v == 3) {
						return "审核不通过";
					}
				}
			}, {
				header : '备注',
				name : 'remark',
				align : 'center',
				width : 120
			}, {
				header : '操作时间',
				name : 'auditTime',
				align : 'center',
				width : 150
			},  {
				header : '操作人',
				name : 'realname',
				align : 'center',
				width : 80
			}]
		});
		
		// 搜索面板
		$("#generalizeExamine-search-panel").omPanel({
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
		$("#adddateQ").omCalendar({
			disabledFn : dadaDisFn
		});
		$("#auditTimeQ").omCalendar({
			disabledFn : dadaDisFn
		});
		// 鼠标悬浮在面板头显示的信息
		$('.om-panel-title').omTooltip({
			html : '可以通过单击，展开高级搜索面板哦'
		});
		
		// 搜索按钮
		$('#generalizeExamine-button-search').omButton({
			icons : {
				left : '/resources/operamasks-ui/themes/default/images/search.png'
			},
			width : 70
		});
		
		/** 搜索按钮点击 */
		$("#generalizeExamine-button-search").click(
			function() {
				var ajaxbg = $("#background,#progressBar");
				ajaxbg.show();
				var url = encodeURI("/generalizeExamine/generalizeExamineQuery?" + $("#generalizeExamineSearchForm").serialize());
				$('#generalizeExamineQueryGride').omGrid('setData', url);
			});
});

/**** 导出excel***/
function generalizeExamineCashFile() {
	var messgae = "是否导出客户关联审核列表到excel？";
	var url = encodeURI("/generalizeExamine/outGeneralizeExamineExcel?" + $("#generalizeExamineSearchForm").serialize());
	// 判断用户是否选中数据
	alertMsg.confirm(messgae, {
		okCall : function() {
			window.location.href = url;
		}
	});
}

/**审核通过**/
$("#generalizeExaminePass").click(
		function() {
			var ids = "";
			// 获取选中行数据
			var selectedRecords = $('#generalizeExamineQueryGride').omGrid('getSelections',true);
			// 判断用户是否选中数据
			if (selectedRecords == null || selectedRecords == ""|| selectedRecords == undefined|| selectedRecords.length < 1) {
				alertMsg.info("请选择要审核的客户信息！");
			} else {
				alertMsg.confirm("是否同意选中的客户信息申请审核?", {
					okCall : function() {
						for ( var i in selectedRecords) {
							if (selectedRecords[i].state == 0) {
								ids += selectedRecords[i].id;
							} else {
								alertMsg.info("存在提交过审核记录，不能重复提交！");
								return false;
							}
						}
						$.ajax({
							url : '/generalizeExamine/auditGeneralizeExamine?examine=1',
							data : 'ids=' + ids,
							type : 'post',
							success : function(msg) {
								if (msg == "1") {
									$('#generalizeExamineQueryGride').omGrid('reload');// 刷新当前页
									alertMsg.correct("审批成功！");
								} else {
									alertMsg.info("修改失败！");
								}
							}
						});
						// 防止打开链接
						event.preventDefault();
					}
				});
			}
		});

$("#generalizeExamineNotPass").click(function() {
	var ids = "";
	// 获取选中行数据
	var selectedRecords = $('#generalizeExamineQueryGride').omGrid('getSelections', true);
	// 判断用户是否选中数据
	if (selectedRecords.length > 0) {
		alertMsg.confirm("是否同意选中的申请审核不通过?", {
			okCall : function() {
				for ( var i in selectedRecords) {
					if (selectedRecords[i].state == 0) {
						 ids += selectedRecords[i].id;
					} else {
						alertMsg.info("已提交过审核记录，不能重复提交！");
						return false;
					}
				}
				$.pdialog.open('/generalizeExamine/queryGeneralizeExamine?id=' + ids,'addExamine', '拒绝原因说明', {
							width : 500,
							height : 220
				});
			}
		});
	} else {
		alertMsg.warn("请选择需要审核不通过的数据");
	}
});