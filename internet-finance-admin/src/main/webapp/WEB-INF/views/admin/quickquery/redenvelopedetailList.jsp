<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript">
	$("#search-useFlag").omCombo({
						width : 80,
						forceSelection : true,
						dataSource : [ {
							text : '未使用',
							value : '0'
						}, {
							text : '已使用',
							value : '1'
						}, {
							text : '待确认',
							value : '2'
						} ]
					});
</script>
<style>
td{text-align: center;}
th{text-align:center;}
</style>
<form id="pagerForm" method="post" action="/quickQuery/openRedenvelopedetailList" onsubmit="return validateCallback(this, navTabAjaxDone)">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="userId" value="${userId}"/>
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
</form>

<div class="pageContent" style="border-left:1px #B8D0D6 solid;border-right:1px #B8D0D6 solid;">
<div class="pageHeader" style="border:1px #B8D0D6 solid">
	<form  action="/quickQuery/openRedenvelopedetailList" method="post" onsubmit="return navTabSearch(this);">
		<input type="hidden" name="pageNum" value="1" />
		<input type="hidden" name="userId" value="${userId}"/>
		<input type="hidden" name="numPerPage" value="${page.numPerPage}"/>
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						红包使用日期：<input style="width: 120px;" type="text" datefmt="yyyy-MM-dd HH:mm:ss" class="date" name="beginDate"  readonly="readonly"/>至
						<input style="width: 120px;" type="text" datefmt="yyyy-MM-dd HH:mm:ss" class="date" name="endDate"  readonly="readonly"/>
					</td>
					<td>
						<span class="label">状态：</span><input name="status" id="search-useFlag" />
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
			<th width="10%">使用红包</th>
			<th width="10%">最低投资额</th>
			<th width="10%">使用记录Id</th>
			<th width="10%">红包领取时间</th>
			<th width="10%">红包使用时间</th>
			<th width="20%">有效期</th>
			<th width="10%">状态</th>
			<th width="10%">来源类型</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list}" var="redList">
			    <tr>
				<td><fmt:formatNumber pattern="0.00" value="${redList[0]}"/></td>
				<td><fmt:formatNumber pattern="0.00" value="${redList[1]}"/></td>
				<td>${redList[2]}</td>
				<td>${redList[3]}</td>
				<td>${redList[4]}</td>
			    <td>${redList[5]}~${redList[6]}</td>
				<td>
				         <c:if  test="${redList[7]==0}">未使用</c:if>
			             <c:if  test="${redList[7]==1}">已使用</c:if>
			             <c:if  test="${redList[7]==2}">待确认</c:if>
				</td>
			    <td>
			             <c:if  test="${redList[8]==1}">投资</c:if>
			             <c:if  test="${redList[8]==2}">注册</c:if>
			             <c:if  test="${redList[8]==3}">奖励</c:if>
			             <c:if  test="${redList[8]==4}">抽奖</c:if>
			    </td>
			    </tr>
		    </c:forEach>
	   </tbody>
</table>
<jsp:include page="/WEB-INF/views/admin/public/dwzpage.jsp"/>
</div>