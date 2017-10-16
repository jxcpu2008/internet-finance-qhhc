<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="pageContent">
	<form action="/loanSign/add_upt_industry?operation=${operation}" method="post"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this, dialogAjaxDone)">
		<div class="pageFormContent" layoutH="50">
			<c:if test="${operation == 'upt'}">
				<input type="hidden" name="id" value="${industry.id }" />
			</c:if>
			<c:if test="${operation == 'add'}">
				<input type="hidden" name="id" value="0" />
			</c:if>
			<p>
				<label>行业名称：</label> <input type="text" class="required textInput"
					name="name" value="${industry.name }">
			</p>
			<p>
				<label> 行业类别：</label> <input type="text" name="industryType"
					value="${industry.industryType }">
			</p>
		</div>
		<div class="formBar">
			<ul>
				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="submit">保存</button>
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
	</form>
</div>