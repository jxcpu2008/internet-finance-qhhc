<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<style>
#customerRecharge-search-panel span.om-combo,#customerRecharge-search-panel  span.om-calendar {
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
<script type="text/javascript" src="/resources/js/financial/finacialRecharge.js"></script>
<div layoutH="0" class="pageContent">
	<div id="customerRecharge-search-panel">
		   			<div >
		   				<form action="" method="post" id="customerRechargeListSearchFrom">		   			
				   			<span class="label">登陆用户名：</span>
				   			<input type="text" name="userName" class="input-text" />
				   			<span class="label">真实用户名：</span>
				   			<input type="text" name="name" class="input-text"   />
				   			 <span class="label">充值状态：</span> 
				   			<input name="userType" id="search-recharge" />
				   			<span class="label">充值时间：</span><input name="createTime" id="start-time-rechOne" readonly="readonly"  style="width: 118px" /> 
							<span class="label">至：</span> <input name="failTime" id="end-time-rechOne" readonly="readonly" style="width: 118px" />
				   			<span id="customerRechargeList-button-search">搜索</span>
			   			</form>
		   			</div>
	</div>
	<div class="panelBar">
		<ul class="toolBar">
		      <li><a class="add" id="selCustomerRecharge"><span>查询充值</span> </a></li>
		      <li><a class="add" href="javascript:void(0);" id="rechange-table-to-excel"><span>导出</span></a></li>
				<li class="line">line</li>
		</ul>
	</div>
	<table id="finacialRecharge"></table>
</div>