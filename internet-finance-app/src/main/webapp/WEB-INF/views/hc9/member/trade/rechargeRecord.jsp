<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = "/";
%>
<table class="table text-center">
	<thead>
		<tr class="bg-panel">
			<th class="text-center">订单号</th>
			<th class="text-center">充值金额</th>
			<th class="text-center">到账金额</th>
			<th class="text-center">宝付手续费</th>
			<th class="text-center">商户手续费</th>
			<th class="text-center">充值时间</th>
			<th class="text-center">交易状态</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${page.list}" var="recharge" varStatus="no">
			<tr>
				<td>${recharge.orderNum}</td>
				<td><fmt:formatNumber pattern="0.00" value="${recharge.rechargeAmount}" /></td>
				<td><fmt:formatNumber pattern="0.00" value="${recharge.incash_money}" /></td>
				<td><fmt:formatNumber pattern="0.00" value="${recharge.rechargeAmount-recharge.incash_money }" /></td>
				<td><fmt:formatNumber pattern="0.00" value="${recharge.mer_fee }" /></td>
				<td>${recharge.time.substring(0,10)}</td>
				<td><c:if test="${recharge.status eq 0}">
						<a href="javascript:rechSearch(${recharge.id},${page.pageNum});"
							style="color: red;">待确认</a>
					</c:if> <c:if test="${recharge.status eq 1}">
							成功
						</c:if> <c:if test="${recharge.status eq -1}">
					  		失败
					  	</c:if></td>
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