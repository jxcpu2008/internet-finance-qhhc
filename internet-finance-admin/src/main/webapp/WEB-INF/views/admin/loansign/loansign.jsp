
 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<style>
/*#loanstate{
		vertical-align: middle;
		float:left;
	}*/
#myloanlist-search-panel span.om-combo,#myloanlist-search-panel span.om-calendar {
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
<script type="text/javascript" src="/resources/js/loanSign/loanSign.js"></script>
<div id="myloanlist-search-panel">
		   			<div >
		   				<form action="" method="post" id="myloanlistsearchfrom">		   			
			   			<span class="label">项目名称：</span>		   		
			   			<input type="text"  name="name" class="input-text" />
			   			<span class="label">借款人：</span>		   		
			   			<input type="text" name="userbasicsinfo.name" class="input-text" />
			   			<br/><br/>
			   			<span class="label">项目类型：</span>		   		
			   			<input  name="type" id="typefind" />
			   			<span class="label">借款金额：</span>		   		
			   			<input name="issueLoan" id="issueLoanfind" />
			   			
			   			<span class="label">推荐首页：</span>		   		
			   			<input  name="recommend" id="recommendfind" />
			   			<span id="myloanlist-button-search">搜索</span>
			   			</form>
		   			</div>
</div>
<div layoutH="0" class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="edit" id="examineLoansign" href="javascript:void(0);"><span>满标申请</span></a></li>
			<li class="line">line</li>
			<li><a class="edit" id="flowLoansign" href="javascript:void(0);"><span>流标</span></a></li>
            <li class="line">line</li>
		    <li><a class="add" href="javascript:void(0);" id="loansign-table-to-excel"><span>导出</span></a></li>
		    <li class="line">line</li>
		    <li><a class="add" href="javascript:void(0);" id="newLoansignNotifyMember"><span>通知会员</span></a></li>
		    <li class="line">line</li>
		    <li><a class="edit" id="activityLoansign" href="javascript:void(0);"><span>申请活动</span></a></li>
		</ul>
	</div>
	<table id="myLoansignList"></table>
	<div class="panelBar">
		<ul class="toolBar">
			<li>
		    	<a class="icon" id="getLoanRecordState" href="javascript:void(0);"><span>获取出借记录状态</span> </a>
				<a class="icon" id="EXPLoanRecord"  href="javascript:void(0);"><span>导出出借记录</span> </a>
			</li>
		</ul>
	</div>
	<table id="myGridRecord"></table>
</div>	
