<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = "/";
%>
<script src="/resources/js/dwz.regional.zh.js" type="text/javascript"></script>
 <script type="text/javascript">
 $(function(){
		/* 计算融资总额 */
		$('#realRate').blur(function() {
					var prioRate = $('#prioRate').val();
					var realRate = $('#realRate').val()/100;
					if (realRate<prioRate){
						alert("实际借款人利率小于优先利率");
					}
				});
 });
 
 function ChckRecommandReason()  { 
	 var str= $('#recommandReason').val();; 
 if(str.length>100) { 
       alert("推荐理由字数不能超过100个"); 
   } 
 } 
 </script>
<form method="post" action="<%=basePath %>loanSign/auditloansign"   class="pageForm required-validate"  	onsubmit="return validateCallback(this,dialogAjaxDone)">
	<div class="pageContent">
			<div class="pageFormContent" layoutH="60" style="margin-left: 50px;">	
			<dl>
			   <dt>新借款人利率：</dt>
				<dd>
				    <input type="hidden" name="type"  id="type"  value="${loansign.type}" />
					<input type="hidden" name="remonth"  id="remonth"  value="${loansign.remonth}" />
					<input type="hidden" name="issueLoan"  id="issueLoan"  value="${loansign.issueLoan}" />
				    <input type="hidden" name="prioRate"  id="prioRate"  value="${loansign.prioRate}" />
				    <input type="hidden" name="refunway"  id="refunway"  value="${loansign.refunway}" />
				    <input type="hidden" name="prioAwordRate"  id="prioAwordRate"  value="${loansign.prioAwordRate}" />
				    <input type="text" name="realRate"  id="realRate"  class="required number"  />%
				    <input type="hidden" name="id" value="${loansign.id}" />
				    <input type="hidden" name="loanName" value="${loansign.name}" />
				</dd>
			</dl>
			<dl>
			<dt>平台服务费收取：</dt>
			<dd>
			<input type="radio" name="feeMethod"   value="1"  checked="checked" />本金中扣除
			<input type="radio" name="feeMethod"   value="2"/>额外支付
			</dd>
			</dl>
			<dl>
			   <dt>平台服务费年利率：</dt>
				<dd>
				     <input type="text"  name="companyFee"    class="required number" />%
				</dd>
			</dl>
			<p style="clear: both; height: 100px; width: 100%">
				<label>推荐理由：</label>
				<textarea name="recommandReason" id="recommandReason" 
					rows="4" cols="80"  maxlength="100"     onblur="ChckRecommandReason();" ></textarea>
			</p>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent" >
							<button type="submit"   onclick="ChckRecommandReason();">确认</button>
						</div>
					</div></li>
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