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
		<tr>
			<td>待收佣金：<fmt:formatNumber type="number" value="${collectMoney }" pattern="#0.00#" /></td>
			<td>已收佣金：<fmt:formatNumber type="number" value="${receivedMoney }" pattern="#0.00#" /></td>
			<td colspan="2">推荐投资金额：<fmt:formatNumber type="number" value="${recommCollect[1] }" pattern="#0.00#" /></td>
			<td>推荐人数：${recommCollect[0] }</td>
		</tr>
		<tr class="bg-panel">
			<th class="text-center">产品名称</th>
			<th class="text-center">认购金额</th>
			<th class="text-center">认购人姓名</th>
			<th class="text-center">认购人手机号</th>
			<th class="text-center">应收佣金(元)</th>
			<th class="text-center">已收佣金(元)</th>
			<th class="text-center">认购时间</th>
			<th class="text-center">交易状态</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${page.list }" var="comlist">
			<tr>
				<c:if test="${fn:length(comlist[8]) ge 10}">
					<td title="${comlist[8] }">${comlist[8].substring(0,10)}..</td>
				</c:if>
				<c:if test="${fn:length(comlist[8]) lt 10}">
					<td title="${comlist[8] }">${comlist[8] }</td>
				</c:if>
				<td>
					<fmt:formatNumber type="number" value="${comlist[3] }" pattern="#0.00#"/>
				</td>
				<c:set var="name" value="${comlist[10] }"/>
				<td>${name.substring(0,1) }***</td>
				<c:set var="phone" value="${comlist[11] }"/>
				<td>***${phone.substring(phone.length()-4,phone.length()) }</td>
				<td><fmt:formatNumber type="number" value="${comlist[4] }"
						pattern="#0.00#" /></td>
				<td><c:if test="${comlist[5] eq 0 || comlist[5] eq -1 }">0.00</c:if>
					<c:if test="${comlist[5] eq 1 }"><fmt:formatNumber type="number" value="${comlist[9] }"
						pattern="#0.00#" /></c:if></td>
				<td>${comlist[7] }</td>
				<td><c:if test="${comlist[5] eq 0 }">未支付</c:if> <c:if
						test="${comlist[5] eq 1 }">支付成功</c:if> </td>
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