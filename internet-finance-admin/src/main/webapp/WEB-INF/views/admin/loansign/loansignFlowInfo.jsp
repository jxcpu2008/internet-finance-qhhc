<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<style>
#loanFlowInfo-search-panel span.om-combo,#loanFlowInfo-search-panel span.om-calendar {
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
<script type="text/javascript" src="/resources/js/loanSign/loansignFlowInfo.js"></script>
<div layoutH="0" class="pageContent">
	<div id="loanFlowInfo-search-panel">
		   			<div >
		   				<form action="" method="post" id="loanFlowInfoListSearchFrom">		   			
			   			<span class="label">项目名称：</span>		   		
			   			<input type="text"  name="name" class="input-text"  id="nameFlowInfoA"/>
			   			<span class="label">借款人：</span>		   		
			   			<input type="text" name="userbasicsinfo.name" class="input-text"  id="nameFlowInfoB"/>
			   			<br/><br/>
			   			<span class="label">项目类型：</span>		   		
			   			<input  name="type" id="typefindFlowInfo" />
			   			<span class="label">借款金额：</span>		   		
			   			<input name="loansignbasics.issueLoan" id="issueLoanfindFlowInfo" />
			   			
			   			<span class="label">推荐首页：</span>		   		
			   			<input  name="recommend" id="recommendfindFlowInfo" />
			   			<span id="loanFlowInfoList-button-search">搜索</span>
			   			</form>
		   			</div>
	</div>
	<div class="panelBar">
		<ul class="toolBar">
		      <li><a class="add" id="selLoanFlow"><span>查询流标</span> </a></li>
				<li class="line">line</li>
			<li><a class="add" id="queryFlowInfo" href="javascript:void(0);" height="350" width="520"><span>查看项目详情</span></a></li>
		</ul>
	</div>

	<table id="myGridLoanFlowInfo"></table>
		<div class="panelBar">
		<ul class="toolBar">
			<li>
				<a class="icon" id="EXPLoanRecordFlowInfo"><span>导出出借记录</span> </a>
			</li>
		</ul>
	</div>
	<table id="myGridRecordFlowInfo"></table>
   <table id="myGridRepayMentFlowInfo"></table>
</div>