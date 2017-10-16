<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<style>
<!--

#user-search-cust .input-text {
	border: 1px solid #6D869E;
	height: 18px;
	vertical-align: middle;
	width: 137px;
}

#user-search-cust span.label {
	margin-left: 10px;
}

#user-search-cust .input-text {
	border: 1px solid #6D869E;
	height: 18px;
	vertical-align: middle;
	width: 137px;
}

#user-search-cust span.om-combo, #user-search-cust span.om-calendar {
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
-->
</style>
<script type="text/javascript"
	src="/resources/js/costomer/customer_user.js"></script>
<div id="user-search-cust">
	<div>
		<form action="" method="post" id="searchfrom-cust">
			  <span class="label">用户名：</span> <input type="text" name="userName" class="input-text" /> 
			  <span class="label">真实姓名：</span> <input type="text" name="name" class="input-text" /> 
			  <span class="label">手机号码：</span> <input type="text" name="repayAuthNo" class="input-text" />
			   <span class="label">是否借款人：</span><input name="isbrow" id="search-cus-brow" />
			   <br> <br> 
			   <span class="label">注册时间：</span><input name="createTime" id="start-time-cust" readonly="readonly" style="width: 118px" />
				<span class="label">至：</span> <input name="failTime" id="end-time-cust" readonly="readonly" style="width: 118px" /> 
				<span class="label">客服：</span> <input name="nickname" id="search-cust-service" />
				<span class="label">是否机构投资人：</span> <input name="isloan" id="search-cus-loan" />
				 <br> <br> 
				<span class="label">用户类型：</span> <input name="userType" id="search-employee" /> 
				<span class="label">是否认购：</span> <input name="isPurchase" id="search-isPurchase" /> 
				<span class="label">是否推荐：</span> <input name="isRecommend" id="search-isRecommend" /> 
				<span id="search-cust">搜索</span>
		</form>
	</div>
</div>
<div layoutH="0" class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" href="javascript:void(0);" id="dis_user"><span>禁用</span></a></li>
			<li class="line">line</li>
			<li><a class="add" href="javascript:void(0);" id="en_user"><span>启用</span></a></li>
			<li class="line">line</li>
			<li><a class="add" href="javascript:void(0);" id="selIpsState"><span>宝付状态查询</span></a></li>
			<li class="line">line</li>
			<li><a class="add" onclick="selUserAccount()"id="selUserAccount"><span>查询余额</span></a></li>
			<li class="line">line</li>
			<li><a class="add" href="javascript:void(0);" id="recordborr"><span>分配客服</span></a></li>
			<li class="line">line</li>
			<li><a class="add" href="javascript:void(0);" id="unlock"><span>用户解锁</span></a></li>
			<li class="line">line</li>
			<li><a class="add" href="javascript:void(0);" id="companyNum"><span>会员类型</span></a></li>
			<li class="line">line</li>
			<li><a class="add" href="javascript:void(0);"
				id="dataToExcelCustomer"><span>导出会员信息</span></a></li>
		</ul>
	</div>
	<table id="user_show_cust_list"></table>
	<table id="acoumtUser"></table>
	<table id="" style="height: 30px;"></table>
</div>
