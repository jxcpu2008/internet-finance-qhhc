<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<style>
div.conment>ul li {line-height: 41px;}
div.conment {padding-left: 50px;padding-top: 10px;}
.bottom_btn {background-color: #33ffff;border: 1px solid #ccc;height: 30px;}
button {cursor: pointer;}
#viewSmsEmailTemplateOfPlanBtn {
	border: 1px solid #bbb;
	background-color: #dedede;
	padding: 2px 15px;
	border-radius: 4px;
	cursor: pointer;
}
</style>
<script>
$(function() {
	$("#searchPMerBillNoUser").click(
		function() {
			var pMerBillNo = $("#pMerBillNo").val();
				if (pMerBillNo == '') {
					alertMsg.info("请输入宝付ID才能进行查询");
					return;
				}
				$.ajax({
					url : '/transferAccount/pMerBillNoName',
					type : 'post',
					data : {
						pMerBillNo:pMerBillNo
					},
					success : function(data) {
						data = JSON.parse(data);
						var code = data.code;
						var msg = data.msg;
					     if(code==1){
					    	 $("#pMerBillNoName").val(msg);
					     }else{
					    	 alertMsg.info(msg);
					     }
					}
				});
		});
	
	//取消
	$("#editTranCert").click(
			function() {
				$("#pMerBillNo").val("");
				$("#pMerBillNoName").val("");
				$("#money").val("");
				$("#status").val("1");
			}
	);
	
	//转账
	$("#submitTranCert").click(
			function() {
				var pMerBillNo = $("#pMerBillNo").val();
				var pMerBillNoName = $("#pMerBillNoName").val();
				var status = $("#status").val();
				var money = $("#money").val();
				if (pMerBillNo == '') {
					alertMsg.info("请输入宝付ID");
					return;
				}
				if (pMerBillNoName == '') {
					alertMsg.info("请查询转账姓名");
					return;
				}
				if (status == '') {
					alertMsg.info("请输入转账类型");
					return;
				}
				if (money == '') {
					alertMsg.info("请输入转账金额");
					return;
				}
				alertMsg.confirm("请确认是否进行转账处理？",{
					okCall : function() {
							$.ajax({
								url : '/transferAccount/ipsTranCertInfo',
								type : 'post',
								data : {
									pMerBillNo:pMerBillNo,
									status:status,
									money:money
								},
								success : function(data) {
									data = JSON.parse(data);
								     if(data==1){
								    	 alertMsg.info("转账成功！");
							    		$("#pMerBillNo").val("");
										$("#pMerBillNoName").val("");
										$("#money").val("");
										$("#status").val("1");
								     }else if(data==4){
								    	 alertMsg.info("无此权限");
								     }else if(data==-1){
								    	 alertMsg.info("转账失败");
								     }else if(data==2){
								    	 alertMsg.info("未查到此用户");
								     }else if(data==3){
								    	 alertMsg.info("转账失败");
								     }
								}
							});
						}
					})
				
			}
	   );
	
});
</script>
<div style="background-color: #fff; width: 100%; height: 400px; top: 100px; left: 400px;">
	<div style="background: #00CCFF; height: 25px; padding: 10px 0 0 20px;">
		<span>转账</span>
	</div>
	<form method="post" id="TranCertForm">
		<div class="conment" style="padding-top: 20px; padding-left: 50px;">
			<ul>
				<li>
					<label style="margin-right: 40px;">转账类型：</label> 
					<select style="width: 80px;" id="status" name="status">
						<option value="1">退款</option>
						<option value="2">支出</option>
					</select>
				</li>
				<li>
				<label style="margin-right: 40px;">宝付ID：</label>
					<input type="text" style="width: 180px;" id="pMerBillNo"  name="pMerBillNo"  class="required" />
					<button type="button" id="searchPMerBillNoUser">查询</button>
				</li>
				<li>
				<label style="margin-right: 40px;">转账姓名：</label>
					<input type="text" style="width: 180px;" id="pMerBillNoName"  readonly="readonly"   class="required" />
				</li>
			<li>
					<label style="margin-right: 40px;">转账金额：</label> 
					<input type="text" style="width: 180px;" id="money"  name="money"  class="required number" />
				</li>
			</ul>
			<div style="padding-top: 30px;">
				<button type="button" style="width: 80px; margin-left: 75px;" id="submitTranCert">转账</button>
				<button type="button" style="width: 80px; margin-left: 50px;" id="editTranCert">取消</button>
			</div>
		</div>
	</form>
</div>

<div id="backgrounddiv"
	style="position: absolute; top: 0px; left: 0px; width: 100%; height: 100%; opacity: .3; 
	display: none; z-index: 50; background-color: #ccc;">
</div>