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
#identity-search-panel span.om-combo,#identity-search-panel span.om-calendar {
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

.imgAttr{  display:none;}

.clsImg{
	cursor: pointer;
}
</style>
<script type="text/javascript" src="/resources/js/usermanager/identitycard.js"></script>
<script >
$(function () {
	var x = 0;
	var y = 0;
	$("img").mouseover(function (e) { //鼠标移动到图片上添加事件，显示放大图片
		$("#imgShow").attr("src", this.src).show();
	});
	
	$("img").mouseout(function () { //鼠标从图片移开图片隐藏
		$("#imgShow").hide();
	});
});
</script>
<div id="identity-search-panel">
		   			<div >
		   				<form action="" method="post" id="searchfrom3">		   			
			   			<span class="label">审核类型：</span>
			   			<input name="cardStatus" id="search-cardStatus" />
			   			<span id="userstatus-button-search">搜索</span>
			   			</form>
		   			</div>
</div>
<div layoutH="0"  class="pageContent">
		<div class="panelBar">
			<ul class="toolBar">
				<li><a class="add" href="javascript:void(0);" id="percardpasstou" ><span>审核通过</span></a></li>
				<li class="line">line</li>
				<li><a class="add" href="javascript:void(0);" id="percarderrortou" ><span>审核不通过</span></a></li>	
			</ul>
		</div>
		<table id="identitycard_list"></table>			
		<div style="margin-top:15px;width:100%;height:100%">
			
				<div style="margin-left:15%;width:20%;height:30%;float:left;"><span style="font-size:15px;font-family:黑体;">身份证正面：</span><img alt="" src="" id="iden_img1" width="100%" height="100%" class="clsImg"/></div>
				
				
				<div style="margin-left:15%;width:20%;height:30%;float:left;"><span style="font-size:15px;font-family:黑体;">身份证反面：</span><img alt="" src="" id="iden_img2" width="100%" height="100%" class="clsImg"/></div>
			
			
		</div>

		
		
</div>
