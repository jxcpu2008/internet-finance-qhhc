<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<style>
#examine-search-panel span.om-combo,#examine-search-panel span.om-calendar {
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
<script type="text/javascript" src="/resources/js/shopManager/shopExamine.js"></script>
<div layoutH="0" class="pageContent">
	<div id="examine-search-panel">
		   			<div >
		   				<form action="" method="post" id="searchExamineForm">		   	
		   				<span class="label">待审核时间：</span>
			   			<input type="text" id="createTimeExamine" style="width: 88px;"  name="createTime" class="input-text" />
			   			<span class="label">至：</span>
			   			<input  type="text" id="teamProfilesExamine" style="width: 88px;"  name="teamProfiles" class="input-text"/>		
			   			<span id="examine-button-search">搜索</span>
			   			</form>
		   			</div>
	</div>
		<div class="panelBar">
		<ul class="toolBar">
		<li><a class="add" onclick="examineShop()"  id="examineShop"><span>审核通过</span></a></li>
		<li class="line">line</li>
		<li><a class="add" onclick="examineNotShop()" id="examineNotShop"><span>审核不通过</span></a></li>
		</ul>
	</div> 

	<table id="myGridExamine"></table>
	<div id="examine-tab">
		<ul>
			<li><a id="shopInfoExamine" href="javascript:void(0);">店铺信息</a></li>
			<li><a id="shopFileInfoExamine" href="javascript:void(0);">店铺资料</a></li>
			<li><a id="shopRewardOptionInfoExamine" href="javascript:void(0);">融资信息</a></li>
		</ul>
		<div id="shopExamineList">
			<table>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
	</div>
</div>