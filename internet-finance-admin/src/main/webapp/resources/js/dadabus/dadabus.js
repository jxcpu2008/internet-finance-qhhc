$(document).ready(
	function() {
		// 数据显示列表相关
		$('#dadaBusCashGride').omGrid({
			dataSource : '/dadabus/queryDadaBusCashList.htm',
			title : '嗒嗒巴士代金券列表',
			height : 500,
			limit : 20,
			// autoFit:true,
			colModel : [{
				header : '真实姓名',
				name : 'investName',
				align : 'center',
				width : 70
			}, {
				header : '手机号码',
				name : 'mobilePhone',
				align : 'center',
				width : 80
			}, {
				header : '注册时间',
				name : 'registerTime',
				align : 'center',
				width : 120
			}, {
				header : '认购金额',
				name : 'tenderMoney',
				align : 'center',
				width : 60,
				renderer : function(v,rowData,rowIndex){
					if (v=="0") {
						return "-";
					} else {
						return v;
					}
				}
			}, {
				header : '认购时间',
				name : 'tenderTime',
				align : 'center',
				width : 120,
				renderer : function(v,rowData,rowIndex){
					if (v=="") {
						return "-";
					} else {
						return v;
					}
				}
			}, {
				header : '面额',
				name : 'money',
				align : 'center',
				width : 30
			}, {
				header : '渠道来源',
				name : 'channelSource',
				align : 'center',
				width : 100
			}, {
				header : '状态',
				name : 'status',
				align : 'center',
				width : 40,
				renderer : function(v, rowData, rowIndex) {
					if (v == 3) {
						return "成功";
					} else if (v == 1) {
						return "待确认";
					}
				}
			}, {
				header : '订单号',
				name : 'orderNo',
				align : 'center',
				width : 160
			}, {
				header : '代金券编码',
				name : 'couponCode',
				align : 'center',
				width : 200
			}]
		});
		
		// 搜索面板
		$("#dadabus-search-panel").omPanel({
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
		$("#dada-start-timeH").omCalendar({
			disabledFn : dadaDisFn
		});
		$("#dada-end-timeH").omCalendar({
			disabledFn : dadaDisFn
		});
		// 鼠标悬浮在面板头显示的信息
		$('.om-panel-title').omTooltip({
			html : '可以通过单击，展开高级搜索面板哦'
		});
		
		// 搜索按钮
		$('#dadabus-button-search').omButton({
			icons : {
				left : '/resources/operamasks-ui/themes/default/images/search.png'
			},
			width : 70
		});
		
		/** 搜索按钮点击 */
		$("#dadabus-button-search").click(
			function() {
				var ajaxbg = $("#background,#progressBar");
				ajaxbg.show();
				var url = encodeURI("/dadabus/queryDadaBusCashList.htm?" + $("#dadaBusSearchVoteForm").serialize());
				$('#dadaBusCashGride').omGrid('setData', url);
			});
});

/** 嗒嗒巴士代金券发放失败状态查询 */
function updateDadaBusCashState() {
	// 获取选中记录
	var selections = $('#dadaBusCashGride').omGrid('getSelections', true);
	// 判断是否选中
	if (selections == null || selections == "" || selections.length < 1) {
		alertMsg.info("请选择一条记录！");
	} else if (selections.length > 1) {
		alertMsg.info("不能选择多条记录！");
	} else {
		var orderNo = selections[0].orderNo;
		var status = selections[0].status;
		if('3' == status) {
			alertMsg.info("该记录已发放成功，不能重复处理！");
		} else {
			$.ajax({
				url : '/dadabus/updateDadaBusCashState.htm',
				type : 'post',
				data : {orderNo:orderNo},
				success : function(data) {
					data = JSON.parse(data);
					var code = data.code;
					var msg = data.msg;
					alertMsg.info(msg);
					setTimeout("$('#dadaBusCashGride').omGrid('reload')",2000);// 刷新当前页数据
				}
			});
		}
	}
}

/**** 导出excel***/
function exportDadaBusCashFile() {
	var messgae = "是否导出嗒嗒巴士代金券明细到excel？";
	var url = encodeURI("/dadabus/exportDadaBusCashFile.do?" + $("#dadaBusSearchVoteForm").serialize());
	// 判断用户是否选中数据
	alertMsg.confirm(messgae, {
		okCall : function() {
			window.location.href = url;
		}
	});

}