<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="page-controls txt-c">
	<c:set var="startNo" value="1" />
	<c:if test="${page.totalPage>=8}">
		<c:if test="${page.pageNum<=2}">
			<c:set var="startNo" value="1" />
		</c:if>
		<c:if test="${page.pageNum>2 && page.pageNum<page.totalPage-3}">
			<c:set var="startNo" value="${page.pageNum-2}" />
		</c:if>
		<c:if test="${page.pageNum>2 && page.pageNum>=page.totalPage-3}">
			<c:set var="startNo" value="${page.totalPage-3}" />
		</c:if>
	</c:if>
	<!--小于10页全部页码都显示  -->
	<c:if test="${page.totalPage<8}">
		<a href="javascript:"
			onclick="<c:if test="${page.pageNum!=1}">jumpPage(1,${page.totalPage})</c:if>">&nbsp;&nbsp;首页&nbsp;&nbsp;</a>
		<a href="javascript:"
			onclick="jumpPage(${page.pageNum-1 },${page.totalPage})">&nbsp;&nbsp;&nbsp;&nbsp;上一页&nbsp;&nbsp;&nbsp;&nbsp;</a>
		<c:forEach var="no" begin="1" end="${page.totalPage}">
			<a href="javascript:"
				onclick="<c:if test="${page.pageNum!=no}">jumpPage(${no})</c:if>"
				class="<c:if test="${page.pageNum==no}">active</c:if>">${no}</a>
		</c:forEach>
	</c:if>
	<!--大于10页根据当前页显示附近页码  -->
	<c:if test="${page.totalPage>=8}">
		<a href="javascript:"
			onclick="<c:if test="${page.pageNum!=1}">jumpPage(1,${page.totalPage})</c:if>">&nbsp;&nbsp;首页&nbsp;&nbsp;</a>
		<a href="javascript:"
			onclick="jumpPage(${page.pageNum-1 },${page.totalPage})">&nbsp;&nbsp;&nbsp;&nbsp;上一页&nbsp;&nbsp;&nbsp;&nbsp;</a>

		<c:forEach var="no" begin="${startNo}" end="${startNo+2}">
			<a href="javascript:"
				onclick="<c:if test="${page.pageNum!=no}">jumpPage(${no},${page.totalPage})</c:if>"
				class="<c:if test="${page.pageNum==no}">active</c:if>">${no}</a>
		</c:forEach>

		<c:if test="${page.pageNum+2<page.totalPage-1}">
				&nbsp;&nbsp;...&nbsp;&nbsp;
			</c:if>

		<c:forEach var="no" begin="${page.totalPage}" end="${page.totalPage}">
			<a href="javascript:"
				onclick="<c:if test="${page.pageNum!=no}">jumpPage(${no})</c:if>"
				class="<c:if test="${page.pageNum==no}">active</c:if>">${no}</a>
		</c:forEach>

	</c:if>
	<a href="javascript:"
		onclick="jumpPage(${page.pageNum+1 },${page.totalPage})">&nbsp;&nbsp;&nbsp;&nbsp;下一页&nbsp;&nbsp;&nbsp;&nbsp;</a> <a
		href="javascript:"
		onclick="<c:if test="${page.pageNum!= page.totalPage}">jumpPage(${page.totalPage},${page.totalPage})</c:if>">&nbsp;&nbsp;末页&nbsp;&nbsp;</a>
</div>
