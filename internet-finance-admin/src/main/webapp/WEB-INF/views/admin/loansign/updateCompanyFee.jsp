<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = "/";
%>

<script src="/resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<form method="post" action="/loanSignAudit/updateCompanyFee"   class="pageForm required-validate"  	onsubmit="return validateCallback(this,dialogAjaxDone)">
	<div class="pageContent">
			<div class="pageFormContent" style="height: 80px">	
		   <dl>
			   <dt>原平台服务费年利率：</dt>
				<dd>
				     <input class="required number" name="companyFeeOld"  type="text"  readonly="readonly"   value="<fmt:formatNumber pattern="0.00" value="${loansign.companyFee*100}"/>" />%
				</dd>
			</dl>
			<dl>
			   <dt>新平台服务费年利率：</dt>
				<dd>
				    <input type="text" name="companyFee"    class="required number" />%
				    <input type="hidden" name="id" value="${loansign.id}" />
				</dd>
			</dl>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">确认</button>
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