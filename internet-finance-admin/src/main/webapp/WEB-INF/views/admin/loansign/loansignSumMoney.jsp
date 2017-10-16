<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = "/";
%>

<script src="/resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<form method="post"  action=""   class="pageForm required-validate"  	onsubmit="return validateCallback(this,dialogAjaxDone)">
	<div class="pageContent">
			<div class="pageFormContent">	
		   <dl>
			   <dt>总放款金额：</dt>
				<dd>
				     <input  type="text"  readonly="readonly"      value="<fmt:formatNumber value="${sumIssueLoan}"/>" />元
				</dd>
			</dl>
			 <dl>
			   <dt>优先总金额：</dt>
				<dd>
				     <input  type="text"  readonly="readonly"      value="<fmt:formatNumber value="${sumPriority}"/>" />元
				</dd>
			</dl>
			 <dl>
			   <dt>夹层总金额：</dt>
				<dd>
				     <input  type="text"  readonly="readonly"      value="<fmt:formatNumber value="${sumMiddle}"/>" />元
				</dd>
			</dl>
			 <dl>
			   <dt>劣后总金额：</dt>
				<dd>
				     <input  type="text"  readonly="readonly"      value="<fmt:formatNumber value="${sumAfter}"/>" />元
				</dd>
			</dl>
			<dl>
			   <dt>总放款利息：</dt>
				<dd>
				     <input  type="text"  readonly="readonly"    value="<fmt:formatNumber value="${sumPreRepay}"/>" />元
				</dd>
			</dl>
			<dl>
			   <dt>服务费总额：</dt>
				<dd>
				     <input  type="text"  readonly="readonly"    value="<fmt:formatNumber value="${sumfeeMoney}"/>" />元
				</dd>
			</dl> 
			<dl>
			   <dt>红包总金额：</dt>
				<dd>
				     <input  type="text"  readonly="readonly"    value="<fmt:formatNumber value="${sumRedEnvelopeMoney}"/>" />元
				</dd>
			</dl>
			<dl>
			   <dt>待还款金额：</dt>
				<dd>
				     <input  type="text"  readonly="readonly"   value="<fmt:formatNumber value="${sumIssueLoanOne}"/>"  />元
				</dd>
			</dl>
		   <dl>
			   <dt>已还款金额：</dt>
				<dd>
				     <input  type="text"  readonly="readonly"  value="<fmt:formatNumber value="${sumIssueLoanTwo}"/>"  />元
				</dd>
			</dl>
			<dl>
			   <dt>待还款利息：</dt>
				<dd>
				     <input   type="text"  readonly="readonly"    value="<fmt:formatNumber value="${sumPreRepayOne}"/>"  />元
				</dd>
			</dl>
			<dl>
			   <dt>已还款利息：</dt>
				<dd>
				     <input  type="text"  readonly="readonly"   value="<fmt:formatNumber value="${sumPreRepayTwo}"/>" />元
				</dd>
			</dl>
			<dl>
			   <dt>逾期利息：</dt>
				<dd>
				     <input  type="text"  readonly="readonly"   value="<fmt:formatNumber value="${sumOverdueInterest}"/>" />元
				</dd>
			</dl>
		</div>
	</div>
</form>