<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/activity/sevenMoonActivityList.js"></script>
<style>
	#vote-search-panel {vertical-align: middle;}
</style>
<div id="vote-search-panel">
	<div>
		<form method="post" id="searchVoteForm">		   			
			<span class="label">选手：</span>
			<select name="votedId" style="float: none;">
				<option value="">全部</option>
				<option value="sigi">sigi</option>
				<option value="kelvin">kelvin</option>
				<option value="jessica">jessica</option>
				<option value="japser">japser</option>
				<option value="elena">elena</option>
			</select>
			<span id="vote-button-search">搜索</span>
		</form>
	</div>
</div>
<div layoutH="0" class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" onclick="updateVoteStatisticsInfo()"><span>更新投票信息</span></a></li>
			<li class="line">line</li>
			<li><a class="edit" onclick="viewVoteRankList()"><span>排行榜</span></a></li>
			<li class="line">line</li>
			<li><a class="add" onclick="voteWinIncomeSummary()"><span>活动加息项目汇总</span></a></li>
		</ul>
	</div>
	<table id="voteQixiActivityGride"></table>
</div>