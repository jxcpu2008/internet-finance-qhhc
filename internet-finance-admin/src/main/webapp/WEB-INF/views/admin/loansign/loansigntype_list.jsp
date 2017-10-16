<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/loanSign/loansigntype.js"></script>
<div layoutH="0" class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="/loansigntype/seeDetails" target="navTab" rel="addloansigntype" ><span>添加</span></a></li>
			<li><a class="delete" id="deleteone" title="确定要删除吗?"><span>删除</span></a></li>
		</ul>
	</div>
	<div id="search-lstype-panel">
		<div>
			<form method="post" id="searchlotypefrom">
				<span class="label">项目类型Key：</span>
				<input type="text" class="" id="typeKey" name="typeKey" width="100px" height="35px" style="width:100px" />
				<span type="submit" id="button-lstype-search">搜索</span>
			</form>
		</div>
	</div>
	<table id="loantypemygrid"></table>
	</div>
