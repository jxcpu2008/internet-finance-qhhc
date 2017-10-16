$(document).ready(
		function() {
			// 数据源面板
			$('#myliquidation').omGrid({
				dataSource : '/loanSign/loansignLiquidation',
				title : '众持项目申请列表',
				height : 345,
				limit : 10,
				 autoFit:true,
				colModel : [ {
					header : '序号',
					name : 'id',
					width : 25,
					align : 'center'
				}, {
					header : '项目名称',
					name : 'name',
					width : 200,
					align : 'center'
				}, 
				 {
					header : '还款期数',
					name : 'periods',
					width : 50,
					align : 'center'
				}, 
				 {
					header : '借款总额',
					name : 'issueLoan',
					align : 'center',
					width : 80,
					 
				},	{
					header : '借款利率',
					name : 'realRate',
					width : 100,
					align : 'center',
					renderer : function(v, rowData, rowIndex) {
						return v*100+"%";
				   }
				},
				{
					header : '优先[￥]',
					name : 'priority',
					align : 'center',
					width : 100
				},
				
				{
					header : '夹层[￥]',
					name : 'middle',
					align : 'center',
					width : 100
				},
				{
					header : '劣后[￥]',
					name : 'after',
					align : 'center',
					width : 100
				},
				{
					header : '最低投[￥]',
					name : 'loanUnit',
					align : 'center',
					width : 100
				},
				{
					header : '放款时间',
					name : 'publishTime',
					align : 'center',
					width : 100
				},					
				{
					header : '创建时间 ',
					name : 'creditTime',
					align : 'center',
					width : 100
				},
				{
					header : '还款类型',
					name : 'refunway',
					align : 'center',
					width : 100,
					renderer : function(v, rowData, rowIndex) {
						if(v==1){
							return "按月";
						}else{
							return "按季";
						}
					}
				}
				,
				{
					header : '担保公司ID',
					name : 'esid',
					align : 'center',
					width : 100,
				}
				,
				{
					header : '还款类型',
					name : 'status',
					align : 'center',
					width : 100,
					renderer : function(v, rowData, rowIndex) {
						if(v==-1){
							return "已处理";
						}else{
							return "待处理";
						}
					}
				}],
				// 选中事件
				onRowSelect : function(index, rowData, event) {
					//取到该行id值
         			var id=rowData["id"];
//         			var esid=rowData["esid"];
          			myAttachment(id);
				}
			});
  
		});
	 
 
// 明细
var myAttachment= function(id){
 	$("#myAttachment").omGrid({
		dataSource: "/loanSign/loansignLiquidationDetails?loanid="+id,
		title : '还款详情',
        height : 320,
        limit : 10,
        colModel : [ 
                     {header : '编号', name : 'id', width : 35, align : 'center'},
                     {header : '收款人', name : 'payeeuserid', width : 100, align : 'center'},
                     {header : '付款人', name : 'payeruserid', width : 100, align : 'center'},
                     {header : '还款金', name : 'amount', align : 'center', width :100 },
                     {header : '状态', name : 'liquidationstate', align : 'center', width :100,renderer : function(v, rowData, rowIndex) {
						if (v == 1) {
							return "成功";
						} else if (v == -1) {
							return "失败";
						}else if(v==0){
							return "等待处理";
						}
					 }},
                     {header : '手续费', name : 'fee',width:120, align : 'center'},
                     {header : '还款时间', name : 'reqtime',width:120,align : 'center'},
					 {header : '标名', name : 'loanid',width:120,align : 'center'}]
     });
};


$("#liquidationPlan").click(function(){
	var lonid=$("#lonid").val();
	var money=$("#money").val();
	var escrowId =$("#escrowId").val();
	var periodsOne =$("#periodsOne").val();
	if(money<1){
		alert("清盘金额未输入！");
		return;
	}else{
		  $.pdialog.closeCurrent(); //这行js就是执行完以上的js之后关闭该dialog弹出框  
	 		$.ajax({
			url : '/loanSign/liquidationPlan',
			data : {
				// 清盘标ID ，//清盘金我额金额 //赔付第三方人ID
				'lonid' :lonid,
				'money' : money,
				'escrowId' :escrowId,
				'periods' :periodsOne,
			},
			type : 'post',
			success : function(msg) {
				// -1 清盘额小于 清盘金额 1 生成清盘数据成功 0 失败 2清盘计划以存在
				if (msg == "-1") {
					alertMsg.info("清盘额过小！");
				} else if (msg == "0") {
					alertMsg.correct("生成清盘数据失败！");
				} else if (msg == "1") {
					$('#myliquidation').omGrid('reload');// 刷新当前页
					$('#myAttachment').omGrid('reload');// 刷新当前页
					alertMsg.info("生成清盘数据成功！");
				} else if (msg == "2") {
					alertMsg.info("清盘计划以存在！");
				}
			}
		});
			// 防止打开链接
			event.preventDefault();
	}
});


//清盘计划
$("#inputLiquidationMoney").click(function(){
	//添加第三担保方信息
	 var ids="";
	 //获取选中行数据
	 var selectedRecords = $('#myliquidation').omGrid('getSelections',true);
	 //判断用户是否选中数据
 	 if(selectedRecords.length>0){
 		var url ='/loanSign/inputLiquidationMoney?loanid='+selectedRecords[i].id+'&esid='+selectedRecords[i].esid+'&periods='+selectedRecords[i].periods;
 		 alertMsg.confirm("是否确定选中的借款项目清盘处理?", {
				okCall: function(){
  					 $.pdialog.open(url,'', '选择清盘信息' , { width:411,height:178,mask:true,maxable:false });
				}
			});
	 }else{
		alertMsg.warn("没有选择需要清盘的借款项目"); 
	 }
});


$("#liquidation").click(function(){
	 var ids="";
	 //获取选中行数据
	 var selectedRecords = $('#myliquidation').omGrid('getSelections',true);
	 //判断用户是否选中数据
	 if(selectedRecords.length>0){
		 alertMsg.confirm("是否确定选中的借款项目清盘处理?", {
				okCall: function(){
					$.ajax({
						url : '/loanSign/liquidation',
						data:{
							 //清盘标ID 
							'lonid':selectedRecords[i].id,
						},
						type : 'post',
						success : function(msg) {	
//							1成功  0失败  -1没有数据
							if (msg == "-1") {
							alertMsg.info("没有数据！");
							} else if (msg == "0") {
								alertMsg.correct("清盘失败！");
							} else if (msg == "1") {
								$('#myliquidation').omGrid('reload');// 刷新当前页
								alertMsg.info("清盘成功！");
							} 																																												
						}
					});
			 		//防止打开链接
			 		event.preventDefault();
				}
			});
	 }else{
		alertMsg.warn("没有选择需要清盘的借款项目"); 
	 }
});


//myAttachment(0);

 