<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<table class="table text-center">
	<thead>
		<tr class="bg-panel">
			<th class="text-center">产品名称</th>
			<th class="text-center">期数</th>
			<th class="text-center">预计还款日期</th>
			<th class="text-center">应还金额</th>
			<th class="text-center">还款日期</th>
			<th class="text-center">&nbsp;操&nbsp;作&nbsp;</th>
		</tr>
	</thead>
	<tbody>
		<c:set var="sta" value="1" />
		<c:forEach var="loan" items="${page.list}">
			<tr>
				<c:if test="${fn:length(loan[1]) ge 15}">
					<td title="${loan[1] }">${loan[1].substring(0,15)}..</td>
				</c:if>
				<c:if test="${fn:length(loan[1]) lt 15}">
					<td title="${loan[1] }">${loan[1] }</td>
				</c:if> 
				<td>第${loan[3] }期</td>
				<td>${loan[2]}</td>
				<td><fmt:formatNumber type="currency" value="${loan[4]}" currencySymbol="" /></td>
				<td><c:if test="${!empty loan[6]}">${loan[6].substring(0,10) }</c:if><c:if test="${empty loan[6]}">--</c:if></td>
				<td>
					<c:if test="${loan[5] eq 1 || loan[5] eq 3}">
						<c:if test="${loan[7] eq 2 && loan[9] eq loan[0]}">
							<button type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#repayModal" onclick="repaymentInfo(${loan[8]},${loan[0]});">按时还款</button>
						</c:if>
						<c:if test="${loan[7] eq 1 && loan[9] eq loan[0]}">
							<button type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#repayModal" onclick="repaymentInfo(${loan[8]},${loan[0]});">逾期还款</button>
						</c:if>
						<c:if test="${loan[7] eq 2 && loan[9] ne loan[0]}">
							未还款
						</c:if>
						<c:if test="${loan[7] eq 1 && loan[9] ne loan[0]}">
							逾期未还款
						</c:if>
					</c:if>
					<c:if test="${loan[5] eq 2 || loan[5] eq 4 ||loan[5] eq 5}">
						已还款
					</c:if>
					<c:if test="${loan[5] eq -1 }">
						已清盘
					</c:if> 
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<c:if test="${empty page.list }">
	<p class="text-center medium-font margin40">暂无数据</p>
</c:if>
<c:if test="${!empty page.list }">
	<jsp:include page="/WEB-INF/views/hc9/common/pageRed.jsp" />
</c:if>
<!-- 项目还款模态框 -->
<div class="modal fade" id="repayModal" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">项目还款</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" method="post" action="/loanManage/shareLoanRepayMent.htm" id="repayment_form">
					<input type="hidden" name="repayId" id="repayId" />
					<div class="form-group">
						<label class="col-sm-3 control-label normal-weight">当前还款的项目
							:</label>
						<div class="col-sm-9">
							<span data-title="title" id="loan_name"></span> <span
								class="text-danger" data-total="total" id="issueLoan">(&yen; 0.00
								元)</span>
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label normal-weight">还款总额 :</label>
						<div class="col-sm-4">
							<input type="text" class="form-control input-sm" id="repaySum" name="repayMoney"
								placeholder="" readonly="readonly">
						</div>
						<div class="input-group-addon">元</div>
					</div>
					<div class="form-group">
						<label class="col-sm-3 control-label normal-weight">还款类型 :</label>
						<div class="col-sm-9">
							<span id="repayType">按月付息，到期还本</span>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" id="confirm_rep">确认还款</button>
				<button type="button" class="btn btn-warning" data-dismiss="modal">取消</button>
			</div>
		</div>
	</div>
</div>
<script src="${oss}/resources/assets/js/src/center/repay-modules.js"></script>
<script src="${oss}/resources/assets/js/repay.js"></script>