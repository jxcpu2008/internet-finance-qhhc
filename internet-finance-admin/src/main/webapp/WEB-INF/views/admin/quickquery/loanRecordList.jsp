<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript">
	$("#search-status").omCombo({
						width : 80,
						forceSelection : true,
						dataSource : [ {
							text : '募集中',
							value : '10'
						}, {
							text : '还款中',
							value : '6'
						}, {
							text : '正常还款',
							value : '7'
						}, {
							text : '已清盘',
							value : '-1'
						} ]
					});
</script>
<style>
td{text-align: center;}
th{text-align:center;}
</style>
<form id="pagerForm" method="post" action="/quickQuery/openUserLoanRecordList" onsubmit="return validateCallback(this, navTabAjaxDone)">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="userId" value="${userId}"/>
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
</form>

<div class="pageContent" style="border-left:1px #B8D0D6 solid;border-right:1px #B8D0D6 solid;">
<div class="pageHeader" style="border:1px #B8D0D6 solid">
	<form  action="/quickQuery/openUserLoanRecordList" method="post" onsubmit="return navTabSearch(this);">
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
						<span class="label">状态：</span><input name="status" id="search-status" />
					</td>
					<td><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></td>
				</tr>
			</table>
		</div>
	</form>
</div>

<table class="table" width="100%" layoutH="110" >
	<thead>
		<tr>
			<th width="10%">认购时间</th>
			<th width="10%">产品名称</th>
			<th width="10%">投资期限</th>
			<th width="10%">投资类型</th>
			<th width="10%">年化利率</th>
			<th width="10%">认购金额</th>
			<th width="10%">起息时间</th>
			<th width="10%">利息</th>
			<th width="10%">佣金</th>
			<th width="10%">标的状态</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list}" var="loanRecord">
			    <tr>
				<td>${loanRecord[0]}</td>
				<td>${loanRecord[1]}</td>
				<td>  
				      <c:if  test="${loanRecord[2]==1}">${loanRecord[3]}个月</c:if>
				      <c:if  test="${loanRecord[2]==2}">${loanRecord[3]}个月</c:if>
				      <c:if  test="${loanRecord[2]==3}">${loanRecord[3]}天</c:if>
				</td>
				<td>
				         <c:if  test="${loanRecord[4]==1}">优先</c:if>
			             <c:if  test="${loanRecord[4]==2}">夹层</c:if>
			             <c:if  test="${loanRecord[4]==3}">劣后</c:if>
				</td>
			    <td>
			             <c:if  test="${loanRecord[4]==1}"> ${loanRecord[5]*100}%</c:if>
			             <c:if  test="${loanRecord[4]==2}">0~23%</c:if>
			             <c:if  test="${loanRecord[4]==3}">浮动收益</c:if>
			    </td>
				<td><fmt:formatNumber pattern="0.00" value="${loanRecord[6]}"/></td>
				<td>${loanRecord[7]}</td>
				<td><fmt:formatNumber pattern="0.00" value="${loanRecord[8]}"/></td>
				<td><fmt:formatNumber pattern="0.00" value="${loanRecord[9]}"/></td>
				<td>
				         <c:if  test="${loanRecord[10]==1  or  loanRecord[10]==2  or  loanRecord[10]==3 or  loanRecord[10]==4  or  loanRecord[10]==5}">募集中</c:if>
			             <c:if  test="${loanRecord[10]==6}">还款中</c:if>
			             <c:if  test="${loanRecord[10]==7}">正常还款</c:if>
			             <c:if  test="${loanRecord[10]==8}">已完成</c:if>
			             <c:if  test="${loanRecord[10]==9}">已流标</c:if>
			             <c:if  test="${loanRecord[10]==-1}">已清盘</c:if>
				</td>
			    </tr>
		    </c:forEach>
	   </tbody>
</table>
<jsp:include page="/WEB-INF/views/admin/public/dwzpage.jsp"/>
</div>