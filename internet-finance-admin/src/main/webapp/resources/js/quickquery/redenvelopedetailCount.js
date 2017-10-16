$(document).ready(
	function() {
		// 数据显示列表相关
		$('#redenvelopeDetailCountGride').omGrid({
			dataSource : '/redenvelopeDetailCount/redenvelopeDetailCountQuery',
			title : '红包统计',
			height : 400,
			limit : 10,
			colModel : [{	
				header : '红包Id',
				name : 'id',
				align : 'center',
				width : 50
			},{
				header : '用户名称',
				name : 'userName',
				align : 'center',
				width : 80
			}, {
				header : '真实姓名',
				name : 'name',
				align : 'center',
				width : 80
			}, {
				header : '手机号码',
				name : 'phone',
				align : 'center',
				width : 80
			}, {
				header : '注册时间',
				name : 'createTime',
				align : 'center',
				width : 120
			}, {
				header : '注册端口',
				name : 'registerSource',
				align : 'center',
				width : 80,
				renderer : function(v, rowData, rowIndex) {
					if (v == 1) {
						return "PC";
					} else if(v==2){
						return "H5";
					}else if(v==8){
						return "android";
					}else if(v==9){
						return "ios";
					}else{
						return "PC";
					}
				}
			}, {
				header : '注册渠道',
				name : 'channelName',
				align : 'center',
				width : 80
			}, {
				header : '发放渠道',
				name : 'sourceType',
				align : 'center',
				width : 80,
				renderer : function(v, rowData, rowIndex) {
					if (v == 1) {
						return "投资";
					} else if(v==2){
						return "注册";
					}else if(v==3){
						return "奖励";
					}else if(v==4){
						return "抽奖";
					}else if(v==5){
						return "老用户回馈";
					}else if(v==6){
						return "节日福利"
					}else if(v==7){
						return "补发奖励";
					}else if(v==8){
						return "登顶红包";
					}
				}
			}, {
				header : '获得红包金额',
				name : 'money',
				align : 'center',
				width : 100
			}, {
				header : '获得红包日期',
				name : 'receiveTime',
				align : 'center',
				width : 120
			},{
				header : '使用状态',
				name : 'useFlag',
				align : 'center',
				width : 80,
				renderer : function(v, rowData, rowIndex) {
					if (v == 0) {
						return "未使用";
					} else if(v==1){
						return "已使用";
					}else if(v==2){
						return "待确认";
					}
			   }
			}, {
				header : '使用红包投资金额',
				name : 'tenderMoney',
				align : 'center',
				width : 100
			}, {
				header : '使用红包日期',
				name : 'consumeTime',
				align : 'center',
				width : 120
			}, {
				header : '红包过期日期',
				name : 'endTime',
				align : 'center',
				width : 120
			}]
		});
		
		// 搜索面板
		$("#redenvelopeDetailCount-search-panel").omPanel({
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
		$("#beginTimeRedenvelope").omCalendar({
			disabledFn : dadaDisFn
		});
		$("#endTimeRedenvelope").omCalendar({
			disabledFn : dadaDisFn
		});
		
		// 注册时间
		$("#receiveTimeRedenvelope").omCalendar({
			disabledFn : dadaDisFn
		});
		$("#consumeTimeRedenvelope").omCalendar({
			disabledFn : dadaDisFn
		});
		// 鼠标悬浮在面板头显示的信息
		$('.om-panel-title').omTooltip({
			html : '可以通过单击，展开高级搜索面板哦'
		});
		
		// 搜索按钮
		$('#redenvelopeDetailCount-button-search').omButton({
			icons : {
				left : '/resources/operamasks-ui/themes/default/images/search.png'
			},
			width : 70
		});
		
		/** 搜索按钮点击 */
		$("#redenvelopeDetailCount-button-search").click(
			function() {
				var ajaxbg = $("#background,#progressBar");
				ajaxbg.show();
				var url = encodeURI("/redenvelopeDetailCount/redenvelopeDetailCountQuery?" + $("#redenvelopeDetailCountSearchForm").serialize());
				        $('#redenvelopeDetailCountGride').omGrid('setData', url);
			        $.ajax({
			    		url : '/redenvelopeDetailCount/redDetailCountMoney?'+ $("#redenvelopeDetailCountSearchForm").serialize(),
			    		type : 'post',
			    		success : function(data) {
			    			 data = JSON.parse(data);
			    			 htmlData(data);
			    		}
			    	});
			});
});

/**** 导出excel***/
function redenvelopeDetailCountCashFile() {
	var messgae = "是否导出红包统计到excel？";
	var url = encodeURI("/redenvelopeDetailCount/outRedEnvelopeDetailExcel?" + $("#redenvelopeDetailCountSearchForm").serialize());
	// 判断用户是否选中数据
	alertMsg.confirm(messgae, {
		okCall : function() {
			window.location.href = url;
		}
	});
}

/***
 * 打开页面就进行加载
 */
$(function(){
	$.ajax({
		url : '/redenvelopeDetailCount/redDetailCountMoney',
		type : 'post',
		success : function(data) {
			 data = JSON.parse(data);
			 htmlData(data);
		}
	});
})

function htmlData(data){
	 $("#distinctRedCount").html(data.distinctRedCount);
	 $("#redSumMoney").html(data.redSumMoney); 
	 $("#redCount").html(data.redCount); 
	 $("#redCountOne").html(data.redCountOne); 
	 $("#redSumMoneyOne").html(data.redSumMoneyOne); 
	 $("#distinctLoanCount").html(data.distinctLoanCount); 
	 $("#redCountTenderMoney").html(data.redCountTenderMoney); 
	 $("#redSumTenderMoney").html(data.redSumTenderMoney); 
	 $("#tenderMoneyProportion").html(data.tenderMoneyProportion); 
	 $("#loanrecordProportion").html(data.loanrecordProportion); 
	 $("#loanCountProportion").html(data.loanCountProportion); 
}