<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = "/";
%>
<form id="pagerForm" method="post" action="/helper/openHelper">
	<input type="hidden" name="pageNum" value="1" /> <input type="hidden"
		name="numPerPage" value="${page.numPerPage}" />
</form>
<div class="panelBar">
	<ul class="toolBar">
		<li><a class="add"
			href="/helper/queryHelpById?operation=add&id=0" target="navTab"
			rel="adddeputy" mask="true" resizable="false" maxable="false"
			width="618" height="500"><span>添加</span></a></li>
		<li><a class="edit"
			href="/helper/queryHelpById?operation=upt&id={aid}" target="navTab"
			rel="adddeputy" mask="true" resizable="false" maxable="false"
			warn="请选择修改的一项！" width="618" height="500"><span>修改</span></a></li>
		<li><a class="delete" href="/helper/deleteHelper?id={aid}"
			title="确实要删除选中项吗?" target="selectedTodo" rel="ids" postType="string"><span>删除</span></a></li>
	</ul>
</div>
<table class="table" width="99%" layoutH="110" rel="jbsxBox2">
	<thead>
		<tr>
			<th width="22"><input value="" type="checkbox" group="ids"
				class="checkboxCtrl"></th>
			<th width="30px;">序号</th>
			<th>一级标题</th>
			<th>二级标题</th>
			<th>内容</th>

		</tr>
	</thead>
	<tbody>
		<c:forEach items="${helpList}" var="help" varStatus="status">
			<tr style="cursor: pointer;" target="aid" rel="${help.id}"
				class="checkall">
				<td><input name="ids" value="${help.id}" type="checkbox"></td>
				<td>${status.index+1}</td>
				<td>${help.levelOne }</td>
				<td>${help.secondary }</td>
				<td>${help.remark }</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<jsp:include page="/WEB-INF/views/admin/public/dwzpage.jsp" />
