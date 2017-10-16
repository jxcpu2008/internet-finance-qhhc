<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<style>
       
        .searchBar{
           
        }
        input#named {
        
		  width: 284px;
		  height: 21px;
		}
        #schname{

            background-color:#ffffff;
            border: 1px solid #e4e4e4;
            /*height: 30px;*/
            position: absolute;
            display: none;
            z-index: 9999999;
        }

		.pagerForm {
		  padding: 20px 40%;
		}
        #schname tr:hover{
            background-color: #e4e4e4;
            cursor: pointer;
        }
       
    </style>


<div class="pageContent"  style="border-left:1px #B8D0D6 solid;border-right:1px #B8D0D6 solid">
     <form id="pagerForm"  class="pagerForm" method="post">
	<div class="searchBar">
		<table class="searchContent">
			<tr>
				<td>
					用户数据搜索：<input type="text"  id="named" >
					            <table  id="schname" >
					
					            </table>
				</td>
			</tr>
		</table>
	</div>
	</form>
	<form >
	<div id="topTenUserInfoDiv" class="unitBox" style="float:left; display:block; overflow:auto; width:514px; line-height:221px;">
	   <div class="panelBar">
		<ul class="toolBar">
			<li><span>今日注册</span></li>
		</ul>
	</div>
	<table class="table" width="99%" layoutH="410" rel="topTenUserInfoDiv">
		<thead>
			<tr>
			<th width="5%">用户名</th>
			<th width="10%">姓名</th>
			<th width="15%">注册手机</th>
			<th width="15%">注册时间</th>
			<th width="15%">宝付状态</th>
		</tr>
		</thead>
		<tbody>
			<c:forEach items="${topTenUserInfo}" var="user">
			    <tr>
				<td><a  class="edit"  style="color:red" onclick="openUserQuickQuery(${user[5]},'${user[1]}')"  id="openUserQuickQueryU">${user[0]}</a></td>
				<td>${user[1]}</td>
				<td>${user[2]}</td>
				<td>${user[3]}</td>
			    <td>
			             <c:if  test="${user[4]==0}">待确认</c:if>
			             <c:if  test="${user[4]==-1}">失败</c:if>
			             <c:if  test="${user[4]==1}">成功</c:if>
			             <c:if  test="${user[4]==2}">注销</c:if>
			              <c:if  test="${user[4]==null }">未注册</c:if>
			    </td>
			    </tr>
		    </c:forEach>
	   </tbody>
	</table>
	</div>
	<div id="topTenRechargeDiv" class="unitBox" style="margin-left:520px;margin-bottom:20px; line-height:221px;">
	<div class="panelBar">
		<ul class="toolBar">
			<li><span>今日充值</span></li>
		</ul>
	</div>
	<table class="table" width="99%" layoutH="410" rel="topTenRechargeDiv">
		<thead>
			<tr>
			<th width="5%">用户名</th>
			<th width="10%">姓名</th>
			<th width="15%">充值金额</th>
			<th width="15%">充值时间</th>
			<th width="15%">成功时间</th>
			<th width="15%">宝付状态</th>
		</tr>
		</thead>
			<tbody>
			<c:forEach items="${topTenRecharge}" var="recharge">
			    <tr>
				<td><a  class="edit"  style="color:red" onclick="openUserQuickQuery(${recharge[6]},'${recharge[0]}')"  id="openUserQuickQueryR">${recharge[0]}</a></td>
				<td>${recharge[1]}</td>
				<td><fmt:formatNumber pattern="0.00" value="${recharge[2]}"/></td>
				<td>${recharge[3]}</td>
				<td>${recharge[4]}</td>
			    <td>
			             <c:if  test="${recharge[5]==0}">待确认</c:if>
			             <c:if  test="${recharge[5]==-1}">失败</c:if>
			             <c:if  test="${recharge[5]==1}">成功</c:if>
			    </td>
			    </tr>
		    </c:forEach>
	   </tbody>
	</table>
	</div>
	
		<div id="topTenLoanRecordDiv" class="unitBox" style="float:left; display:block; overflow:auto; width:514px; ">
	   <div class="panelBar">
		<ul class="toolBar">
			<li><span>今日认购</span></li>
		</ul>
	</div>
	<table class="table" width="99%" layoutH="410" rel="topTenLoanRecordDiv">
		<thead>
			<tr>
				<th width="5%">用户名</th>
				<th width="10%">姓名</th>
				<th width="15%">认购金额</th>
				<th width="15%">认购产品名称</th>
				<th width="15%">产品类型</th>
				<th width="15%">认购时间</th>
				<th width="15%">宝付状态</th>
		 </tr>
		</thead>
		<tbody>
						<c:forEach items="${topTenLoanRecord}" var="loanRecord">
			    <tr>
				<td><a  class="edit"  style="color:red"  onclick="openUserQuickQuery(${loanRecord[7]},'${recharge[0]}')"  id="openUserQuickQueryL">${loanRecord[0]}</a></td>
				<td>${loanRecord[1]}</td>
				<td> <fmt:formatNumber pattern="0.00" value="${loanRecord[2]}"/></td>
				<td>${loanRecord[3]}</td>
				<td>
				         <c:if  test="${loanRecord[4]==1}">优先</c:if>
			             <c:if  test="${loanRecord[4]==2}">夹层</c:if>
			             <c:if  test="${loanRecord[4]==3}">劣后</c:if>
				</td>
				<td>${loanRecord[5]}</td>
			    <td>
			             <c:if  test="${loanRecord[6]==0}">待确认</c:if>
			             <c:if  test="${loanRecord[6]==-1}">失败</c:if>
			             <c:if  test="${loanRecord[6]==1}">成功</c:if>
			    </td>
			    </tr>
		    </c:forEach>
		</tbody>
	</table>
	</div>
	
	<div id="topTenWithdrawDiv" class="unitBox" style="margin-left:520px;">
	<div class="panelBar">
		<ul class="toolBar">
			<li><span>今日提现</span></li>
		</ul>
	</div>
	<table class="table" width="99%" layoutH="410" rel="topTenWithdrawDiv">
		<thead>
			<tr>
				<th width="5%">用户名</th>
				<th width="10%">姓名</th>
				<th width="15%">提现金额</th>
				<th width="15%">提现申请时间</th>
				<th width="15%">提现成功时间</th>
				<th width="15%">宝付状态</th>
		 </tr>
		</thead>
		<tbody>
					<c:forEach items="${topTenWithdraw}" var="withdraw">
			    <tr>
				<td><a  class="edit"  style="color:red" onclick="openUserQuickQuery(${withdraw[6]},'${withdraw[0]}')"  id="openUserQuickQueryW">${withdraw[0]}</a></td>
				<td>${withdraw[1]}</td>
				<td> <fmt:formatNumber pattern="0.00" value="${withdraw[2]}"/></td>
				<td>${withdraw[3]}</td>
				<td>${withdraw[4]}</td>
			    <td>
			             <c:if  test="${withdraw[5]==0}">待确认</c:if>
			             <c:if  test="${withdraw[5]==-1}">失败</c:if>
			             <c:if  test="${withdraw[5]==1}">成功</c:if>
			             <c:if  test="${withdraw[5]==5}">转账处理中</c:if>
			               <c:if  test="${withdraw[5]==2}">宝付已受理</c:if>
			    </td>
			    </tr>
		    </c:forEach>
		</tbody>
	</table>
	</div>
	</form>
</div>


<script>
function openUserQuickQuery(userId,rename){
    if(userId!=null){
   		navTab.openTab("quickQueryList","/quickQuery/openUserQuickQuery?userId="+ userId, {
						title : "数据详情"+$.trim(rename),
						fresh : true
					});
    }
};

$(function() {
//使得下拉框的宽度和输入框保持一致
    $("#schname").css({"margin-left":"85px"});

//监听输入框
var a="";
    $("#named").keyup(function (){
        if($("#named").val().length>0){	
        	var url=encodeURI("/quickQuery/selUser");
        	$.ajax({type: "POST",url:url,data:{name:$("#named").val()},success:function(data){
        		websites=JSON.parse(data.replace(/null/g,'""'));
        	   	console.log(websites,$("#named").val())
        		 var html="";
        	     
                 var len=websites.length>10?10:websites.length;//最多显示10行
                 for(var i=0;i< len;i++){                	                                   	
                     if(websites[i][0].toLowerCase().indexOf($("#named").val().trim().toLowerCase())>=0 && websites[i][1].toLowerCase().indexOf($("#named").val().trim().toLowerCase())>=0 && websites[i][2].toLowerCase().indexOf($("#named").val().trim().toLowerCase())>=0)
                     {
                         html+="<tr  data-val='"+websites[i][3]+"'><td style='color: blue;font-weight: bold'>"+websites[i][0]+"</td><td style='color: blue;font-weight: bold'>"+websites[i][1]+"</td><td style='color: blue;font-weight: bold'>"+websites[i][2]+"</td></tr>";
                     }
                     else if(websites[i][0].toLowerCase().indexOf($("#named").val().trim().toLowerCase())>=0 && websites[i][1].toLowerCase().indexOf($("#named").val().trim().toLowerCase())>=0 && websites[i][2].toLowerCase().indexOf($("#named").val().trim().toLowerCase())<0)
                     {
                         html+="<tr  data-val='"+websites[i][3]+"'><td style='color: blue;font-weight: bold'>"+websites[i][0]+"</td><td style='color: blue;font-weight: bold'>"+websites[i][1]+"</td><td >"+websites[i][2]+"</td></tr>";
                     }
                     else if(websites[i][0].toLowerCase().indexOf($("#named").val().trim().toLowerCase())>=0 && websites[i][1].toLowerCase().indexOf($("#named").val().trim().toLowerCase())<0 && websites[i][2].toLowerCase().indexOf($("#named").val().trim().toLowerCase())>=0)
                     {
                         html+="<tr  data-val='"+websites[i][3]+"'><td style='color: blue;font-weight: bold'>"+websites[i][0]+"</td><td >"+websites[i][1]+"</td><td style='color: blue;font-weight: bold'>"+websites[i][2]+"</td></tr>";
                     }
                     else if(websites[i][0].toLowerCase().indexOf($("#named").val().trim().toLowerCase())<0 && websites[i][1].toLowerCase().indexOf($("#named").val().trim().toLowerCase())>=0 && websites[i][2].toLowerCase().indexOf($("#named").val().trim().toLowerCase())>=0)
                     {
                         html+="<tr  data-val='"+websites[i][3]+"'><td >"+websites[i][0]+"</td><td style='color: blue;font-weight: bold'>"+websites[i][1]+"</td><td style='color: blue;font-weight: bold' >"+websites[i][2]+"</td></tr>";
                     }

                     else if(websites[i][0].toLowerCase().indexOf($("#named").val().trim().toLowerCase())<0 && websites[i][1].toLowerCase().indexOf($("#named").val().trim().toLowerCase())>=0 && websites[i][2].toLowerCase().indexOf($("#named").val().trim().toLowerCase())<0)
                     {
                         html+="<tr  data-val='"+websites[i][3]+"'><td>"+websites[i][0]+"</td><td  style='color: blue;font-weight: bold'>"+websites[i][1]+"</td><td >"+websites[i][2]+"</td></tr>";
                     }
                     else if(websites[i][0].toLowerCase().indexOf($("#named").val().trim().toLowerCase())>=0 && websites[i][1].toLowerCase().indexOf($("#named").val().trim().toLowerCase())<0 && websites[i][2].toLowerCase().indexOf($("#named").val().trim().toLowerCase())<0)
                     {
                         html+="<tr  data-val='"+websites[i][3]+"'><td style='color: blue;font-weight: bold'>"+websites[i][0]+"</td><td >"+websites[i][1]+"</td><td >"+websites[i][2]+"</td></tr>";
                     }
                     else if(websites[i][0].toLowerCase().indexOf($("#named").val().trim().toLowerCase())<0 && websites[i][1].toLowerCase().indexOf($("#named").val().trim().toLowerCase())<0 && websites[i][2].toLowerCase().indexOf($("#named").val().trim().toLowerCase())>=0)
                     {
                         html+="<tr data-val='"+websites[i][3]+"'><td >"+websites[i][0]+"</td><td >"+websites[i][1]+"</td><td style='color: blue;font-weight: bold'>"+websites[i][2]+"</td></tr>";
                     }
                 }
                if(html==""){
                    html="<tr><td >无对应用户</td></tr>";
                }
                 $("#schname").html(html);

                 $("#schname").css("display","table");
        	}})  //ajax colse	          
        }else{
            $("#schname").css("display","none");
        }
    });
//      这里是点击事件处理
    $('#schname').on('click', 'tr', function() {

        if($(this).text()=="无对应用户"){
            return;//没有匹配值返回否则做相应处理
        }   
        $("#named").val($(this).children().eq(0).text());//eq(0)获取第一个字段 eq(1) eq(2) 分别为第二第三个字段
        $("#schname").css("display","none");
        
        var name=$(this).children().eq(0).text();
        var userName=$(this).children().eq(1).text();
        var phone=$(this).children().eq(2).text();
       var rename=name;
        if(name==null||name==""){
        	rename=userName;
        }
        navTab.openTab("quickQueryList","/quickQuery/openUserQuickQuery?userId="+ $(this).attr('data-val'), {
			title : "数据详情"+$.trim(rename),
			fresh : true
		});
    });

});

/* function myrefresh(){
	navTab.reload("/quickQuery/index", "", 92); 
}
setTimeout('myrefresh()',30000); //指定1秒刷新一次  */
</script>