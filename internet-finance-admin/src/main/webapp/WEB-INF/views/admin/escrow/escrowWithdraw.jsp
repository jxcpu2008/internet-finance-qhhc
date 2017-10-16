<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = "/";
%>
 <script type="text/javascript">
 $(function(){
		/*  提现金额不能大于账户余额*/
		$('#amount').blur(function() {
					var staffMoney = $('#staffMoney').val();
					var amount = $('#amount').val();
					if (parseFloat(amount)>parseFloat(staffMoney)){
						$('#amount').val('');
						alert("提现金额不能大于账户余额");
					}
	     });
		
 })
 </script>
<div class="pageContent">
<form method="post" action="<%=basePath %>escrowWithdraw/ipsEscrowWithdraw.htm"   class="pageForm required-validate"   onsubmit="return validateCallback(this,dialogAjaxDone)">
	<div class="pageFormContent" layoutH="50">
			<input type="hidden" name="id" value="${escrow.id}" />
			<p>
				<label>账户余额：</label>
				<input type="text" name="staffMoney"  id="staffMoney"  value="<fmt:formatNumber pattern="0.00" value="${escrow.staffMoney}"/>" />
			</p>
		   <p>
				<label>提现金额：</label>
				<input type="text"  id="amount"  name="amount"    class="required number"  min="1"/>
			</p>
			 <p>
				<label>备注：</label>
				 <input type="text"  name="additional_info"   maxlength="30"/>
			</p>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive"><div class="buttonContent"><button type="submit">保存</button></div></div></li>
				<li>
					<div class="button"><div class="buttonContent"><button type="button" class="close">取消</button></div></div>
				</li>
			</ul>
		</div>
	</form>
</div>