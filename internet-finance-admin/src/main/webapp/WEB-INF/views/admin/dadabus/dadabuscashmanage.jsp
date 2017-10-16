<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/dadabus/dadabus.js"></script>
<style>
	#vote-search-panel {vertical-align: middle;}
</style>
<div id="dadabus-search-panel">
	<div>
		<form method="post" id="dadaBusSearchVoteForm">		   			
			<span class="label">发放状态：</span>
			<select name="dispatchState" style="float: none;">
				<option value="">全部</option>
				<option value="1">待确认</option>
				<option value="3">发放成功</option>
			</select>
			<span class="label">注册时间：</span>
			<input name="startTime" id="dada-start-timeH" readonly="readonly" style="width: 118px" />
			<span class="label">至：</span>
			<input name="endTime" id="dada-end-timeH" readonly="readonly" style="width: 118px" />
			<span class="label">手机号码：</span>		   		
			<input type="text"  name="mobilePhone" class="input-text" id="dadaMobilePhone"/>
			<span id="dadabus-button-search">搜索</span>
		</form>
	</div>
</div>
<div layoutH="0" class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" onclick="updateDadaBusCashState()"><span>状态查询</span></a></li>
			<li class="line">line</li>
			<li><a class="add" onclick="exportDadaBusCashFile()"><span>导出excel</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>
	<table id="dadaBusCashGride"></table>
</div>