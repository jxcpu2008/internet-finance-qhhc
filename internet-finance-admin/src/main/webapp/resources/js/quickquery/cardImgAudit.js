$(document).ready(
	function() {
		// 数据显示列表相关
		$('#cardImgAuditQueryGride').omGrid({
			dataSource : '/cardImgAudit/cardImgAuditQuery',
			title : '实名验证审核列表',
			height : 550,
			limit : 20,
			colModel : [{
				header : 'id',
				name : 'id',
				align : 'center',
				width : 50
			}, {
				header : '申请人姓名',
				name : 'name',
				align : 'center',
				width : 120
			},  {
				header : '推荐人姓名',
				name : 'genName',
				align : 'center',
				width : 110
			},{
				header : '申请人手机号',
				name : 'phone',
				align : 'center',
				width : 110
			}, {
				header : '宝付授权状态',
				name : 'isAuthIps',
				align : 'center',
				width : 80,
				renderer : function(v, rowData, rowIndex) {
					if (v == 0) {
						return "待授权";
					} else if (v == 1) {
						return "已授权";
					}else if (v == 2) {
						return "授权失败";
					}else{
						return "待授权";
					}
				}
			}, {
				header : '身份证号码',
				name : 'cardId',
				align : 'center',
				width : 180
			}, {
				header : '操作',
				name : 'id',
				align : 'center',
				width : 100,
				renderer : function(v, rowData, rowIndex) {
					return "<a class='edit'  style='color:red' onclick=openCardImgAudit("+rowData["id"]+") >查看身份证图片</a>"
				}
			}, {
				header : '申请时间',
				name : 'cardImgTime',
				align : 'center',
				width : 150
			}, {
				header : '状态',
				name : 'cardImgState',
				align : 'center',
				width : 80,
				renderer : function(v, rowData, rowIndex) {
					if (v == 0) {
						return "待审核";
					} else if (v == 1) {
						return "审核通过";
					}else if (v == 2) {
						return "审核不通过";
					}
				}
			}, {
				header : '备注',
				name : 'cardImgRemark',
				align : 'center',
				width : 110
			}, {
				header : '操作时间',
				name : 'cardImgAuditTime',
				align : 'center',
				width : 110
			},  {
				header : '操作人',
				name : 'realname',
				align : 'center',
				width : 80
			}]
		});
		
		// 搜索面板
		$("#cardImgAudit-search-panel").omPanel({
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
		$("#cardImgTime").omCalendar({
			disabledFn : dadaDisFn
		});
		$("#cardImgAuditTime").omCalendar({
			disabledFn : dadaDisFn
		});
		// 鼠标悬浮在面板头显示的信息
		$('.om-panel-title').omTooltip({
			html : '可以通过单击，展开高级搜索面板哦'
		});
		
		// 搜索按钮
		$('#cardImgAudit-button-search').omButton({
			icons : {
				left : '/resources/operamasks-ui/themes/default/images/search.png'
			},
			width : 70
		});
		
		/** 搜索按钮点击 */
		$("#cardImgAudit-button-search").click(
			function() {
				var ajaxbg = $("#background,#progressBar");
				ajaxbg.show();
				var url = encodeURI("/cardImgAudit/cardImgAuditQuery?" + $("#cardImgAuditSearchForm").serialize());
				$('#cardImgAuditQueryGride').omGrid('setData', url);
			});
});

/**** 导出excel***/
function cardImgAuditCashFile() {
	var messgae = "是否导出实名验证审核列表到excel？";
	var url = encodeURI("/cardImgAudit/outPutCardImgAuditExcel?" + $("#cardImgAuditSearchForm").serialize());
	// 判断用户是否选中数据
	alertMsg.confirm(messgae, {
		okCall : function() {
			window.location.href = url;
		}
	});
}

/**审核通过**/
$("#cardImgAuditPass").click(
		function() {
			var ids = "";
			// 获取选中行数据
			var selectedRecords = $('#cardImgAuditQueryGride').omGrid('getSelections',true);
			// 判断用户是否选中数据
			if (selectedRecords == null || selectedRecords == ""|| selectedRecords == undefined|| selectedRecords.length < 1) {
				alertMsg.info("请选择要审核的客户信息！");
			} else {
				alertMsg.confirm("是否同意选中的客户信息申请审核?", {
					okCall : function() {
						for ( var i in selectedRecords) {
							if (selectedRecords[i].cardImgState == 0) {
								ids += selectedRecords[i].id;
							} else {
								alertMsg.info("存在提交过审核记录，不能重复提交！");
								return false;
							}
						}
						$.ajax({
							url : '/cardImgAudit/auditCardImgState?examine=1',
							data : 'ids=' + ids,
							type : 'post',
							success : function(msg) {
								if (msg == "1") {
									$('#cardImgAuditQueryGride').omGrid('reload');// 刷新当前页
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

$("#cardImgAuditNotPass").click(function() {
	var ids = "";
	// 获取选中行数据
	var selectedRecords = $('#cardImgAuditQueryGride').omGrid('getSelections', true);
	// 判断用户是否选中数据
	if (selectedRecords.length > 0) {
		alertMsg.confirm("是否同意选中的申请审核不通过?", {
			okCall : function() {
				for ( var i in selectedRecords) {
					if (selectedRecords[i].cardImgState == 0) {
						 ids += selectedRecords[i].id;
					} else {
						alertMsg.info("已提交过审核记录，不能重复提交！");
						return false;
					}
				}
				$.pdialog.open('/cardImgAudit/queryCardImgState?id=' + ids,'addCardImgState', '拒绝原因说明', {
							width : 450,
							height : 200
				});
			}
		});
	} else {
		alertMsg.warn("请选择需要审核不通过的数据");
	}
});

function openCardImgAudit(v){
	if(v!=null){
		$.pdialog.open('/cardImgAudit/selCardImgState?id=' + v,'selCardImgState', '身份证图片', {
			width : 550,
			height : 500
});
	}else{
		alertMsg.info("请选择一条信息查看");
	}
};

$("#updateActivityMonkey").click(function() {
		alertMsg.confirm("是否一键进行更改现金红包2元状态改成待发放?", {
			okCall : function() {
				$.ajax({
					url : '/cardImgAudit/updateActivityMonkey',
					type : 'post',
					success : function(msg) {
						if (msg == "1") {
							$('#cardImgAuditQueryGride').omGrid('reload');// 刷新当前页
							alertMsg.correct("更改现金红包2元状态成功！");
						} else {
							alertMsg.info("更改现金红包2元状态失败！");
						}
					}
				});
			}
		});
});