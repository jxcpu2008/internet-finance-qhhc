<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<style>
#loanAudit-search-panel span.om-combo,#loanAudit-search-panel span.om-calendar {
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
<script type="text/javascript" src="/resources/js/loanSign/loansignAudit.js"></script>
<div layoutH="0" class="pageContent">
	<div id="loanAudit-search-panel">
		   			<div >
		   				<form action="" method="post" id="loanAuditListSearchFrom">		   			
			   			<span class="label">项目名称：</span>		   		
			   			<input type="text"  name="name" class="input-text"  id="nameAuditA"/>
			   			<span class="label">借款人：</span>		   		
			   			<input type="text" name="userbasicsinfo.name" class="input-text"  id="nameAudtiB"/>
			   			<br/><br/>
			   			<span class="label">项目类型：</span>		   		
			   			<input  name="type" id="typefindAudit" />
			   			<span class="label">借款金额：</span>		   		
			   			<input name="loansignbasics.issueLoan" id="issueLoanfindAudit" />
			   			
			   			<span class="label">推荐首页：</span>		   		
			   			<input  name="recommend" id="recommendfindAudit" />
			   			<span id="loanAuditList-button-search">搜索</span>
			   			</form>
		   			</div>
	</div>
	<div class="panelBar">
		<ul class="toolBar">
		   	<li><a class="add" onclick="updateFeeLoan()"  id="updateFeeLoan"><span>收取平台服务费</span></a></li>
		    <li class="line">line</li>
		    <li><a class="add" onclick="selLoanFeeState()" id="selLoanFeeState" ><span>查询收取平台服务费</span></a></li>
			<li class="line">line</li>
			<li><a class="add" onclick="auditLoansign()"  id="auditLoansign"><span>审核通过(放款)</span></a></li>
			<li class="line">line</li>
			<li><a class="add" onclick="notAuditLoanAudit()" id="notAuditLoanAudit" ><span>审核不通过</span></a></li>
		</ul>
	</div>

	<table id="myGridLoanAudit"></table>
		<div class="panelBar">
		<ul class="toolBar">
			<li>
				<a class="icon" id="EXPLoanRecordAudit"><span>导出出借记录</span> </a>
			</li>
		</ul>
	</div>
	<table id="myGridRecordAudit"></table>
   <table id="myGridRepayMent"></table>
   <table id="myGridparticularsListAudit"></table>
</div>