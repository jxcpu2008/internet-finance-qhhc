<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = "/";
%>

<style>
#user-search-panel .input-text, #userProList-search-panel .input-text {
	border: 1px solid #6D869E;
	height: 18px;
	vertical-align: middle;
	width: 137px;
}

#user-search-panel span.label, #userProList-search-panel span.label {
	margin-left: 10px;
}

#user-search-panel .input-text, #userProList-search-panel .input-text {
	border: 1px solid #6D869E;
	height: 18px;
	vertical-align: middle;
	width: 137px;
}

#user-search-panel span.om-combo, #user-search-panel span.om-calendar,
	#userProList-search-panel span.om-combo, #userProList-search-panel span.om-calendar
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
	src="/resources/js/usermanager/userPromotelist.js"></script>

<div layoutH="0">
	<div id="userProList-search-panel">
		<div>
			<form action="" method="post" id="searchProListfrom">
				<span class="label">用户名：</span> <input type="text" name="userName"
					class="input-text" /> <span class="label">真实姓名：</span> <input
					type="text" name="name" class="input-text" /> <span class="label">注册时间：</span>
				<input name="createTime" id="startTime" readonly="readonly"
					style="width: 118px" /> <span class="label">至：</span> 
					<input name="failTime" id="endTime" readonly="readonly" style="width: 118px" />
					<span class="label">用户类型：</span>		   		
			   			<input  name="userType" id="user_typeCombo" /> <span id="userProList-button-search">搜索</span>
			</form>
		</div>
	</div>
	<table id="userPromotelist_show_list"></table>
	<div class="panelBar">
		<ul class="toolBar">
			<li class="line">line</li>
			<li><a class="add" href="javascript:void(0);"
				id="userPromoteOut"><span>导出推广记录</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>
	<table id="genlizeList"></table>
	<div id="user-search-panel">
		<div>
			<form action="" method="post" id="searchProfrom">
				<span class="label">购买时间：</span> <input name="createTime"
					id="start-time-userPro" readonly="readonly" style="width: 118px" />
				<span class="label">至：</span> <input name="failTime"
					id="end-time-userPro" readonly="readonly" style="width: 118px" />
				<span id="user-button-search">搜索</span>
			</form>
		</div>
	</div>
	<div class="panelBar">
		<ul class="toolBar">
			<li class="line">line</li>
			<li><a class="add" href="javascript:void(0);" id="outLoanRecord"><span>导出投资记录</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>
	<table id="genUserRecord"></table>
</div>
