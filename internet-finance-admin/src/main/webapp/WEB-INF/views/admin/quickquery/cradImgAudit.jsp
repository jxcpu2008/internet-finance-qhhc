<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/quickquery/cardImgAudit.js"></script>
<style>
	#cardImgAudit-search-panel {vertical-align: middle;}
</style>
<div id="cardImgAudit-search-panel">
	<div>
		<form method="post" id="cardImgAuditSearchForm">		
		     <span class="label">搜索：</span>		   		
			<input type="text"  name="cardImgRemark" class="input-text" id="cardImgRemark"/> 			
			<span class="label">审核状态：</span>
			<select name="cardImgState" style="float: none;" id="cardImgState">
				<option value="3">全部</option>
				<option value="0">待审核</option>
				<option value="1">审核通过</option>
				<option value="2">审核不通过</option>
			</select>
			<span class="label">时间搜索：</span>
			<input name="cardImgTime"  id="cardImgTime" readonly="readonly" style="width: 100px" />
			<span class="label">至：</span>
			<input name="cardImgAuditTime" id="cardImgAuditTime" readonly="readonly" style="width: 100px" />
			<span id="cardImgAudit-button-search">搜索</span>
		</form>
	</div>
</div>
<div layoutH="0" class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
		  	<li><a class="add" id="cardImgAuditPass" href="javascript:void(0);" ><span>审核通过</span></a></li>
			<li class="line">line</li>
			<li><a class="add" id="cardImgAuditNotPass" href="javascript:void(0);" ><span>审核不通过</span></a></li>
			<li class="line">line</li>
				<li><a class="add" id="updateActivityMonkey" href="javascript:void(0);" ><span>一键更改现金状态</span></a></li>
			<li class="line">line</li>
			<li><a class="add" onclick="cardImgAuditCashFile()"><span>导出</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>
	<table id="cardImgAuditQueryGride"></table>
	<table><tr><td height="150"></td></tr></table>
</div>