<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/quickquery/mayTopListStatics.js"></script>
<style>
	#mayListStatistics-search-panel {vertical-align: middle;}
</style>
<div id="mayTopListStatics-search-panel">
	<div>
		<form method="post" id="mayTopListStaticsSearchForm">	
		    <span class="label">搜索：</span>
			<input type="text" name="name" id="name" placeholder="按手机/真实姓名号搜索" style="width: 140px"/>
			<span class="label">获奖时间：</span>
			<select name="weekNum" style="float: none;width: 100px" id="weekNum" >
			    <option value="0">全部</option>
				<option value="1" selected="selected">第一周</option>
				<option value="2">第二周</option>
				<option value="3">第三周</option>
				<option value="4">第四周</option>
				<option value="5">第五周</option>
				<option value="6">第六周</option>
				<option value="7">第七周</option>
				<option value="8">第八周</option>
				<option value="9">总榜</option>
			</select>
			<span class="label">名次搜索：</span>
			<select name="ranking" style="float: none;width: 100px" id="ranking" >
				<option value="0">全部</option>
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
			</select>
			<span id="mayTopListStatics-button-search">搜索</span>
<!-- 			<button type="button" style="float: right;" id="mayTopListStaticsCashFile">导出统计表</button> -->
		</form>
	</div>
</div>
<div layoutH="0" class="pageContent" >
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" onclick="mayTopListStaticsCashFile()"><span>导出</span></a></li>
			<li class="line">line</li>
		</ul>
	</div>
	
	<table id="mayTopListStaticsGride"></table>
	<table><tr><td height="150"></td></tr></table>
</div>