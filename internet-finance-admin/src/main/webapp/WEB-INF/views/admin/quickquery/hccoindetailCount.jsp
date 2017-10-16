
 <%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<style>
/*#loanstate{
		vertical-align: middle;
		float:left;
	}*/
#myHccoindetail-search-panel span.om-combo,#myHccoindetail-search-panel span.om-calendar {
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
<script type="text/javascript" src="/resources/js/quickquery/hccoindetailCount.js"></script>
<div id="myHccoindetail-search-panel">
		   			<div >
		   				<form action="" method="post" id="myHccoindetailsearchfrom">		   			
			   			<span class="label">时间：</span> <input name="beginDateH" id="start-timeH" readonly="readonly" style="width: 118px" />
			   			 <span class="label">至：</span> <input name="endDateH" id="end-timeH" readonly="readonly" style="width: 118px" />
			   			 <span class="label">员工姓名：</span>		   		
			   			<input type="text"  name="name" class="input-text"  id="nameHccoindetail"/>
			   			<span id="myHccoindetail-button-search">搜索</span>
			   			</form>
		   			</div>
</div>
<div layoutH="0" class="pageContent">
	<div class="panelBar">
		<ul class="toolBar">
            <li class="line">line</li>
		   <li><a class="add" href="javascript:void(0);" id="outUserHccoindetail-excel"><span>导出</span></a></li>
		</ul>
	</div>
	<table id="myUserHccoindetailList"></table>
	<table id="myGridHccoindetail"></table>
	<table id="" style="height: 30px;"></table>
</div>	
