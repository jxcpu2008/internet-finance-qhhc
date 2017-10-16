<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
.textarea {
	width: 510px;
	height: 100px;
	border: 1px red soild
}
.cancel {
	border-width: 1px;
	border-style: solid;
	background-color: #fff;
    border-color: #a2bac0 #b8d0d6 #b8d0d6 #a2bac0;
    padding-top: 3px;
    padding-left:6px;
    font-size:12px;
    color:#333;
    margin-right:5px;
}
.cancel>img {
	vertical-align:middle;
	margin-top: -2px;
}
</style>
<script src="/resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<script src="/resources/js/loanSign/addLoanSign.js" type="text/javascript"></script>
<div class="pageContent">
	<form id="form1" method="post" action="/loanSign/saveLoansign"
		class="pageForm required-validate"
		onsubmit="return validateCallback(this, navTabAjaxDone);">
		<!-- 查找带回结束 -->
		<div class="pageFormContent" layoutH="60" style="margin-left: 50px;">
			<p>
				<label> 借款人</label> <input id="borrower_name" type="text" class="required"
					name="Userbasicsinfo.name" value="" readonly="readonly" /> <input
					type="hidden" name="Userbasicsinfo.id" value="" /> <a
					class="btnLook" href="/baseLoanSign/borrowersbaseLists" width="520"
					lookupGroup="Userbasicsinfo">查找带回</a>
			</p>
			<p>
				<label>借款标题</label> <input name="name" type="text" class="required"
					minlength="6" maxlength="20" />
			</p>
			<p>
				<label>本期借款额</label> <input type="text" name="issueLoan"
					id="issueLoan" class="required number" maxlength="15">元
			</p>
			<p>
				<label>优先拟定金额</label> <input type="text" name="priority"
					id="priority" class="required number" maxlength="15">元
			</p>
			<p>
				<label>夹层拟定金额</label> <input type="text" name="middle" id="middle"
					class="required number" maxlength="15">元
			</p>
			<p>
				<label>劣后拟定金额</label> <input type="text" name="after" id="after"
					class="required number" maxlength="15">元
			</p>

			<p>
				<label>最小借出单位</label> <select name="loanUnit" id="loanUnit">
					<option value="100">100</option>
					<option value="200">200</option>
					<option value="300">300</option>
					<option value="500">500</option>
					<option value="1000">1000</option>
				</select>
			</p>
			<p>
				<label>借款类型</label> <select name="type" id="subType">
					<option value="2">普通众持</option>
					<option value="3">短期众持</option>
				</select>
			</p>
	       <p>
					<label>还款类型</label> <select name="refunway" id="refunway">
					<option value="1">按月还款</option>
					<option value="2">按季度还款</option>
					<option value="4">等本等息</option>
				</select>
			</p>
			<p>
				<label>企业成立时间</label> <select name="enteruptime1" id="year"
					style="float: none;">
				</select>年 <select name="enteruptime2" id="month" style="float: none;">
				</select>月
			</p>
			<p>
				<label>企业所在城市</label> <select name="province" id="cityid-1"
					style="float: none;"><option value="">请选择</option>
					<c:forEach items="${proList}" var="pro">
						<option value="${pro.id}"
							<c:if test="${pro.id==loan.loansignbasics.province}">selected="selected"</c:if>>${pro.name}</option>
					</c:forEach>
				</select>&nbsp;<select name="city" id="cityid-2" style="float: none;"><option
						value="">请选择</option>
					<c:if test="${!empty loan.loansignbasics.city}">
						<option value="${loan.loansignbasics.city}" selected="selected">${loan.loansignbasics.city}</option>
					</c:if>
				</select>
			</p>
			<p>
				<label>企业地址</label><input type="text" name="address">
			</p>
			<p>
				<label>优先年利率</label> <input name="prioRate" type="text"
					class="required number" min="4" max="24" />%
			</p>

			<p>
				<label>奖励</label> <input name="prioAwordRate" type="text"
					class="required number" min="0" max="10" />%
			</p>
			<p>
				<label>劣后拟定年利率</label> <input type="text" name="afterRate"
					class="required number" />%

			</p>
			<p>
				<label>标的期限</label> 
				<input name="remonth" type="text"
					class="required number digits" />天/月
			</p>
			<p>
				<label>第三方担保</label> <select name="escrow.id">
					<c:forEach items="${ecl}" var="ecls" varStatus="statvar">
						<option value="${ecls.id}"
							<c:if test="${ls.escrow.id==ecls.id}">selected = "selected"</c:if>>${ecls.name}
						</option>
					</c:forEach>
				</select>
			</p>

			<p>
				<label>发布有效期</label> <input name="validity" type="text"
					class="required number digits" min="1" max="30" />天
			</p>
			<p>
				<label>项目类型</label> <select name="loansignType.id">
					<c:forEach items="${loansignType}" var="loansignTypes"
						varStatus="statvar">
						<option value="${loansignTypes.id}"
							<c:if test="${ls.loansignType.id==loansignTypes.id}">selected = "selected"</c:if>>${loansignTypes.typeName}
						</option>
					</c:forEach>
				</select>
			</p>
			<p>
				<label>项目号</label><input name="projectNumber"
					class="required  number" type="text" maxlength="4">(必须数字)
			</p>
			<p>
				<label>项目期数</label><input name="loanPeriods"
					class="required lettersonly textInput" maxlength="1" alt="必须是字母">(必须字母)
			</p>
		    <p>
					<label>活动状态</label> <select name="activityStatus" id="activityStatus">
					<option value="0">不参与</option>
					<option value="1">参与</option>
				</select>
			</p>
			<p style="clear: both; width: 100%">
				<label>客户基本信息</label>
				<input id="customerMsgName" name="Userbasicsinfo.name" class="required" style="width: 15%" maxlength="20" placeholder="客户姓名" readonly="readonly">
				<input id="customerMsgPhone" class="required" style="width: 15%" onkeyup="value=value.replace(/[^\d]/g,'')" maxlength="20" placeholder="客户手机号">
				<input id="customerMsgEmail" style="width: 15%" maxlength="30" alt="必须是字母" placeholder="客户邮箱">
				<input id="customerType" type="hidden" value="1">
			</p>
			<p style="clear: both; width: 100%">
				<label>项目消息提醒人</label>
				<input id="reminderEmployeeName" name="reminderEmployeeName" style="width: 15%" maxlength="30" alt="必须是字母" placeholder="提醒人姓名">
				<input id="reminderEmployeePhone" name="reminderEmployeePhone" onkeyup="value=value.replace(/[^\d]/g,'')" style="width: 15%" maxlength="30" alt="必须是字母" placeholder="提醒人手机号">
				<input id="reminderEmployeeEmail" name="reminderEmployeeEmail" style="width: 15%" maxlength="30" alt="必须是字母" placeholder="提醒人邮箱">
				<input id="addMsgReminderBtn" type="button" value="添加"/>
			</p>
			<p style="clear: both; width: 100%">
				<input id="employeeReminderInfo" name="employeeReminderInfo" type="hidden" value="">
				<div style="float: left;padding-left: 127px;">&nbsp</div>
				<div style="float: left;" id="employeeInfoParea"><span>&nbsp;</span></div>
			</p>
			<p style="clear: both; height: 290px; width: 100%">
				<label>借款方借款用途</label>
				<textarea name="behoof" rows="13" cols="107"></textarea>
			</p>
			<p style="clear: both; height: 290px; width: 100%">
				<label>项目简介</label>
				<textarea name="remark" class="editor"
					upImgUrl="/admincolum/uploadFile" upImgExt="jpg,jpeg,gif,png"
					rows="13" cols="80"></textarea>
			</p>

			<p style="clear: both; height: 290px; width: 100%">
				<label>风控措施</label>
				<textarea class="editor" upImgUrl="/admincolum/uploadFile"
					upImgExt="jpg,jpeg,gif,png" rows="13" cols="80" name="history"></textarea>
			</p>
		</div>
		<div class="formBar">
			<ul>

				<li><div class="buttonActive">
						<div class="buttonContent">
							<button type="button" id="submit">保存</button>
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
