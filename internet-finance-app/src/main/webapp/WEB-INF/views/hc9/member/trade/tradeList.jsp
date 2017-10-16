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
			<th class="text-center">操作时间</th>
			<th class="text-center">交易类型</th>
			<th class="text-center">收入金额（元）</th>
			<th class="text-center">支出金额（元）</th>
			<!-- <th class="text-center">服务费（元）</th> -->
			<!-- <th class="text-center">当前余额（元）</th>-->
		</tr>
	</thead>
	<tbody>
		<c:forEach var="trade" items="${page.list}">
			<tr>
				<td>${trade[4] }</td>
				<td>${trade[1] }</td>
				<td>
					<c:if test="${empty trade[2] || 0 eq trade[2] }">--</c:if>
					<c:if test="${!empty trade[2] && 0 ne trade[2] }"><fmt:formatNumber value="${trade[2] }" pattern="#0.00#"/></c:if>
				</td>
				<td>
					<c:if test="${empty trade[6] || 0 eq trade[6] }">--</c:if>
					<c:if test="${!empty trade[6] && 0 ne trade[6] }"><fmt:formatNumber value="${trade[6] }" pattern="#0.00#"/></c:if>
				</td>
				<%-- <td>
					<c:if test="${empty trade[5] || 0 eq trade[5] }">--</c:if>
					<c:if test="${!empty trade[5] && 0 ne trade[5] }"><fmt:formatNumber value="${trade[5] }" pattern="#00.00#"/></c:if>
				</td> --%>
				<%-- <td><fmt:formatNumber value="${trade[3] }" pattern="#0.00#"/></td> --%>
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
