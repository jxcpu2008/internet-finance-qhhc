<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = "/";
%>
<style>
#userPro-search-panel .input-text, #userPromote-search-panel .input-text
	{
	border: 1px solid #6D869E;
	height: 18px;
	vertical-align: middle;
	width: 137px;
}

#userPro-search-panel span.label, #userPromote-search-panel span.label {
	margin-left: 10px;
}

#userPro-search-panel .input-text, #userPromote-search-panel .input-text
	{
	border: 1px solid #6D869E;
	height: 18px;
	vertical-align: middle;
	width: 137px;
}

#userPro-search-panel span.om-combo, #userPro-search-panel span.om-calendar,
	#userPromote-search-panel span.om-combo, #userPromote-search-panel span.om-calendar
	{
	vertical-align: middle;
}

nav-panel div.nav-item:hover {
	border: 1px solid #99A8BC;
	background-color: #C4D6EC;
	padding-left: 39px;
	line-height: 23px;
}

button::-moz-focus-inner, input::-moz-focus-inner {
	border: none;
}
</style>
<script type="text/javascript"
	src="/resources/js/usermanager/promotelist.js"></script>
<div layoutH="0">
	<div id="userPromote-search-panel">
		<div>
			<form action="" method="post" id="searchProListfrom">
				<span class="label">用户名：</span> <input type="text" name="userName"
					class="input-text" /> <span class="label">真实姓名：</span> <input
					type="text" name="name" class="input-text" /> <span class="label">注册时间：</span>
				<input name="createTime" id="startTime1" readonly="readonly"
					style="width: 118px" /> <span class="label">至：</span> <input
					name="failTime" id="endTime1" readonly="readonly"
					style="width: 118px" /> <span id="userPromote-button-search">搜索</span>
			</form>
		</div>
	</div>
	<table id="promotelist_show_list"></table>
	<div class="panelBar">
		<ul class="toolBar">
			<li class="line">line</li>
			<li><a class="add" href="javascript:void(0);" id="promoteOut"><span>导出推广记录</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>
	<table id="userGenlizeList"></table>
	<div id="userPro-search-panel">
		<div>
			<form action="" method="post" id="searchPromotefrom">
				<span class="label">购买时间：</span> <input name="createTime"
					id="start-time-pro" readonly="readonly" style="width: 118px" /> <span
					class="label">至：</span> <input name="failTime" id="end-time-pro"
					readonly="readonly" style="width: 118px" /> <span
					id="userPro-button-search">搜索</span>
			</form>
		</div>
	</div>
	<div class="panelBar">
		<ul class="toolBar">
			<li class="line">line</li>
			<li><a class="add" href="javascript:void(0);"
				id="userPromoteRecordOut"><span>导出投资记录</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>
	<table id="genUserRecordList"></table>
</div>
