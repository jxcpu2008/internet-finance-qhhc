<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<form method="post" action="demo/common/ajaxDone.html"
	class="pageForm required-validate"
	onsubmit="return validateCallback(this)">
	<div class="pageContent">
		<div class="pageFormContent sortDrag">
		 <c:if test="${shop.shopExamine.state eq  '2' || shop.shopExamine.state eq  '5' || shop.shopExamine eq null}">
			           <c:if test="${shop.state  eq '0'}">
			                  <p align="center" >未提交</p>
						</c:if>
						<c:if test="${shop.state  eq '1'}">
			                 <p align="center" >草稿中</p>
						</c:if>
						<c:if test="${shop.state  eq '2'}">
			                <p align="center" > 预热中</p>
						</c:if>
						<c:if test="${shop.state  eq '3'}">
			                <p align="center" > 预热结束(修改)</p>
						</c:if>
						<c:if test="${shop.state  eq '4'}">
			             <p align="center" >     融资中</p>
						</c:if>
						<c:if test="${shop.state  eq '5'}">
			                 <p align="center" > 融资成功</p>
						</c:if>
						<c:if test="${shop.state  eq '6'}">
			               <p align="center" > 已放款</p>
						</c:if>
						<c:if test="${shop.state  eq '7'}">
			                <p align="center" >  已完成</p>
						</c:if>
						<c:if test="${shop.state  eq '8'}">
			                <p align="center" > 分红</p>
						</c:if>
						<c:if test="${shop.state  eq '9'}">
			                 <p align="center" > 已流标</p>
						</c:if>
				</c:if>
				<c:if test="${shop.shopExamine.state  eq '1'}">
				        <p align="center" >待审批</p>
				</c:if>
				<c:if test="${shop.shopExamine.state  eq '3'}">
				        <p align="center" >审批不通过</p>
				</c:if>
				<c:if test="${shop.shopExamine.state  eq '4'}">
				        <p align="center" >待审核</p>
				</c:if>
				<c:if test="${shop.shopExamine.state  eq '6'}">
				        <p align="center" >审核不通过</p>
				</c:if>
					
		</div>	
	</div>
</form>
