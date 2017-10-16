
 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<style>
/*#loanstate{
		vertical-align: middle;
		float:left;
	}*/
#myloanlistOnIndex-search-panel span.om-combo,#myloanlistOnIndex-search-panel span.om-calendar {
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
<script type="text/javascript" src="/resources/js/loanSign/onIndex.js"></script>
<div id="myloanlistOnIndex-search-panel">
		   			<div >
		   				<form action="" method="post" id="myloanlistOnIndexsearchfrom">		   			
			   			<span class="label">项目名称：</span>		   		
			   			<input type="text"  name="name" class="input-text" />
			   			<span class="label">借款人：</span>		   		
			   			<input type="text" name="userbasicsinfo.name" class="input-text" />
			   			<span class="label">项目类型：</span>		   		
			   			<input  name="type" id="typefindOnIndex" />
			   			<br/><br/>
			   			<span class="label">借款金额：</span>		   		
			   			<input name="issueLoan" id="issueLoanfindOnIndex" />
			   			<span class="label">热门推荐：</span>		   		
			   			<input  name="recommend" id="recommendfindOnIndex" />
			   				<span class="label">首页推荐：</span>		   		
			   			<input  name="onIndex" id="OnIndexType" />
			   			<span id="myloanlistOnIndex-button-search">搜索</span>
			   			</form>
		   			</div>
</div>
<div layoutH="0" class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
		    <li><a class="edit" id="loanEndsOnIndex" href="javascript:void(0);"><span >推荐到首页</span></a></li>
				<li class="line">line</li>
		    <li><a class="edit" id="recommandOnIndex" href="javascript:void(0);"><span >首页热门推荐</span></a></li>
		</ul>
	</div>
	<table id="myLoansignOnIndex"></table>
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="edit" id="loanEndsnotOnIndex" href="javascript:void(0);"><span>取消推荐到首页</span></a></li>
		    	<li class="line">line</li>
			<li><a class="edit" id="cancelrecommandOnIndex" href="javascript:void(0);"><span>取消首页热门推荐</span></a></li>
		</ul>
	</div>
	<table id="currentOnIndex"></table>
</div>	
