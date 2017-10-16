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
	$("#queryPhone").click(
		function() {
			var phone = $("#phone").val();
				if (phone == '') {
					alertMsg.info("请输入手机号");
					return;
				}
				$.ajax({
					url : '/dispenseRedEnvelope/queryUserByPhone',
					type : 'post',
					data : {
						phone:phone
					},
					success : function(data) {
						data = JSON.parse(data);
						var code = data.code;
						var msg = data.msg;
					     if(code==1){
					    	 $("#userName").val(data.userName);
					    	 $("#name").val(data.name);
					    	 $("#uid").val(data.uid);
					     }else{
					    	 alertMsg.info(msg);
					     }
					}
				});
		});
	
	
	//转账
	$("#submitData").click(
			function() {
				var phone = $("#phone").val();
				var userName = $("#userName").val();
				var money = $("#money").val();
				var uid = $("#uid").val();
				if (phone == '') {
					alertMsg.info("请输入手机号");
					return;
				}
				if (userName == '') {
					alertMsg.info("请查询用户名");
					return;
				}

				alertMsg.confirm("请确认是否进行红包发放？",{
					okCall : function() {
							$.ajax({
								url : '/dispenseRedEnvelope/dispense',
								type : 'post',
								data : {
									uid:uid,
									phone:phone,
									money:money
								},
								success : function(data) {
									data = JSON.parse(data);
									alertMsg.info(data.msg);

								}
							});
						}
					})
				
			}
	   );
	
});
</script>
<div style="background-color: #fff; width: 100%; height: 600px; top: 100px; left: 400px;">
	<div style="background: #00CCFF; height: 25px; padding: 10px 0 0 20px;">
		<span>红包发放</span>
	</div>
	<form method="post" id="TranCertForm">
	<input type="hidden" id="uid" name="uid" value="" />
		<div class="conment" style="padding-top: 20px; padding-left: 50px;">
		<span>注意：</span>
		<ul>
		<li>1.目前只能发放5，10元的红包，</li>
		<li>2.红包类型为奖励，</li>
		<li>3.此类红包无使用门槛，</li>
		<li>4.有效期从发放红包之日起1个月，</li>
		<li style="color: red;font-style: italic;">可以无限制的发放（使用时请注意）</li>
		</ul>
		<br />
			<ul>

				<li>
				<label style="margin-right: 40px;">手机号：</label>
					<input type="text" style="width: 180px;" id="phone"  name="phone"  class="required" />
					<button type="button" id="queryPhone">查询</button>
				</li>
				<li>
				<label style="margin-right: 40px;">用户名：</label>
					<input type="text" style="width: 180px;" id="userName"  readonly="readonly"   class="required" />
				</li>
				<li>
				<label style="margin-right: 40px;">姓名：</label>
					<input type="text" style="width: 180px;" id="name"  readonly="readonly"   class="required" />
				</li>				
				<li>
					<label style="margin-right: 40px;">红包金额：</label> 
					<select style="width: 80px;" id="money" name="money">
						<option value="1">5元</option>
						<option value="2">10元</option>
					</select>					
				</li>
			
			</ul>
			<div style="padding-top: 30px;">
				<button type="button" style="width: 80px; margin-left: 75px;" id="submitData">发放</button>
			</div>
		</div>
	</form>
</div>

<div id="backgrounddiv"
	style="position: absolute; top: 0px; left: 0px; width: 100%; height: 100%; opacity: .3; 
	display: none; z-index: 50; background-color: #ccc;">
</div>