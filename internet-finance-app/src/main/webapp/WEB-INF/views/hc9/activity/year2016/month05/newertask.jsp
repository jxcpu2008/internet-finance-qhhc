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
@-webkit-keyframes wave1 {
  0% {
    -webkit-transform:translate(0,0);
  }
  25% {
   -webkit-transform:translate(0,180px);
  }
  50% {
    -webkit-transform:translate(0,0);
  }
  75% {
    -webkit-transform:translate(0,180px);
  }
  100% {
    -webkit-transform:translate(0,0);
  }
  }
}
@-moz-keyframes wave1 {
  0% {
    -moz-transform:translate(0,0);
  }
  25% {
    -moz-transform:translate(0,180px);
  }
  50% {
    -moz-transform:translate(0,0);
  }
  75% {
    -moz-transform:translate(0,180px);
  }
  100% {
    -moz-transform:translate(0,0);
  }
}
@keyframes wave1 {
  0% {
    transform:translate(0,0);
  }
  25% {
    transform:translate(0,180px);
  }
  50% {
    transform:translate(0,0);
  }
  75% {
    transform:translate(0,180px);
  }
  100% {
    transform:translate(0,0);
  }
}
.wave1 {
  -webkit-animation: wave1 16s;
  -moz-animation: wave1 16s;
  animation: wave1 16s;
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

#wealNew{
	background-color:#ebc04d;
}
#wealNew .tag{
	display:block;
	position:absolute;
	left:50%;
}
#wealNew .cloud{
	background-image:url(${oss }/resources/activity/year2016/month05/newertask/images/cloud.png);
	background-repeat:no-repeat;
}
#wealNew .part_1{
	background:url(${oss }/resources/activity/year2016/month05/newertask/images/bg_01.jpg) center top no-repeat;
	height:816px;
	position:relative;
	outline-width:0px;  
  	vertical-align:top;
}
#wealNew .part_1 .tag1{
	background:url(${oss }/resources/activity/year2016/month05/newertask/images/banner-img2.png) 0 0 no-repeat;
	width:1090px;
	height:547px;
	margin-left:-510px;
	top:-60px;
}
#wealNew .part_1 .tag2{
	background:url(${oss }/resources/activity/year2016/month05/newertask/images/banner-img3.png) 0 0 no-repeat;
	width:370px;
	height:362px;
	margin-left:-500px;
	top:104px;
}
#wealNew .part_1 .tag3{
	background:url(${oss }/resources/activity/year2016/month05/newertask/images/banner-img1.png) 0 0 no-repeat;
	width:550px;
	height:438px;
	margin-left:-212px;
	top:80px;
}
#wealNew .part_1 .tag4{
	background-position: 0 0;
	width:208px;
	height:79px;
	margin-left:395px;
	top:210px;
}
#wealNew .part_1 .tag5{
	background-position: 0 -130px;
	width:98px;
	height:38px;
	margin-left:315px;
	top:430px;
}
#wealNew .part_1 .tag6{
	background-position: 0 -80px;
	width:133px;
	height:50px;
	margin-left:-500px;
	top:35px;
}
#wealNew .part_1 .tag7{
	background-position: 0 -130px;
	width:98px;
	height:38px;
	margin-left:-540px;
	top:380px;
}
#wealNew .part_1 .tag8{
	background:url(${oss }/resources/activity/year2016/month05/newertask/images/title-bg-1.png) 0 0 no-repeat;
	width:682px;
	height:168px;
	margin-left:-330px;
	top:650px;
	font-size:18px;
	color:#463234;
	line-height:38px;
	text-align:center;
	padding-top:25px;
}





#wealNew .part_4 .title,
#wealNew .part_3 .title,
#wealNew .part_2 .title{
	background-image:url(${oss }/resources/activity/year2016/month05/newertask/images/titleBg.png);
	background-repeat:no-repeat;
}
#wealNew .part_4 .treasureBox,
#wealNew .part_3 .treasureBox,
#wealNew .part_2 .treasureBox{
	background:url(${oss }/resources/activity/year2016/month05/newertask/images/btn-bg.png) 0 0 no-repeat;
	width:178px;
	height:51px;
	font-size:18px;
	font-weight:bold;
	color:white;
	line-height:46px;
}
#wealNew .part_4 .disbled,
#wealNew .part_3 .disbled,
#wealNew .part_2 .disbled{
	background:url(${oss }/resources/activity/year2016/month05/newertask/images/btn-grey.png) 0 0 no-repeat;
}
#wealNew .part_2{
	background:url(${oss }/resources/activity/year2016/month05/newertask/images/bg_02.jpg) center top no-repeat;
	height:874px;
	position:relative;
}
#wealNew .part_2 .tag1{
	margin-left:-89px;
	top:360px;
}
#wealNew .part_2 .tag1 span{
	background-image:url(${oss }/resources/activity/year2016/month05/newertask/images/treasureBox-left.png);
	width:194px;
	height:183px;
	background-position:0 0;
	margin-left:-350px;
	top:-135px;
}
#wealNew .part_2 a.tag1.active span{
	background-position:0 -183px;
	margin-left:-384px;
}
#wealNew .part_2 .tag3{
	margin-left:-92px;
	top:682px;
}
#wealNew .part_2 .tag3 span{
	background-image:url(${oss }/resources/activity/year2016/month05/newertask/images/treasureBox-right.png);
	width:198px;
	height:194px;
	background-position:0 0;
	margin-left:164px;
	top:-150px;
}
#wealNew .part_2 a.tag3.active span{
	background-position:0 -194px;
	margin-left:150px;
}
#wealNew .part_2 .tag4,
#wealNew .part_2 .tag2{
	background:url(${oss }/resources/activity/year2016/month05/newertask/images/titleBg-1.png) no-repeat;
	width:277px;
	height:79px;
	background-position: 0 0;
	font-size:14px;
	color:#7e5110;
	line-height:30px;
	padding-top:25px;
}
#wealNew .part_2 .tag2{
	top:246px;
	margin-left:-140px;
}
#wealNew .part_2 .tag4{
	top:570px;
	margin-left:-150px;
}


#wealNew .part_3{
	background:url(${oss }/resources/activity/year2016/month05/newertask/images/bg_03.jpg) center top no-repeat;
	height:922px;
	position:relative;
}
#wealNew .part_3 .tag1{
	margin-left:40px;
	top:222px;
}
#wealNew .part_3 .tag1 span{
	background-image:url(${oss }/resources/activity/year2016/month05/newertask/images/treasureBox-left2.png);
	width:194px;
	height:194px;
	background-position:0 0;
	margin-left:-370px;
	top:-135px;
}
#wealNew .part_3 a.tag1.active span{
	background-position:0 -194px;
	margin-left:-384px;
}
#wealNew .part_3 .tag3{
	margin-left:-230px;
	top:665px;
}
#wealNew .part_3 .tag3 span{
	background-image:url(${oss }/resources/activity/year2016/month05/newertask/images/treasureBox-right2.png);
	width:198px;
	height:194px;
	background-position:0 0;
	margin-left:194px;
	top:-150px;
}
#wealNew .part_3 a.tag3.active span{
	background-position:0 -194px;
	margin-left:194px;
}
#wealNew .part_3 .tag4,
#wealNew .part_3 .tag2{
	font-size:14px;
	color:#7e5110;
	line-height:30px;
	padding-top:25px;
}
#wealNew .part_3 .tag2{
	background:url(${oss }/resources/activity/year2016/month05/newertask/images/titleBg-1.png) 0 0 no-repeat;
	top:110px;
	margin-left:-15px;
	width:277px;
	height:79px;
}
#wealNew .part_3 .tag4{
	background:url(${oss }/resources/activity/year2016/month05/newertask/images/titleBg-2.png) 0 0 no-repeat;
	top:550px;
	margin-left:-320px;
	width:342px;
	height:91px;
}





#wealNew .part_4{
	background:url(${oss }/resources/activity/year2016/month05/newertask/images/bg_04.jpg) center top no-repeat;
	height:843px;
	position:relative;
}
#wealNew .part_4 .tag1{
	margin-left:-60px;
	top:115px;
}
#wealNew .part_4 .tag1 span{
	background-image:url(${oss }/resources/activity/year2016/month05/newertask/images/treasureBox-left3.png);
	width:194px;
	height:194px;
	background-position:0 0;
	margin-left:-425px;
	top:-115px;
}
#wealNew .part_4 a.tag1.active span{
	background-position:0 -194px;
	top:-135px;
}
#wealNew .part_4 .tag4,
#wealNew .part_4 .tag2{
	font-size:14px;
	color:#7e5110;
	line-height:30px;
	padding-top:25px;
	background:url(${oss }/resources/activity/year2016/month05/newertask/images/titleBg-2.png) 0 0 no-repeat;
}
#wealNew .part_4 .tag2{
	top:0px;
	margin-left:-145px;
	width:342px;
	height:91px;
}
#wealNew .part_4 .tag4{
	top:350px;
	margin-left:-250px;
	width:342px;
	height:91px;
}
#wealNew .part_4 .tag3{
	background-image:url(${oss }/resources/activity/year2016/month05/newertask/images/treasureBox-right3.png);
	background-repeat:no-repeat;
	width:194px;
	height:194px;
	background-position: 0 0;
	top:340px;
	margin-left:120px;
}
#wealNew .part_4 .tag3.active{
	background-position: 0 -194px;
	width:198px;
	top:285px;
	margin-left:130px;
}
#wealNew .part_4 .tag5{
	background:url(${oss }/resources/activity/year2016/month05/newertask/images/qrcode.jpg) 0 0 no-repeat;
	height:153px;
	font-size:16px;
	color:#463234;
	line-height:38px;
	padding-left:170px;
	top:530px;
	margin-left:-270px;
}
#wealNew .part_4 .tag5 .scan{
	background:url(${oss }/resources/activity/year2016/month05/newertask/images/scan-bg.png) 0 0 no-repeat;
	width:450px;
	height:183px;
	top:-14px;
	margin-left:-228px;
	overflow:hidden;
}
#wealNew .part_4 .tag5 .scan img{
	margin-left:-228px;
}
#wealNew .part_5{
	background:url(${oss }/resources/activity/year2016/month05/newertask/images/bg_05.jpg) center top no-repeat;
	height:660px;
	position:relative;
}
#wealNew .part_5 .tag1{
	background:url(${oss }/resources/activity/year2016/month05/newertask/images/max-treasureBox.png) 0 0 no-repeat;
	width:404px;
	height:220px;
	margin-left:-160px;
	top:44px;
}
#wealNew .part_5 .active{
	background:url(${oss }/resources/activity/year2016/month05/newertask/images/max-treasureBox2.png) 0 0 no-repeat;
	height:254px;
	top:10px;
}
#wealNew .part_5 .tag2{
	background:url(${oss }/resources/activity/year2016/month05/newertask/images/btn-bg2.png) 0 0 no-repeat;
	width:322px;
	height:63px;
	margin-left:-140px;
	top:550px;
	font-size:22px;
	color:#463234;
	font-weight:bold;
	line-height:58px;
}
#wealNew .part_6{
	background:url(${oss }/resources/activity/year2016/month05/newertask/images/bg_06.jpg) center top no-repeat;
	height:732px;
	position:relative;
}
#wealNew .part_6 p{
	top:110px;
	font-size:14px;
	color:#ffffff;
	margin-left:-450px;
}
#wealNew .part_6 a{
	background:url(${oss }/resources/activity/year2016/month05/newertask/images/btn-bg3.png) 0 0 no-repeat;
	width:296px;
	height:85px;
	margin-left:-150px;
	top:540px;
	font-size:30px;
	color:white;
	font-weight:bold;
	line-height:75px;
}
.popup-record .popup-bg{
	background:url(${oss }/resources/activity/year2016/month05/newertask/images/popup-bg.png) 0 0 no-repeat;
	width:515px;
	height:445px;
	position:relative;
}
.popup-record .popup-bg.endImg{
	background:url(${oss }/resources/activity/year2016/month05/newertask/images/popup-bg2.png) 0 0 no-repeat;
}
.popup-record .popup-bg span{
	padding:0 48px;
	position:absolute;
	top:220px;
	left:50%;
	margin-left:-244px;
	font-size:18px;
	color:#575757;
	text-indent:20px;
}
.popup-record .popup-bg a{
	position:absolute;
	color:white;
	font-size:16px;
	background-color:#f65c5d;
	border-radius:25px;
	-moz-border-radius:25px;
	-ms-border-radius:25px;
	-o-border-radius:25px;
	padding:5px 54px;
	top:350px;
	left:50%;
	margin-left:-70px;
}
</style>
</head>
<body>
	<!--Container begin-->
	<div id="container">
		<jsp:include page="/WEB-INF/views/hc9/header_new.jsp" />
		
		<!--Main begin-->
        <main id="wealNew" role="main">
        
        	<div class="part_1">
            	<span class="tag tag1"></span>
            	<span class="tag tag2 animated fadeInRight"></span>
            	<span class="tag tag3 animated fadeInDown"></span>
            	<span class="tag tag4 cloud animated wave infinite"></span>
            	<span class="tag tag5 cloud animated level infinite"></span>
            	<span class="tag tag6 cloud animated level infinite"></span>
            	<span class="tag tag7 cloud animated wave infinite"></span>
            	<span class="tag tag8">
                	红筹新手收集关卡的6把钥匙后，即可获得终极大奖！<br>
                    <font color="#463234" style="font-size:32px; font-weight:bold;">已有<span class="totalNum">${collectAllNum }</span>位新手成功寻到所有钥匙</font><br>
                    您还在犹豫什么？赶快去收集吧！<br>
                </span>
            </div>
            
            <div class="part_2">
            	<c:choose>
	            	<c:when test="${taskOneStatus eq 3 }">
		            	<a href="javascript:;" class="tag tag1 txt-c treasureBox active disbled">已领取
		                	<span class="tag"></span>
		                </a>
	            	</c:when>
	            	<c:when test="${taskOneStatus eq 1 }">
		            	<a id="regist_receive" href="javascript:;" class="tag tag1 txt-c treasureBox">打开宝箱
		                	<span class="tag"></span>
		                </a>
	            	</c:when>
	            	<c:otherwise>
	            		<a id="regist_role" href="javascript:;" class="tag tag1 txt-c treasureBox">立即注册
		                	<span class="tag"></span>
		                </a>
	            	</c:otherwise>
            	</c:choose>
                <span class="tag tag2 txt-c">
                	<font color="#463234" class="px22">新手注册送100元红包</font><br>
                    已有<span class="registNum">${taskOneTotalNum }</span>人成功闯到此关
                </span>
                <c:choose>
	            	<c:when test="${taskTwoStatus eq 3 }">
		            	<a href="javascript:;" class="tag tag3 txt-c treasureBox active disbled">已领取
		                	<span class="tag"></span>
		                </a>
	            	</c:when>
	            	<c:when test="${taskTwoStatus eq 1 }">
		            	<a id="recharge_receive" href="javascript:;" class="tag tag3 txt-c treasureBox">打开宝箱
		                	<span class="tag"></span>
		                </a>
	            	</c:when>
	            	<c:otherwise>
	            		<a id="recharge_role" href="javascript:;" class="tag tag3 txt-c treasureBox">立即充值
		                	<span class="tag"></span>
		                </a>
	            	</c:otherwise>
            	</c:choose>
                <span class="tag tag4 txt-c">
                	<font color="#463234" class="px22">首次充值送5元红包</font><br>
                    已有<span class="rechargeNum">${taskTwoTotalNum }</span>人成功闯到此关
                </span>
            </div>
            
            <div class="part_3">
            	<c:choose>
	            	<c:when test="${taskThreeStatus eq 3 }">
		            	<a href="javascript:;" class="tag tag1 txt-c treasureBox active disbled">已领取
		                	<span class="tag"></span>
		                </a>
	            	</c:when>
	            	<c:when test="${taskThreeStatus eq 1 }">
		            	<a href="javascript:;" data-invest="1" class="tag tag1 txt-c treasureBox invest_receive">打开宝箱
		                	<span class="tag"></span>
		                </a>
	            	</c:when>
	            	<c:otherwise>
	            		<a href="javascript:;" class="tag tag1 txt-c treasureBox invest_role">立即认购
		                	<span class="tag"></span>
		                </a>
	            	</c:otherwise>
            	</c:choose>
                <span class="tag tag2 txt-c">
                	<font color="#463234" class="px22">单笔认购100送15元红包</font><br>
                    已有<span class="investNum1">${taskThreeTotalNum }</span>人成功闯到此关
                </span>
            	<c:choose>
	            	<c:when test="${taskFourStatus eq 3 }">
		            	<a href="javascript:;" class="tag tag3 txt-c treasureBox active disbled">已领取
		                	<span class="tag"></span>
		                </a>
	            	</c:when>
	            	<c:when test="${taskFourStatus eq 1 }">
		            	<a href="javascript:;" data-invest="2" class="tag tag3 txt-c treasureBox invest_receive">打开宝箱
		                	<span class="tag"></span>
		                </a>
	            	</c:when>
	            	<c:otherwise>
	            		<a href="javascript:;" class="tag tag3 txt-c treasureBox invest_role">立即认购
		                	<span class="tag"></span>
		                </a>
	            	</c:otherwise>
            	</c:choose>
                <span class="tag tag4 txt-c">
                	<font color="#463234" class="px22">单笔认购满1000送30元红包</font><br>
                    已有<span class="investNum2">${taskFourTotalNum }</span>人成功闯到此关
                </span>
            </div>
            
            <div class="part_4">
            	<c:choose>
	            	<c:when test="${taskFiveStatus eq 3 }">
		            	<a href="javascript:;" class="tag tag1 txt-c treasureBox active disbled">已领取
		                	<span class="tag"></span>
		                </a>
	            	</c:when>
	            	<c:when test="${taskFiveStatus eq 1 }">
		            	<a href="javascript:;" data-invest="3" class="tag tag1 txt-c treasureBox invest_receive">打开宝箱
		                	<span class="tag"></span>
		                </a>
	            	</c:when>
	            	<c:otherwise>
	            		<a href="javascript:;" class="tag tag1 txt-c treasureBox invest_role">立即认购
		                	<span class="tag"></span>
		                </a>
	            	</c:otherwise>
            	</c:choose>
                <span class="tag tag2 txt-c">
                	<font color="#463234" class="px22">单笔认购满3000送60元红包</font><br>
                    已有<span class="investNum3">${taskFiveTotalNum }</span>人成功闯到此关
                </span>
                <span class="tag tag3 <c:if test="${taskSixStatus eq 3 }">active</c:if>"></span>
                <span class="tag tag4 txt-c">
                	<font color="#463234" class="px22">关注微信号送10元红包</font><br>
                    已有${taskSixTotalNum }人成功闯到此关
                </span>
                <span class="tag tag5">
                    扫描二维码或者微信公众号<br>
                    搜索<font color="#e72727" style="font-size:25px;">“前海红筹”</font><br>
                    关注成功后，回复手机号+新手福利
                    <span class="tag scan">
                    	<img src="${oss }/resources/activity/year2016/month05/newertask/images/scan-img.png" class="tag animated wave1 infinite" />
                    </span>
                </span>
            </div>
            
            <div class="part_5">
            	<c:choose>
	            	<c:when test="${empty session_user }">
	            		<div class="tag tag1"></div>
            			<a href="${https }/visitor/to-login?skip=neweractivity/totask.htm" class="tag tag2 txt-c">集齐6把钥匙开启终极宝藏</a>
	            	</c:when>
	            	<c:when test="${finishAllTaskStatus eq 3 }"> <!-- 老用户 -->
	            		<div class="tag tag1"></div>
            			<a href="javascript:;" class="tag tag2 txt-c">老用户只可享受微信红包</a>
	            	</c:when>
	            	<c:when test="${finishAllTaskStatus eq 1 }">
	            		<div class="tag tag1"></div>
            			<a id="openBox" href="javascript:;" class="tag tag2 txt-c">已集齐6把钥匙，开启宝箱吧</a>
	            	</c:when>
	            	<c:when test="${finishAllTaskStatus eq 2 }">
	            		<div class="tag tag1 active"></div>
            			<a href="javascript:;" class="tag tag2 txt-c">恭喜您已获得新手任务终极大奖</a>
	            	</c:when>
	            	<c:otherwise>
	            		<div class="tag tag1"></div>
	            		<c:if test="${completeTaskNum le 0 }">
	            			<a class="tag tag2 txt-c">集齐6把钥匙开启终极宝藏</a>
	            		</c:if>
	            		<c:if test="${completeTaskNum gt 0 }">
 	 	          			<a class="tag tag2 txt-c">已集齐<span class="lock">${completeTaskNum }</span>把钥匙，还差<span class="differLock">${unCompleteTaskNum }</span>把钥匙</a>
	            		</c:if>
	            	</c:otherwise>
            	</c:choose>
            </div>
            
            <div class="part_6">
            	<p class="tag"><span class="px24">活动规则</span><br>
                	1. 活动时间：2016年5月3日起；<br>
                    2. 该活动仅限5月3日起注册的新用户，老用户可享受关注微信送红包的福利；<br>                  
                    3. 新手任务中几项认购任务，用户需认购标的的优先和夹层，认购劣后不参与此活动；<br>                    
                    4. 用户在完成任务后（关注微信的任务除外），需回到页面打开宝箱，自行领取红包奖励；<br>                    
                    5. 微信红包获取方式：用户需关注前海红筹微信公众号，扫描上面的微信二维码或者公众号搜索“前海红筹”，关注成功后并且<br>
                    回复“手机号码+新手福利”，系统会在3个工作日后发放红包至账户，用户可以在个人中心-我的优惠券-我的红包处查看；<br>                  
                    6. 活动中获得的所有红包、加息券仅限认购优先使用；<br>                    
                    7. 活动最终解释权归前海红筹所有。
                </p>
                <c:if test="${empty session_user }">
	                <a href="${https }/visitor/to-regist" class="tag txt-c">立即注册</a>
                </c:if>
            </div>
            
            <div style="display:none;">
	        	<div class="popup-record" id="record">
	            	<div class="popup-bg">
	                	<span>恭喜您获得第<em class="num"></em>把钥匙，并且获得<em class="packet"></em>元红包，完成接下来的任务，收集更多的钥匙，将有更多的奖励等着您！</span>
	                    <a href="javascript:$.fancybox.close();">确认</a>
	                </div>
	            </div>
	        </div>
	        
	        <div style="display:none;">
	        	<div class="popup-record" id="record2">
	            	<div class="popup-bg endImg">
	                	<span>恭喜您获得终极大奖，大奖有：<font color="#f65c5d">0.3%加息券<br>1张，0.8%加息券1张，提现券1张，一对一VIP客户服务。</font></span>
	                    <a href="/loaninfo/loanList.htm?nav=2">去投资吧</a>
	                </div>
	            </div>
	        </div>
            
        	
        </main>
        <!--Main end--> 
		
		<jsp:include page="/WEB-INF/views/hc9/footer_new.jsp" />
	</div>
	<!--Container end-->
	<script>
	var receiveInfo = function(num,packet,href) {
		$(href).find('.num').text(num)
		$(href).find(".packet").text(packet);
		$.fancybox.open({
			href : href,
            padding : 0,
            margin:0,
            scrolling: 'no',
            closeBtn: true,
            wrapCSS: 'fancybox-transparent',
            helpers: {
                  overlay : {
                      closeClick : false
                  }
              },
              tpl:{
                  closeBtn : '<a title="关闭" class="fancybox-custom-close" href="javascript:;" style="right:30px;top:130px;background:url(${oss}/resources/public/js/fancybox/close-gray_24x24.png);width:24px;height:24px;"></a>'
              }
        });
	}
	var setUpStatus = function(_this,numObj,oldNum) {
		$(_this).addClass("active disbled").html('已领取<span class="tag"></span>');
		$(_this).unbind('click');
		$(numObj).text((parseInt(oldNum)+1));
		var lock = $(".part_5 .lock"); 
		lock.text(parseInt(lock.text()) + 1);
		var differLock = $(".part_5 .differLock"); 
		differLock.text(parseInt(differLock.text()) - 1);
	}
    $(function(){
    	// receiveInfo(3,15,"#record"); receiveInfo(0,0,"#record2");
    	var r_num = $(".registNum").text(),
    		c_num = $(".rechargeNum").text(),
    		i_num1 = $(".investNum1").text(),
    		i_num2 = $(".investNum2").text(),
    		i_num3 = $(".investNum3").text();
        // 立即注册（任务一）
        $("#regist_role").click(function(){
        	var taskOneStatus = "${taskOneStatus}";
        	var url = "${https }/visitor/to-regist"; 
        	if (taskOneStatus == 2) {
        		layer.alert("此活动为新注册用户专享哦，您可以参加平台其他的精彩活动",{title:'提示',icon:0});
        	} else {
        		location.href = url;
        	}
        });
     	// 立即充值（任务二）
        $("#recharge_role").click(function(){
        	var taskTwoStatus = "${taskTwoStatus}";
       		var url = "/recharge/openRecharge.htm?index=8_8";
        	if ("${session_user}" != '') {
	        	if (taskTwoStatus == 2) {
	        		layer.alert("此活动为新注册用户专享哦，您可以参加平台其他的精彩活动",{title:'提示',icon:0});
	        		return;
	        	}
        	} else {
        		url = "${https }/visitor/to-login?skip=recharge/openRecharge.htm?index=8_8";
        	}
       		location.href = url;
        });
     	// 立即认购（任务三、任务四、任务五）
        $(".invest_role").click(function(){
        	var taskThreeStatus = "${taskThreeStatus}";
       		var url = "/loaninfo/loanList.htm?nav=2";
        	if (taskThreeStatus == 2) {
        		layer.alert("此活动为新注册用户专享哦，您可以参加平台其他的精彩活动",{title:'提示',icon:0});
        		return;
        	}
       		location.href = url;
        });
        
     	// 注册任务领取
        $("#regist_receive").click(function(){
        	var _this = this;
        	$.ajax({
        		type : 'post',
        		url : '/neweractivity/taskOneReceive.htm',
        		dataType : 'json',
        		success : function(jsonObj) {
        			if (jsonObj.code == 0) {
        				receiveInfo(jsonObj.completeTaskNum,100,"#record");
        				setUpStatus(_this,".registNum",r_num);
        			} else {
        				layer.alert("领取失败，请稍后领取！",{title:'提示',icon:0});
        			}
        		}
        	});
        });
    	// 充值任务领取
        $("#recharge_receive").click(function(){
        	var _this = this;
        	$.ajax({
        		type : 'post',
        		url : '/neweractivity/taskTwoReceive.htm',
        		dataType : 'json',
        		success : function(jsonObj) {
        			if (jsonObj.code == 0) {
        				receiveInfo(jsonObj.completeTaskNum,5,"#record");
        				setUpStatus(_this,".rechargeNum",c_num);
        			} else {
        				layer.alert("领取失败，请稍后领取！",{title:'提示',icon:0});
        			}
        		}
        	});
        });
     	// 首次认购任务领取（包含100、1000、3000）
        $(".invest_receive").click(function(){
        	var _this = this;
        	var invest_type = $(_this).attr("data-invest");
        	if (!isNaN(invest_type) && invest_type != '') {
        		var processUrl = '',packet = 0,tempNum = 0;
        		if (invest_type == '1') {
        			processUrl =  '/neweractivity/taskThreeReceive.htm';
        			packet = 15;
        			tempNum = i_num1;
        		} else if (invest_type == '2') {
        			processUrl =  '/neweractivity/taskFourReceive.htm';
        			packet = 30;
        			tempNum = i_num2;
        		} else if (invest_type == '3') {
        			processUrl =  '/neweractivity/taskFiveReceive.htm';
        			packet = 60;
        			tempNum = i_num3;
        		} else {
        			layer.alert("领取失败，请稍后领取！",{title:'提示',icon:0});
        			return;
        		}
	        	$.ajax({
	        		type : 'post',
	        		url : processUrl,
	        		dataType : 'json',
	        		success : function(jsonObj) {
	        			if (jsonObj.code == 0) {
	        				receiveInfo(jsonObj.completeTaskNum,packet,"#record");
	        				setUpStatus(_this,(".investNum"+invest_type),tempNum);
	        			} else {
	        				layer.alert("领取失败，请稍后领取！",{title:'提示',icon:0});
	        			}
	        		}
	        	});
        	} else {
        		layer.alert("操作异常，领取失败！",{title:'提示',icon:0});
        	}
        });
     	// 终极大奖
     	$("#openBox").click(function(){
     		var _this = this;
     		$.ajax({
        		type : 'post',
        		url : '/neweractivity/finalBigPrizeReceive.htm',
        		dataType : 'json',
        		success : function(jsonObj) {
        			if (jsonObj.code == 0) {
			        	receiveInfo(0,0,"#record2");
			        	$(_this).prev().addClass('active');
			    		$(".totalNum").text((parseInt($(".totalNum").text())+1));
        			} else if (jsonObj.code == -3) {
        				layer.alert(jsonObj.msg,{title:'提示',icon:0});
        			} else {
        				layer.alert("领取失败，请稍后领取！",{title:'提示',icon:0});
        			}
        		}
        	});
     	});
    });
    </script>
</body>
</html>