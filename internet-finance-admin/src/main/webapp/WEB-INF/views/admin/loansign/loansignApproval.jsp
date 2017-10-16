<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<style>
#loanApproval-search-panel span.om-combo,#loanApproval-search-panel span.om-calendar {
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
<script type="text/javascript" src="/resources/js/loanSign/loansignApproval.js"></script>
<div layoutH="0" class="pageContent">
	<div id="loanApproval-search-panel">
		   			<div >
		   				<form action="" method="post" id="loanApprovalListSearchFrom">		   			
			   			<span class="label">项目名称：</span>		   		
			   			<input type="text"  name="name" class="input-text"  id="nameApprovalA"/>
			   			<span class="label">借款人：</span>		   		
			   			<input type="text" name="userbasicsinfo.name" class="input-text"  id="nameApprovalB"/>
			   			<br/><br/>
			   			<span class="label">项目类型：</span>		   		
			   			<input  name="type" id="typefindApproval" />
			   			<span class="label">借款金额：</span>		   		
			   			<input name="loansignbasics.issueLoan" id="issueLoanfindApproval" />
			   			
			   			<span class="label">推荐首页：</span>		   		
			   			<input  name="recommend" id="recommendfindApproval" />
			   			<span id="loanApprovalList-button-search">搜索</span>
			   			</form>
		   			</div>
	</div>
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" onclick="ApprovalLoansign()"  id="ApprovalLoansign"><span>审批通过</span></a></li>
			<li class="line">line</li>
				<li><a class="add" onclick="updateCompanyFee()"  id="updateCompanyFee"><span>修改平台服务费年利率</span></a></li>
			<li class="line">line</li>
			<li><a class="add" onclick="updateLoansign()"  id="updateLoansign"><span>修改借款人利率</span></a></li>
    	</ul>
	</div>
	<table id="myGridLoanApproval"></table>
		<div class="panelBar">
		<ul class="toolBar">
			<li>
				<a class="icon" id="EXPLoanRecordApproval"><span>导出出借记录</span> </a>
			</li>
		</ul>
	</div>
	<table id="myGridRecordApproval"></table>
</div>