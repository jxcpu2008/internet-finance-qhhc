<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<style>
#customerLoansign-search-panel span.om-combo,
	#customerLoansign-search-panel  span.om-calendar {
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
	src="/resources/js/costomer/customerLoansign.js"></script>
<div layoutH="0" class="pageContent">
	<div id="customerLoansign-search-panel">
		<div>
			<form action="" method="post" id="customerLoansignListSearchFrom">
				<span class="label">登陆用户名：</span> <input type="text" name="userName"
					class="input-text" /> <span class="label">真实用户名：</span> <input
					type="text" name="name" class="input-text" /> <span class="label">项目名称：</span>
				<input type="text" name="nickname" class="input-text" /> <span
					class="label">投资类型：</span> <input name="userintegral"
					id="search-state" /> <span class="label">投资状态：</span> <input
					name="userType" id="search-loansign" /><br /> <br /> <span
					class="label">还款状态：</span> <input name="cardStatus"
					id="search-repay" /><span class="label">认购时间：</span> <input
					name="createTime" id="start-time-loan" readonly="readonly"
					style="width: 118px" /> <span class="label">至：</span> <input
					name="failTime" id="end-time-loan" readonly="readonly"
					style="width: 118px" /><span class="label">期限搜索：</span> <input
					name="department" id="search-remonth" /><span class="label">标的搜索：</span>
				<input name="hasIpsAccount" id="search-loanstatus" /> <span
					id="customerLoansignList-button-search">搜索</span>
			</form>
		</div>
	</div>
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" id="selCustomerLoansign"><span>查询出借状态</span>
			</a></li>
			<li class="line">line</li>
			<li><a class="add" id="outLoanRecord"><span>导出投资记录</span> </a></li>
		</ul>
	</div>
	<table id="customerLoansign"></table>
</div>