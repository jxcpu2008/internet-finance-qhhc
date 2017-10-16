<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
.detailes>table {
	height: 360px;
	width: 680px;
}

.detailes>table td {
	width: 80px;
	color: #00CCFF;
	padding-left: 50px;
	border-bottom: 1px solid #ccc;
}

.detailes>table td.td2 {
	color: #000;
	border-right: 1px solid #ccc;
}

.detailes>table td.td3 {
	color: #000;
}
</style>
<div class="detailes">
	<table>
		<tr>
			<td>记录ID</td>
			<td class="td2">${loanDetailes[0][0]}</td>
			<td>购买是否成功</td>
			<td class="td3"><c:if test="${loanDetailes[0][6] eq 0}">待支付</c:if>
				<c:if test="${loanDetailes[0][6] eq 1}">成功</c:if> <c:if
					test="${loanDetailes[0][6] eq -1}">失败</c:if></td>
		</tr>
		<tr>
			<td>项目名称</td>
			<td class="td2">${loanDetailes[0][1]}</td>
			<td>投资者真实用户名</td>
			<td class="td3">${loanDetailes[0][2]}</td>
		</tr>
		<tr>
			<td>购买金额</td>
			<td class="td2">${loanDetailes[0][3]}</td>
			<td>订单号</td>
			<td class="td3">${loanDetailes[0][4]}</td>
		</tr>
		<tr>
			<td>购买时间</td>
			<td class="td2">${loanDetailes[0][5]}</td>
			<td>投资类型</td>
			<td class="td3"><c:if test="${loanDetailes[0][7] eq 1}">优先</c:if>
				<c:if test="${loanDetailes[0][7] eq 2}">夹层</c:if> <c:if
					test="${loanDetailes[0][7] eq 3}">劣后</c:if></td>
		</tr>
		<tr>
			<td>放款时间</td>
			<td class="td2">${loanDetailes[0][10]}</td>
			<td>标的状态</td>
			<td class="td3"><c:if test="${loanDetailes[0][8] eq 1}">融资中</c:if>
				<c:if
					test="${loanDetailes[0][8] eq 2 || loanDetailes[0][8] eq 3 ||loanDetailes[0][8] eq 4 ||loanDetailes[0][8] eq 5 }">融资成功</c:if>
				<c:if test="${loanDetailes[0][8] eq 6}">已放款</c:if> <c:if
					test="${loanDetailes[0][8] eq 7}">还款中</c:if> <c:if
					test="${loanDetailes[0][8] eq 8}">已完成</c:if> <c:if
					test="${loanDetailes[0][8] eq 9}">已流标</c:if></td>
		</tr>
		<tr>
			<td>产品期限</td>
			<td class="td2"><c:if test="${loanDetailes[0][14] eq 2}">${loanDetailes[0][9]}个月</c:if>
				<c:if test="${loanDetailes[0][14] eq 3}">${loanDetailes[0][9]}天</c:if>
			</td>
			<td>佣金</td>
			<td class="td3"><fmt:formatNumber type="number"
					value="${loanDetailes[0][13]}" maxFractionDigits="2" />元</td>
		</tr>
		<tr>
			<td>推荐人</td>
			<td class="td2">${loanDetailes[0][11]}</td>
			<td>推荐部门</td>
			<td class="td3"><c:if test="${loanDetailes[0][12] eq 1}">总裁办</c:if>
				<c:if test="${loanDetailes[0][12] eq 2}">财务部</c:if> <c:if
					test="${loanDetailes[0][12] eq 3}">行政部</c:if> <c:if
					test="${loanDetailes[0][12] eq 4}">副总办</c:if> <c:if
					test="${loanDetailes[0][12] eq 5}">运营中心</c:if> <c:if
					test="${loanDetailes[0][12] eq 6}">培训部</c:if> <c:if
					test="${loanDetailes[0][12] eq 7}">风控部</c:if> <c:if
					test="${loanDetailes[0][12] eq 8}">IT部</c:if> <c:if
					test="${loanDetailes[0][12] eq 9}">摄影部</c:if> <c:if
					test="${loanDetailes[0][12] eq 10}">推广部</c:if> <c:if
					test="${loanDetailes[0][12] eq 11}">项目部</c:if> <c:if
					test="${loanDetailes[0][12] eq 12}">客服部</c:if> <c:if
					test="${loanDetailes[0][12] eq 13}">事业一部</c:if> <c:if
					test="${loanDetailes[0][12] eq 14}">事业二部</c:if> <c:if
					test="${loanDetailes[0][12] eq 15}">离职员工</c:if></td>
		</tr>
	</table>
</div>