<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
.textarea {
	width: 510px;
	height: 100px;
	border: 1px red soild
}
</style>
<script src="/resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<script src="/resources/js/loanSign/editLoansign.js"
	type="text/javascript"></script>
<div class="pageContent">
	<form id="form2" method="post" action="/loanSign/saveLoansign"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this, navTabAjaxDone);">
		<input type="hidden" name="id" id="loadId" value="${loansign.id}" />
		<input type="hidden" value="${loansignbasics.enteruptime1 }"
			id="curYear" /> <input type="hidden"
			value="${loansignbasics.enteruptime2 }" id="curMonth" /> <input
			type="hidden" value="${loansign.cus_id }" name="cus_id" />
		<!-- 查找带回结束 -->
		<div class="pageFormContent" layoutH="60" style="margin-left: 50px;">
			<p>
				<label> 借款人</label> <input id="borrower_name_edit" type="text" class="required"
					name="Userbasicsinfo.name" value="${loansign.userbasicsinfo.name}"
					readonly="readonly" /> <input type="hidden"
					name="Userbasicsinfo.id" value="${loansign.userbasicsinfo.id}" />
				<a class="btnLook" href="/baseLoanSign/borrowersbaseLists"
					width="520" lookupGroup="Userbasicsinfo">查找带回</a>
			</p>
			<p>
				<label>借款标题</label> <input id="loansignNameId" name="name" type="text" class="required"
					minlength="6" maxlength="20" value="${loansign.name }" />
					<input id="orginalLoansignNameId" type="hidden" value="${orginalLoansignName}">
			</p>
			<p>
				<label>本期借款总额</label> <input type="text" name="issueLoan"
					id="issueLoan1" class="required number" maxlength="15"
					value="<fmt:formatNumber type="number" value="${loansign.issueLoan}" pattern="#0.00" />">元
			</p>
			<p>
				<label>优先拟定金额</label> <input type="text" name="priority"
					id="priority1" class="required number" maxlength="15"
					value="<fmt:formatNumber type="number" value="${loansign.priority }" pattern="#0.00" />">元
			</p>
			<p>
				<label>夹层拟定金额</label> <input type="text" name="middle" id="middle1"
					class="required number" maxlength="15"
					value="<fmt:formatNumber type="number" value="${loansign.middle }" pattern="#0.00" />">元
			</p>
			<p>
				<label>劣后拟定金额</label> <input type="text" name="after" id="after1"
					class="required number" maxlength="15"
					value="<fmt:formatNumber type="number" value="${loansign.after }" pattern="#0.00" />">元
			</p>

			<p>
				<label>最小借出单位</label> <select name="loanUnit" id="loanUnit1">
					<option value="100"
						<c:if test="${loansign.loanUnit eq  '100'}">selected="selected"</c:if>>100</option>
					<option value="200"
						<c:if test="${loansign.loanUnit eq  '200'}">selected="selected"</c:if>>200</option>
					<option value="300"
						<c:if test="${loansign.loanUnit eq  '300'}">selected="selected"</c:if>>300</option>
					<option value="500"
						<c:if test="${loansign.loanUnit eq  '500'}">selected="selected"</c:if>>500</option>
					<option value="1000"
						<c:if test="${loansign.loanUnit eq  '1000'}">selected="selected"</c:if>>1000</option>
				</select>
			</p>
			<p>
				<label>借款类型</label> <select name="type" id="subType">
					<option value="3"
						<c:if test="${loansign.type eq  '3'}">selected="selected"</c:if>>短期众持</option>
					<option value="2"
						<c:if test="${loansign.type eq  '2'}">selected="selected"</c:if>>普通众持</option>
				</select>
			</p>
			<p>
				<label>还款类型</label> <select name="refunway" id="refunway">
					<option value="1"
						<c:if test="${loansign.refunway eq  '1'}">selected="selected"</c:if>>按月还款</option>
					<option value="2"
						<c:if test="${loansign.refunway eq  '2'}">selected="selected"</c:if>>按季度还款</option>
							<option value="4"
						<c:if test="${loansign.refunway eq  '4'}">selected="selected"</c:if>>等本等息</option>
				</select>
			</p>
			<p>
				<label>企业成立时间</label> <select name="enteruptime1" id="year1"
					style="float: none;">
				</select>年 <select name="enteruptime2" id="month1" style="float: none;">
				</select>月
			</p>
			<p>
				<label>企业所在城市</label> <select name="province" id="cityid-3"
					style="float: none;"><option value="">请选择</option>
					<c:forEach items="${proList}" var="pro">
						<option value="${pro.id}"
							<c:if test="${pro.id==loansignbasics.province}">selected="selected"</c:if>>${pro.name}</option>
					</c:forEach>
				</select>&nbsp;<select name="city" id="cityid-4" style="float: none;"><option
						value="">请选择</option>
					<c:if test="${!empty loansignbasics.city}">
						<option value="${loansignbasics.city}" selected="selected">${loansignbasics.city}</option>
					</c:if>
				</select>
			</p>
			<p>
				<label>企业地址</label><input type="text" name="address"
					value="${loansignbasics.address }">
			</p>
			<p>
				<label>优先年利率</label> <input name="prioRate" type="text"
					class="required number" min="4" max="24"
					value="${loansign.prioRate * 100 }" />%
			</p>

			<p>
				<label>奖励</label> <input name="prioAwordRate" type="text"
					class="required number" min="0" max="10"
					value="${loansign.prioAwordRate * 100 }" />%
			</p>
			<p>
				<label>劣后拟定年利率</label> <input type="text" name="afterRate"
					class="required number" value="${loansign.afterRate * 100 }" />%

			</p>
			<p>
				<label>标的期限</label> <input name="remonth" id="remonth1" type="text"
					class="required number digits" 
					value="${loansign.remonth}" />天/月
			</p>
			<p>
				<label>第三方担保</label> <select name="escrow.id">
					<c:forEach items="${ecl}" var="ecls" varStatus="statvar">
						<option value="${ecls.id}"
							<c:if test="${loansign.escrow.id==ecls.id}">selected = "selected"</c:if>>${ecls.name}
						</option>
					</c:forEach>
				</select>
			</p>

			<p>
				<label>发布有效期</label> <input name="validity" type="text"
					class="required number digits" min="0" max="30"
					value="${loansign.validity}" />天
			</p>
			<p>
				<label>项目类型</label> <select name="loansignType.id">
					<c:forEach items="${loansignType}" var="loansignTypes" varStatus="statvar">
						<option value="${loansignTypes.id}"
							<c:if test="${loansign.loansignType.id==loansignTypes.id}">selected = "selected"</c:if>>${loansignTypes.typeName}
						</option>
					</c:forEach>
				</select>
			</p>
			<p>
				<label>项目号</label><input  name="projectNumber"   value="${loansign.projectNumber}" class="required  number"  type="text"  maxlength="4" >(必须数字)
			</p>
			<p>
				<label>项目期数</label><input  name="loanPeriods"   value="${loansign.loanPeriods}" class="required lettersonly textInput"    maxlength="2"  alt="必须是字母">(必须字母)
			</p>
			<p>
				<label>活动状态</label> <select name="activityStatus" id="activityStatus">
					<option value="0"
						<c:if test="${loansign.activityStatus eq  '0'}">selected="selected"</c:if>>不参与</option>
					<option value="1"
						<c:if test="${loansign.activityStatus eq  '1'}">selected="selected"</c:if>>参与</option>
				</select>
			</p>
			<p style="clear: both; width: 100%">
				<label>客户基本信息</label>
				<input id="customerMsgNameForUpdate" name="Userbasicsinfo.name" class="required" style="width: 15%" maxlength="20" placeholder="客户姓名" readonly="readonly" value="${customerReminder.receiverName}">
				<input id="customerMsgPhoneForUpdate" class="required" style="width: 15%" onkeyup="value=value.replace(/[^\d]/g,'')" maxlength="20" placeholder="客户手机号" value="${customerReminder.receiverPhone}">
				<input id="customerMsgEmailForUpdate" style="width: 15%" maxlength="30" alt="必须是字母" placeholder="客户邮箱" value="${customerReminder.receiverEmail}">
				<input id="customerTypeForUpdate" type="hidden" value="1">
			</p>
			<p style="clear: both; width: 100%">
				<label>项目消息提醒人</label>
				<input id="reminderEmployeeNameForUpdate" name="reminderEmployeeName" style="width: 15%" maxlength="30" alt="必须是字母" placeholder="提醒人姓名">
				<input id="reminderEmployeePhoneForUpdate" name="reminderEmployeePhone" onkeyup="value=value.replace(/[^\d]/g,'')" style="width: 15%" maxlength="30" alt="必须是字母" placeholder="提醒人手机号">
				<input id="reminderEmployeeEmailForUpdate" name="reminderEmployeeEmail" style="width: 15%" maxlength="30" alt="必须是字母" placeholder="提醒人邮箱">
				<input id="addMsgReminderBtnForUpdate" type="button" value="添加"/>
			</p>
			<p style="clear: both; width: 100%">
				<input id="employeeReminderInfoForUpdate" name="employeeReminderInfo" type="hidden" value="">
				<div style="float: left;padding-left: 120px;">&nbsp</div>
					<c:forEach items="${employeeReminderList}" var="reminder" varStatus="statvar">
						<div style="float:left;" receiverNameListForUpdate="e" class="cancel">
							<span>${reminder.receiverName}</span>
							<input name="receiverName" type="hidden" value="${reminder.receiverName}">
							<input name="receiverPhone" type="hidden" value="${reminder.receiverPhone}">
							<input name="receiverEmail" type="hidden" value="${reminder.receiverEmail}">
							<input name="receivertype" type="hidden" value="2">
							<img src="/resources/assets/images/home/remove.png" onclick="deleteReminderInfo(this)">
						</div>
					</c:forEach>
				<div style="float: left;" id="employeeInfoPareaForUpdate"><span>&nbsp;</span></div>
			</p>
			<p style="clear: both; height: 290px; width: 100%">
				<label>借款方借款用途</label>
				<textarea name="behoof" rows="13" cols="107">${loansignbasics.behoof}</textarea>
			</p>
			<p style="clear: both; height: 290px; width: 100%">
				<label>项目简介</label>
				<textarea name="remark" class="editor"
					upImgUrl="/admincolum/uploadFile" upImgExt="jpg,jpeg,gif,png"
					rows="13" cols="80">${loansignbasics.remark}</textarea>
			</p>

			<p style="clear: both; height: 290px; width: 100%">
				<label>风控措施</label>
				<textarea class="editor" upImgUrl="/admincolum/uploadFile"
					upImgExt="jpg,jpeg,gif,png" rows="13" cols="80" name="history">${loansignbasics.history}</textarea>
			</p>
		</div>
		<div class="formBar">
			<ul>

				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="button" id="submit1">保存</button>
						</div>
					</div></li>

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
