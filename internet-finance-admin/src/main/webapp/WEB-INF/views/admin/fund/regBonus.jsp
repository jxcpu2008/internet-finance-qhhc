<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<style>
#regBonus-search-panel span.om-combo,#regBonus-search-panel span.om-calendar {
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
<script type="text/javascript" src="/resources/js/funds/regBonus.js"></script>
<div layoutH="0" class="pageContent">
	<div id="regBonusList-search-panel">
		   			<div >
		   				<form action="" method="post" id="regBonusListSearchFrom">		   			
			   			<span class="label">宝付注册时间：</span> 
			   			<input  type="text" id="selAuthIpsTimeStar" style="width: 100px;"name="authIpsTime" class="input-text" /> 
			   			<span class="label">至</span>
				       <input type="text" id="selCreateTimeEnd" style="width: 100px;"name="createTime" class="input-text" /> 
				       
				       	<span class="label">发放状态</span>
				       <input id="releaseStatusCombo"  name="isAuthIps" /> 
			   			<span id="regBonusList-button-search">搜索</span>
			   			</form>
		   			</div>
	</div>
		<div class="panelBar">
		<ul class="toolBar">
		           <li><a class="add"  id="selRegBonusSelected"  href="javascript:void(0);" ><span>选中奖励发放</span></a></li>
		          <li><a class="add"  id="selRegBonus"><span>注册奖励发放</span></a></li>
		         <li><a class="add"  id="outRegBonus"><span>导出注册发放记录</span></a></li>
			 <li class="line">line</li>
		</ul>
	</div>
	<table id="myGridRegBonus"></table>
	<table id="myGridUserbank"></table>
</div>