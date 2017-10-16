<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
    String path = request.getContextPath();
    String basePath = "/";
%>
<script src="/resources/js/dwz.regional.zh.js" type="text/javascript"></script>
 <script type="text/javascript">
 $(function(){
		/* 计算融资总额 */
		$('#money').blur(function() {
					var sumMoney = $('#sumMoney').val();
					var money = $('#money').val();
					if (parseFloat(money)<parseFloat(sumMoney)){
						$('#money').val('');
						alert("清盘金额不能小于优先本息加夹层本金总和："+sumMoney);
					}
				});
 })
 </script>
<script type="text/javascript" src="/resources/js/loanSign/liquidation.js"></script>
	<form method="post">
	<div class="pageContent">
	    <input class="required"  id ="lonid"  name="lonid" value="${lonid}" type="hidden">
	    <input class="required"  id ="periodsOne"  name="periodsOne" value="${periodsOne}" type="hidden">
	      <input class="required"  id ="sumMoney"  name="sumMoney" value="${sumMoney}" type="hidden">
		<div class="pageFormContent" style="height: 80px">
			<dl>
 				<dt>请输入金额：</dt>
				<dd>
					<input class="required number"  id ="money" name="money" value="" type="text"  >
				</dd>
			</dl>
			
			<dl>
 				<dt>请选择担保人：</dt>
				<dd>
 				
					<select id ="escrowId" name="escrowId">
 						   <c:forEach  items="${es}" var="e"> 
						   			 <option value="${e.id}" <c:if test="${e.id eq defesid}">selected="selected"</c:if>  >${e.staffName}</option>
						    </c:forEach>
					 </select>
				</dd>
			</dl>
		</div>
		<div class="formBar">
			<ul>
				<li>
					<div class="buttonActive">
						<div class="buttonContent">
							<button id="liquidationPlan" type="button">保存</button>
						</div>
					</div>
				</li>
				<li>
					<div class="button">
						<div class="buttonContent">
							<button type="button" class="close">取消</button>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</div>
</form>
