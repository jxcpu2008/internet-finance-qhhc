<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html;  charset="utf-8">
<title>渠道信息查询</title>
<script src="${oss}/resources/My97DatePicker/WdatePicker.js"></script>
<script src="${oss}/resources/vendor/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"> 
var pageSize=20;
var totalPage=0
var pageNo=1;
$(function(){
	initDataToHtml();
});

function initDataToHtml(){
	var spreadId=$("#spreadId").val();
	if(isChannel(spreadId)){
		 $("#theadData").html("<tr><th>ID</th><th>注册时间</th><th>姓名</th><th>手机号</th><th>是否开通宝付</th></tr>");
	}else{
		 $("#theadData").html("<tr><th>ID</th><th>注册时间</th><th>手机号</th><th>是否开通宝付</th></tr>");
	}
	ajaxData(1);
	initPaging();
}

function ajaxData(pageNum){

	var spreadId=$("#spreadId").val();
	var beginTime=$("#beginTime").val().replace(/-/g,'');
	var endTime=$("#endTime").val().replace(/-/g,'');
	
	$.getJSON("/channelQuery/getChannelInfoList.htm",{spreadId:spreadId,beginTime:beginTime,endTime:endTime,pageNum:pageNum,pageSize:pageSize},
	function(data,status) {
		
		if(status=="success"&&data!=null&&data!=''&&data.length>0){
			if(isChannel(spreadId)){
				var dataHtml="";
				$.each(data, function(k) {
					dataHtml+="<tr style='text-align:center'>"
					+"<td>"+(k+1)+"</td>"
					+"<td>"+data[k][0]+"</td>"
					+"<td>"+data[k][1]+"</td>"
					+"<td>"+data[k][2]+"</td>"
					+"<td>"+data[k][3]+"</td>"
					+"</tr>";
		        })
		        $("#tbodyData").html("");
		        $("#tbodyData").html(dataHtml);
			}else{
				  var dataHtml="";
				$.each(data, function(k) {
					dataHtml+="<tr style='text-align:center'>"
					+"<td>"+(k+1)+"</td>"
					+"<td>"+data[k][0]+"</td>"
					+"<td>"+phoneNum(data[k][2])+"</td>"
					+"<td>"+data[k][3]+"</td>"
					+"</tr>";
		        })
		        $("#tbodyData").html("");
		        $("#tbodyData").html(dataHtml);
			}
			
		}else{
			dataHtml="<tr><td colspan='5' align='center'>暂无数据... </td></tr>";
			$("#tbodyData").html(dataHtml);
		}
		});
}

function queryCom(){
	ajaxData(1);
	initPaging();
}

function phoneNum(phone){
	if(phone!=''){
		return phone.substring(0,3)+"****"+phone.substring(7,11);
	}
	return '';
}

function isChannel(param){
	var str="#AQcLfNKo#";
	if(str.indexOf(param)>0){
		return true;
	}
	return false;
}

function initPaging(){
	var pagerHtml="";
	var spreadId=$("#spreadId").val();
	var beginTime=$("#beginTime").val().replace(/-/g,'');
	var endTime=$("#endTime").val().replace(/-/g,'');
	$.getJSON("/channelQuery/getChannelInfoCount.htm",{spreadId:spreadId,beginTime:beginTime,endTime:endTime},
			function(data,status){
		 if(status=="success"&&data!=null){
			if(data>pageSize){
				pagerHtml+="<p><span id='firstPage'><a href='javascript:ajaxData("+1+");setPage("+1+");'>首页</a><span>&nbsp;&nbsp;";
				pagerHtml+="<span id='perPage'><a href='javascript:preOrNextPage(1)'>上一页</a><span>&nbsp;&nbsp;";
				for(var i=1;i<data;i++){
					if(i%pageSize==0){
						totalPage+=1;
					}
				}
				if(data/pageSize>0){
					totalPage+=1;
				}
				if(totalPage<=3){
					for(var i=1;i<=totalPage;i++){
						pagerHtml+="<span id='"+i+"'><a href='javascript:ajaxData("+i+");setPage("+i+")'>"+i+"</a><span>&nbsp;&nbsp;" ;
					}
				}else if(totalPage>3&&totalPage<=8){
					for(var i=1;i<=3;i++){
						pagerHtml+="<span id='"+i+"'><a href='javascript:ajaxData("+i+");setPage("+i+")'>"+i+"</a><span>&nbsp;&nbsp;" ;
					}
					pagerHtml+="<span>...</span>&nbsp;&nbsp;";
					for(var i=5;i<=totalPage;i++){
						pagerHtml+="<span id='"+i+"'><a href='javascript:ajaxData("+i+");setPage("+i+")'>"+i+"</a><span>&nbsp;&nbsp;" ;
					}
				}else{
					
				}
				pagerHtml+="<span id='perPage'><a href='javascript:preOrNextPage(2);'>下一页</a><span>&nbsp;&nbsp;";
				pagerHtml+="<span id='lastPage'><a href='javascript:ajaxData("+totalPage+");setPage("+totalPage+");'>末页</a></span></p>"
			}
			
		}
		$("#paging").html(pagerHtml);
	});
}

function setPage(num){
	pageNo=num;
}
function preOrNextPage(param){

	if(1==param){
		if(pageNo>1){
			pageNo=pageNo-1;
			ajaxData(pageNo);
		}else{
			alert("已经是第一页了!");
		}
	}
	
	if(2==param){
		if(pageNo<totalPage){
			pageNo=pageNo+1;
			ajaxData(pageNo);
		}else{
			alert("已经是最后一页了!");
		}
	}
	
}

</script>
</head>
<body>
<div class="panel-heading text-center">
							<div class="form-inline text-label" >
								<div class="form-group has-feedback overtime">
									<label>起止时间: </label> <input type="text" name="beginTime"
										class="form-control input-sm form_datetime" id="beginTime"
										onclick="WdatePicker({maxDate:'#F{$dp.$D(\'endTime\')}'})"
										placeholder="开始时间" readonly="readonly"><span
										class="glyphicon glyphicon-calendar form-control-feedback left-calendar tleft-calendar text-label"></span>
										&nbsp;&nbsp;至&nbsp;&nbsp;
										<input type="text" class="form-control input-sm form_datetime"
										id="endTime" name="endTime"
										onclick="WdatePicker({minDate:'#F{$dp.$D(\'beginTime\')}'})"
										placeholder="结束时间" readonly="readonly"><span
										class="glyphicon glyphicon-calendar form-control-feedback text-label tright-calendar"></span>
										&nbsp;&nbsp;<button type="button" onclick="queryCom();">查询</button>
							</div>
						</div>
</div> <br>
<input type="hidden" id="spreadId" value="${spreadId}"/>
	<table border="1" width="50%">
		<thead id="theadData"></thead>
		<tbody id="tbodyData"></tbody>
	</table>
	<div id="paging"></div>
</body>
</html>