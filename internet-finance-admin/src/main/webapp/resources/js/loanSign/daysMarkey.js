$(function(){
	  //投标
	$("#suBnt_s").click(function() {
		 
		var $investMoney = $("#investMoney").val();	//投标金额
		  var $cashBalance =$("#userMoney").val();  //当前用户余额
		  var $loanuserId=$("#loanuserId").val();   //当前转让项目用户id
		  var $userId=$("#userId").val();			//当前用户
		  var $remoney=$("#remoney").val();			//融资剩余额
		  var $flowId=$("#flowId").val();
		  
		  if($userId==$flowId){  ymPrompt.errorInfo('您不能投自己的项目!',400,200,'提示',function(){}); return; }
		 // if($loanuserId==$userId){ ymPrompt.errorInfo('您不能投自己转让的项目!',400,200,'提示',function(){}); return; }
		  if($investMoney==""){  ymPrompt.errorInfo('请输入投资金额!',400,200,'提示',function(){}); return; }
		  if(isNaN($investMoney)){  ymPrompt.errorInfo('输入含非法字符!',400,200,'提示',function(){}); return; }
		  if(parseInt($cashBalance)<parseInt($investMoney)){ ymPrompt.errorInfo('您的账户余额不足,请先充值!',400,200,'提示',function(){}); return; }
		  if(parseInt($investMoney)>parseInt($remoney)){  ymPrompt.errorInfo('您投资的金额已超过可投金额,请重新输入!',400,200,'提示',function( ){});  return;}
		  // if(parseInt($investMoney)!= parseInt($remoney)){  ymPrompt.errorInfo('您只能一次性购买此转让标的剩余金额,请重新输入!',420,200,'提示',function(){});  return; }
		  if (!$("#checkAgree").attr("checked")) { ymPrompt.errorInfo('您还未同意使用条款!',420,200,'提示',function(){});  return;
			}
		 
		$("#form1").submit();
	});
	
	//查询原融资人Id
/*	var $loanId=$("#loanId").val(); 
		$.ajax({
			type:'post',
			url:'loaninfo/yuanLoanFolws.htm',
			data: 'loanId='+$loanId,
			success : function(msg) {
				$("#yrongzi").html(msg);
			}
		})*/
	
	
	//查询转让标的借款记录
/*	$("#jiechu").click(function(){
		$.ajax({
			type:'post',
			url:'loaninfo/LendRecords.htm?no=1',
			data: 'loanId='+$loanId,
			success : function(msg) {
				$("#LendContBox").html(msg);
			}
		})
	});*/
});