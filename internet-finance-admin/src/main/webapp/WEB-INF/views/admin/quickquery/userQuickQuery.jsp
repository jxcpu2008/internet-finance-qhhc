<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript">
function queryLoanRecordList(){
		var userId=$('#userId').val();
		var nameOne=$("#nameOne").val();
	     if(userId!=null){
	    		navTab.openTab("LoanRecordList","/quickQuery/openUserLoanRecordList?userId="+ userId, {
							title : "认购流水"+nameOne,
							fresh : true
						});
	     }
};

function queryAccountInfoList(){
	var userId=$('#userId').val();
	var nameOne=$("#nameOne").val();
     if(userId!=null){
    		navTab.openTab("AccountInfoList","/quickQuery/openAccountInfoList?userId="+ userId, {
						title : "资金流水"+nameOne,
						fresh : true
					});
     }
};

function queryRedenvelopeList(){
	var userId=$('#userId').val();
	var nameOne=$("#nameOne").val();
     if(userId!=null){
    		navTab.openTab("RedenvelopeList","/quickQuery/openRedenvelopedetailList?userId="+ userId, {
						title : "红包记录"+nameOne,
						fresh : true
					});
     }
};


function queryCoutList(){
	var userId=$('#userId').val();
	var nameOne=$("#nameOne").val();
     if(userId!=null){
    		navTab.openTab("CardList","/quickQuery/openInCardList?userId="+ userId, {
						title : "加息卷流水"+nameOne,
						fresh : true
					});
     }
};
</script> 
<h2 class="contentTitle">${name}</h2>
<div class="pageFormContent" layoutH="60">
	<fieldset>
		<legend>基本信息</legend>
		<c:forEach items="${userInfoList}" var="user">
				<dl>
					<dt>用户名：</dt>
					<dd>${user[0]}</dd>
				</dl>
				<dl>
					<dt>姓名：</dt>
					<dd>${user[1]}</dd>
				</dl>
				<dl>
					<dt>手机号：</dt>
					<dd>${user[2]}</dd>
				</dl>
				<dl>
					<dt>用户类型：</dt>
					<dd>
					    <c:if  test="${user[3]==1}">会员</c:if>
			             <c:if  test="${user[3]==2}">员工</c:if>
			             <c:if  test="${user[3]==3}">特别企业</c:if>
			             <c:if  test="${user[3]==4}">居间人</c:if>
			             <c:if  test="${user[3]==6}">理财师</c:if>
					</dd>
				</dl>
				<dl>
					<dt>注册时间</dt>
					<dd>${user[4]}</dd>
				</dl>
				<dl>
					<dt>宝付状态：</dt>
					<dd>    
					      <c:if  test="${user[5]==0}">待确认</c:if>
			             <c:if  test="${user[5]==-1}">失败</c:if>
			             <c:if  test="${user[5]==1}">成功</c:if>
			             <c:if  test="${user[5]==2}">注销</c:if>
			             <c:if  test="${user[5]==null }">未注册</c:if>
			        </dd>
				</dl>
			     <dl>
					<dt>宝付授权：</dt>
					<dd>    
					      <c:if  test="${user[9]==0}">待确认</c:if>
			             <c:if  test="${user[9]==-1}">失败</c:if>
			             <c:if  test="${user[9]==1}">成功</c:if>
			        </dd>
				</dl>
				<dl>
					<dt>推荐人：</dt>
					<dd>${user[6]}</dd>
				</dl>
				<dl>
					<dt>推荐人部门：</dt>
					<dd>
					      <c:if  test="${user[7]==0}">离职员工</c:if>
			             <c:if  test="${user[7]==1}">总裁办</c:if>
			             <c:if  test="${user[7]==2}">财务部</c:if>
			             <c:if  test="${user[7]==3}">行政部</c:if>
			             <c:if  test="${user[7]==4 }">副总办</c:if>
			             <c:if  test="${user[7]==5}">运营中心</c:if>
			             <c:if  test="${user[7]==6}">培训部</c:if>
			             <c:if  test="${user[7]==7}">风控部</c:if>
			             <c:if  test="${user[7]==8}"> IT部</c:if>
			             <c:if  test="${user[7]==9 }">摄影部</c:if>
			             <c:if  test="${user[7]==10}">推广部</c:if>
			             <c:if  test="${user[7]==11}">项目部</c:if>
			             <c:if  test="${user[7]==12}">客服部</c:if>
			             <c:if  test="${user[7]==13}">事业一部</c:if>
			             <c:if  test="${user[7]==14 }">事业二部</c:if>
			              <c:if  test="${user[7]==15 }">离职员工</c:if>
			        </dd>
				</dl>
				<dl>
					<dt>渠道名称：</dt>
					<dd>${chname}</dd>
				</dl>
				<input id="userId" value="${user[8]}"  type="hidden"/>
				<input id="nameOne" value="${user[1]}"  type="hidden"/>
		</c:forEach>
	</fieldset>
	
	<fieldset>
		<legend>资金数据</legend>
			<dl>
			<dt>账户余额：</dt>
			<dd>${money}</dd>
		</dl>
		<dl>
			<dt>累计充值：</dt>
			<dd>${rechargeSum}</dd>
		</dl>
		<dl>
			<dt>累计提现：</dt>
			<dd>${withdrawSum}</dd>
		</dl>
		<dl>
			<dt>累计认购金额</dt>
			<dd>${loanRecordSum}</dd>
		</dl>
		<dl>
			<dt>累计推荐人数：</dt>
			<dd>${generalizeCount}</dd>
		</dl>
			<dl>
			<dt>累计推荐佣金：</dt>
			<dd>${generalizeSum}</dd>
		</dl>
		<dl>
			<dt>待回款本金：</dt>
			<dd>${moneyCollection}</dd>
		</dl>
		<dl>
			<dt>已回款本金：</dt>
			<dd>${moneyReceived}</dd>
		</dl>
		<dl>
			<dt>待收收益：</dt>
			<dd>${dueRepayCollection}</dd>
		</dl>
		<dl>
			<dt>已收收益：</dt>
			<dd>${dueRepayReceived}</dd>
		</dl>
		<dl>
			<dt>待收佣金：</dt>
			<dd>${bonusCollection}</dd>
		</dl>
			<dl>
			<dt>已收佣金：</dt>
			<dd>${bonusReceived}</dd>
		</dl>
			<dl>
			<dt>红包个数：</dt>
			<dd>${redCount}个</dd>
		</dl>	
		<dl>
			<dt>红包总额：</dt>
			<dd>${redMoney}</dd>
		</dl>	
		<dl>
			<dt>加息：</dt>
			<dd>${cardCount}个</dd>
		</dl>
	</fieldset>
	<fieldset>
	<legend>认购流水 <a style="padding-left:34px;" class="edit"  onclick="queryLoanRecordList()"  id="queryLoanRecordList">查看更多</a></legend>
	 <table class="table" width="99%" layoutH="280" rel="loanRecordListDiv">
		<thead>
			<tr>
			<th width="10%">认购时间</th>
			<th width="10%">产品名称</th>
			<th width="10%">投资期限</th>
			<th width="10%">投资类型</th>
			<th width="10%">年化利率</th>
			<th width="10%">认购金额</th>
			<th width="10%">起息时间</th>
			<th width="10%">利息</th>
			<th width="10%">佣金</th>
			<th width="10%">标的状态</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${loanRecordList}" var="loanRecord">
			    <tr>
				<td>${loanRecord[0]}</td>
				<td>${loanRecord[1]}</td>
				<td>  
				      <c:if  test="${loanRecord[2]==1}">${loanRecord[3]}个月</c:if>
				      <c:if  test="${loanRecord[2]==2}">${loanRecord[3]}个月</c:if>
				      <c:if  test="${loanRecord[2]==3}">${loanRecord[3]}天</c:if>
				</td>
				<td>
				         <c:if  test="${loanRecord[4]==1}">优先</c:if>
			             <c:if  test="${loanRecord[4]==2}">夹层</c:if>
			             <c:if  test="${loanRecord[4]==3}">劣后</c:if>
				</td>
			     <td>
			             <c:if  test="${loanRecord[4]==1}"> ${loanRecord[5]*100}%</c:if>
			             <c:if  test="${loanRecord[4]==2}">0~23%</c:if>
			             <c:if  test="${loanRecord[4]==3}">浮动收益</c:if>
			    </td>
				<td><fmt:formatNumber pattern="0.00" value="${loanRecord[6]}"/></td>
				<td>${loanRecord[7]}</td>
				<td><fmt:formatNumber pattern="0.00" value="${loanRecord[8]}"/></td>
				<td><fmt:formatNumber pattern="0.00" value="${loanRecord[9]}"/></td>
				<td>
				         <c:if  test="${loanRecord[10]==1  or  loanRecord[10]==2  or  loanRecord[10]==3 or  loanRecord[10]==4  or  loanRecord[10]==5}">募集中</c:if>
			             <c:if  test="${loanRecord[10]==6}">还款中</c:if>
			             <c:if  test="${loanRecord[10]==7}">正常还款</c:if>
			             <c:if  test="${loanRecord[10]==8}">已完成</c:if>
			             <c:if  test="${loanRecord[10]==9}">已流标</c:if>
			             <c:if  test="${loanRecord[10]==-1}">已清盘</c:if>
				</td>
			    </tr>
		    </c:forEach>
	   </tbody>
	</table>
	</fieldset>
	<fieldset>
	<legend>资金流水 <a style="padding-left:34px;"  class="edit"  onclick="queryAccountInfoList()"  id="queryAccountInfoList">查看更多</a></legend> 
		 <table class="table" width="99%" layoutH="280" rel="accountInfoListDiv">
		<thead>
			<tr>
			<th width="15%">时间</th>
			<th width="10%">金额</th>
			<th width="15%">类型</th>
			<th width="15%">当前余额</th>
		</tr>
		</thead>
		<tbody>
           <c:forEach items="${accountInfoList}" var="account">
			    <tr>
				<td>${account[0]}</td>
				<td>
				 <c:if  test="${account[5] == 5 or account[5] == 7 or  account[5] == 15 or  account[5] == 19 or account[5] == 17  or  account[5] ==4}">-<fmt:formatNumber pattern="0.00" value="${account[1]}"/></c:if>
				 <c:if  test="${account[5] == 3 or  account[5] == 6 or  account[5] == 12 or  account[5] == 16 or  account[5] == 18 or  account[5] == 20  or  account[5] == 21}"><fmt:formatNumber pattern="0.00" value="${account[2]}"/></c:if>
				</td>
				<td>${account[3]}</td>
				<td><fmt:formatNumber pattern="0.00" value="${account[4]}"/></td>
			    </tr>
		    </c:forEach>
	   </tbody>
	</table>
	</fieldset>
		<fieldset>
	<legend>红包使用 <a style="padding-left:34px;"  class="edit"  onclick="queryRedenvelopeList()"  id="queryRedenvelopeList">查看更多</a></legend> 
		 <table class="table" width="99%" layoutH="280" rel="redenvelopeListDiv">
		<thead>
			<tr>
			<th width="15%">红包金额</th>
			<th width="20%">有效期</th>
			<th width="15%">最低投资额</th>
			<th width="10%">状态</th>
			<th width="15%">使用时间</th>
		</tr>
		</thead>
		<tbody>
           <c:forEach items="${redenvelopeList}" var="redenvelope">
			    <tr>
				<td><fmt:formatNumber pattern="0.00" value="${redenvelope[0]}"/></td>
				<td>${redenvelope[1]}~${redenvelope[2]}</td>
				<td><fmt:formatNumber pattern="0.00" value="${redenvelope[3]}"/></td>
				<td> 
				        <c:if  test="${redenvelope[4]==0}">未使用</c:if>
			             <c:if  test="${redenvelope[4]==1}">已使用</c:if>
			             <c:if  test="${redenvelope[4]==2}">待确认</c:if>
			       </td>
			       <td>${redenvelope[5]}</td>
			    </tr>
		    </c:forEach>
	   </tbody>
	</table>
	</fieldset>
  <fieldset>
	<legend>加息卷流水 <a style="padding-left:34px;"  class="edit"  onclick="queryCoutList()"  id="queryCoutList">查看更多</a></legend> 
		 <table class="table" width="99%" layoutH="280" rel="listCardDiv">
		<thead>
			<tr>
			<th width="15%">加息卷</th>
			<th width="20%">有效期</th>
			<th width="15%">最低投资额</th>
			<th width="10%">状态</th>
			<th width="15%">使用时间</th>
		</tr>
		</thead>
		<tbody>
           <c:forEach items="${listCard}" var="card">
			    <tr>
				<td><fmt:formatNumber pattern="0.00" value="${card[0]}"/></td>
				<td>${card[1]}~${card[2]}</td>
				<td><fmt:formatNumber pattern="0.00" value="${card[3]}"/></td>
				<td> 
				        <c:if  test="${card[4]==0}">未使用</c:if>
			             <c:if  test="${card[4]==1}">已使用</c:if>
			             <c:if  test="${card[4]==2}">待确认</c:if>
			       </td>
			       <td>${card[5]}</td>
			    </tr>
		    </c:forEach>
	   </tbody>
	</table>
	</fieldset>
</div>
