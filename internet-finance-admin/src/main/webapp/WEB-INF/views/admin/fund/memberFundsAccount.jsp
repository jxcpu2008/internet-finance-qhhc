<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<style>
#FundsAccount-search-panel span.om-combo, #FundsAccount-search-panel span.om-calendar
	{
	vertical-align: middle;
}
</style>
<script type="text/javascript"
	src="/resources/js/funds/memberFundsAccount.js"></script>
<div layoutH="0" class="pageContent">
	<div id="FundsAccount-search-panel">
		<div>
			<form action="" method="post" id="searchFundsAccountForm">
				<span class="label">用户名：</span> <input type="text" name="userName"
					class="input-text" /> <span class="label">真实姓名：</span> <input
					type="text" name="name" class="input-text" /> <span class="label">会员等级：</span>
				<input name="errorNum" id="search-type" /> <span class="label">是否是借款人：</span>
				<input name="isbrow" id="search-brow" /> <span class="label">时间：</span>
				<input type="text" id="selTimebegin" style="width: 100px;"
					name="createTime" class="input-text" /> <span class="label">至</span>
				<input type="text" id="selTimeEnd" style="width: 100px;"
					name="failTime" class="input-text" /> <span
					id="FundsAccount-button-search">搜索</span>
			</form>
		</div>
	</div>
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" onclick="selFundsAccount()"
				id="selFundsAccount"><span>查询余额</span></a></li>
			<li class="line">line</li>
			 <li><a class="add" onclick="selBankCard()" id="selBankCard"><span>获取银行卡信息</span></a></li>
			<li class="line">line</li>
			<li><a class="add" onclick="FundsAccountinfo()"
				id="FundsAccountinfo"><span>导出资金明细</span></a></li>
			<li class="line">line</li>
			<li><a class="add" onclick="FundsLoanRecord()"
				id="FundsLoanRecord"><span>导出投资记录</span></a></li>
			<li class="line">line</li>
			<li><a class="add" onclick="FundsLoanRecordAll()"
				id="FundsLoanRecordAll"><span>一键导出所有投资记录</span></a></li>
			<li><a class="add" onclick="FundsAccountinfoAll()"
				id="FundsLoanRecordAll"><span>一键导出所有资金明细</span></a></li>
		</ul>
	</div>
	<table id="myGridFundsAccount"></table>
	<table id="user_money_list"></table>
	<table id="myGridFundsRecord"></table>
</div>