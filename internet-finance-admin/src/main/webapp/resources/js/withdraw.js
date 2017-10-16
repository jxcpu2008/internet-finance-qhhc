$(function(){
	  var $cardStatus=$("#cardStatus").val();		//实名认证
	  var $phonePass=$("#phonePass").val();		//手机认证
	  var $pMerBillNo=$("#pMerBillNo").val();	//宝付注册
	  $("#mysubmit").click(function(){
		  
		  if($cardStatus!=2){
			  $("#mtck-02").css("display","block");
			  return;
		  }
		  
		  if($phonePass!=1){
			  $("#mtck-05").css("display","block");
			  return;
		  }
		  
		  if($pMerBillNo==""){
			  $("#mtck-03").css("display","block");
			  return;
		  }
		  
		var cashBalance=$("#cashBalance").val();
		var money = $("#money").val();
		if(money==""){
			ymPrompt.errorInfo('请填写提现金额！', 300, 200, '提醒', null);
			return false;
		}
		
		if(parseInt(money)<=0){
			ymPrompt.errorInfo('提现金额不能小于或为0,请填写大于0的提现金额！', 430, 170, '提醒', null);
			return false;
		}
		
		if(isNaN(money)){
			ymPrompt.errorInfo('金额输入非法字符,请重新输入！', 400, 200, '提醒', null);
			return false;
		}
		
		if(parseInt(cashBalance)<parseInt(money)){
			ymPrompt.errorInfo('您提现的金额已超过你的可用余额,请重新输入！', 400, 200, '提醒', null);
		}else{
			$.ajax({
				 url:'/member/ipsforchange',
				 type:'post',
				 data:$("#withdraw_form").serialize(),
				 success:function(data){
					 
					 ymPrompt.succeedInfo('提现申请成功，请等待红筹审核结果！', 400, 200, '成功', null);
					  
				 }
				
			});
		}
	});
	
});