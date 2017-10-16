<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript">
	$("#search-useFlagCard").omCombo({
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
<form id="pagerForm" method="post" action="/quickQuery/openInCardList" onsubmit="return validateCallback(this, navTabAjaxDone)">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="userId" value="${userId}"/>
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
</form>

<div class="pageContent" style="border-left:1px #B8D0D6 solid;border-right:1px #B8D0D6 solid;">
<div class="pageHeader" style="border:1px #B8D0D6 solid">
	<form  action="/quickQuery/openInCardList" method="post" onsubmit="return navTabSearch(this);">
		<input type="hidden" name="pageNum" value="1" />
		<input type="hidden" name="userId" value="${userId}"/>
		<input type="hidden" name="numPerPage" value="${page.numPerPage}"/>
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						加息卷使用日期：<input style="width: 120px;" type="text" datefmt="yyyy-MM-dd HH:mm:ss" class="date" name="beginDateC"  readonly="readonly"/>至
						<input style="width: 120px;" type="text" datefmt="yyyy-MM-dd HH:mm:ss" class="date" name="endDateC"  readonly="readonly"/>
					</td>
					<td>
						<span class="label">状态：</span><input name="status" id="search-useFlagCard" />
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
			<th width="10%">加息额度</th>
			<th width="10%">最低投资额</th>
			<th width="10%">加息领取时间</th>
			<th width="10%">加息使用时间</th>
			<th width="20%">有效期</th>
			<th width="10%">状态</th>
			<th width="10%">来源类型</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach items="${list}" var="cardList">
			    <tr>
				<td><fmt:formatNumber pattern="0.00" value="${cardList[0]}"/></td>
				<td><fmt:formatNumber pattern="0.00" value="${cardList[3]}"/></td>
				<td>${cardList[4]}</td>
				<td>${cardList[5]}</td>
			    <td>${cardList[1]}~${cardList[2]}</td>
				<td>
				         <c:if  test="${cardList[6]==0}">未使用</c:if>
			             <c:if  test="${cardList[6]==1}">已使用</c:if>
			             <c:if  test="${cardList[6]==2}">待确认</c:if>
				</td>
			    <td>
			             <c:if  test="${cardList[7]==1}">投资</c:if>
			             <c:if  test="${cardList[7]==2}">注册</c:if>
			             <c:if  test="${cardList[7]==3}">奖励</c:if>
			             <c:if  test="${cardList[8]==4}">抽奖</c:if>
			    </td>
			    </tr>
		  </c:forEach>
	   </tbody>
</table>
<jsp:include page="/WEB-INF/views/admin/public/dwzpage.jsp"/>
</div>