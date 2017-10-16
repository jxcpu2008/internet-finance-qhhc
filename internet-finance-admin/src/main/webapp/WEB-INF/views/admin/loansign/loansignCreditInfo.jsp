<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<style>
#loanCreditInfo-search-panel span.om-combo,#loanCreditInfo-search-panel span.om-calendar {
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
<script type="text/javascript" src="/resources/js/loanSign/loansignCreditInfo.js"></script>
<div layoutH="0" class="pageContent">
	<div id="loanCreditInfo-search-panel">
		   			<div >
		   				<form action="" method="post" id="loanCreditInfoListSearchFrom">		   			
			   			<span class="label">项目名称：</span>		   		
			   			<input type="text"  name="name" class="input-text"  id="nameCreditInfoA"/>
			   			<span class="label">借款人：</span>		   		
			   			<input type="text" name="userbasicsinfo.name" class="input-text"  id="nameCreditInfoB"/>
			   			<span class="label">项目类型：</span>		   		
			   			<input  name="type" id="typefindCreditInfo" />
			   			<span class="label">借款金额：</span>		   		
			   			<input name="loansignbasics.issueLoan" id="issueLoanfindCreditInfo" />
			   			<span class="label">推荐首页：</span>		   		
			   			<input  name="recommend" id="recommendfindCreditInfo" />
			   			<br/><br/>
			   			<span class="label">发布时间：</span>
			   			<input type="text" id="beginpublishTime" style="width: 88px;"  name="beginpublishTime" class="input-text" />
			   			<span class="label">至：</span>
			   			<input  type="text" id="endpublishTime" style="width: 88px;"  name="endpublishTime" class="input-text"/>	
			   			<span class="label">满标时间：</span>
			   			<input type="text" id="beginfullTime" style="width: 88px;"  name="beginfullTime" class="input-text" />
			   			<span class="label">至：</span>
			   			<input  type="text" id="endfullTime" style="width: 88px;"  name="endfullTime" class="input-text"/>			
			   			<span class="label">放款时间：</span>
			   			<input type="text" id="begincreditTime" style="width: 88px;"  name="begincreditTime" class="input-text" />
			   			<span class="label">至：</span>
			   			<input  type="text" id="endcreditTime" style="width: 88px;"  name="endcreditTime" class="input-text"/>			
			   			<span id="loanCreditInfoList-button-search">搜索</span>
			   			</form>
		   			</div>
	</div>
	<div class="panelBar">
		<ul class="toolBar">
		     <li><a class="add" onclick="selLoansignAccount()" id="selLoansignAccount"><span>查询余额</span></a></li>
		      <li class="line">line</li>
		      <li><a class="add"  id="selCreditLoan"><span>查询放款</span></a></li>
		      <li class="line">line</li>
			 <li><a class="add"   id="updateGeneralizemoney"><span>佣金转账</span></a></li>
			 <li class="line">line</li>
			<!-- 		 <li><a class="add" onclick="updateLoansignRate()"  id="updateLoansignRate"><span>修改借款人利率</span></a></li>
			<li class="line">line</li>
	<li><a class="add" onclick="updateFullBid()"  id="updateFullBid"><span>重新生成待还款记录</span></a></li>
			<li class="line">line</li> -->
			<li><a class="add" onclick="tranCertHBZZ()"  id="tranCertHBZZ"><span>红包转账</span></a></li>
			<li class="line">line</li>
			<li><a class="add" href="javascript:void(0);" id="fullLoansign"><span>导出项目信息</span></a></li>
			<li><a class="add" href="javascript:void(0);" id="outRepaymentrecord"><span>导出还款记录</span></a></li>
			<li><a class="add" href="javascript:void(0);" id="outParticulars"><span>导出还款明细记录</span></a></li>
			<li><a class="add" href="javascript:void(0);" id="outGeneralizeMoney"><span>导出佣金转账记录</span></a></li>
			<li><a class="add" id="sumMoney"><span>统计总额</span></a></li>
		</ul>
	</div>

	<table id="myGridLoanCreditInfo"></table>
		<div class="panelBar">
		<ul class="toolBar">
			<li>
				<a class="icon" id="EXPLoanRecordCreditInfo"><span>导出出借记录</span> </a>
			</li>
		</ul>
	</div>
	<table id="myGridRecordCreditInfo"></table>
		<div class="panelBar">
		<ul class="toolBar">
			<li>
				<a class="add" onclick="shareBonusState()"  id="shareBonusState"><span>查询还款状态</span> </a>
			</li>
		</ul>
	</div>
   <table id="myGridRepayMentCreditInfo"></table>
   <table id="myGridrecordparticularsList"></table>
   <table id="myGridRecordMoney"></table>
   <table id="myGridCompanyList"></table>
</div>