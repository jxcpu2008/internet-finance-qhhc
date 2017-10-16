<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<style>
#BonusList-search-panel span.om-combo,#BonusList-search-panel span.om-calendar {
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
<script type="text/javascript" src="/resources/js/funds/bonusFund.js"></script>
<div layoutH="0" class="pageContent">
	<div id="BonusAlreadyList-search-panel">
		   			<div >
		   				<form action="" method="post" id="BonusAlreadyListSearchFrom">		   			
			   			<span class="label">被推荐人首次投资时间：</span> 
			   			<input  type="text" id="selTimebeginFundAlready" style="width: 100px;"name="authIpsTime" class="input-text" /> 
			   			<span class="label">至</span>
				       <input type="text" id="selTimeEndFundAlready" style="width: 100px;"name="createTime" class="input-text" /> 
				       
				       	<span class="label">被推荐人状态</span>
				       <input id="userStateCombo"  name="isAuthIps" /> 
				         	<span class="label">推荐人状态</span>
				       <input id="genUserStateCombo"  name="hasIpsAccount" /> 
			   			<span id="BonusAlreadyList-button-search">搜索</span>
			   			</form>
		   			</div>
	</div>
		<div class="panelBar">
		<ul class="toolBar">
		         <li><a class="add"  id="selCreditBonusMoneyOne"><span>被推荐人奖励发放</span></a></li>
		          <li><a class="add"  id="selCreditBonusMoneyTwo"><span>推荐人奖励发放</span></a></li>
		         <li><a class="add"  id="outBonusFundAlready"><span>导出奖励发放记录</span></a></li>
			 <li class="line">line</li>
		</ul>
	</div>
	<table id="myGridBonusFundAlready"></table>
</div>