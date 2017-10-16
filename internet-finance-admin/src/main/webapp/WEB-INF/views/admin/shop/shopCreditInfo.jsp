<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<style>
/*#loanstate{
		vertical-align: middle;
		float:left;
	}*/
#shopCredit-search-panel span.om-combo,#shopCredit-search-panel span.om-calendar {
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
<script type="text/javascript"   src="/resources/js/shopManager/shopCreditInfo.js"></script>
<div layoutH="0" class="pageContent">
	<div id="shopCredit-search-panel">
		   			<div >
		   				<form action="" method="post" id="searchShopCreditForm">		   			
			   			<span class="label">状态：</span>
			   			<input name="state" id="searchCredit-prostate" />
			   			<span class="label">放款时间：</span>
			   			<input type="text" id="createTimeCredit" style="width: 88px;"  name="createTime" class="input-text" />
			   			<span class="label">至：</span>
			   			<input  type="text" id="teamProfilesCredit" style="width: 88px;"  name="teamProfiles" class="input-text"/>			
			   			<span id="shopCredit-button-search">搜索</span>
			   			</form>
		   			</div>
	</div>
	<div class="panelBar">
		<ul class="toolBar">
		    <li><a class="add"  id="selCreditShop"><span>查询放款</span></a></li>
		    <li class="line">line</li>
		</ul>
	</div>
	<table id="myGridShopCredit"></table>
	<table id="myRecordCredit"></table>
	<div id="shopCredit-tab">
		<ul>
			<li><a id="shopCredit" href="javascript:void(0);">店铺信息</a></li>
			<li><a id="shopFileCredit" href="javascript:void(0);">店铺资料</a></li>
			<li><a id="shopRewardOptionCredit" href="javascript:void(0);">融资信息</a></li>
		</ul>

		<div id="shopCreditInfo">
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