<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<script src="/resources/js/dwz.regional.zh.js" type="text/javascript"></script>
<script type="text/javascript" src="/resources/js/cache/cachemanage.js"></script>
<div>
	<button type="button" onclick="updateLoginRelCache()">登录相关缓存</button>&nbsp;
	<button type="button" onclick="updateIndexBannerRelCache()">首页导航条相关缓存</button>&nbsp;
	<button type="button" onclick="updateTotalInvestMoney()">累计投资相关缓存</button>&nbsp;
	<button type="button" onclick="updateTotalRegisterNum()">总注册人数相关缓存</button>&nbsp;
	<button type="button" onclick="updateArticleList()">文章列表相关缓存</button><br/>
	<button type="button" onclick="updateToReturnLoanList()">待回款列表相关缓存</button>&nbsp;
	<button type="button" onclick="hotIntroduceLoanList()">热门推荐相关缓存</button>&nbsp;
	<button type="button" onclick="updateIndexLoanList()">首页产品列表相关缓存</button>&nbsp;
	<button type="button" onclick="updateZhongChiPageLoanList()">我要众持页面缓存</button><br/>
	<button type="button" onclick="updateH5ZhongChiPageLoanList()">H5我要众持页面缓存</button>&nbsp;
	<button type="button" onclick="updateH5IndexBannerRelCache()">H5首页导航条相关缓存</button>&nbsp;
	<button type="button" onclick="updateH5TotalIncome()">H5累计收益相关缓存</button>&nbsp;
	<button type="button" onclick="updateH5HotIntroduceLoanList()">H5热门推荐相关缓存</button><br/>
	
	<br/><br/>
	<button type="button" onclick="updateInvestorstasinfo()">邮件短信查询数据更新</button><br/>
	<!-- <button type="button" onclick="updateZhongChiPageLoanList()">用户充值记录相关缓存</button><br/> -->
	标id:<input id="loanSignId" type="text" accept="请输入标的主键id">
	<button type="button" onclick="updateLoanDetailRelCache()">更新标缓存信息</button>
	<button type="button" onclick="updateAllLoanDetailRelCache()">更新所有标详细缓存信息</button><br/>
	
	<br/><br/>
	标id:<input id="monkeyLoanSignId" type="text" accept="请输入标的主键id">
	<button type="button" onclick="updateActivityMonkeyMax()">更新猴声大噪缓标存信息</button><br/>
	<button type="button" onclick="updateActivityMonkeyWEEK()">更新猴声大噪周榜到数据库</button><br/>
	<button type="button" onclick="updateActivityFinancial()">更新理财师现金返利排行榜到数据库</button><br/>
	<button type="button" onclick="generateClimbTopResult()">爬山活动奖励结果一键生成</button><br/>
	手机号码:<input id="mobilePhone" type="text" accept="请输入用户手机号码">
	<button type="button" onclick="webChatAttentionReceive()">关注微信红包发放</button><br/>
<!-- 	手机号码:<input id="MonthersDayPhone" type="text" maxlength="11" accept="请输入用户手机号码"> -->
<!-- 	<button type="button" onclick="monthersDay()">母亲节红包发放</button><br/>  -->
	第几周：<select name="weekNum" id="weekNum">
				<option value="0" selected="selected">--请选择--</option>
				<option value="1">第一周</option>
				<option value="2">第二周</option>
				<option value="3">第三周</option>
				<option value="4">第四周</option>
				<option value="5">第五周</option>
				<option value="6">第六周</option>
				<option value="7">第七周</option>
				<option value="8">第八周</option>
			</select>
	<button type="button" onclick="weekSurprisePrizeGive()">周周惊喜大放送奖励发放</button><br/>
	<button type="button" onclick="updateJuChengTicketStatus()">聚橙网演唱会门票发放</button><br/>
	
	<br/>
选择开关状态:<select name="pictureSwitch" id="pictureSwitch">
	           <option value="-1" selected="selected">--请选择--</option>
	           <option value="0">关闭</option>
	           <option value="1">开启</option>
	    </select>
	<button type="button" onclick="appStartPictureSwitch()">app广告页开关</button><br/>
	输入图片地址:<input type="text" id="imageAddress"  style="width:300px;">
	<button type="button" onclick="updateAppStartImageAddress()">app广告页地址</button><br/>
	标id:<input id="investAwardLoanId" type="text" accept="请输入标id">
	<button type="button" onclick="juChengTicketInvestAward()">投资有奖聚橙网门票发放</button><br/>
	<button type="button" onclick="juChengGenUserTcketAward()">聚橙网推荐用户门票发放</button><br/>
	手机号码:<input id="weiBoMobilePhone" type="text" accept="请输入用户手机号码">
	<button type="button" onclick="juChengWeiBoTcketAward()">微博活动门票发放</button><br/>
</div>