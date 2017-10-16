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
			<th class="text-center">提现金额</th>
			<th class="text-center">宝付手续费</th>
			<th class="text-center">商户手续费</th>
			<th class="text-center">提现时间</th>
			<th class="text-center">交易状态</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${page.list}" var="withdraw">
			<tr>
				<td>${withdraw.strNum}</td>
				<td>￥<fmt:formatNumber value="${withdraw.amount }" pattern="#0.00#"/></td>
				<td><c:if test="${empty withdraw.fee}">￥0.00</c:if> <c:if
						test="${!empty withdraw.fee}">￥<fmt:formatNumber value="${withdraw.fee }" pattern="#0.00#"/></c:if></td>
				<td><c:if test="${empty withdraw.mer_fee}">￥0.00</c:if> <c:if
						test="${!empty withdraw.mer_fee}">￥<fmt:formatNumber value="${withdraw.mer_fee }" pattern="#0.00#"/></c:if></td>
				<td>${withdraw.time}</td>
				<td><c:if test="${withdraw.state eq 0}">
						<a href="javascript:withdrSearch(${withdraw.id},${page.pageNum });"
							style="color: red;">待确认</a>
					</c:if> <c:if test="${withdraw.state eq 1}">
											   成功
											 </c:if> <c:if test="${withdraw.state eq 5}">
						<a href="javascript:withdrSearch(${withdraw.id},${page.pageNum });"
							style="color: red;">转账处理中</a>
					</c:if> <c:if test="${withdraw.state eq -1}">
											   失败
											  </c:if> <c:if test="${withdraw.state eq 2}">
						<a href="javascript:withdrSearch(${withdraw.id},${page.pageNum });"
							style="color: red;">宝付已受理</a>
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