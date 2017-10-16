<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<style>
#customerWithdraw-search-panel span.om-combo,
	#customerWithdraw-search-panel  span.om-calendar {
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
<script type="text/javascript"
	src="/resources/js/financial/finalWithdrawList.js"></script>
<div layoutH="0" class="pageContent">
	<div id="customerWithdraw-search-panel">
		<div>
			<form action="" method="post" id="customerWithdrawListSearchFrom">
				<span class="label">登陆用户名：</span> <input type="text" name="userName"
					class="input-text" /> <span class="label">真实用户名：</span> <input
					type="text" name="name" class="input-text" />
					<span class="label">提现时间：</span><input name="createTime" id="start-time-rechW" readonly="readonly"  style="width: 118px" /> 
				<span class="label">至：</span> <input name="failTime" id="end-time-rechW" readonly="readonly" style="width: 118px" />
				<span class="label">提现状态：</span> <input name="userType"
					id="search-withdraw" /> <span
					id="customerWithdrawList-button-search">搜索</span>
			</form>
		</div>
	</div>
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" id="selCustomerWithdraw"><span>查询提现</span>
			</a></li>
			<li><a class="add" href="javascript:void(0);"
				id="withdraw-table-to-excel"><span>导出</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>
	<table id="finacialWithdraw"></table>
</div>