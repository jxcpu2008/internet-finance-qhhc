<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<style>
#shopComment-search-panel span.om-combo,#shopComment-search-panel span.om-calendar {
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
<script type="text/javascript" src="/resources/js/comment/shopComment.js"></script>
<div layoutH="0" class="pageContent">
	<div id="shopComment-search-panel">
		   			<div >
		   				<form action="" method="post" id="searchshopCommentForm">		   	
		   				<span class="label">评论时间：</span>
			   			<input type="text" id="commentTime" style="width: 88px;"  name="commentTime" class="input-text" />
			   			<span class="label">至：</span>
			   			<input  type="text" id="replyTime" style="width: 88px;"  name="replyTime" class="input-text"/>		
			   			<span id="shopComment-button-search">搜索</span>
			   			</form>
		   			</div>
	</div>
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" onclick="uptShopComment()"  id="uptShopComment"><span>回复评论</span></a></li>
			<li class="line">line</li>
			<li><a class="add" onclick="delShopComment()"  id="delShopComment"><span>删除</span></a></li>
		</ul>
	</div>
	<table id="myGridShopComment" ></table>
</div>