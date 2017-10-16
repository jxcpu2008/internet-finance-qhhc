<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style type="text/css">
	.page_div {
		width: auto;
		height: 40px;
		margin:20px auto 40px;
		text-align:center;
		padding-top:15px;
		clear: both;
	}
	.page_div>ul.page_ul>li{
		height: 24px;
	}
	.page_div>ul.page_ul>li>a {
		display: block;
		text-decoration: none;
	}
	.page_s_1, .page_s {
		line-height: 24px;
		border: 1px solid #bbb;
	}
	.page_div .page_s {
		color: #333;
		padding:1px 10px;
	}
	.page_div .page_s_1 {
		background-color: #0099FF;
		color: #fff;
		padding:1px 10px;
	}
	.page_div .first, .page_div .last {
		padding:1px 10px;
	}
	.list-unstyled{
		padding-left:0;
		list-style:none;
	}
	.list-inline{
		padding-left:0;
		margin-left:-5px;
		list-style:none;
	}
	.list-inline>li{
		display:inline-block;
		padding-right:5px;
		padding-left:5px;
	}
</style>
<div class="page_div">
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
	<ul class="list-unstyled list-inline page_ul">
		<!--小于10页全部页码都显示  -->
		<c:if test="${page.totalPage<8}">
			<li><a href="javascript:"
				onclick="<c:if test="${page.pageNum!=1}">jumpPage(1,${page.totalPage})</c:if>"
				class="page_s first">首页</a></li>
			<li><a href="javascript:" onclick="jumpPage(${page.pageNum-1 },${page.totalPage})"
				class="page_s prev">上一页</a></li>
			<c:forEach var="no" begin="1" end="${page.totalPage}" varStatus="s">
				<li><a href="javascript:"
					onclick="<c:if test="${page.pageNum!=no}">jumpPage(${no})</c:if>"
					class="<c:if test="${page.pageNum==no}">page_s_1</c:if><c:if test="${page.pageNum!=no}">page_s</c:if>">${no}</a></li>
			</c:forEach>
		</c:if>
		<!--大于10页根据当前页显示附近页码  -->
		<c:if test="${page.totalPage>=8}">
			<li><a href="javascript:"
				onclick="<c:if test="${page.pageNum!=1}">jumpPage(1,${page.totalPage})</c:if>"
				class="page_s first">首页</a></li>
			<li><a href="javascript:" onclick="jumpPage(${page.pageNum-1 },${page.totalPage})"
				class="page_s prev">上一页</a></li>
				
			<c:forEach var="no" begin="${startNo}" end="${startNo+2}"
				varStatus="s">
				<li><a href="javascript:"
					onclick="<c:if test="${page.pageNum!=no}">jumpPage(${no},${page.totalPage})</c:if>"
					class="<c:if test="${page.pageNum==no}">page_s_1</c:if><c:if test="${page.pageNum!=no}">page_s</c:if>">${no}</a></li>
			</c:forEach>
			
			<c:if test="${page.pageNum+2<page.totalPage-1}">
				<li>...</li>
			</c:if>
			
			<c:forEach var="no" begin="${page.totalPage}"
				end="${page.totalPage}" varStatus="s">
				<li><a href="javascript:"
					onclick="<c:if test="${page.pageNum!=no}">jumpPage(${no})</c:if>"
					class="<c:if test="${page.pageNum==no}">page_s_1</c:if><c:if test="${page.pageNum!=no}">page_s</c:if>">${no}</a></li>
			</c:forEach>
			
		</c:if>
		<li><a href="javascript:" onclick="jumpPage(${page.pageNum+1 },${page.totalPage})"
			class="page_s next">下一页</a></li>
			<li><a href="javascript:"
				onclick="<c:if test="${page.pageNum!= page.totalPage}">jumpPage(${page.totalPage},${page.totalPage})</c:if>"
				class="page_s last">末页</a></li>
<%-- 		<li>&nbsp;共&nbsp;${page.pageNum}/${page.totalPage}&nbsp;页&nbsp;/&nbsp;共查询到&nbsp;${page.totalCount}&nbsp;条记录</li> --%>
	</ul>
</div>
