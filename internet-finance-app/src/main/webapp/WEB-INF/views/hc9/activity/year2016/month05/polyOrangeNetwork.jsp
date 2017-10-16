<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>前海红筹-中国首家众持平台</title>
<link rel="stylesheet" href="${oss}/resources/public/js/jDialog/jDialog.css" type="text/css">
<script type="text/javascript" src="${oss}/resources/public/js/jquery.js"></script>
<script type="text/javascript" src="${oss}/resources/public/js/jDialog.js"></script>
<script type="text/javascript" src="${oss}/resources/public/js/jDialog/jquery.drag.js"></script>
<script type="text/javascript" src="${oss}/resources/public/js/jDialog/jquery.mask.js"></script>
<script type="text/javascript" src="${oss}/resources/public/js/jDialog/jquery.dialog.js"></script>

<link rel="stylesheet" href="${oss}/resources/public/css/reset.css?v=1.0"/>
<link rel="stylesheet" href="${oss}/resources/public/css/common.css?v=1.0" />
<link rel="stylesheet" href="${oss}/resources/public/css/animate.css?v=1.0" />
<link rel="stylesheet" href="${oss}/resources/public/css/base.css?v=1.0" />

<script src="${oss}/resources/public/js/jquery-1.7.2.min.js"></script>
<script src="${oss}/resources/public/js/main.js?v=1.0"></script>
<link href="${oss}/resources/public/js/fancybox/jquery.fancybox.css" rel="stylesheet" />
<script src="${oss}/resources/public/js/fancybox/jquery.fancybox.js"></script>
<!--[if lte IE 9]> 
<script src="../js/html5.js"></script>
<script src="../js/selector.js"></script>
<![endif]-->
<style>
	#cooperation .inner{
		width:1200px;
	}
	#cooperation .tag{
		position:absolute;
		display:block;
		left:50%;
	}
	#cooperation .part_1{
		background:url(${oss }/resources/activity/year2016/month05/jucheng/images/bgimg_01.jpg) top center no-repeat;
		height:1050px;
		outline-width:0px;  
  		vertical-align:top;
	}
	#cooperation .part_1 .logo{
		padding:48px 0 114px 0;
	}
	#cooperation .part_1 .parcel{
		position:relative;
		height:847px;
	}
	#cooperation .part_1 .parcel .text{
		background-image:url(${oss }/resources/activity/year2016/month05/jucheng/images/text-sprite.png);
	}
	#cooperation .part_1 .parcel .tag1{
		width:108px;
		height:86px;
		background-position:0 0;
		margin-left:-585px;
		top:24px;
	}
	#cooperation .part_1 .parcel .tag2{
		width:112px;
		height:106px;
		background-position:-108px 0;
		margin-left:-527px;
		top:24px;
	}
	#cooperation .part_1 .parcel .tag3{
		width:99px;
		height:102px;
		background-position:-220px 0;
		margin-left:-432px;
		top:10px;
	}
	#cooperation .part_1 .parcel .tag4{
		width:92px;
		height:85px;
		background-position:-319px 0;
		margin-left:-344px;
		top:10px;
	}
	#cooperation .part_1 .parcel .tag5{
		width:91px;
		height:93px;
		background-position:-411px 0;
		margin-left:-267px;
		top:16px;
	}
	#cooperation .part_1 .parcel .tag6{
		width:89px;
		height:85px;
		background-position:-629px 0;
		margin-left:-102px;
		top:24px;
	}
	#cooperation .part_1 .parcel .tag7{
		width:127px;
		height:124px;
		background-position:-502px 0;
		margin-left:-193px;
		top:0;
	}
	#cooperation .part_1 .parcel .tag8{
		width:89px;
		height:85px;
		background-position:0 -125px;
		margin-left:-25px;
		top:40px;
	}
	#cooperation .part_1 .parcel .tag9{
		width:92px;
		height:84px;
		background-position:-108px -125px;
		margin-left:53px;
		top:41px;
	}
	#cooperation .part_1 .parcel .tag10{
		width:92px;
		height:83px;
		background-position:-220px -125px;
		margin-left:133px;
		top:20px;
	}
	#cooperation .part_1 .parcel .tag11{
		width:87px;
		height:85px;
		background-position:-319px -125px;
		margin-left:213px;
		top:18px;
	}
	#cooperation .part_1 .parcel .tag12{
		background:url(${oss }/resources/activity/year2016/month05/jucheng/images/rule-ico1.png) 0 0 no-repeat;
		width:188px;
		height:188px;
		margin-left:-555px;
		top:177px;
	}
	#cooperation .part_1 .parcel .tag13{
		background:url(${oss }/resources/activity/year2016/month05/jucheng/images/rule-ico2.png) 0 0 no-repeat;
		width:232px;
		height:232px;
		margin-left:-275px;
		top:245px;
	}
	#cooperation .part_1 .parcel .tag14{
		background:url(${oss }/resources/activity/year2016/month05/jucheng/images/rule-ico3.png) 0 0 no-repeat;
		width:230px;
		height:230px;
		margin-left:-515px;
		top:445px;
	}
	#cooperation .part_1 .parcel .tag15{
		background:url(${oss }/resources/activity/year2016/month05/jucheng/images/rule-ico4.png) 0 0 no-repeat;
		width:257px;
		height:257px;
		margin-left:-246px;
		top:540px;
	}
	#cooperation .part_1 .parcel .login{
		background:url(${oss }/resources/activity/year2016/month05/jucheng/images/login-bg.png) 0 0 no-repeat;
		width:546px;
		height:546px;
		margin-left:54px;
		top:288px;
	}
	#cooperation .part_1 .parcel .login .notlogin{
		position:absolute;
		top:94px;
		left:50%;
		margin-left:-143px;
	}
	#cooperation .part_1 .parcel .login .notlogin form{
		position:absolute;
		left:50%;
		margin-left:-173px;
		top:30px;
		width:368px;
	}
	#cooperation .part_1 .parcel .login .notlogin .bg-white{
		border:1px solid #e2e2e2;
		border-radius:5px;
		height:20px;
		padding:10px;
		line-height:18px;
		width:346px;
	}
	#cooperation .part_1 .parcel .login .notlogin .bg-white input{
		background-color:white;
		border-width:0;
		height:20px;
		line-height:20px;
		padding:0;
		width:296px;
	}
	#cooperation .part_1 .parcel .login .notlogin a.captcha{
		color:#dc7633;
		font-size:14px;
		background-color:white;
		text-align:center;
		width:120px;
		height:40px;
		line-height:40px;
		border:1px solid #dc7633;
		border-radius:5px;
	}
	#cooperation .part_1 .parcel .login .notlogin .protocol{
		margin:10px 0;
		font-size:14px;
		color:white;
	}
	.input-checkbox {
		min-width:15px;
		min-height:15px;
		padding-left:25px;
		position:relative;
	}
	.input-checkbox:before,
	.input-checkbox:after {
		content:"";
		display:block;
		position:absolute;
		left:0;
		top:50%;
		margin-top:-8px;
	}
	.input-checkbox:before {
		width:15px;
		height:15px;
		border:1px solid #dc7633;
	}
	.input-checkbox:after {
		display:none;
		height:11px;
		width:11px;
		background:url(${oss }/resources/activity/year2016/month05/jucheng/images/checked-ico.png) no-repeat;
		background-size:contain;
		left:3px;
		margin-top:-5px;
	}
	.input-checkbox.checked:after{
		display:block;
	}
	#cooperation .part_1 .parcel .login .notlogin .btn-regist{
		background-color:#dc7633;
		padding:10px 135px;
		color:#ffffff;
		font-size:18px;
		border-radius:5px;
		-ms-border-radius:5px;
		-webkit-border-radius:5px;
	}
	#cooperation .part_1 .parcel .login .haslogin{
		position:absolute;
		top:160px;
		left:50%;
		margin-left:-170px;
	}
	#cooperation .part_1 .parcel .login .haslogin ul{
		font-size:18px;
		color:#fefefe;
		line-height:48px;
		margin-bottom:50px;
	}
	#cooperation .part_1 .parcel .login .haslogin ul span{
		font-size:20px;
		color:#ce322e;
		padding-left:148px;
	}
	#cooperation .part_1 .parcel .login .haslogin .btn-account{
		background-color:#ce322e;
		padding:8px 110px;
		color:#ffffff;
		font-size:18px;
		border-radius:5px;
		-ms-border-radius:5px;
		-webkit-border-radius:5px;
	}
	
	
	
	#cooperation .part_2{
		background:url(${oss }/resources/activity/year2016/month05/jucheng/images/bgimg_02.jpg) top center no-repeat;
		height:1314px;
	}
	#cooperation .part_2 .parcel-1{
		padding-top:58px;
	}
	#cooperation .part_2 .parcel-1 .title{
		background:url(${oss }/resources/activity/year2016/month05/jucheng/images/title-img1.png) 0 0 no-repeat;
		height:56px;
	}
	#cooperation .part_2 .parcel-1 .content{
		margin:42px 0 82px 0;
	}
	#cooperation .part_2 .parcel-1 .content .concert{
		background:url(${oss }/resources/activity/year2016/month05/jucheng/images/concert-835x355.png) 0 0 no-repeat;
		width:835px;
		height:366px;
	}
	#cooperation .part_2 .parcel-1 .content .concert p{
		padding:270px 0 0 20px;
		letter-spacing:2px;
	}
	/* #cooperation .part_2 .parcel-1 .content .list{
		background:url(${oss }/resources/activity/year2016/month05/jucheng/images/list-345x336.png) 0 0 no-repeat;
		width:345px;
		height:336px;
		margin-top:19px;
	}
	#cooperation .part_2 .parcel-1 .content .list ul{
		margin:65px 22px 0 22px;
		height:240px;
		overflow:hidden;
	}
	#cooperation .part_2 .parcel-1 .content .list li{
		font-size:16px;
		color:#ffffff;
		border-bottom:1px dashed #1d1854;
		padding:5px 10px;
	} */
	#cooperation .part_2 .parcel-1 .content .list{
		background:url(${oss }/resources/activity/year2016/month05/jucheng/images/list-345x336.png) 0 0 no-repeat;
		width:345px;
		height:265px;
		padding-top:71px;
	}
	#cooperation .part_2 .parcel-1 .content .list-parcel{
		height:240px;
		overflow:hidden;
	}
	#cooperation .part_2 .parcel-1 .content .list ul{
		margin:0 22px;
		height:240px;
	}
	#cooperation .part_2 .parcel-1 .content .list li{
		font-size:16px;
		color:#ffffff;
		border-bottom:1px dashed #1d1854;
		padding:5px 10px;
	}
	
	#cooperation .part_2 .parcel-2 .title{
		background:url(${oss }/resources/activity/year2016/month05/jucheng/images/title-img2.png) 0 0 no-repeat;
		height:56px;
	}
	#cooperation .part_2 .parcel-2 .content .mode-l{
		background:url(${oss }/resources/activity/year2016/month05/jucheng/images/parcel-img1.png) 0 0 no-repeat;
		width:618px;
		height:485px;
		margin-top:100px;
	}
	#cooperation .part_2 .parcel-2 .content .mode-r{
		margin:80px 0 0 95px;
	}
	#cooperation .part_2 .parcel-2 .content .mode-r dl{
		background-image:url(${oss }/resources/activity/year2016/month05/jucheng/images/parcel-img2.png);
		height:125px;
		background-repeat:no-repeat;
		color:#fefefe;
		padding-left:150px;
		margin-bottom:60px;
	}
	#cooperation .part_2 .parcel-2 .content .mode-r dl:nth-child(1){
		background-position: 0 0;
	}
	#cooperation .part_2 .parcel-2 .content .mode-r dl:nth-child(2){
		background-position: 0 -125px;
	}
	#cooperation .part_2 .parcel-2 .content .mode-r dl:nth-child(3){
		background-position: 0 -250px;
	}
	#cooperation .part_2 .parcel-2 .content .mode-r dl dt{
		font-size:20px;
		font-weight:bold;
		padding-top:20px;
	}
	#cooperation .part_2 .parcel-2 .content .mode-r dl dd{
		font-size:16px;
	}
	
	
	
	
	#cooperation .part_3{
		background:url(${oss }/resources/activity/year2016/month05/jucheng/images/bgimg_03.jpg) top center no-repeat;
		height:1592px;
	}
	#cooperation .part_3 .parcel-1 .title{
		background:url(${oss }/resources/activity/year2016/month05/jucheng/images/title-img3.png) 0 0 no-repeat;
		height:56px;
	}
	#cooperation .part_3 .parcel-1 .content{
		position:relative;
		height:564px;
		margin:104px 0 68px 0;
	}
	#cooperation .part_3 .parcel-1 .content .tag1{
		background:url(${oss }/resources/activity/year2016/month05/jucheng/images/safety-bg3.png) 0 0 no-repeat;
		width:1134px;
		height:369px;
		margin-left:-567px;
		top:60px;
	}
	#cooperation .part_3 .parcel-1 .content .tag2{
		background:url(${oss }/resources/activity/year2016/month05/jucheng/images/safety-bg2.png) 0 0 no-repeat;
		width:1134px;
		height:369px;
		margin-left:-567px;
		top:60px;
	}
	#cooperation .part_3 .parcel-1 .content .tag3{
		background:url(${oss }/resources/activity/year2016/month05/jucheng/images/safety-bg1.png) 0 0 no-repeat;
		width:1134px;
		height:369px;
		margin-left:-567px;
		top:60px;
	}
	#cooperation .part_3 .parcel-1 .content dl{
		color:#fefefe;
		font-size:16px;
	}
	#cooperation .part_3 .parcel-1 .content dl dt{
		padding:60px 0 10px 0;
		font-size:25px;
	}
	#cooperation .part_3 .parcel-1 .content dl dd{
		line-height:24px;
	}
	#cooperation .part_3 .parcel-1 .content .tag4 dt{
		background:url(${oss }/resources/activity/year2016/month05/jucheng/images/safety-ico1.png) top center no-repeat;
	}
	#cooperation .part_3 .parcel-1 .content .tag5 dt{
		background:url(${oss }/resources/activity/year2016/month05/jucheng/images/safety-ico2.png) top center no-repeat;
	}
	#cooperation .part_3 .parcel-1 .content .tag6 dt{
		background:url(${oss }/resources/activity/year2016/month05/jucheng/images/safety-ico3.png) top center no-repeat;
	}
	#cooperation .part_3 .parcel-1 .content .tag7 dt{
		background:url(${oss }/resources/activity/year2016/month05/jucheng/images/safety-ico4.png) top center no-repeat;
	}
	#cooperation .part_3 .parcel-1 .content .tag4{
		top:160px;
		margin-left:-560px;
	}
	#cooperation .part_3 .parcel-1 .content .tag5{
		top:0;
		margin-left:-302px;
	}
	#cooperation .part_3 .parcel-1 .content .tag6{
		top:0;
		margin-left:120px;
	}
	#cooperation .part_3 .parcel-1 .content .tag7{
		top:160px;
		margin-left:405px;
	}
	#cooperation .part_3 .parcel-1 .content .tag8{
		background:url(${oss }/resources/activity/year2016/month05/jucheng/images/safety-img1.png) 0 0 no-repeat;
		width:348px;
		height:288px;
		top:269px;
		margin-left:-174px;
	}
	#cooperation .part_3 .parcel-2 .title{
		background:url(${oss }/resources/activity/year2016/month05/jucheng/images/title-img4.png) 0 0 no-repeat;
		height:56px;
	}
	#cooperation .part_3 .parcel-2 .content{
		margin:68px 0 120px 0;
	}
	#cooperation .part_3 .parcel-2 .content a{
		margin-left:40px;
	}
	#cooperation .part_3 .parcel-2 .content a:nth-child(1){
		margin-left:0px;
	}
	#cooperation .part_3 .parcel-3 .title{
		background:url(${oss }/resources/activity/year2016/month05/jucheng/images/title-img5.png) 0 0 no-repeat;
		height:56px;
	}
	#cooperation .part_3 .parcel-3 .content{
		margin-top:48px;
	}
	#cooperation .part_3 .parcel-3 .content li{
		background:url(${oss }/resources/activity/year2016/month05/jucheng/images/honor-bg-370x333.png) 0 0 no-repeat;
		width:370px;
		height:333px;
		margin-left:45px;
	}
	#cooperation .part_3 .parcel-3 .content li:nth-child(1){
		margin-left:0;
	}
	#cooperation .part_3 .parcel-3 .content li p{
		font-size:18px;
		color:#fefefe;
		padding-top:28px;
	}

	#cooperation .part_4{
		background:url(${oss }/resources/activity/year2016/month05/jucheng/images/bgimg_04.jpg) top center no-repeat;
		height:844px;
	}
	#cooperation .part_4 .title img{
		padding-top:100px;
	}
	#cooperation .part_4 .content{
		font-size:18px;
		color:#fefefe;
		line-height:40px;
		margin:70px 0 0 354px;
		letter-spacing:2px;
	}
	#cooperation .part_4 a{
		background-color:#dc7633;
		font-size:18px;
		color:white;
		padding:10px 100px;
		border-radius:5px;
		-ms-border-radius:5px;
		-webkit-border-radius:5px;
	}
	#protocol-record section{
		background-color:white;
		width: 640px;
	}
	#protocol-record section article{
		overflow: hidden;
		width:600px;
		margin: 0 auto;
	}
</style>
</head>
<body>
	 <!--Container begin-->
    <div id="container"> 
        <!--[if lt IE 8]>
        <div class="cmpt_bar">
            您现在使用的浏览器版本过低，可能会导致浏览效果和信息的缺失。建议立即升级到 <a href="http://windows.microsoft.com/zh-cn/internet-explorer/download-ie" target="_blank" title="免费升级至IE8浏览器">Internet Explorer 8</a> 或 <a href="http://baoku.360.cn/soft/show/appid/100923" target="_blank" title="免费升级至360安全浏览器">360安全浏览器</a> ，安全更放心！
        </div>
        <![endif]-->
          
        <!--Main begin-->
        <main id="cooperation" role="main">
        	<div class="part_1"> 
            	<div class="inner">
                	<div class="logo clearfix">                    	
                        <a href="#" class="fl-l mr40"><img src="${oss }/resources/activity/year2016/month05/jucheng/images/hc9-logo.png" /></a>
                        <a href="#" class="fl-l pt5"><img src="${oss }/resources/activity/year2016/month05/jucheng/images/jc-logo.png" /></a>
                    </div>
                    <div class="parcel scene">
                    	<span class="tag text tag1 animated bounceIn" data-delay="300"></span>
                    	<span class="tag text tag2 animated bounceIn" data-delay="450"></span>
                    	<span class="tag text tag3 animated bounceIn" data-delay="600"></span>
                    	<span class="tag text tag4 animated bounceIn" data-delay="750"></span>
                    	<span class="tag text tag5 animated bounceIn" data-delay="900"></span>
                    	<span class="tag text tag6 animated bounceIn" data-delay="1200"></span>
                    	<span class="tag text tag7 animated bounceIn" data-delay="1050"></span>
                    	<span class="tag text tag8 animated bounceIn" data-delay="1350"></span>
                    	<span class="tag text tag9 animated bounceIn" data-delay="1500"></span>
                    	<span class="tag text tag10 animated bounceIn" data-delay="1650"></span>
                    	<span class="tag text tag11 animated bounceIn" data-delay="1800"></span>
                        <span class="tag tag12 animated bounceIn" data-delay="2100"></span>
                        <span class="tag tag13 animated bounceIn" data-delay="2200"></span>
                        <span class="tag tag14 animated bounceIn" data-delay="2300"></span>
                        <span class="tag tag15 animated bounceIn" data-delay="2400"></span>
                        <div class="tag login" id="login">
                        <c:if test="${empty session_user}">
                        		<!--未登录状态-->
                        	<div class="notlogin">
                        		<span><img src="${oss}/resources/activity/year2016/month05/jucheng/images/ico.png" /></span>
                                <form method="post" id="regForm1">
                                	<!-- 从渠道过来的SessionId -->
                                	<input type="hidden" id="CSRFToken" name="CSRFToken" value="${csrf}" />
                                	<input type="hidden" id="registryFlag" value="0"/>
                                	<!-- 默认图形验证码 -->
                                	<input type="hidden" id="imgcode" name="imgcode" value="${user_login}">
                                	<p class="overflow bg-white mt30">
                                    	<img src="${oss }/resources/activity/year2016/month05/jucheng/images/login-ico1.gif" width="20" height="20"  class="fl-l mr10" />
                                        <input type="text" name="userName" data-id="userName" placeholder="请输入6-18位字符的用户名" class="fl-l">
                                        <br class="clear">
                                    </p>
                                	<p class="overflow bg-white mt15">
                                    	<img src="${oss }/resources/activity/year2016/month05/jucheng/images/login-ico2.gif" width="16" height="19"  class="fl-l mr10" />
                                        <input type="password" name="pwd" data-id="pwd" placeholder="请输入6-18位字符的密码" class="fl-l">
                                        <br class="clear">
                                    </p>
                                	<p class="overflow bg-white mt15">
                                    	<img src="${oss }/resources/activity/year2016/month05/jucheng/images/login-ico3.gif" width="15" height="23"  class="fl-l mr10" />
                                        <input type="text" name="phone1" data-id="phone1" placeholder="请输入手机号码" class="fl-l">
                                        <br class="clear">
                                    </p>
                                    <p class="overflow bg-white mt15 fl-l" style="width:220px;">
                                    	<img src="${oss }/resources/activity/year2016/month05/jucheng/images/login-ico4.gif" width="18" height="22"  class="fl-l mr10" />
                                        <input type="text" id="pcode" name="pcode" data-id="pcode" placeholder="请输入验证码" class="fl-l" style="width:190px;">
                                        <br class="clear">
                                        <!-- regCode -->
                                    </p>
                                    <a href="javascript:void(0)" id="sendPCode" class="fl-r mt15 captcha">获取验证码</a>
                                    <div class="clear"></div>
                                    <div class="protocol"><span id="reginxy" class="input-checkbox">您已阅读并同意</span>
                                    <a href="#protocol-record" id="protocol" class="clr-skyblue">《前海红筹用户服务协议》</a></div>
                                     <a href="javascript:;" id="registSubmit" class="btn-regist">注册领红包</a>
                                </form>        
                            </div>
                            </c:if>
                            <c:if test="${!empty session_user}">
	                            <!--登陆后状态-->
	                            <div class="haslogin">
	                                <ul>
	                                    <li>账户余额<span>￥<fmt:formatNumber type="number" value="${cashBalance}" pattern=",##0.00#" /></span></li>
	                                    <li>投资金额<span>￥<fmt:formatNumber type="number" value="${totalInvestMoney}" pattern=",##0.00#" /></span></li>
	                                    <li>总收益&nbsp;&nbsp;&nbsp;&nbsp;<span>￥<fmt:formatNumber type="number" value="${totalIncome}" pattern=",##0.00#" /></span></li>
	                                    <li>门票张数<span>${ticketNum}张</span></li>
	                                </ul>
	                                <a href="/member_index/member_center.htm?index=0_0&nav=5" target="_Blank" class="btn-account px18">进入我的账户</a>
								</div>
							</c:if>
                        </div>
                    </div>
                </div>
            	
            </div>
            
            <div class="part_2">
            	<div class="inner">
                    <div class="parcel-1">
                        <div class="title"></div>
                        <div class="content clearfix">
                            <div class="fl-l concert">
                            	<p class="px20 clr-white">目前还剩余<font color="#ce322e" style="font-size:30px;">${leftTicketNum}</font>张免费门票，门票有限，送完即止！</p>
                            </div>
                            <div class="fl-r list" id="list">
                           		 <c:if test="${!empty prizeList}">
                           			  <c:if test="${prizeList.size() > 6}">  
		                            	<div class="list-parcel">
		                            		<ul>
		                            			<c:forEach items="${prizeList}" var="p">
		                            				<li>恭喜&nbsp;&nbsp;&nbsp;&nbsp;<font color="#ce322e">${fn:replace(p.phone,fn:substring(p.phone,3,fn:length(p.phone)-4),"****")}</font>&nbsp;&nbsp;&nbsp;&nbsp;获得门票&nbsp;&nbsp;${p.prizeNum}&nbsp;&nbsp;张</li>
		                            			</c:forEach>
			                                </ul>
		                            	</div>
	                            	  </c:if>
	                            	  <!-- 小于7不许需要滚动 --> 
	                            	  <c:if test="${prizeList.size() < 7}">  
		                            	<div>
		                            		<ul>
		                            			<c:forEach items="${prizeList}" var="pl">
		                            				<li>恭喜&nbsp;&nbsp;&nbsp;&nbsp;<font color="#ce322e">${fn:replace(pl.phone,fn:substring(pl.phone,3,fn:length(pl.phone)-4),"****")}</font>&nbsp;&nbsp;&nbsp;&nbsp;获得门票&nbsp;&nbsp;${pl.prizeNum}&nbsp;&nbsp;张</li>
		                            			</c:forEach>
			                                </ul>
		                            	</div>
	                            	  </c:if> 
                            	</c:if>
                            	<c:if test="${empty prizeList}">
                            		<div class="txt-c px20 pt50 mt50 clr-white">当前没有用户获得门票</div>
                            	</c:if>
                            </div>
                        </div>
                    </div>
                    <div class="parcel-2">
                        <div class="title"></div>
                        <div class="content clearfix">
                            <div class="fl-l mode-l"></div>
                            <div class="fl-l mode-r clearfix">
                            	<dl>
                                	<dt>优先模式</dt>
                                    <dd>本息有保障，10%收益固定</dd>
                                </dl>
                            	<dl>
                                	<dt>夹层模式</dt>
                                    <dd>本金有保障，0%~15%收益浮动</dd>
                                </dl>
                            	<dl>
                                	<dt>劣后模式</dt>
                                    <dd>本金不保障，浮动收益</dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="part_3">
            	<div class="inner">
                    <div class="parcel-1">
                        <div class="title"></div>
                        <div class="content scene">
                        	<span class="tag tag1 animated fadeIn" data-delay="900"></span>
                        	<span class="tag tag2 animated fadeIn" data-delay="600"></span>
                        	<span class="tag tag3 animated fadeIn" data-delay="300"></span>
                            <dl class="txt-c tag tag4 animated bounceIn" data-delay="1500">
                            	<dt>项目真实</dt>
                                <dd>实地项目考察，历史项目100%<br>兑付，成立至今0坏账。</dd>
                            </dl>
                            <dl class="txt-c tag tag5 animated bounceIn" data-delay="1700">
                            	<dt>专业团队</dt>
                                <dd>风控法务团队、精英项目团队<br>全程为你的财富保驾护航。</dd>
                            </dl>
                            <dl class="txt-c tag tag6 animated bounceIn" data-delay="1900">
                            	<dt>信息安全</dt>
                                <dd>银行级数据保障 中国电子商务<br>协会“安全联盟信誉企业”</dd>
                            </dl>
                            <dl class="txt-c tag tag7 animated bounceIn" data-delay="2100">
                            	<dt>还款双重保障</dt>
                                <dd>融资方足值抵质押物<br><img src="${oss }/resources/activity/year2016/month05/jucheng/images/safety-ico5.png" /><br>第三方债权收购机构</dd>
                            </dl>
                            <span class="tag tag8 animated bounceIn" data-delay="200"></span>
                        </div>
                    </div>
                    
                    <div class="parcel-2">
                        <div class="title"></div>
                        <div class="content clearfix">
                        	<a href="https://www.hc9.com/to/article-1-3-111.htm" class="fl-l"><img src="${oss }/resources/activity/year2016/month05/jucheng/images/report-img1.png" /></a>
                        	<a href="https://www.hc9.com/to/article-1-3-109.htm" class="fl-l"><img src="${oss }/resources/activity/year2016/month05/jucheng/images/report-img2.png" /></a>
                        	<a href="https://www.hc9.com/to/article-1-3-53.htm" class="fl-l"><img src="${oss }/resources/activity/year2016/month05/jucheng/images/report-img3.png" /></a>
                        	<a href="https://www.hc9.com/to/article-1-3-83.htm" class="fl-l"><img src="${oss }/resources/activity/year2016/month05/jucheng/images/report-img4.png" /></a>
                        	<a href="https://www.hc9.com/to/article-1-3-98.htm" class="fl-l"><img src="${oss }/resources/activity/year2016/month05/jucheng/images/report-img5.png" /></a>
                        </div>
                    </div>
                    
                    <div class="parcel-3">
                        <div class="title"></div>
                        <ul class="content clearfix">
                        	<li class="fl-l txt-c">
                            	<img src="${oss }/resources/activity/year2016/month05/jucheng/images/honor-img1.jpg" class="pt15" />
                                <p>前海风云榜优秀商业模式奖项</p>
                            </li>
                            <li class="fl-l txt-c">
                            	<img src="${oss }/resources/activity/year2016/month05/jucheng/images/honor-img2.jpg" class="pt15" />
                                <p>CCTV影响力合作单位奖项</p>
                            </li>
                            <li class="fl-l txt-c">
                            	<img src="${oss }/resources/activity/year2016/month05/jucheng/images/honor-img3.jpg" class="pt15" />
                                <p>3.15全国诚信企业重点单位</p>
                            </li>
                        </ul>
                    </div>
                    
            	</div>
            </div>
            
            <div class="part_4">
            
            	<div class="inner">
                	<div class="title txt-c"><img src="${oss }/resources/activity/year2016/month05/jucheng/images/title-img6.png" /></div>
                
                    <ul class="content">
                        <li>1.活动时间：2016年5月10日-6月9日</li>
                        <li>2.活动仅限由本页面新注册的用户参与；</li>
                        <li>3.活动仅限投资优先、夹层产品，劣后不参与；</li>
                        <li>4.投资25天及以上期限标的即可参与活动；</li>
                        <li>5.活动期间，每位用户仅限获取一份奖励，不作叠加；</li>
                        <li>6.该活动不与前海红筹平台的首投返现活动同时享有奖励；</li>
                        <li>7.活动最终解释权归前海红筹所有，如有疑问，<br>&nbsp;&nbsp;&nbsp;请咨询前海红筹客服热线：<img src="${oss }/resources/activity/year2016/month05/jucheng/images/phone-ico.png" /><font color="#ce322e">400-822-3499</font>。</li>
                    </ul>
                    <c:if test="${empty session_user}">
	                    <div class="txt-c pt50 mt40">
	                    	<a href="#login">立即注册</a>
	                    </div>
                    </c:if>
                </div>
            
            </div>
        </main>
        <!--Main end-->
        <!-- 前海红筹网站服务协议模态框 -->
		<div style="display:none;">
        	<div class="popup-record" id="protocol-record">
            	<section>
                	<header class="px18" style="color:#515151; padding:15px; border-bottom:1px solid #e5e5e5">前海红筹网站服务协议</header>
                    <article id="showXy"></article>
                </section>
            </div>
        </div>
  	<div style="display: none;">
		<div class="popup-record" id="record">
			<div style="font-size: 18px; position: relative;background: url(${oss}/resources/assets/images/center/news/news-popupBg.png) 0 0 no-repeat;width: 498px;height:705px;">
				<div style="position: absolute;top:120px;left:50%;margin-left: -92px;">
				<img src="${oss }/resources/assets/images/center/news/news-registbg.png" /></div>
				<div style="position: absolute;top:394px;left:50%;margin-left: -182px;">
					<p style="text-align: center; line-height: 35px; color: #666666;font-size: 16px;"><span style="font-size: 24px; color: #444444;">恭喜您</span><br>
					成功完成注册，现在赶紧去领取您的百元红包大礼！<br>完成更多的新手任务，将有终极大奖等着你！</p>
				</div>
				<a style="position: absolute;top:540px;left:50%;margin-left: -130px;background-color: #f15252; color:#ffffff; text-decoration: none; padding: 10px 100px;border-radius:25px;" id="Lqload" target="_Blank" href="/neweractivity/totask.htm">去领取</a>
				<a style="position: absolute;top:600px;left:50%;margin-left: -130px;background-color: white; color:#f15252; text-decoration: none;border:1px solid #f15252; padding: 8px 88px;border-radius:25px;" id="KtLoad" target="_Blank" href="/member_index/member_center.htm?index=0_0_3&nav=5">开通宝付</a>
			</div>
		</div>
	</div>
    </div>
    <!--Container end-->
    <script src="../resources/public/js/jquery.appear.js"></script>
    <script src="${oss}/resources/assets/js/src/signup-modules.js"></script>
    <script type="text/javascript">
    
    $(function(){
    	
    	 $("#protocol").fancybox({
   	        padding : 0,
   	        margin:50,
   	        scrolling: 'yes',
   	        closeBtn: true,
   	        wrapCSS: 'fancybox-transparent',
   	        helpers: {
   	              overlay : {
   	                  closeClick : false
   	              }
   	          },
   	          tpl:{
   	              closeBtn : '<a title="关闭" class="fancybox-custom-close" href="javascript:;" style="right:30px;top:10px;background:url(${oss}/resources/public/js/fancybox/close-gray_24x24.png);width:24px;height:24px;"></a>'
   	          }
   	    	})
    });
    </script>
	<script>
    //设置动画参数
    function transferParam(){
        if(!$(".animated").size())return false;
        $(".animated").each(function(index, element) {
            var thisObj = $(this);
            if(typeof(thisObj.attr("data-delay")) != "undefined"){
                var delay = thisObj.attr("data-delay") + "ms";
                thisObj.css({'animation-delay':delay,'-webkit-animation-delay':delay,'-moz-animation-delay':delay});
            };
            if(typeof(thisObj.attr("data-duration")) != "undefined"){
                var duration = thisObj.attr("data-duration") + "ms";
                thisObj.css({'animation-duration':duration,'-webkit-animation-duration':duration,'-moz-animation-duration':duration});
            };
            if(typeof(thisObj.attr("data-easing")) != "undefined"){
                var easing = thisObj.attr("data-easing");
                thisObj.css({'animation-easing':easing,'-webkit-animation-delay':easing,'-moz-animation-delay':easing});
            };
        });
    };
    transferParam();
$(function(){
	$('.scene').appear();
	$('.scene').each(function(index, element) {
        if(index != 0){
			$(this).find(".animated").hide();
		}
    });
	$(document.body).on('appear', '.scene', function(e, $affected) {
		var _this=$(this);
		_this.find('.animated').show();
	});
	$(document.body).on('disappear', '.scene', function(e, $affected) {
		var _this=$(this);
		_this.find('.animated').hide();
	});
	
	function scroll(){
		 $(".list-parcel ul").animate({"margin-top":"-40px"},
		 function(){
		   	$(".list-parcel ul li:eq(0)").appendTo($(".list-parcel ul"))
		   	$(".list-parcel ul").css({"margin-top":0})
		 })
	 }
	 setInterval(scroll,1600)

});
	</script>
	<script src="${oss}/resources/activity/year2016/month05/jucheng/js/registerPolyOrange.js?v=1.0.5"></script>		<!-- 验证提交 -->
	<div style="display:none">
	<script src="https://s4.cnzz.com/z_stat.php?id=1254954304&web_id=1254954304" language="JavaScript"></script>
	</div>
</body>
</html>