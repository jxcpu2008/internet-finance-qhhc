<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/quickquery/prizedetailCount.js"></script>
<style>
	#prizedetailCount-search-panel {vertical-align: middle;}
</style>
<div id="prizedetailCount-search-panel">
	<div>
		<form method="post" id="prizedetailCountSearchForm">		
			<span class="label">获奖时间：</span>
			<input name="authIpsTime"  id="authIpsTimePrizedetail" readonly="readonly" style="width: 100px" />
			<span class="label">至：</span>
			<input name="loginTime" id="loginTimePrizedetail" readonly="readonly" style="width: 100px" />
			 <span class="label">手机号码：</span>		   		
			<input type="text"  name="name" class="input-text" id="namePrizedetail"  style="width: 100px"/>   
			<span id="prizedetailCount-button-search">搜索</span>
		</form>
	</div>
</div>
<div layoutH="0" class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" onclick="prizedetailCountCashFile()"><span>导出</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>
	<table id="prizedetailCountGride"></table>
	<table><tr><td height="150"></td></tr></table>
</div>