$(document).ready(
	function() {
		// 数据显示列表相关
		$('#voteQixiActivityGride').omGrid({
			dataSource : '/activity/querySevenMoonList.htm',
			title : '投票人信息列表',
			height : 345,
			limit : 10,
			// autoFit:true,
			colModel : [ {
				header : 'ID',
				name : 'id',
				width : 90,
				align : 'center'
			}, {
				header : '投票用户',
				name : 'voterName',
				align : 'center',
				width : 100
			}, {
				header : '选手',
				name : 'votedId',
				align : 'center',
				width : 100
			}, {
				header : '所投票总数',
				name : 'totalNum',
				align : 'center',
				width : 100
			}, {
				header : '投票结果',
				name : 'status',
				align : 'center',
				width : 100,
				renderer : function(v, rowData, rowIndex) {
					if (v == 1) {
						return "胜出方";
					} else if (v == 0) {
						return "未胜出";
					}
				}
			}, {
				header : '创建时间',
				name : 'createTime',
				align : 'center',
				width : 200
			}],
			// 选中事件
			onRowSelect : function(index, rowData, event) {
				// 取到该行id值
				var id = rowData["id"];
			}
		});
		
		// 搜索面板
		$("#vote-search-panel").omPanel({
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
		$('#vote-button-search').omButton({
			icons : {
				left : '/resources/operamasks-ui/themes/default/images/search.png'
			},
			width : 70
		});
		
		/** 搜索按钮点击 */
		$("#vote-button-search").click(
			function() {
				var ajaxbg = $("#background,#progressBar");
				ajaxbg.show();
				var url = encodeURI("/activity/querySevenMoonList.htm?" + $("#searchVoteForm").serialize());
				$('#voteQixiActivityGride').omGrid('setData', url);
			});
});

/** 更新用户 */
function updateVoteStatisticsInfo() {
	$.ajax({
		url : '/activity/updateVoteStatisticsInfo.htm',
		type : 'post',
		data : null,
		success : function(data) {
			data = JSON.parse(data);
			var code = data.code;
			var msg = data.msg;
			alertMsg.info(msg);
			$('#voteQixiActivityGride').omGrid('reload');// 刷新当前页数据
		}
	});
}

/** 查看排行榜列表 */
function viewVoteRankList() {
	$.pdialog.open('/activity/viewVoteRankList.htm',
			'viewVoteRankList', '查看排行榜', {
				width : 800,
				height : 420
	});
}

/** 七夕活动利息项目项目汇总 */
function voteWinIncomeSummary() {
	$.ajax({
		url : '/activity/voteWinIncomeSummary.htm',
		type : 'post',
		data : null,
		success : function(data) {
			data = JSON.parse(data);
			var code = data.code;
			var msg = data.msg;
			alertMsg.info(msg);
			$('#voteQixiActivityGride').omGrid('reload');// 刷新当前页数据
		}
	});
}