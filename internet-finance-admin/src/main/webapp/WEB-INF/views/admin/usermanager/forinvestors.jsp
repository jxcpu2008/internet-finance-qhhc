<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
#auch-search-panel span.om-combo,#auch-search-panel span.om-calendar {
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


<script type="text/javascript" src="/resources/js/usermanager/forinvestor.js"></script>
<div id="auch-search-panel">
		   			<div >
		   				<form action="" method="post" id="searchfrom">		   			
			   			<span class="label">审核类型：</span>
			   			<input name="audit" id="search-forinves" />
			   			<span id="userforinves-button-search">搜索</span>
			   			</form>
		   			</div>
</div>
<div layoutH="0"  class="pageContent">
		<div class="panelBar">
			<ul class="toolBar">
				<li><a class="add" href="javascript:void(0);" id="mechpasstou" ><span>审核通过</span></a></li>
				<li class="line">line</li>
				<li><a class="add" href="javascript:void(0);" id="mecherrortou" ><span>审核不通过</span></a></li>	
			</ul>
		</div>
		<table id="forinves_id"></table>
		
	
		
		
		<div style="margin-top:15px;">
	
		
		<div style="width:600px;height:400px;float:left;margin-left:100px;">附件1：<img alt="" src="" id="forinves_img1" width="300px" height="300px"/></div>
		<div style="width:600px;height:400px;float:left;margin-left:100px;">附件2：<img alt="" src="" id="forinves_img2" width="300px" height="300px"/></div>
		<div style="width:600px;height:400px;float:left;margin-left:100px;">附件3：<img alt="" src="" id="forinves_img3"  width="300px" height="300px"/></div>
		<div style="width:600px;height:400px;float:left;margin-left:100px;">附件4：<img alt="" src="" id="forinves_img4" width="300px" height="300px" /></div>	
		</div>	
</div>
