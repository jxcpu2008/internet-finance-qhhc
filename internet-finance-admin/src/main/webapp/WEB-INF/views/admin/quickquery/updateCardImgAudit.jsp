<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
    String path = request.getContextPath();
    String basePath = "/";
%>
<script src="/resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<form method="post" id="frm" name="myForm" action="<%=basePath %>cardImgAudit/auditCardImgStateNotPass?examine=2"   class="pageForm required-validate"  	onsubmit="return validateCallback(this,dialogAjaxDone)">
	<div class="pageContent">
			<div class="pageFormContent" layoutH="60" style="margin-left: 50px;">	
			<dl>
			  <dt>拒绝原因：</dt>
				<dd>
			     	<input type="hidden" name="id" value="${id}"/>
				    <textarea rows="3"  cols="20"  id="remark" name="remark"   class="required"  ></textarea>
				</dd>
			</dl>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent" >
							<button type="submit" >确认</button>
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