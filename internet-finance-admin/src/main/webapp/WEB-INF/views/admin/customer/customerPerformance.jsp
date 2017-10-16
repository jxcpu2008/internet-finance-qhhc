<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<script src="/resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<style>
div.conment>ul li {line-height: 41px;}
div.conment {padding-left: 50px;padding-top: 10px;}
.bottom_btn {background-color: #33ffff;border: 1px solid #ccc;height: 30px;}
button {cursor: pointer;}
</style>
<script>
	$(function() {
		//投资时间
		$("#beginTenderTime").omCalendar({
			disabledFn : disFn
		});
		$("#endTenderTime").omCalendar({
			disabledFn : disFn
		});
		var disFn = function disFn(date) {
			var nowMiddle = new Date();
			if (date > nowMiddle) {
				return false;
			}
		};
		$("#excelPerformance").click(function() {
			var beginTenderTime = $("#beginTenderTime").val();
			var endTenderTime = $("#endTenderTime").val();
			if (beginTenderTime != ""&& endTenderTime != "") {
				window.location.href = "/customerPerformance/dataToPerforman?beginTenderTime="+ beginTenderTime+"&endTenderTime="+endTenderTime;
			}else{
				window.location.href = "/customerPerformance/dataToPerforman";
			}
		});
	})
</script>
<div style="background-color: #fff; width: 100%; height: 400px; top: 100px; left: 400px;">
	<div style="background: #00CCFF; height: 25px; padding: 10px 0 0 20px;">
		<span>营销客户业绩查询</span>
	</div>
	<div>
		 <span style="height: 25px; padding: 10px 0 0 20px;">温馨提示 </span>
			 <ul>
				  <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;1：excel必须是.xlsx格式</li>
				  <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2：excel中第一行表格标题写手机号码</li>
				  <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3：excel中手机号码所在列必须以文本格式存储</li>
				  <li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4：设置文本格式步骤：选中手机号所在列-->菜单数据-->找到分列-->选择分隔符号-->右侧有"文本识别符号(Q)"下拉框，选择单引号-->点击下一步-->左侧列数据格式选择文本类型-->点击完成</li>
			 </ul>
	</div>
	<form method="post" action="/customerPerformance/addPerformance"  enctype="multipart/form-data"  class="pageForm required-validate"  onsubmit="return iframeCallback(this, dialogAjaxDone)">
		<div class="conment" style="padding-top: 20px; padding-left: 50px;">
			<ul>
				<li>
					<label>查询时间：</label>
					<input id="beginTenderTime" type="text" name="beginTenderTime" style="width: 180px"
					placeholder="开始时间" /> - <input id="endTenderTime" type="text" name="endTenderTime"  style="width: 180px" placeholder="结束时间" />
				</li>
				<li>
				<label>上传文件：</label>
				 <input type="file" name="uploadFile" value=""    class="required">
				</li>
			</ul>
			<div style="padding-top: 30px;">
				<button type="submit" style="width: 100px; margin-left: 75px;" id="submitPerformance">上传</button>
				<button type="button" style="width: 100px; margin-left: 50px;" id="excelPerformance">下载</button>
			</div>
		</div>
	</form>
</div>