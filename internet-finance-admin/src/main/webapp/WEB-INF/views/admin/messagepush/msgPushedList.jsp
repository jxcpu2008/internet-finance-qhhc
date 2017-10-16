<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String path = request.getContextPath();
	String basePath = "/";
%>
<script type="text/javascript" src="/resources/js/pushmessage/pushmessage20160328.js"></script>
	<form id="pagerForm" method="post" action="/msgPush/msgPushedList">
		<input type="hidden" name="pageNum" value="1" />
		<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
		<input type="hidden" name="title" value="${message.title}" />
		<input type="hidden" name="timeFrom" value="${timeFrom}" />
		<input type="hidden" name="timeTo" value="${timeTo}" />
		<input type="hidden" name="pushTo" value="${message.pushTo}" />
	</form>
	<div class="pageHeader" style="border:1px #B8D0D6 solid">
		<form  action="/msgPush/msgPushedList" method="post" onsubmit="return navTabSearch(this);">
<!-- 			<input type="hidden" name="pageNum" value="1" /> -->
<%-- 			<input type="hidden" name="numPerPage" value="${page.numPerPage}"/> --%>
			
			<div class="searchBar">
				<table class="searchContent">
					<tr>
						<td>
						 	消息标题：<input type="text" name="title" class="input-text" />
						</td>
						<td>
							<span class="label">创建时间：</span>
							<input name="timeFrom" id="time-from" readonly="readonly" style="width: 118px"/>
							<span class="label">至：</span> 
							<input name="timeTo" id="time-to" readonly="readonly" style="width: 118px"/>
						</td>
						<td>
							推送目标：
						 	<select name="pushTo">
						 		<c:forEach items="${map}" var="entry">
						 			<option value="${entry.key}" <c:if test="${entry.key eq message.pushTo}">selected="selected"</c:if>>${entry.value}</option>
						 		</c:forEach>
						 	</select>
						</td>
						<td>
							<div class="buttonActive">
								<div class="buttonContent">
									<button type="submit">搜索</button>
								</div>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	
	<div class="panelBar">
		<ul class="toolBar">
			<li>
				<a class="add" id="messagePush" href="/msgPush/input" target="navTab" rel="pushMsg" mask="true" maxable="false" resizable="false" width="520" height="315">
					<span>添加消息</span>
				</a>
			</li>
<!-- 			<li> -->
<!-- 				<a title="确实要删除选中栏目吗?" target="selectedTodo" rel="ids" postType="string" href="/msgPush/deleteMsg" class="delete"> -->
<!-- 					<span>删除</span> -->
<!-- 				</a> -->
<!-- 			</li> -->
		</ul>
	</div>
	
	<table class="table" width="100%" layoutH="110" rel="jbsxBox2">
		<thead>
			<tr>
<!-- 				<th width="22"><input value="" type="checkbox" group="ids" class="checkboxCtrl"></th> -->
				<th style="width:40px">序号</th>
				<th style="width:195px">消息标题</th>
				<th style="width:635px">消息内容</th>
				<th style="width:105px">推送目标</th>
				<th style="width:65px">推送方式</th>
				<th style="width:120px">创建时间</th>
				<th style="width:80px">创建人</th>
<!-- 				<th width="10%">推送结果</th> -->
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${msgPushedList}" var="pushedMsg" varStatus="d">
<%-- 				<tr target="msgPushed_id" rel="${pushedMsg.id}" class="checkall" onclick="javascript:selecteddefault();" style="cursor: pointer;"> --%>
<%-- 					<td><input name="ids" value="${pushedMsg.id}" type="checkbox"></td> --%>
<%-- 					<td>${d.index+1}</td> --%>
				<tr>
					<td>${pushedMsg.id}</td>
					<td>${pushedMsg.title}</td>
					<td>${pushedMsg.content}</td>
					<td>
						<c:if test="${pushedMsg.pushTo eq 0}">其他</c:if>
						<c:if test="${pushedMsg.pushTo eq 1}">全部注册用户</c:if>
						<c:if test="${pushedMsg.pushTo eq 2}">已认购用户</c:if>
						<c:if test="${pushedMsg.pushTo eq 3}">已宝付授权未认购</c:if>
						<c:if test="${pushedMsg.pushTo eq 4}">女性用户</c:if>
						<c:if test="${pushedMsg.pushTo eq 5}">男性用户</c:if>
						<c:if test="${pushedMsg.pushTo eq 6}">当日生日客户</c:if>
					</td>
					<td><c:if test="${pushedMsg.pushNow eq 1}">立即推送</c:if></td>
					<td><fmt:formatDate value="${pushedMsg.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
					<td>${pushedMsg.operator}</td>
<!-- 					<td> -->
<%-- 						<c:if test="${pushedMsg.status eq 1}">推送成功</c:if> --%>
<%-- 						<c:if test="${pushedMsg.status eq 2}">推送失败</c:if> --%>
<!-- 					</td> -->
				</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<jsp:include page="/WEB-INF/views/admin/public/dwzpage.jsp"/>