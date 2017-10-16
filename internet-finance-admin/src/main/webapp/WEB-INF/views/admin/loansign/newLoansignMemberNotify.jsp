<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="/resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<script type="text/javascript" src="/resources/js/loanSign/loanSign.js"></script>
<div class="pageContent">
	<form id="newLoansignMemberNotifyForm" method="post" action="/loanSign/doNewLoansignMemberNotify" 
		class="pageForm required-validate"
		onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input name="loansignId" type="hidden" value="${loansignId}"/>
		<!-- 查找带回结束 -->
		<div class="pageFormContent" layoutH="60" style="margin-left: 50px;">
			<div>
				<label>模板类型</label> 
				<select name="msgType" style="float: none;">
					<option value="1">短信</option>
					<!-- <option value="3">邮件</option> -->
				</select>
			</div><br/>
		</div>
		<div class="formBar">
			<ul>
				<li>
					<div class="buttonActive">
						<div class="buttonContent">
							<button type="button" id="newLoansignMemberNotifyBtn">确认通知</button>
						</div>
					</div>
				</li>
				<li>
					<div class="button">
						<div class="buttonContent">
							<button type="reset" class="close">取消</button>
						</div>
					</div>
				</li>
			</ul>
		</div>
	</form>
</div>