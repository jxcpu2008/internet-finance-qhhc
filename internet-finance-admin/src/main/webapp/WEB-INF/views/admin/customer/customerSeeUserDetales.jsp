<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
.detailes>table {
	height: 460px;
	width: 680px;
}

.detailes>table td {
	width: 80px;
	color: #00CCFF;
	padding-left: 50px;
	border-bottom: 1px solid #ccc;
}

.detailes>table td.td2 {
	color: #000;
	border-right: 1px solid #ccc;
}

.detailes>table td.td3 {
	color: #000;
}
</style>
<div class="detailes">
	<table>
		<tr>
			<td>序号</td>
			<td class="td2">${cutuser[0][0]}</td>
			<td>是否为机构投资人</td>
			<td class="td3"><c:if test="${cutuser[0][16] eq 1}">是</c:if> <c:if
					test="${cutuser[0][16] eq 0}">否</c:if></td>
		</tr>
		<tr>
			<td>用户名</td>
			<td class="td2">${cutuser[0][1]}</td>
			<td>推荐人用户名</td>
			<td class="td3">${cutuser[0][23]}</td>
		</tr>
		<tr>
			<td>真实姓名</td>
			<td class="td2">${cutuser[0][2]}</td>
			<td>推荐人真实姓名</td>
			<td class="td3">${cutuser[0][22]}</td>
		</tr>
		<tr>
			<td>手机号码</td>
			<td class="td2">${cutuser[0][3]}</td>
			<td>推荐人部门</td>
			<td class="td3"><c:if test="${cutuser[0][26] eq 1}">总裁办</c:if> <c:if
					test="${cutuser[0][26] eq 2}">财务部</c:if> <c:if
					test="${cutuser[0][26] eq 3}">行政部</c:if> <c:if
					test="${cutuser[0][26] eq 4}">副总办</c:if> <c:if
					test="${cutuser[0][26] eq 5}">运营中心</c:if> <c:if
					test="${cutuser[0][26] eq 6}">培训部</c:if> <c:if
					test="${cutuser[0][26] eq 7}">风控部</c:if> <c:if
					test="${cutuser[0][26] eq 8}">IT部</c:if> <c:if
					test="${cutuser[0][26] eq 9}">摄影部</c:if> <c:if
					test="${cutuser[0][26] eq 10}">推广部</c:if> <c:if
					test="${cutuser[0][26] eq 11}">项目部</c:if> <c:if
					test="${cutuser[0][26] eq 12}">客服部</c:if> <c:if
					test="${cutuser[0][26] eq 13}">事业一部</c:if> <c:if
					test="${cutuser[0][26] eq 14}">事业二部</c:if> <c:if
					test="${cutuser[0][26] eq 15}">离职员工</c:if></td>
		</tr>
		<tr>
			<td>用户余额</td>
			<td class="td2"><fmt:formatNumber type="number"
					value="${cutuser[0][27]}" maxFractionDigits="2" />元</td>
			<td>会员等级</td>
			<td class="td3"><c:if test="${empty cutuser[0][9] }">普通会员</c:if>
				<c:if test="${!empty cutuser[0][9] }">特权会员</c:if></td>
		</tr>
		<tr>
			<td>用户类别</td>
			<td class="td2"><c:if test="${cutuser[0][20] eq 2}">员工</c:if> <c:if
					test="${cutuser[0][20] eq 1}">普通用户</c:if>
				<c:if test="${cutuser[0][20] eq 3}">企业用户</c:if>
				<c:if test="${cutuser[0][20] eq 4}">居间人</c:if></td>
			<td>会员期限</td>
			<td class="td3"><c:if test="${empty cutuser[0][9] }">永久</c:if> <c:if
					test="${!empty cutuser[0][9] }">${cutuser[0][9] }</c:if></td>
		</tr>
		<tr>
			<td>员工工号</td>
			<td class="td2">${cutuser[0][21]}</td>
			<td>登陆次数</td>
			<td class="td3">${cutuser[0][8]}次</td>
		</tr>
		<tr>
			<td>注册时间</td>
			<td class="td2">${cutuser[0][5]}</td>
			<td>积分</td>
			<td class="td3">${cutuser[0][4]}分</td>
		</tr>
		<tr>
			<td>宝付注册状态</td>
			<td class="td2"><c:choose>
					<c:when test="${cutuser[0][13] eq 1}">
			已注册
			</c:when>
					<c:otherwise>
					未注册
					</c:otherwise>
				</c:choose></td>
			<td>状态</td>
			<td class="td3">${cutuser[0][11]}</td>
		</tr>
		<tr>
			<td>宝付授权状态</td>
			<td class="td2"><c:choose>
					<c:when test="${cutuser[0][14] eq 1}">已授权</c:when>
					<c:otherwise>
					未授权
					</c:otherwise>
				</c:choose></td>
			<td>客服</td>
			<td class="td3">${cutuser[0][12]}</td>
		</tr>
		<tr>
			<td>宝付注册单号</td>
			<td class="td2">${cutuser[0][15]}</td>
			<td>上次登陆时间</td>
			<td class="td3">${cutuser[0][6]}</td>
		</tr>
		<tr>
			<td>宝付ID</td>
			<td class="td2">${cutuser[0][19]}</td>
			<td>上次登陆地址</td>
			<td class="td3">${cutuser[0][7]}</td>
		</tr>
		<tr>
			<td>是否为融资人</td>
			<td class="td2"><c:if test="${cutuser[0][18] eq 1}">是</c:if> <c:if
					test="${cutuser[0][18] eq 0}">否</c:if></td>
			<td></td>
			<td></td>
		</tr>
		<tr>
			<td>累计收益</td>
			<td class="td2">${fn:substring(cutuser[0][24],0,fn:indexOf(cutuser[0][24], ".")+3)}</td>
			<td>累计投资金</td>
			<td class="td3">${fn:substring(cutuser[0][25],0,fn:indexOf(cutuser[0][25], ".")+3)}</td>
		</tr>

	</table>

</div>