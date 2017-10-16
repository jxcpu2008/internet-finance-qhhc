<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<style>
#customerShop-search-panel span.om-combo,#customerShop-search-panel  span.om-calendar {
	vertical-align: middle;
}
.unit {
	clear: both;
	text-align: left;
}
.unit label {
	text-align: right;
	float: left;
	width: 100px;
}
.unit textarea {
	width: 280px;
	height: 5em;
}
</style>
<script type="text/javascript" src="/resources/js/costomer/customerShop.js"></script>
<div layoutH="0" class="pageContent">
	<div id="customerShop-search-panel">
		   			<div >
		   				<form action="" method="post" id="customerShopListSearchFrom">		   			
			   				<span class="label">登陆用户名：</span>
				   			<input type="text" name="userName" class="input-text" />
				   			<span class="label">真实用户名：</span>
				   			<input type="text" name="name" class="input-text"   />
				   			<span class="label">身份证号：</span>
				   			<input type="text" name="createTime" class="input-text"  onkeyup="value=value.replace(/[^\d\.]/g,'')" />
				   			 <span class="label">手机号码：</span>
				   			<input type="text" name="staffNo" class="input-text"  onkeyup="value=value.replace(/[^\d\.]/g,'')" />
				   			 <span class="label">状态：</span> 
				   			<input name="userType" id="search-shop" />
			   			<span id="customerShopList-button-search">搜索</span>
			   			</form>
		   			</div>
	</div>
	<div class="panelBar">
		<ul class="toolBar">
		      <li><a class="add" id="selCustomerShop"><span>查询出借状态</span> </a></li>
				<li class="line">line</li>
		</ul>
	</div>
	<table id="customerShop"></table>
</div>