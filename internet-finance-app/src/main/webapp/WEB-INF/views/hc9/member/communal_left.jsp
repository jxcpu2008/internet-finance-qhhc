<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
	String basePath = "/";
%>
<%--vipLeft --%>
<div class="nav-left col-md-2">
	<div class="panel panel-default">
		<div class="panel-heading micmedium-font">
			<span class="icon-navlist icon-user center-block top-align"></span>
			会员中心
		</div>
		<ul class="list-group">
			<li class="list-group-item"><a
				href="/member_index/member_center.htm?index=0_0&nav=5">账户总览</a></li>
			<li class="list-group-item"><a
				href="/member_index/toMoneyRecord.htm?index=0_1&nav=5">交易记录</a></li>
			<li class="list-group-item"><a
				href="/userBank/toBindBank.htm?index=0_2&nav=5">银行卡</a></li>
			<li class="list-group-item"><a
				href="/member_index/favorable.htm?index=0_3&nav=5">我的优惠券<c:if test="${sessionScope.newCouponTipFlag eq 1 }"><span style="left: 124px;position: absolute;top: -2px;color: #d9534f;font-weight: bold;font-size: 20px;">●</span></c:if></a></li>
			<li class="list-group-item"><a
				href="/member_index/tapTapBus.htm?index=0_4&nav=5">我的嗒嗒车票</a></li>
			<li class="list-group-item"><a
				href="/member_index/selfInfo.htm?index=0_5&nav=5">账户设置</a></li>
			<li class="list-group-item"><a
				href="/member_index/monkeyRecord.htm?index=0_6&nav=5">中奖记录</a></li>
			<li class="list-group-item"><a
				href="/member_index/messageBox.htm?index=0_7&nav=5">消息箱</a></li>
		</ul>
	</div>
	<div class="panel panel-default">
		<div class="panel-heading micmedium-font">
			<span class="icon-navlist icon-stats-bars center-block top-align"></span>
			投资管理
		</div>
		<ul class="list-group">
			<li class="list-group-item"><a
				href="/member_index/myLoanRecord.htm?index=1_0&nav=5">我的投资</a></li>
		</ul>
	</div>
	<div class="panel panel-default">
		<div class="panel-heading micmedium-font">
			<span class="icon-navlist icon-moneybag center-block top-align"></span>
			融资管理
		</div>
		<ul class="list-group">
			<li class="list-group-item"><a
				href="/member_index/myFinanceRecord.htm?index=2_0&nav=5">我的融资</a></li>
		</ul>
	</div>
	<div class="panel panel-default">
		<div class="panel-heading micmedium-font">
			<span class="icon-navlist icon-users center-block top-align"></span>
			我的推广
		</div>
		<ul class="list-group">
			<li class="list-group-item"><a
				href="/member_index/friendRecommend.htm?index=3_0&nav=5">好友推荐</a></li>
			<li class="list-group-item"><a
				href="/member_index/promoteReward.htm?index=3_1&nav=5">推广奖励</a></li>
		</ul>
	</div>
</div>
<!-- end -->