<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<style>
/*#loanstate{
		vertical-align: middle;
		float:left;
	}*/
#loanExamine-search-panel span.om-combo,#loanExamine-search-panel span.om-calendar {
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

<script type="text/javascript" src="/resources/js/loanSign/loanExamine.js"></script>
<div id="loanExamine-search-panel">
		   			<div >
		   				<form method="post" id="searchExaminefrom">		   			
			   			<span class="label">创建时间：</span>
			   			<input type="text" id="createTime" style="width: 88px;"  name="beginDate" class="input-text" />
			   			<span class="label">至：</span>
			   			<input  type="text" id="creditTime" style="width: 88px;"  name="endDate" class="input-text"/>		
			   			<span id="loanExamine-button-search">搜索</span>
			   			</form>
		   			</div>
</div>
<div layoutH="0" class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
			<li><a class="add" id="isReplication" href="javascript:void(0);" ><span>复制项目</span></a></li>
			 <li class="line">line</li>
			<li><a class="add" id="isPass" href="javascript:void(0);" ><span>审核通过</span></a></li>
			  <li class="line">line</li>
			<li><a class="add" id="notPass" href="javascript:void(0);"><span>审核不通过</span></a></li>
			  <li class="line">line</li>
			<li><a class="edit" id="updateExample" href="javascript:void(0);" ><span>修改项目</span></a></li>
			  <li class="line">line</li>
			<li><a class="delete" onclick="delConfirmMsg()"><span>删除</span></a></li>
		</ul>
	</div>
	<table id="myGridExamine"></table>
    <div class="panelBar">
		<ul class="toolBar">
			<li>
				<a id="addAttachmentIcon" class="icon"><span>上传标图/借款方资料</span> </a>
			</li>
			<li>
				<a id="deleteAttachment" class="delete"><span>删除附件</span> </a>
			</li>
		</ul>
	</div>
	<table id="myAttachment"></table>
	<table style="height: 30px;"></table>
</div>




