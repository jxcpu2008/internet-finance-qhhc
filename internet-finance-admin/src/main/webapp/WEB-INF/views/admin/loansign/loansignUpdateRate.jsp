<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = "/";
%>
<script type="text/javascript">
function checkMidAfter(){
	var midRateValue=$("#midRate").val();
	var afterRateValue=$("#afterRate").val();
	var sum=parseInt(midRateValue)+parseInt(afterRateValue);
	if(sum==100){
		 $("#loansignReate").submit();
	}else{
		alert("夹层与劣后百分比之后必须等于100");
		return false;
	}
}
</script>
<script src="/resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<form id="loansignReate" method="post" action="<%=basePath %>loanSignAudit/updateLoansignRate"   class="pageForm required-validate"  	onsubmit="return validateCallback(this,dialogAjaxDone)">
	<div class="pageContent">
			<div class="pageFormContent" style="height: 80px">	
			 <input type="hidden" name="id" value="${loansign.id}" />
			  <dl>
			   <dt>夹层百分比：</dt>
				<dd>
				     <input class="required number" name="midRate"   id="midRate"   type="text"   value="<fmt:formatNumber pattern="0" value="${loansign.midRate*100}"/>" />%
				</dd>
			</dl>
			<dl>
			   <dt>劣后百分比：</dt>
				<dd>
				  <input class="required number" name="afterRate"  id="afterRate"  type="text"   value="<fmt:formatNumber pattern="0" value="${loansign.afterRate*100}"/>" />%
				</dd>
			</dl>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="button"   onclick="checkMidAfter()">确认</button>
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