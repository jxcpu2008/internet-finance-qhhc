<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
<head>
<jsp:include page="/WEB-INF/views/hc9/common/common_new.jsp" />
<link rel="stylesheet" href="${oss}/resources/public/css/animate.css" />
<link rel="stylesheet" href="${oss}/resources/public/js/layer/skin/layer.css" />
<script src="${oss}/resources/public/js/main.js"></script>
<script src="${oss}/resources/public/js/layer/layer.js"></script>
<!--[if lte IE 9]> 
<script src="${oss}/resources/public/js/html5.js"></script> 
<script src="${oss}/resources/public/js/selector.js"></script>
<![endif]-->
<style>
#seasonFive{
	background-color:#f4ebb4;
}
#seasonFive .inner{
	width:1200px;
}
@-webkit-keyframes wave {
  0% {
    -webkit-transform:translate(0,0);
  }
  25% {
   -webkit-transform:translate(0,10px);
  }
  50% {
    -webkit-transform:translate(0,0);
  }
  75% {
    -webkit-transform:translate(0,10px);
  }
  100% {
    -webkit-transform:translate(0,0);
  }
  }
}
@-moz-keyframes wave {
  0% {
    -moz-transform:translate(0,0);
  }
  25% {
    -moz-transform:translate(0,10px);
  }
  50% {
    -moz-transform:translate(0,0);
  }
  75% {
    -moz-transform:translate(0,10px);
  }
  100% {
    -moz-transform:translate(0,0);
  }
}
@keyframes wave {
  0% {
    transform:translate(0,0);
  }
  25% {
    transform:translate(0,10px);
  }
  50% {
    transform:translate(0,0);
  }
  75% {
    transform:translate(0,10px);
  }
  100% {
    transform:translate(0,0);
  }
}
.wave {
  -webkit-animation: wave 8s;
  -moz-animation: wave 8s;
  animation: wave 8s;
}
@-webkit-keyframes level {
  0% {
    -webkit-transform:translate(0,0);
  }
  25% {
   -webkit-transform:translate(10px,0);
  }
  50% {
    -webkit-transform:translate(0,0);
  }
  75% {
    -webkit-transform:translate(10px,0);
  }
  100% {
    -webkit-transform:translate(0,0);
  }
  }
}
@-moz-keyframes level {
  0% {
    -moz-transform:translate(0,0);
  }
  25% {
    -moz-transform:translate(10px,0);
  }
  50% {
    -moz-transform:translate(0,0);
  }
  75% {
    -moz-transform:translate(10px,0);
  }
  100% {
    -moz-transform:translate(0,0);
  }
}
@keyframes level {
  0% {
    transform:translate(0,0);
  }
  25% {
    transform:translate(10px,0);
  }
  50% {
    transform:translate(0,0);
  }
  75% {
    transform:translate(10px,0);
  }
  100% {
    transform:translate(0,0);
  }
}
.level {
  -webkit-animation: level 4s;
  -moz-animation: level 4s;
  animation: level 4s;
}
#seasonFive .balloon{
	background-image:url(${oss }/resources/activity/year2016/month05/feedback/images/balloon-ico.png);
	background-repeat:no-repeat;
}
#seasonFive .cloud{
	background:url(${oss }/resources/activity/year2016/month05/feedback/images/cloud.png) 0 0 no-repeat;
}
#seasonFive .cloud2{
	background:url(${oss }/resources/activity/year2016/month05/feedback/images/cloud-2.png) 0 0 no-repeat;
}
#seasonFive .cloud3{
	background:url(${oss }/resources/activity/year2016/month05/feedback/images/cloud-3.png) 0 0 no-repeat;
}
#seasonFive .cloud4{
	background:url(${oss }/resources/activity/year2016/month05/feedback/images/cloud-4.png) 0 0 no-repeat;
}
#seasonFive .banner{
	background:url(${oss }/resources/activity/year2016/month05/feedback/images/banner-bg.jpg) top center no-repeat;
	height:688px;
	position:relative;
}
#seasonFive .tag{
	display:block;
	position:absolute;
	left:50%;
}
#seasonFive .banner .tag1{
	margin-left:-355px;
	top:208px;
}
#seasonFive .banner .tag2{
	margin-left:-474px;
	top:372px;
}
#seasonFive .banner .tag3{
	width:100px;
	height:62px;
	margin-left:-150px;
	top:64px;
}
#seasonFive .banner .tag4{
	width:83px;
	height:52px;
	margin-left:380px;
	top:260px;
}
#seasonFive .banner .tag5{
	background-position:0 0;
	width:83px;
	height:112px;
	margin-left:470px;
	top:160px;
}
#seasonFive .banner .tag6{
	background-position: 0 -112px;
	width:36px;
	height:48px;
	margin-left:-470px;
	top:275px;
}


#seasonFive .part_1{
	padding-top:34px;
}
#seasonFive header{
	position:relative;
	height:220px;
}
#seasonFive header .tag1{
	top:0;
	margin-left:-352px;
}
#seasonFive header .tag2{
	top:113px;
	margin-left:-222px;
}
#seasonFive header .tag3{
	top:113px;
	margin-left:60px;
}
#seasonFive footer{
	position:relative;
}
#seasonFive footer p{
	font-size:14px;
	color:#463234;
	line-height:24px;
	left:50%;
	margin-left:-536px;
}
#seasonFive footer p span{
	font-weight:bold;
}

#seasonFive .part_1 header .tag4{
	background-position:0 -209px;
	width:49px;
	height:66px;
	margin-left:-560px;
	top:-20px;
}
#seasonFive .part_1 header .tag5{
	background-position:0 -160px;
	width:37px;
	height:49px;
	margin-left:385px;
	top:140px;
}
#seasonFive .part_1 footer{
	background:url(${oss }/resources/activity/year2016/month05/feedback/images/part_1-rule.jpg) center center no-repeat;
	height:247px;
}
#seasonFive .part_1 footer p{
	top:42px;
}
#seasonFive .part_2 footer{
	background:url(${oss }/resources/activity/year2016/month05/feedback/images/part_2-rule.jpg) top center no-repeat;
	height:256px;
}
#seasonFive .part_2 footer p{
	top:28px;
}
#seasonFive .part_3 footer{
	background:url(${oss }/resources/activity/year2016/month05/feedback/images/part_3-rule.png) center center no-repeat;
	height:349px;
}
#seasonFive .part_3 footer p{
	top:104px;
}
#seasonFive .part_2{
	background-color:#fdf8d8;
}
#seasonFive .part_2 header .tag2{
	top:110px;
	margin-left:-170px;
}
#seasonFive .part_2 header .tag3{
	width:85px;
	height:115px;
	background-position:0 -160px;
	margin-left:-550px;	
	top:-40px;
}
#seasonFive .part_2 header .tag4{
	width:83px;
	height:53px;
	margin-left:310px;
	top:20px;
}
#seasonFive .part_2 header .tag5{
	width:83px;
	height:53px;
	margin-left:440px;
	top:150px;
}
#seasonFive .part_2 header .tag6{
	width:49px;
	height:66px;
	background-position:0 -275px;
	margin-left:500px;	
	top:110px;
}
#seasonFive .part_2 article .ranklist{
	background:url(${oss }/resources/activity/year2016/month05/feedback/images/ranklist-bg1.jpg) center center no-repeat;
	height:485px;
	position:relative;
}
#seasonFive .part_2 article .ranklist dl,
#seasonFive .part_2 article .ranklist span{
	color:#463234;
	font-size:16px;
	line-height:24px;
}
#seasonFive .part_2 article .ranklist .tag5{
	margin-left:-470px;
	top:132px;
}
#seasonFive .part_2 article .ranklist .tag6{
	margin-left:-184px;
	top:98px;
}
#seasonFive .part_2 article .ranklist .tag7{
	margin-left:110px;
	top:60px;
}
#seasonFive .part_2 article .ranklist .tag8{
	margin-left:400px;
	top:20px;
}
#seasonFive .part_2 article .ranklist .pxclr{
	font-size:14px;
	color:#7b565a;
	line-height:22px;
}
#seasonFive .part_2 article .ranklist .tag9{
	margin-left:-510px;
	top:422px;
}
#seasonFive .part_2 article .ranklist .tag10{
	margin-left:-422px;
	top:422px;
}
#seasonFive .part_2 article .ranklist .tag11{
	margin-left:-222px;
	top:400px;
}
#seasonFive .part_2 article .ranklist .tag12{
	margin-left:72px;
	top:378px;
}
#seasonFive .part_2 article .ranklist span:nth-child(9){
	margin-left:364px;
	top:356px;
}
#seasonFive .part_2 article .ranklist .tag1{
	margin-left:-475px;
	top:120px;
}
#seasonFive .part_2 article .ranklist .tag2{
	margin-left:-195px;
	top:88px;
}
#seasonFive .part_2 article .ranklist .tag3{
	margin-left:100px;
	top:48px;
}
#seasonFive .part_2 article .ranklist .tag4{
	margin-left:390px;
	top:8px;
}
#seasonFive .part_2 article .list .title{
	font-size:30px;
	color:#463234;
}
#seasonFive .part_2 article .list .list-btn a{
	background-color:#fdf8d8;
	border:1px solid #fa555c;
	width:148px;
	border-left:none;
	color:#fa555c;
	font-size:18px;
	line-height:24px;
	padding:10px 0;
}
#seasonFive .part_2 article .list .list-btn a.active{
	background-color:#fa555c;
	color:white;
}
#seasonFive .part_2 article .list .list-btn a:nth-child(1){
	border-left:1px solid #fa555c;
	padding-left:7px;
}
#seasonFive .part_2 article table{
	border:1px solid #fa555c;
}
#seasonFive .part_2 article table td{
	color:#fa555c;
	font-size:18px;
	padding:12px 0;
	border:1px solid #feddde;
}
#seasonFive .part_2 article table td:nth-child(1),
#seasonFive .part_2 article table td:nth-child(2),
#seasonFive .part_2 article table td:nth-child(3){
	padding:10px 0;
}
#seasonFive .part_2 article table th{
	color:#fdf8d8;
	font-size:18px;
	padding:16px 0;
	font-weight:normal;
}
#seasonFive .part_2 article table td.greenBg{
	color:#463234;
	background-color:#f4ebb4;
	border:1px solid #fa555c;
	border-bottom:none;
	border-left:none;
	border-right:none;
}
#seasonFive .part_2 article table td.greenBg a{
	background:url(${oss }/resources/activity/year2016/month05/feedback/images/btn-red2.png) 0 0 no-repeat;
	height:35px;
	width:172px;
	color:#fdf8d8;
	line-height:35px;
}


#seasonFive .part_3 header .tag2{
	top:110px;
	margin-left:-220px;
}
#seasonFive .part_3 header .tag3{
	width:49px;
	height:31px;
	margin-left:-390px;
	top:75px;
}
#seasonFive .part_3 header .tag4{
	width:130px;
	height:177px;
	background-position: 0 -341px;
	margin-left:370px;
	top:-5px;
}
#seasonFive .part_3 article .ranklist{
	background:url(${oss }/resources/activity/year2016/month05/feedback/images/ranklist-bg2.jpg) center center no-repeat;
	height:566px;
	position:relative;
}
#seasonFive .part_3 article .ranklist dl:nth-child(odd){
	font-size:14px;
	color:#968479;
}
#seasonFive .part_3 article .ranklist dl:nth-child(even){
	font-size:14px;
	color:#463234;
}
#seasonFive .part_3 article .ranklist dl:nth-child(3){
	margin-left:-454px;
	top:400px;
}
#seasonFive .part_3 article .ranklist dl:nth-child(4){
	margin-left:-330px;
	top:400px;
}
#seasonFive .part_3 article .ranklist dl:nth-child(1){
	margin-left:-100px;
	top:336px;
}
#seasonFive .part_3 article .ranklist dl:nth-child(2){
	margin-left:25px;
	top:336px;
}
#seasonFive .part_3 article .ranklist dl:nth-child(5){
	margin-left:285px;
	top:428px;
}
#seasonFive .part_3 article .ranklist dl:nth-child(6){
	margin-left:410px;
	top:428px;
}
#seasonFive .part_3 article .ranklist .tag-dl1{
	margin-left: -390px;
	top:415px;
	font-size:18px;
	color:#463234;
}
#seasonFive .part_3 article .ranklist .tag-dl2{
	margin-left: -40px;
	top:355px;
	font-size:18px;
	color:#463234;
}
#seasonFive .part_3 article .ranklist .tag-dl3{
	margin-left: 345px;
	top:448px;
	font-size:18px;
	color:#463234;
}
#seasonFive .part_3 article .ranklist .tag1{
	width:129px;
	height:81px;
	margin-left:190px;
	top:-25px;
}
#seasonFive .part_3 article .ranklist .tag2{
	width:84px;
	height:52px;
	margin-left:-590px;
	top:150px;
}
#seasonFive .part_3 article .ranklist .tag3{
	width:37px;
	height:49px;
	background-position:-49px -275px;
	margin-left:-500px;
	top:0;
}
#seasonFive .part_3 article .ranklist .tag4{
	margin-left:-106px;
	top:435px;
}
#seasonFive .part_3 article .ranklist .tag5{
	background:url(${oss }/resources/activity/year2016/month05/feedback/images/btn-red2.png) 0 0 no-repeat;
	width:171px;
	height:35px;
	margin-left:-70px;
	top:465px;
	line-height:35px;
}
#seasonFive .part_3 article .now{
	font-size:16px;
	color:#463234;
}
#seasonFive .part_3 article .now1{
	margin-left:-365px;
	top:354px;
}
#seasonFive .part_3 article .now2{
	margin-left:-8px;
	top:285px;
}
#seasonFive .part_3 article .now3{
	margin-left:368px;
	top:385px;
}
#seasonFive .part_3 footer{
	margin-top:-35px;
}
#seasonFive .part_3 footer span{
	margin-left:-650px;
	top:10px;
}

#seasonFive .part_1 article ul{
	margin-left:-32px;
}
#seasonFive .part_1 article ul li{
	background-repeat:no-repeat;
	width:368px;
	height:280px;
	margin-left:32px;
	position:relative;
}
#seasonFive .part_1 article ul li:nth-child(1){
	background-image:url(${oss }/resources/activity/year2016/month05/feedback/images/part_1-img1.jpg);
}
#seasonFive .part_1 article ul li:nth-child(2){
	background-image:url(${oss }/resources/activity/year2016/month05/feedback/images/part_1-img2.jpg);
}
#seasonFive .part_1 article ul li:nth-child(3){
	background-image:url(${oss }/resources/activity/year2016/month05/feedback/images/part_1-img.jpg);
}
#seasonFive .part_1 article ul li span{
	top:66px;
	margin-left:-16px;
}
#seasonFive .part_1 article ul li a{
	top:218px;
	margin-left:-66px;
}

#seasonFive .bottom{
	background:url(${oss }/resources/activity/year2016/month05/feedback/images/bottom-bg.jpg) center center no-repeat;
	height:70px;
}
#seasonFive .bottom2{
	background:url(${oss }/resources/activity/year2016/month05/feedback/images/bottom-bg2.jpg) center center no-repeat;
	height:82px;
}
#seasonFive .bottom3{
	background:url(${oss }/resources/activity/year2016/month05/feedback/images/bottom-bg3.png) center center no-repeat;
	height:280px;
	margin-top:-120px;
}
#seasonFive .bottom3 .btn{
	padding-top:135px;
}
#seasonFive .bottom3 .btn a{
	display:block;
	background:url(${oss }/resources/activity/year2016/month05/feedback/images/footer-btn.png) center center no-repeat;
	width:219px;
	height:50px;
	line-height:50px;
	text-align:center;
	font-weight:bold;
	color:#463234;
}
#seasonFive .floatbox{
	position:fixed;
	z-index:99;
	left:82%;
	top:50%;
	background:url(/resources/public/images/activity/planner/fixed-bg.png) 0 0 no-repeat;
	width:272px;
	height:177px;
}
#seasonFive .floatbox a{
	display:block;
	width:120px;
	height:90px;
	position:absolute;
	right:26%;
	top:64px;
}
</style>
</head>
<body>
	<!--Container begin-->
	<div id="container">
		<jsp:include page="/WEB-INF/views/hc9/header_new.jsp" />
		
		<!--Main begin-->
        <main id="seasonFive" role="main">
        
        	<div class="banner">
            	<span class="tag tag1 animated fadeInDown"><img src="${oss }/resources/activity/year2016/month05/feedback/images/banner-title.png" /></span>
                <span class="tag tag2 animated fadeInLeft"><img src="${oss }/resources/activity/year2016/month05/feedback/images/banner-human.png" /></span>
                <span class="tag tag3 cloud animated level infinite"></span>
                <span class="tag tag4 cloud2 animated level infinite"></span>
                <span class="tag tag5 balloon animated wave infinite"></span>
                <span class="tag tag6 balloon animated wave infinite"></span>
            </div>
        
        	<section class="part_1">
            	<header>
                	<img src="${oss }/resources/activity/year2016/month05/feedback/images/part_1-title.jpg" class="tag tag1" />
                    <span class="px16 tag tag2"><font color="#463234">首投满足条件即可获得相应现金奖励</font></span>
                    <span class="px16 tag tag3"><font color="#fa555c">首投用户专享，仅此一次</font></span>
                    <span class="tag tag4"><img src="${oss }/resources/activity/year2016/month05/feedback/images/starfish-ico1.jpg" /></span>
                    <span class="tag tag5"><img src="${oss }/resources/activity/year2016/month05/feedback/images/starfish-ico2.jpg" /></span>
                </header>
                
                <article class="inner pb50 pt20">
                	<ul class="clearfix">
                		<c:choose>
                			<c:when test="${empty session_user }">
                				<li class="fl-l">
		                        	<span class="tag"><img src="${oss }/resources/activity/year2016/month05/feedback/images/part_1-ico1.png" /></span>
		                            <a href="${https }/visitor/to-login?skip=activity201605/tofeedback.htm" class="tag"><img src="${oss }/resources/activity/year2016/month05/feedback/images/btn-red.png" /></a>
		                        </li>
		                    	<li class="fl-l">
		                        	<span class="tag"><img src="${oss }/resources/activity/year2016/month05/feedback/images/part_1-ico2.png" /></span>
		                            <a href="${https }/visitor/to-login?skip=activity201605/tofeedback.htm" class="tag"><img src="${oss }/resources/activity/year2016/month05/feedback/images/btn-red.png" /></a>
		                        </li>
		                    	<li class="fl-l">
		                        	<span class="tag"><img src="${oss }/resources/activity/year2016/month05/feedback/images/part_1-ico3.png" /></span>
		                            <a href="${https }/visitor/to-login?skip=activity201605/tofeedback.htm" class="tag"><img src="${oss }/resources/activity/year2016/month05/feedback/images/btn-red.png" /></a>
		                        </li>
                			</c:when>
                			<c:when test="${chanceFlag eq 0 }">
                				<li class="fl-l">
		                        	<span class="tag"><img src="${oss }/resources/activity/year2016/month05/feedback/images/part_1-ico1.png" /></span>
		                            <a href="/loaninfo/loanList.htm?nav=2" class="tag"><img src="${oss }/resources/activity/year2016/month05/feedback/images/btn-red.png" /></a>
		                        </li>
		                    	<li class="fl-l">
		                        	<span class="tag"><img src="${oss }/resources/activity/year2016/month05/feedback/images/part_1-ico2.png" /></span>
		                            <a href="/loaninfo/loanList.htm?nav=2" class="tag"><img src="${oss }/resources/activity/year2016/month05/feedback/images/btn-red.png" /></a>
		                        </li>
		                    	<li class="fl-l">
		                        	<span class="tag"><img src="${oss }/resources/activity/year2016/month05/feedback/images/part_1-ico3.png" /></span>
		                            <a href="/loaninfo/loanList.htm?nav=2" class="tag"><img src="${oss }/resources/activity/year2016/month05/feedback/images/btn-red.png" /></a>
		                        </li>
                			</c:when>
                			<c:otherwise>
                				<li class="fl-l">
		                        	<span class="tag"><img src="${oss }/resources/activity/year2016/month05/feedback/images/part_1-ico1.png" /></span>
		                            <a class="tag"><img src="${oss }/resources/activity/year2016/month05/feedback/images/btn-grey.png" /></a>
		                        </li>
		                    	<li class="fl-l">
		                        	<span class="tag"><img src="${oss }/resources/activity/year2016/month05/feedback/images/part_1-ico2.png" /></span>
		                            <a class="tag"><img src="${oss }/resources/activity/year2016/month05/feedback/images/btn-grey.png" /></a>
		                        </li>
		                    	<li class="fl-l">
		                        	<span class="tag"><img src="${oss }/resources/activity/year2016/month05/feedback/images/part_1-ico3.png" /></span>
		                            <a class="tag"><img src="${oss }/resources/activity/year2016/month05/feedback/images/btn-grey.png" /></a>
		                        </li>
                			</c:otherwise>
                		</c:choose>
                    </ul>
                </article>
                
                <footer>
                	<p class="tag"><span>温馨提示：</span><br>
                        1.活动期间，平台新注册用户及注册未投资的用户皆可参与此活动；<br>
                        2.平台首投时可用红包，奖励的现金按照首笔投资金额为准；<br>
                        3.活动期间，每个首投客户仅可享受一次奖励，奖励投资成功后将在3个工作日内进行发放，奖励可进行投资或进行提现；<br>
                        4.用户投资优先、夹层即可参与活动，投资劣后不参与；<br>
                        5. 活动最终解释权归前海红筹所有。</p>
                </footer>
            </section>
            
            <div class="bottom"></div>
            
            <section class="part_2 pt40">
            	<header>
                	<img src="${oss }/resources/activity/year2016/month05/feedback/images/part_2-title.jpg" class="tag tag1" />
                    <span class="px16 tag tag2"><font color="#463234">每周累计投资年化金额最高的前十名新老客户将获得奖励</font></span>
                    <span class="tag tag3 balloon animated wave infinite"></span>
                	<span class="tag tag4 cloud2 animated level infinite"></span>
                	<span class="tag tag5 cloud2 animated level infinite"></span>
                    <span class="tag tag6 balloon animated wave infinite"></span>
                </header>
                
                <article>
                	<div class="ranklist mb50">
                		<c:choose>
                			<c:when test="${!empty onePhone && weekNum ge 2 }">	<!--出结果状态-->
                				<dl class="tag tag4">
		                        	<dt class="txt-c">走向人生巅峰者</dt>
		                            <dd class="txt-c">${fn:replace(onePhone,fn:substring(onePhone,3,fn:length(onePhone)-4),"****") }</dd>
		                        </dl>
                			</c:when>
                			<c:otherwise>							<!--未出结果状态-->
	                       		<span class="tag tag8">走向人生巅峰</span>
                			</c:otherwise>
                		</c:choose>
                		<c:choose>
                			<c:when test="${!empty twoPhone && weekNum ge 2 }">
                				<dl class="tag tag3">
		                        	<dt class="txt-c">迎娶白富美者</dt>
		                            <dd class="txt-c">${fn:replace(twoPhone,fn:substring(twoPhone,3,fn:length(twoPhone)-4),"****") }</dd>
		                        </dl>
                			</c:when>
                			<c:otherwise>
                				<span class="tag tag7">迎娶白富美</span>
                			</c:otherwise>
                		</c:choose>
                		<c:choose>
                			<c:when test="${!empty threePhone && weekNum ge 2 }">
                				<dl class="tag tag2">
		                        	<dt class="txt-c">出任CEO者</dt>
		                            <dd class="txt-c">${fn:replace(threePhone,fn:substring(threePhone,3,fn:length(threePhone)-4),"****") }</dd>
		                        </dl>
                			</c:when>
                			<c:otherwise>
	                        	<span class="tag tag6">出任CEO</span>
                			</c:otherwise>
                		</c:choose>
                		<c:choose>
                			<c:when test="${!empty fourPhone && weekNum ge 2 }">
                				<dl class="tag tag1">
		                        	<dt class="txt-c">担任总经理者</dt>
		                            <dd class="txt-c">${fn:replace(fourPhone,fn:substring(fourPhone,3,fn:length(fourPhone)-4),"****") }</dd>
		                        </dl>
                			</c:when>
                			<c:otherwise>
                				<span class="tag tag5">担任总经理</span>
                			</c:otherwise>
                		</c:choose>
                        <span class="tag pxclr tag9">100元红包</span>
                        <span class="tag pxclr tag10">0.3%加息券</span>
                        <span class="tag pxclr txt-c tag11">返当周累计投资年化金额<br><font color="#de4646" class="px20">*1%</font></span>
                        <span class="tag pxclr txt-c tag12">返当周累计投资年化金额<br><font color="#de4646" class="px20">*1.5%</font></span>
                        <span class="tag pxclr txt-c tag13">返当周累计投资年化金额<br><font color="#de4646" class="px20">*2%</font></span>
                    </div>
                    <div class="list inner pb50">
                    	<div class="txt-c title pb50">前十名投资排行榜（实时更新中）</div>
                    	<div class="list-btn clearfix">
                        	<a href="javascript:;" class="txt-c fl-l" data-week="1">第一周<br><em class="px14">(5.3-5.9)</em></a>
                        	<a href="javascript:;" class="txt-c fl-l" data-week="2">第二周<br><em class="px14">(5.10-5.16)</em></a>
                        	<a href="javascript:;" class="txt-c fl-l" data-week="3">第三周<br><em class="px14">(5.17-5.23)</em></a>
                        	<a href="javascript:;" class="txt-c fl-l" data-week="4">第四周<br><em class="px14">(5.24-5.30)</em></a>
                        	<a href="javascript:;" class="txt-c fl-l" data-week="5">第五周<br><em class="px14">(5.31-6.6)</em></a>
                        	<a href="javascript:;" class="txt-c fl-l" data-week="6">第六周<br><em class="px14">(6.7-6.13)</em></a>
                        	<a href="javascript:;" class="txt-c fl-l" data-week="7">第七周<br><em class="px14">(6.14-6.20)</em></a>
                        	<a href="javascript:;" class="txt-c fl-l" data-week="8">第八周<br><em class="px14">(6.21-6.27)</em></a>
                        </div>
                        <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="txt-c">
                            <col width="20%"/>
                            <col width="20%"/> 
                            <col width="20%"/>
                            <col width="20%"/> 
                            <col width="20%"/>
                            <tr>
                                <th bgcolor="#fa555c">排名</th>
                                <th bgcolor="#fa555c">手机号</th>
                                <th bgcolor="#fa555c">周投资累计金额</th>
                                <th bgcolor="#fa555c">周累计年化金额</th>
                                <th bgcolor="#fa555c">待收奖励</th>
                            </tr>
                            <tbody id="week_list">
	                            <c:choose>
	                            	<c:when test="${weekRankList.size() le 0 }">
	                            		<tr><td bgcolor="#ffffff" colspan="5" style="padding: 50px;">暂无用户入榜</td></tr>
	                            	</c:when>
	                            	<c:otherwise>
	                            		<c:forEach var="weeks" items="${weekRankList }" varStatus="i">
			                            	<tr>
				                                <td bgcolor="#ffffff"><c:choose><c:when test="${i.count ge 1 && i.count le 3 }"><img src="${oss }/resources/activity/year2016/month05/feedback/images/medal-ico${i.count }.png" /></c:when><c:otherwise>${i.count }</c:otherwise></c:choose></td>
				                                <td bgcolor="#ffffff">${fn:replace(weeks.phone,fn:substring(weeks.phone,3,fn:length(weeks.phone)-4),"****") }</td>
				                                <td bgcolor="#ffffff"><fmt:formatNumber type="number" value="${weeks.weekMoney}" pattern="#0.00#" /></td>
				                                <td bgcolor="#ffffff"><fmt:formatNumber type="number" value="${weeks.weekYearMoney}" pattern="#0.00#" /></td>
				                                <td bgcolor="#ffffff">${weeks.toInCome}</td>
				                            </tr>
			                            </c:forEach>
	                            	</c:otherwise>
	                            </c:choose>
	                            <c:if test="${weekNum ne 9 }">
		                            <c:choose>
		                            	<c:when test="${!empty session_user }">
		                            		<tr class="member_line">
				                            	<td colspan="5" class="greenBg clearfix">
				                            		<em class="fl-l pl40 pr50">我的周累计投资金额：<span class="weekMoney"><fmt:formatNumber type="number" value="${weekMoney}" pattern="#0.00#" /></span>元</em>
				                            		<em class="fl-l pr50">周年化金额：<span class="yearMoney"><fmt:formatNumber type="number" value="${weekYearMoney}" pattern="#0.00#" /></span>元</em>
				                            		<c:if test="${differMoney ne 0 }"><em class="fl-l pr50">距第1名周年化金额差<span class="differMoney"><fmt:formatNumber type="number" value="${differMoney}" pattern="#0.00#" /></span>元</em></c:if>
				                            		<a href="/loaninfo/loanList.htm?nav=2" class="fl-r mr40 px16">去投资超越他/她</a>
				                            	</td>
				                            </tr>
		                            	</c:when>
		                            	<c:otherwise>
			                            	<tr class="member_line">
				                            	<td colspan="5" class="greenBg">
				                            		<a href="${https }/visitor/to-login?skip=activity201605/tofeedback.htm" class="px16 fl-c" style="margin: 0 514px;">查看我的年化金额</a>
				                            	</td>
				                            </tr>
		                            	</c:otherwise>
		                            </c:choose>
		                        </c:if>
                            </tbody>
                        </table>
                    </div>
                </article>
                <footer>
                	<p class="tag"><span>温馨提示：</span><br>
                        1.活动按照周累计投资年化金额来进行排名，前十名可获得相应奖励，<font color="#f12010">年化金额计算方式为：月标：投资金额/12*投资月份数；天标：投资金额/360*投资天数；</font><br>
                        2.每周二到次周一为一个结算周期，每周二公布上周获奖名单，周榜奖励在3-5个工作日发放；<br>
                        3.100元红包分成：2个5元，1个30元，1个60元，0.3%加息券需投资3000元以上方可使用；<br>
                        4.用户投资优先、夹层即可参与活动，投资劣后不参与；<br>
                        5.活动最终解释权归前海红筹所有。</p>
                </footer>
            </section>
            
            <div class="bottom2"></div>
            
            <section class="part_3">
            	<header class="mt30">
                	<img src="${oss }/resources/activity/year2016/month05/feedback/images/part_3-title.jpg" class="tag tag1" />
                    <span class="px16 tag tag2"><font color="#463234">在活动期间内累计投资年化金额最高的三位客户将获得终极大奖</font></span>
                    <span class="tag tag3 cloud3 animated level infinite"></span>
                	<span class="tag tag4 balloon animated wave infinite"></span>
                </header>
                
                <article>
                	<div class="ranklist">
                		<c:set var="mrList" value="${monthRankList }" />
                		<c:forEach var="ranking" items="${mrList}" varStatus="i">
               				<dl class="tag">
	                        	<dt>手机号</dt>	
	                            <dd>累计投资额</dd>
	                            <dd>累计年化投资额</dd>
	                        </dl>
	                    	<dl class="tag">
	                        	<dt>${fn:replace(ranking.phone,fn:substring(ranking.phone,3,fn:length(ranking.phone)-4),"****") }</dt>
	                            <dd><fmt:formatNumber type="number" value="${ranking.weekMoney}" pattern="#0.00#" />元</dd>
	                            <dd><fmt:formatNumber type="number" value="${ranking.weekYearMoney}" pattern="#0.00#" />元</dd>
	                        </dl>
                		</c:forEach>
                		<c:if test="${mrList.size() lt 1 || empty mrList }">
                			<span class="tag tag-dl2">暂无用户入榜</span>
                		</c:if>
                		<c:if test="${mrList.size() lt 2 }">
                			<span class="tag tag-dl1">暂无用户入榜</span>
                		</c:if> 
                		<c:if test="${mrList.size() lt 3 }">
                			<span class="tag tag-dl3">暂无用户入榜</span>
                		</c:if> 
                        <span class="tag tag1 cloud4 animated level infinite"></span>
                        <span class="tag tag2 cloud2 animated level infinite"></span>
                        <span class="tag tag3 balloon animated wave infinite"></span>
                        <c:if test="${!empty session_user && monthDifferMoney ne 0 }">
	                        <span class="tag tag4"><font color="#463234">距第1名累计投资年化金额差<fmt:formatNumber type="number" value="${monthDifferMoney }" pattern="#0.00#" />元</font></span>
                        </c:if>
                        <c:choose>
	                        <c:when test="${parentActivityFlag eq 0 }">
		                        <a href="/loaninfo/loanList.htm?nav=2" class="tag tag5 txt-c"><font color="#fdf8d8">去投资<c:if test="${mrList.size() gt 0 }">超越他/她</c:if></font></a>
		                        <span class="tag now now1">目前得主</span>
		                        <span class="tag now now2">目前得主</span>
		                        <span class="tag now now3">目前得主</span>
	                        </c:when>
	                        <c:otherwise>
	                        	<span class="tag now now1">最终得主</span>
		                        <span class="tag now now2">最终得主</span>
		                        <span class="tag now now3">最终得主</span>
	                        </c:otherwise>
                        </c:choose>
                    </div>
                </article>
                
                <footer>
                	<p class="tag"><span>温馨提示：</span><br>
                        1. 双亲感恩大回馈中的旅游将在活动结束后的10个工作日由客服人员联系并发放奖励；<br>
                        2. 旅游奖品一切以旅行社所提供的服务内容为准，本公司概不负责；<br>
                        3. 用户投资优先、夹层即可参与活动，投资劣后不参与； <br>
                        4.活动最终解释权归前海红筹所有。</p>
                    <span class="tag"><img src="${oss }/resources/activity/year2016/month05/feedback/images/umbrella-ico.png" /></span>
                </footer>
            </section>
       		<div class="bottom3">
	        	<c:if test="${empty session_user }">
		            	<div class="btn">
		            		<a href="${https }/visitor/to-regist" class="px20 inner">立即注册</a>
		                </div>
	        	</c:if>
            </div>
	        <c:if test="${empty session_user }">
			    <div class="floatbox">
			    	<a href="${https }/visitor/to-regist"></a>
			    </div>
		    </c:if>
        </main>
        <!--Main end-->
		
		<jsp:include page="/WEB-INF/views/hc9/footer_new.jsp" />
	</div>
	<!--Container end-->
	<script type="text/javascript">
	var _member = $("#week_list .member_line").html();
	function createList(weekList) {
		var html = '',top_three = '',phone = '',week_money = '',year_money = '',income = '';
		for (var i = 0;i < weekList.length;i++) {
			if (i >= 0 && i <= 2) {
				top_three = '<img src="${oss }/resources/activity/year2016/month05/feedback/images/medal-ico'+(i + 1)+'.png" />';
			} else {
				top_three = i + 1;
			}
			phone = weekList[i].phone;
			week_money = weekList[i].weekMoney;
			year_money = weekList[i].weekYearMoney;
			income = weekList[i].toInCome;
			html += '<tr><td bgcolor="#ffffff">'+top_three+'</td>'+
					'<td bgcolor="#ffffff">'+(phone.replace(phone.substring(3,phone.length-4),"****"))+'</td>'+
                	'<td bgcolor="#ffffff">'+(week_money.toFixed(2))+'</td>'+
                	'<td bgcolor="#ffffff">'+(year_money.toFixed(2))+'</td>'+
                	'<td bgcolor="#ffffff">'+(income)+'</td></tr>';
		}
		if (_member != null && _member != '') {
			_member = '<tr>' + _member + '</tr>'; 
		} else {
			_member = '';
		}
		return html + _member;
	}
	function setUpValue(obj, wm, wy, dm) {
		obj.find('.greenBg .weekMoney').text(parseFloat(wm).toFixed(2));
		obj.find('.greenBg .yearMoney').text(parseFloat(wy).toFixed(2));
		obj.find('.greenBg .differMoney').text(parseFloat(dm).toFixed(2));
	}
    $(function(){
        $(".list .list-btn").on("click" , "a" , function() {
        	var _this = $(this);
        	var _week = _this.attr("data-week") || 1;
        	if (_week != '' && !isNaN(_week)) {
        		$.ajax({
        			type : 'post',
        			data : {
        				weekNum : _week
        			},
        			url : '/activity201605/getWeekRankList.htm',
        			success : function(json) {
        				json = JSON.parse(json);
        				var htmlObj = $("#week_list");
    					var weekList = json.weekRankList;
        				htmlObj.html('');
        				var html = '';
        				if (weekList != '' && weekList != 'undefined' && weekList != null) {
        					html = createList(weekList);
        					htmlObj.append(html);
        					var dfMoney = json.differMoney;
        					setUpValue(htmlObj,json.weekMoney,json.weekYearMoney,dfMoney);
        					if (dfMoney <= 0) {
        						htmlObj.find('.differMoney').parent().remove();
        					}
        				} else if (json.code == -2) { 
        					html = '<tr><td bgcolor="#ffffff" colspan="5" style="padding: 50px;">暂未到开始时间</td></tr><tr>' + _member + '</tr>';
	        				htmlObj.append(html);
	        				htmlObj.find('.greenBg a').text('去投资');
	        				htmlObj.find('.greenBg a').attr('href','/loaninfo/loanList.htm?nav=2');
	        				setUpValue(htmlObj,0,0,0);
        				} else {
        					html = '<tr><td bgcolor="#ffffff" colspan="5" style="padding: 50px;">暂无用户入榜</td></tr><tr>' + _member + '</tr>';
	        				htmlObj.append(html);
	        				htmlObj.find('.greenBg a').text('去投资');
	        				htmlObj.find('.greenBg a').attr('href','/loaninfo/loanList.htm?nav=2');
	        				setUpValue(htmlObj,0,0,0);
        				}
        				_this.addClass("active").siblings().removeClass("active");
        			}
        		});
        	}
        });
    	var index = "${weekNum}";
    	if (index == 9) {  // 9表示活动结束后
    		index = 8;
    	}
    	$(".list .list-btn").find('a').eq(index-1).trigger('click');
    });
    </script>
</body>
</html>