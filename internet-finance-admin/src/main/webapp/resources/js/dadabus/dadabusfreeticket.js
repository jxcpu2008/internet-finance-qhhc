$(document).ready(
	function() {
		// 数据显示列表相关
		$('#dadaBusFreeTicketGride').omGrid({
			dataSource : '/dadabus/queryDadaBusFreeTicketList.do',
			title : '嗒嗒巴士免费车票列表',
			height : 500,
			limit : 20,
			// autoFit:true,
			colModel : [{
				header : '真实姓名',
				name : 'investName',
				align : 'center',
				width : 170
			}, {
				header : '手机号码',
				name : 'mobilePhone',
				align : 'center',
				width : 80
			}, {
				header : '投资金额(元)',
				name : 'tenderMoney',
				align : 'center',
				width : 120
			}, {
				header : '认购时间',
				name : 'createTime',
				align : 'center',
				width : 120
			}, {
				header : '时间段',
				name : 'timeArea',
				align : 'center',
				width : 120,
				renderer : function(v, rowData, rowIndex) {
					if (v == 1) {
						return "09:30-11:30";
					} else if (v == 2) {
						return "13:30-15:30";
					} else if (v == 3) {
						return "15:30-17:30";
					} else if (v == 4) {
						return "17:30-19:30";
					} else if (v == 5) {
						return "19:30-21:30";
					} else {
						return "-----";
					}
				}
			}, {
				header : '认购序号',
				name : 'serialNo',
				align : 'center',
				width : 60
			}, {
				header : '乘车时间',
				name : 'ticketTime',
				align : 'center',
				width : 100
			}, {
				header : '线路',
				name : 'line',
				align : 'center',
				width : 100,
				renderer : function(v, rowData, rowIndex) {
					if (v == 1) {
						return "深圳-->福州";
					} else if (v == 2) {
						return "深圳-->南昌";
					} else if (v == 3) {
						return "深圳-->南宁";
					} else if (v == 4) {
						return "深圳-->长沙";
					} else if (v == 5) {
						return "深圳-->武汉";
					} else {
						return "-----";
					}
				}
			}, {
				header : '状态',
				name : 'status',
				align : 'center',
				width : 160,
				renderer : function(v, rowData, rowIndex) {
					if (v == 1) {
						return "待沟通";
					} else if (v == 2) {
						return "确定乘车";
					} else if (v == 3) {
						return "已提交信息";
					} else if (v == 4) {
						return "已收到票";
					} else if (v == 5) {
						return "放弃赠票";
					} else {
						return "-----";
					}
				}
			}, {
				header : '操作',
				name : 'id',
				align : 'center',
				width : 100,
				renderer : function(v, rowData, rowIndex) {
					return "<a class='edit'  style='color:red' onclick=openSaveHccoindetail("+rowData["id"]+") >编辑</a>"
				}
			}]
		});

		$.ajax({
			url : '/dadabus/queryDadaBusFreeTicketMap.do',
			type : 'post',
			success : function(data) {
				data = JSON.parse(data);
				$("#status0").html(data["status0"]);
				$("#status1").html(data["status1"]);
				$("#status2").html(data["status2"]);
				$("#status3").html(data["status3"]);
				$("#status4").html(data["status4"]);
				$("#status5").html(data["status5"]);
			}
		});
		
});

/** 嗒嗒巴士免费车票 */
function giveFreeTicket() {
	var url = encodeURI("/dadabus/queryDadaBusFreeTicketList.do?dispatchState="+$("#freeTicket").val());
	$('#dadaBusFreeTicketGride').omGrid('setData', url);
}

/***
 * 编辑
 * @param v
 */
function openSaveHccoindetail(v){
	if(v!=null){
		$.pdialog.open('/dadabus/queryDadaBusFreeTicket?dadabusId='+v ,
				'addHccoindetail', '备注', {
					width : 500,
					height : 280
				});
	}else{
		alertMsg.info("请选择一条信息进行导出");
	}
};
