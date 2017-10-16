<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = "/";
%>
<form id="pagerForm" method="post" action="/loanSign/dustrylists" onsubmit="return validateCallback(this, navTabAjaxDone)">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
</form>

<div class="pageContent" style="border-left:1px #B8D0D6 solid;border-right:1px #B8D0D6 solid">
<div class="panelBar">
		<ul class="toolBar">
		<li><a class="edit" href="/loanSign/forwardAddOrUpt?operation=upt&Id={industry_id}" target="dialog" rel="addusertab" mask="true" maxable="false" resizable="false"  warn="请选择您要修改的行业！" width="520" height="215"><span>编辑</span></a></li>
		<li><a class="add" href="/loanSign/forwardAddOrUpt?operation=add&Id=0" target="dialog" rel="addusertab" mask="true" maxable="false" resizable="false" width="520" height="215"><span>新增</span></a></li>
		<li><a class="delete" href="/loanSign/deleteIndustry" title="确实要删除选中行业吗?"  warn="请选择您要删除的行业！" target="selectedTodo" rel="ids" postType="string"><span>删除</span></a></li>
		</ul>
	</div>
	<table class="table" width="99%" layoutH="110" rel="jbsxBox2">
		<thead>
			<tr>
<!-- 				<th width="80">序号</th> -->
				<th width="22"><input value="" type="checkbox" group="ids" class="checkboxCtrl"></th>
				<th>序号</th>
				<th>行业名称</th>
				<th>行业类别</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${dustrylist}" var="list">
			<tr target="industry_id" rel="${list.id}" class="checkall" onclick="javascript:selecteddefault(${list.id});" style="cursor: pointer;">
<%-- 				<td>${topic.id}</td> --%>
				<td><input name="ids" value="${list.id}" type="checkbox"></td>
				<td>${list.id}</td>
				<td>${list.name}</td>
				<td>${list.industryType}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	<jsp:include page="/WEB-INF/views/admin/public/dwzpage.jsp"/>
</div>