<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
<!--

	
	
		nav-panel div.nav-item:hover{
			border: 1px solid #99A8BC;
			background-color: #C4D6EC;
			padding-left: 39px;
			line-height: 23px;
		}
		
	   button::-moz-focus-inner,input::-moz-focus-inner{border:none;}
		
	
-->
</style>
<style>
/*#loanstate{
		vertical-align: middle;
		float:left;
	}*/
#search-panel span.om-combo,#search-panel span.om-calendar {
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

<script type="text/javascript" src="/resources/js/usermanager/applylist201404150949.js"></script>
<div id="search-panel">
		   			<div >
		   				<form action="" method="post" id="searchfrom">		   			
			   			<span class="label">审核类型：</span>
			   			<input name="status" id="search-status" />
			   			<span id="userapply-button-search">搜索</span>
			   			</form>
		   			</div>
</div>
<div layoutH="0" class="pageContent">
	<div class="panelBar">
			<ul class="toolBar">
				<li><a class="add" href="javascript:void(0);" id="en_apply" ><span>通过选中申请</span></a></li>
				<li class="line">line</li>
				<li><a class="add" href="javascript:void(0);" id="dis_apply" ><span>不通过选中申请</span></a></li>
			</ul>
		</div>
	<table id="apply_list"></table>
</div>
