<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="/resources/js/checkboxselected.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		var ids="";
		//批量导出
		$("#iconbatch").click(function(){
			var flag=false;
			$('input[type="checkbox"][name="ids"]').each(function(){
				if(this.checked){
					ids=ids+this.value+",";
					flag=true;
				}
			});
			
			if(flag){
				window.location.href="/withdraw/export_excel?ids="+ids;
			}else{
				alertMsg.error('请选择导出内容');
			}
		});
		
		//导出全部
		$("#iconall").click(function(){
			window.location.href="/withdraw/export_excel?"+$("#withdrawListId").serialize();
		});
	});
	 $("#isCreditorCom").omCombo({
			width : 70,
			forceSelection:true,
		    dataSource : [
		                {text : '全部', value : '0'},
		                {text : '投资人', value : '1'},
		                 {text : '借款人', value : '2'}
		                 ]
	});
	 
	 $("#stateCom").omCombo({
			width : 70,
			forceSelection:true,
		    dataSource : [
		                {text : '全部', value : '-2'},
		                {text : '待确认', value : '0'},
		                 {text : '提现失败', value : '-1'},
		                 {text : '提现成功', value : '1'},
		                 {text : '宝付已受理', value : '2'},
		                 {text : '转账处理中', value : '5'}
		              ]
	});
</script>
<style>
td{text-align: center;}
th{text-align:center;}
</style>
<form id="pagerForm" method="post" action="/withdraw/openRatio" onsubmit="return validateCallback(this, navTabAjaxDone)">
	<input type="hidden" name="pageNum" value="1" />
	<input type="hidden" name="numPerPage" value="${page.numPerPage}" />
</form>

<div class="pageContent" style="border-left:1px #B8D0D6 solid;border-right:1px #B8D0D6 solid;">
<div class="panelBar">
		<ul class="toolBar">
			<li><a class="icon" href="javascript:void(0);" id="iconbatch"><span>批量导出</span></a></li>
			<li class="line">line</li>
			<li><a class="icon" href="javascript:void(0);" id="iconall"><span>导出</span></a></li>
		</ul>
</div>

<div class="pageHeader" style="border:1px #B8D0D6 solid">
	<form  action="/withdraw/openRatio" method="post" onsubmit="return navTabSearch(this);" id="withdrawListId">
		<input type="hidden" name="pageNum" value="1" />
		<input type="hidden" name="numPerPage" value="${page.numPerPage}"/>
		<div class="searchBar">
			<table class="searchContent">
				<tr>
					<td>
						日期：<input style="width: 120px;" type="text" datefmt="yyyy-MM-dd HH:mm:ss" class="date" name="beginDate"  readonly="readonly" id="beginDate"/>至
						<input style="width: 120px;" type="text" datefmt="yyyy-MM-dd HH:mm:ss" class="date" name="endDate"  readonly="readonly"/>
					</td>
					<td>
						用户名:<input  style="width: 100px;" type="text" name="userName"/>
					</td>
					<td>
						用户类型：<input  style="width: 100px;" name="isCreditor" id="isCreditorCom"/>
					</td>
					<td>
						提现状态：<input  style="width: 100px;" name="state" id="stateCom"/>
					</td>
					<td>
					<td><div class="buttonActive"><div class="buttonContent"><button type="submit">检索</button></div></div></td>
				</tr>
			</table>
		</div>
	</form>
</div>

<table class="table" width="100%" layoutH="110" rel="jbsxBox2">
	<thead>
		<tr>
			<th width="5%"><input type="checkbox" group="ids" class="checkboxCtrl"/></th>
			<th width="8%">姓名</th>
			<th width="8%">用户名</th>
			<th width="7%">提现金额</th>
			<th width="7%">实际到账金额</th>
			<th width="7%">宝付手续费</th>
			<th width="7%">商户手续费</th>
			<th width="10%">ips订单号</th>
			<th width="10%">提现状态</th>
			<th width="10%">用户类型</th>
			<th width="10%">费用承担方</th>
			<th width="10%">提现时间</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${list}" var="withdraw">
		<tr target="sid_obj" rel="${withdraw[0]}" class="checkall" onclick="javascript:selecteddefault(${withdraw[0]});" style="cursor: pointer;">
			<td><input name="ids" class="checkboxSelected" value="${withdraw[0]}" onclick="javascript:selecteddefault(${withdraw[0]});" type="checkbox"/></td>
			<td>${withdraw[1]}</td>
			<td>${withdraw[2]}</td>
			<td><fmt:formatNumber pattern="0.00" value="${withdraw[3]}"/></td>
			<td><fmt:formatNumber pattern="0.00" value="${withdraw[11]}"/></td>
			<td><fmt:formatNumber pattern="0.00" value="${withdraw[4]}"/></td>
			<td><fmt:formatNumber pattern="0.00" value="${withdraw[5]}"/></td>
			<td>${withdraw[6]}</td>
			<td>
			<c:if test="${withdraw[7] eq 0}">待确认</c:if>
			<c:if test="${withdraw[7] eq -1}">提现失败</c:if>
			<c:if test="${withdraw[7] eq 1}">提现成功</c:if>
			<c:if test="${withdraw[7] eq 2}">宝付已受理</c:if>
			<c:if test="${withdraw[7] eq 5}">转账处理中</c:if>
			</td>
			<td>
				<c:if test="${withdraw[10] eq 1}">投资人</c:if>
				<c:if test="${withdraw[10] eq 2}">借款人</c:if>
			</td>
			<td>
				<c:if test="${withdraw[12] eq 1}">平台支付</c:if>
				<c:if test="${withdraw[12] eq 2}">用户支付</c:if>
			</td>
			<td>${withdraw[8]}</td>
		</tr>
	</c:forEach>
	</tbody>
</table>
<jsp:include page="/WEB-INF/views/admin/public/dwzpage.jsp"/>
</div>