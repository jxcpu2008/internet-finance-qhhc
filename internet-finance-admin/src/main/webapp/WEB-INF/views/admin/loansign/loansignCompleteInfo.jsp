<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<style>
#loanCompleteInfo-search-panel span.om-combo,#loanCompleteInfo-search-panel span.om-calendar {
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
<script type="text/javascript" src="/resources/js/loanSign/loansignCompleteInfo.js"></script>
<div layoutH="0" class="pageContent">
	<div id="loanCompleteInfo-search-panel">
		   			<div >
		   				<form action="" method="post" id="loanCompleteInfoListSearchFrom">		   			
			   			<span class="label">项目名称：</span>		   		
			   			<input type="text"  name="name" class="input-text"  id="nameCompleteInfoA"/>
			   			<span class="label">借款人：</span>		   		
			   			<input type="text" name="userbasicsinfo.name" class="input-text"  id="nameCompleteInfoB"/>
			   			<br/><br/>
			   			<span class="label">项目类型：</span>		   		
			   			<input  name="type" id="typefindCompleteInfo" />
			   			<span class="label">借款金额：</span>		   		
			   			<input name="loansignbasics.issueLoan" id="issueLoanfindCompleteInfo" />
			   			<span class="label">推荐首页：</span>		   		
			   			<input  name="recommend" id="recommendfindCompleteInfo" />
			   			<span class="label">放款时间：</span>
			   			<input type="text" id="begincreditTimeOne" style="width: 88px;"  name="begincreditTime" class="input-text" />
			   			<span class="label">至：</span>
			   			<input  type="text" id="endcreditTimeOne" style="width: 88px;"  name="endcreditTime" class="input-text"/>			
			   			<span id="loanCompleteInfoList-button-search">搜索</span>
			   			</form>
		   			</div>
	</div>
	<div class="panelBar">
		<ul class="toolBar">
		      <li class="line">line</li>
			 <li><a class="add"   id="updateGeneralizComplete"><span>佣金转账</span></a></li>
			<li class="line">line</li>
			<li><a class="edit" id="loanrecomple" href="javascript:void(0);" height="350" width="520"><span>取消推荐</span></a></li>
			<li class="line">line</li>
			<li><a class="add" href="javascript:void(0);" id="outRepaymentrecordCom"><span>导出还款记录</span></a></li>
			<li class="line">line</li>
			<li><a class="add" href="javascript:void(0);" id="outParticularsCom"><span>导出还款明细记录</span></a></li>
			<li class="line">line</li>
			<li><a class="add" href="javascript:void(0);" id="outGeneralizeMoneyCom"><span>导出佣金转账记录</span></a></li>
			<li class="line">line</li>
			<li><a class="add" id="sumMoneyOne"><span>统计总额</span></a></li>
		</ul>
	</div>

	<table id="myGridLoanCompleteInfo"></table>
		<div class="panelBar">
		<ul class="toolBar">
			<li>
				<a class="icon" id="EXPLoanRecordCompleteInfo"><span>导出出借记录</span> </a>
			</li>
		</ul>
	</div>
	<table id="myGridRecordCompleteInfo"></table>
   <table id="myGridRepayMentCompleteInfo"></table>
   <table id="myGridrecordCompleteInfo"></table>
     <table id="myGridRecordMoneyCom"></table>
</div>