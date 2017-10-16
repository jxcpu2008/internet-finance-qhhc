<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/dadabus/dadabusfreeticket.js"></script>
<style>
	#vote-search-panel {vertical-align: middle;}
</style>
<div id="dadabus-free-ticket-search-panel">
	<div>
		&nbsp;&nbsp;
		获奖总数&nbsp;&nbsp;<span id="status0">0</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		待沟通数&nbsp;&nbsp;<span id="status1">0</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		确认乘车数&nbsp;&nbsp;<span id="status2">0</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		已提交信息数&nbsp;&nbsp;<span id="status3">0</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		已收到票数&nbsp;&nbsp;<span id="status4">0</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		放弃赠票数&nbsp;&nbsp;<span id="status5">0</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	</div>
</div>
<div layoutH="0" class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li>
				<select onchange="giveFreeTicket()" id="freeTicket">
					<option value="0">全部</option>
					<option value="1">待沟通</option>
					<option value="2">确定乘车</option>
					<option value="3">已提交信息</option>
					<option value="4">已收到票</option>
					<option value="5">放弃赠票</option>
				</select>
			</li>
			<li class="line">line</li>
		</ul>
	</div>
	<table id="dadaBusFreeTicketGride"></table>
</div>