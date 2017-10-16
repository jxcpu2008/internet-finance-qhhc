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
			<th class="text-center">融资总额(元)</th>
			<th class="text-center">应还金额(元)</th>
			<th class="text-center">已融资总额(元)</th>
			<th class="text-center">发布日期</th>
			<!-- <th class="text-center">融资合同单号(合同)</th> -->
			<th class="text-center">状态</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${page.list }" var="loan">
			<tr>
				<c:if test="${fn:length(loan[1]) ge 12}">
					<td title="${loan[1] }"><a class="text-label" href="/loaninfo/loansignInfo.htm?loanId=${loan[0] }">${loan[1].substring(0,12)}...</a></td>
				</c:if>
				<c:if test="${fn:length(loan[1]) lt 12}">
					<td title="${loan[1] }"><a class="text-label" href="/loaninfo/loansignInfo.htm?loanId=${loan[0] }">${loan[1] }</a></td>
				</c:if>
				<td><fmt:formatNumber value="${loan[3]}" pattern="#0.00#" /></td>
				<td><fmt:formatNumber value="${loan[5]}" pattern="#0.00#" /></td>
				<td><fmt:formatNumber value="${loan[6]}" pattern="#0.00#" /></td>
				<td>${loan[4]}</td>
				<td><c:if test="${loan[2] eq 1}">融资中</c:if> <c:if
						test="${loan[2] ge 2 && loan[2] le 5}">满标中</c:if> <c:if
						test="${loan[2] eq 6 || loan[2] eq 7}">还款中</c:if> <c:if
						test="${loan[2] eq 8}">已完成</c:if> <c:if test="${loan[2] eq 9}">已流标</c:if>
					<c:if test="${loan[2] eq -1}">已清盘</c:if></td>
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
