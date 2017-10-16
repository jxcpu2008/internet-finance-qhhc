$(document).ready(
	function() {
		var phone = $("#phone").val();
		var name = $("#name").val();
		
		var jsonParam = new Object();
		jsonParam.phone = phone;
		jsonParam.name = name;

		// 数据源面板
		$('#inadvance_repay_list').omGrid( 
		{
			height : 485,
			dataSource : '/riskManage/getInadvanceRepayApplyList?&jsonParam=' + JSON.stringify(jsonParam),
			limit : 20,
			method : 'POST',
			showIndex : false,
			emptyMsg : '暂时还没有您想要的数据',
			singleSelect : true,
			colModel : [ 
			{
				header : '申请人',
				name : 'userName',
				width : 120,
				align : 'center'
			}, {
				header : '手机号码',
				name : 'phone',
				align : 'center',
				width : 100
			}, {
				header : '申请项目',
				name : 'loanName',
				align : 'center',
				width : 120
			}, {
				header : '项目期限',
				name : 'loanPeriodDisplay',
				align : 'center',
				width : 120
			}, {
				header : '借款金额',
				name : 'loanAmount',
				align : 'center',
				width : 120
			}, {
				header : '应收利息',
				name : 'expectInterest',
				align : 'center',
				width : 120
			}, {
				header : '实际借款期限',
				name : 'repayPeriodDisplay',
				align : 'center',
				width : 120
			}, {
				header : '额外利息',
				name : 'penaltyInterest',
				align : 'center',
				width : 120
			}, {
				header : '实际还款总额',
				name : 'repayAmount',
				align : 'center',
				width : 120
			}, {
				header : '账户余额',
				name : 'balance',
				align : 'center',
				width : 120
			}, {
				header : '申请时间',
				name : 'applyTime',
				align : 'center',
				width : 120
			} ]
		});

		// 搜索面板
		$("#user-search-panel").omPanel( {
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
		$('.om-panel-title').omTooltip( {
			html : '可以通过单击，展开高级搜索面板哦'
		});

		// 搜索按钮
		$('span#user-button-search').omButton( {
			icons : {
				left : '/resources/operamasks-ui/themes/default/images/search.png'
			},
			width : 70
		});
		
		// 搜索按钮单击事件
		$("#user-button-search").click(
				function() {
					var ajaxbg = $("#background,#progressBar");
					ajaxbg.show();
					var url = encodeURI("/riskManage/getInadvanceRepayApplyList?" + $("#searchfrom").serialize());
					$('#inadvance_repay_list').omGrid('setData', url);
				});
	});

$("#approvalInadvanceRepay").click(function() {
	var selections = $('#inadvance_repay_list').omGrid('getSelections', true);
	if (selections == null || selections == "" || selections == undefined || selections.length < 1) {
	  	alertMsg.warn("请至少选择一条数据！");
	  	return false;
	}
	
	// 判断融资用户的余额是否足够
	var repayMoney = selections[0].repayAmount;
	var balance = selections[0].balance;
	repayMoney = parseFloat(repayMoney);
	balance = parseFloat(balance);
	if (repayMoney > balance) {
		alertMsg.warn('账户余额不足，无法进行还款！');
		return false;
	}
	
	alertMsg.confirm("确定批准该提前还款申请？", {
		okCall : function() {
			if (selections.length >= 1) {
				var loanId = selections[0].loanId;
				var loanName = selections[0].loanName;
				var repayRecordId = selections[0].repayRecordId;
				var repayAmount = selections[0].repayAmount;
				var repayPeriod = selections[0].repayPeriod;
				var loanType = selections[0].loanType;
				var loanPeriod = selections[0].loanPeriod;
				var userId = selections[0].userId;
				
				var jsonParam = new Object();
				jsonParam.loanId = loanId;
				jsonParam.loanName = loanName;
				jsonParam.repayRecordId = repayRecordId;
				jsonParam.repayAmount = repayAmount;
				jsonParam.repayPeriod = repayPeriod;
				jsonParam.loanType = loanType;
				jsonParam.loanPeriods = loanPeriod;
				jsonParam.userId = userId;
				
				$.ajax({
					data : 'jsonParam=' + JSON.stringify(jsonParam),
					url : '/riskManage/approveInadvanceApply',
					type : 'post',
					success : function(data) {
						data = JSON.parse(data);
						
						var code = data.code;
						var msg = data.msg;
						if (code > 100) {
							alertMsg.info("提前还款申请审核失败，请联系管理员！错误代码：" + code + "，错误信息：" + msg);
						} else {
							alertMsg.info("提前还款申请审核操作成功！");
							$('#inadvance_repay_list').omGrid('reload');
						}
					}
				});
			} else {
				alertMsg.warn("请至少选择一条数据！");
				return false;
			}
		}
	});
});

$("#refuseInadvanceRepay").click(function() {
	var selections = $('#inadvance_repay_list').omGrid('getSelections', true);
	if (selections == null || selections == "" || selections == undefined || selections.length < 1) {
	  	alertMsg.warn("请至少选择一条数据！");
	  	return false;
	}
	
	alertMsg.confirm("确定拒绝该提前还款申请？", {
		okCall : function() {
			if (selections.length >= 1) {
				var loanId = selections[0].loanId;
				var loanName = selections[0].loanName;
				var repayRecordId = selections[0].repayRecordId;
				var repayAmount = selections[0].repayAmount;
				var repayPeriod = selections[0].repayPeriod;
				var loanType = selections[0].loanType;
				var loanPeriod = selections[0].loanPeriod;
				var userId = selections[0].userId;
				
				var jsonParam = new Object();
				jsonParam.loanId = loanId;
				jsonParam.loanName = loanName;
				jsonParam.repayRecordId = repayRecordId;
				jsonParam.repayAmount = repayAmount;
				jsonParam.repayPeriod = repayPeriod;
				jsonParam.loanType = loanType;
				jsonParam.loanPeriods = loanPeriod;
				jsonParam.userId = userId;
				
				$.ajax({
					data : 'jsonParam=' + JSON.stringify(jsonParam),
					url : '/riskManage/refuseInadvanceApply',
					type : 'post',
					success : function(data) {
						data = JSON.parse(data);
						
						var code = data.code;
						var msg = data.msg;
						if (code > 100) {
							alertMsg.info("拒绝提前还款操作失败，请联系管理员！错误代码：" + code + "，错误信息：" + msg);
						} else {
							alertMsg.info("拒绝提前还款操作成功！");
							$('#inadvance_repay_list').omGrid('reload');
						}
					}
				});
			} else {
				alertMsg.warn("请至少选择一条数据！");
				return false;
			}
		}
	});
});