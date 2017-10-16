<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript">
	$("#search-accountType").omCombo({
						width : 80,
						forceSelection : true,
						dataSource : [{
							text : '提现',
							value : '7'
						}, {
							text : '充值',
							value : '6'
						}, {
							text : '认购',
							value : '5'
						} , {
							text : '流标',
							value : '3'
						}, {
							text : '放款',
							value : '12'
						}, {
							text : '回款',
							value : '20'
						}, {
							text : '还款',
							value : '4'
						}, {
							text : '佣金发放',
							value : '16'
						}, {
							text : '奖励发放',
							value : '18'
						} , {
							text : '平台收取服务费',
							value : '17'
						} , {
							text : '退款',
							value : '19'
						}]
					});
</script>
<style>
td{text-align: center;}
th{text-align:center;}
</style>
<form id="pagerForm" method="post" action="/quickQuery/openAccountInfoList" onsubmit="return validateCallback(this, navTabAjaxDone)">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="userId" value="${userId}"/>
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
</form>
<div class="pageContent" style="border-left:1px #B8D0D6 solid;border-right:1px #B8D0D6 solid;">
<div class="pageHeader" style="border:1px #B8D0D6 solid">
	<form  action="/quickQuery/openAccountInfoList" method="post" onsubmit="return navTabSearch(this);">
		<input type="hidden" name="pageNum" value="1" />
		<input type="hidden" name="userId" value="${userId}"/>
		<input type="hidden" name="numPerPage" value="${page.numPerPage}"/>
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						日期：<input style="width: 120px;" type="text" datefmt="yyyy-MM-dd HH:mm:ss" class="date" name="beginDate"  readonly="readonly"/>至
						<input style="width: 120px;" type="text" datefmt="yyyy-MM-dd HH:mm:ss" class="date" name="endDate"  readonly="readonly"/>
					</td>
					<td>
						<span class="label">状态：</span><input name="accountType" id="search-accountType" />
					</td>
					<td><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></td>
				</tr>
			</table>
		</div>
	</form>
</div>

<table class="table" width="100%" layoutH="110">
	<thead>
		<tr>
			<th width="15%">时间</th>
			<th width="10%">金额</th>
			<th width="15%">类型</th>
			<th width="15%">当前余额</th>
		</tr>
	</thead>
	<tbody>
		 <c:forEach items="${list}" var="account">
			    <tr>
				<td>${account[0]}</td>
				<td>
				 <c:if  test="${account[5] == 5 or account[5] == 7 or  account[5] == 15 or  account[5] == 19 or account[5] == 17  or  account[5] ==4}">-<fmt:formatNumber pattern="0.00" value="${account[1]}"/></c:if>
				 <c:if  test="${account[5] == 3 or  account[5] == 6 or  account[5] == 12 or  account[5] == 16 or  account[5] == 18 or  account[5] == 20  or  account[5] == 21}"><fmt:formatNumber pattern="0.00" value="${account[2]}"/></c:if>
				</td>
				<td>${account[3]}</td>
				<td><fmt:formatNumber pattern="0.00" value="${account[4]}"/></td>
			    </tr>
		    </c:forEach>
	</tbody>
</table>
<div>金额合计：<fmt:formatNumber pattern="0.00" value="${sumMoney}"/>元</div>
<jsp:include page="/WEB-INF/views/admin/public/dwzpage.jsp"/>
</div>