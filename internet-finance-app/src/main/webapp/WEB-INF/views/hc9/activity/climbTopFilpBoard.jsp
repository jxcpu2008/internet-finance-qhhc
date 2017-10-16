<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
	String path = request.getContextPath();
	String basePath = "/";
%>
<!DOCTYPE html>
<html lang="zh-cn">
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
#peakedness{
	background-color:#8bc82b;
}
#peakedness .tag{
	display:block;
	position:absolute;
}
#peakedness header{
	background:url(/resources/public/images/activity/april/banner.jpg) top center no-repeat;
	height:840px;
	position:relative;
}
#peakedness header .tag1{
	left:50%;
	margin-left:-474px;
	top:50px;
}
#peakedness header .tag2{
	left:50%;
	margin-left:-604px;
	top:70px;
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
  -webkit-animation: wave 4s;
  -moz-animation: wave 4s;
  animation: wave 4s;
}

#peakedness article .part_1{
	background-color:#8bc82b;
	position:relative;
}
#peakedness article .part_1 .title img{
	position:absolute;
	top:-50px;
	left:50%;
	margin-left:-269px;
}
#peakedness article .part_1 .title p{
	line-height:20px;
	padding-top:15px;
}
#peakedness article .part_1 .content .hill{
	background:url(/resources/public/images/activity/april/hill-bg.png) center center no-repeat;
	width:1370px;
	height:580px;
	margin-top:150px;
	position:relative;
}
#peakedness article .part_1 .content .hill p.sum{
	position:absolute;
	left:83%;
	border-bottom:1px solid white;
	padding:0 10px;
}
#peakedness article .part_1 .content .hill p.sum1{
	top:44px;
}
#peakedness article .part_1 .content .hill p.sum2{
	top:194px;
}
#peakedness article .part_1 .content .hill p.sum3{
	top:270px;
}
#peakedness article .part_1 .content .hill p.sum4{
	top:360px;
}
#peakedness article .part_1 .content .hill p.sum5{
	top:454px;
}
#peakedness article .part_1 .content .hill .adorn-1{
	position:absolute;
	display:block;
	top:-120px;
	left:17%;
}
#peakedness article .part_1 .content .hill .adorn-2{
	position:absolute;
	display:block;
	top:210px;
	right:2%;
}
#peakedness article .part_1 .content .hill .adorn-3{
	position:absolute;
	display:block;
	top:585px;
	left:5%;
}
#peakedness article .part_1 .content .person{
	position:absolute;
	background:url(/resources/public/images/activity/april/person-img.png) center center no-repeat;
	width:66px;
	height:72px;
}
#peakedness article .part_1 .content .person1{
	top:97%;
	margin-top:-72px;
	left:12%;
	margin-left:-60px;
}
#peakedness article .part_1 .content .person2{
	top:95%;
	margin-top:-70px;
	left:18%;
	margin-left:-50px;
}
#peakedness article .part_1 .content .person3{
	top:84%;
	margin-top:-76px;
	left:22%;
	margin-left:-44px;
}
#peakedness article .part_1 .content .person4{
	top:82%;
	margin-top:-80px;
	left:28%;
	margin-left:-35px;
}
#peakedness article .part_1 .content .person5{
	top:68%;
	margin-top:-74px;
	left:36%;
	margin-left:-52px;
}
#peakedness article .part_1 .content .person6{
	top:66%;
	margin-top:-76px;
	left:44%;
	margin-left:-56px;
}
#peakedness article .part_1 .content .person7{
	top:52%;
	margin-top:-72px;
	left:50%;
	margin-left:-94px;
}
#peakedness article .part_1 .content .person8{
	top:54%;
	margin-top:-76px;
	left:58%;
	margin-left:-88px;
}
#peakedness article .part_1 .content .person9{
	top:40%;
	margin-top:-76px;
	left:64%;
	margin-left:-94px;
}
#peakedness article .part_1 .content .person10{
	top:36%;
	margin-top:-75px;
	left:75%;
	margin-left:-78px;
}
#peakedness article .part_1 .content .person11{
	top:14%;
	margin-top:-78px;
	left:82%;
	margin-left:-90px;
}
#peakedness article .part_1 .content .bubble{
	position:absolute;
	background:url(/resources/public/images/activity/april/bubble.png) center center no-repeat;
	width:209px;
	height:135px;
	top:-150px;
	left:-50px;
	padding-top:45px;
}
#peakedness article .part_1 .content .bubble a{
	background-color:#f84348;
	display:inline-block;
	padding:5px 20px;
	margin-bottom:5px;
	border-radius:5px;
	color:white;
	border-bottom:2px solid #e1e1e1;
}
#peakedness article .part_1 .content .bubble p{
	line-height:20px;
}
#peakedness article .button{
	display:block;
	background:url(/resources/public/images/activity/april/button.png) center center no-repeat;
	width:297px;
	height:76px;
	margin:40px auto;
}
#peakedness article .part_1 .prize{
	margin-top:70px;
}
#peakedness article .part_1 .prize .line_1 .fl-l{
	background:url(/resources/public/images/activity/april/prize_1.jpg) 0 0 no-repeat;
	width:547px;
	height:268px;
}
#peakedness article .part_1 .prize .line_1 .fl-r{
	background:url(/resources/public/images/activity/april/prize_2.jpg) 0 0 no-repeat;
	width:547px;
	height:268px;
}
#peakedness article .part_1 .prize .line_1 dl{
	padding-top:200px;
}
#peakedness article .part_1 .prize .line_2{
	background:url(/resources/public/images/activity/april/prize_3.jpg) 0 0 no-repeat;
	width:1163px;
	height:270px;
	margin:50px 0;
	position:relative;
}
#peakedness article .part_1 .prize .line_2 .adorn{
	position:absolute;
	display:block;
	top:250px;
	left:90%;
}
#peakedness article .part_1 .prize .line_2 dl{
	position:absolute;
}
#peakedness article .part_1 .prize .line_2 dl:nth-child(1){
	top:35px;
	left:20%;
	margin-left:-65px;
}
#peakedness article .part_1 .prize .line_2 dl:nth-child(2){
	top:56px;
	left:50%;
	margin-left:-100px;
}
#peakedness article .part_1 .prize .line_2 dl:nth-child(3){
	top:54px;
	left:80%;
	margin-left:-70px;
}
#peakedness article .part_1 .prize .line_3{
	background:url(/resources/public/images/activity/april/prize_4.jpg) 0 0 no-repeat;
	width:1157px;
	height:230px;
	margin-bottom:108px;
	position:relative;
}
#peakedness article .part_1 .prize .line_3 .adorn{
	position:absolute;
	display:block;
	top:225px;
	left:-60px;
}


#peakedness article .part_2{
	background-color:#7db425;
}
#peakedness article .part_2 .title{
	background:url(/resources/public/images/activity/april/title-bg.jpg) top center no-repeat;
	height:200px;
}
#peakedness article .part_2 .content .line{
	background:url(/resources/public/images/activity/april/card-bg.jpg) center center no-repeat;
	width:1212px;
	height:295px;
	margin-bottom:30px;
}
#peakedness article .part_2 .content .line .parcel{
	padding:25px 29px 37px 25px;
}
#peakedness article .part_2 .content .line .disabled{
	background-color:#000000;
  	filter:alpha(opacity=50);  
	-moz-opacity:0.5;  
	-khtml-opacity: 0.5;  
	opacity: 0.5; 
	width:1158px;
	height:233px;
	position:absolute;
	top:0;
	left:0;
	z-index:2;
}
#peakedness article .part_2 .content .line .parcel .piece{
	background-color:#66961a;
	width:1158px;
	height:233px;
	position:relative;
}
#peakedness article .part_2 .content  .parcel .piece .friendly{
	width:177px;
	height:178px;
	text-align:center;
	padding-top:100px;
	line-height:18px;
	font-size:14px;
	color:#66961a;
	position:absolute;
	top:28px;
	left:30px;
}
#peakedness article .part_2 .content .line_1 .parcel .piece .friendly{
	background:url(/resources/public/images/activity/april/friendly-bg.png) 0 0 no-repeat;
}
#peakedness article .part_2 .content .line_2 .parcel .piece .friendly{
	background:url(/resources/public/images/activity/april/rich-bg.png) 0 0 no-repeat;
}
#peakedness article .part_2 .content .line_3 .parcel .piece .friendly{
	background:url(/resources/public/images/activity/april/patriotic-bg.png) 0 0 no-repeat;
}
#peakedness article .part_2 .content .line_4 .parcel .piece .friendly{
	background:url(/resources/public/images/activity/april/respect-bg.png) 0 0 no-repeat;
}
#peakedness article .part_2 .content .line .parcel .piece .draw{
	position:absolute;
	top:0px;
	left:220px;
}
#peakedness article .part_2 .content .line .parcel .piece .draw a{
	display:inline;
	width:133px;
	height:190px;
	margin:0 34px;
	padding-top:35px;
}
#peakedness article .part_2 .content .line_1 .parcel .piece .draw a{
	background:url(/resources/public/images/activity/april/friendly-img.png) center center no-repeat;
}
#peakedness article .part_2 .content .line_1 .parcel .piece .draw a:hover{
	background-image:url(/resources/public/images/activity/april/friendly-max.png);
	width:202px;
	height:259px;
	margin:-14px 0 0 0px;
	padding:0;
}
#peakedness article .part_2 .content .line_2 .parcel .piece .draw a{
	background:url(/resources/public/images/activity/april/rich-img.png) center center no-repeat;
}
#peakedness article .part_2 .content .line_2 .parcel .piece .draw a:hover{
	background-image:url(/resources/public/images/activity/april/rich-max.png);
	width:202px;
	height:259px;
	margin:-14px 0 0 0px;
	padding:0;
}
#peakedness article .part_2 .content .line_3 .parcel .piece .draw a{
	background:url(/resources/public/images/activity/april/patriotic-img.png) center center no-repeat;
}
#peakedness article .part_2 .content .line_3 .parcel .piece .draw a:hover{
	background-image:url(/resources/public/images/activity/april/patriotic-max.png);
	width:202px;
	height:259px;
	margin:-14px 0 0 0px;
	padding:0;
}
#peakedness article .part_2 .content .line_4 .parcel .piece .draw a{
	background:url(/resources/public/images/activity/april/respect-img.png) center center no-repeat;
}
#peakedness article .part_2 .content .line_4 .parcel .piece .draw a:hover{
	background-image:url(/resources/public/images/activity/april/respect-max.png);
	width:202px;
	height:259px;
	margin:-14px 0 0 0px;
	padding:0;
}

#peakedness article .part_2 .content .line .parcel .piece .award{
	position:absolute;
	top:25px;
	left:822px;
}
#peakedness article .part_2 .content .line .parcel .piece .award .min-title li{
	height:28px;
}
#peakedness article .part_2 .content .line .parcel .piece .award .min-title li:nth-child(1),
#peakedness article .part_2 .content .line .parcel .piece .award .min-title li:nth-child(3){
	width:80px;
	height:1px;
	background-color:#85ab48;
	margin:12px 14px;
}
#peakedness article .part_2 .content .line .parcel .piece .award .clearfix li dl{
	margin-top:10px;
}
#peakedness article .part_2 .content .line .parcel .piece .award .clearfix li dl dt{
	background-image:url(/resources/public/images/activity/april/sprite-62x50.png);
	background-repeat:no-repeat;
	width:62px;
	height:50px;
	text-align:center;
}
#peakedness article .part_2 .content .line_1 .parcel .piece .award .clearfix li dl .award-1{
	background-position: 0 0;
	margin:0 25px;
}
#peakedness article .part_2 .content .line_1 .parcel .piece .award .clearfix li dl .award-2{
	background-position: 0 -50px;
}
#peakedness article .part_2 .content .line_1 .parcel .piece .award .clearfix li dl .award-3{
	background-position: 0 -100px;
	margin:0 25px;
}
#peakedness article .part_2 .content .line_2 .parcel .piece .award .clearfix li dl .award-1{
	background-position: -62px 0;
	margin:0 25px;
}
#peakedness article .part_2 .content .line_2 .parcel .piece .award .clearfix li dl .award-2{
	background-position: -62px -50px;
}
#peakedness article .part_2 .content .line_2 .parcel .piece .award .clearfix li dl .award-3{
	background-position: -62px -100px;
	margin:0 25px;
}
#peakedness article .part_2 .content .line_3 .parcel .piece .award .clearfix li dl .award-1{
	background-position: -124px 0;
	margin:0 25px;
}
#peakedness article .part_2 .content .line_3 .parcel .piece .award .clearfix li dl .award-2{
	background-position: -124px -50px;
}
#peakedness article .part_2 .content .line_3 .parcel .piece .award .clearfix li dl .award-3{
	background-position: -124px -100px;
	margin:0 25px;
}
#peakedness article .part_2 .content .line_4 .parcel .piece .award .clearfix li dl .award-1{
	background-position: -186px 0;
	margin:0 25px;
}
#peakedness article .part_2 .content .line_4 .parcel .piece .award .clearfix li dl .award-2{
	background-position: -186px -50px;
}
#peakedness article .part_2 .content .line_4 .parcel .piece .award .clearfix li dl .award-3{
	background-position: -186px -100px;
	margin:0 25px;
}
#peakedness article .part_2 .content .explain{
	background:url(/resources/public/images/activity/april/explain-bg.jpg) 0 0 no-repeat;
	width:1180px;
	height:288px;
}
#peakedness footer .title{
	background:url(/resources/public/images/activity/april/explain-bg2.jpg) top center no-repeat;
	height:112px;
}
#peakedness .register .regist-box{
	padding:54px 65px;
    border: 1px solid #80bc1b;
    background: #fafafa url(/resources/assets/images/home/logo.png) 86px center no-repeat;
	text-align:right;
	background-color:#fafafa;
	margin:115px 0 0 24px;
}
#peakedness .register .regist-box input{
    width: 290px;
    height: 49px;
    border: 1px solid #f94040;
	padding:0 20px;
}
#peakedness .register .regist-box a{
    width: 157px;
    height: 51px;
    line-height: 51px;
    background-color: #f94040;
    color: #fff;
    text-align: center;
}
#peakedness .register .inner{
	position:relative;
}
#peakedness .register .inner .adorn-1{
	position:absolute;
	top:105px;
	left:-40px;
}
#peakedness .register .inner .adorn-2{
	position:absolute;
	top:-90px;
	left:90%;
}
#flopDraw .floatbox{
	position:fixed;
	z-index:99;
	left:82%;
	top:50%;
	background:url(/resources/public/images/activity/planner/fixed-bg.png) 0 0 no-repeat;
	width:272px;
	height:177px;
}
#flopDraw .floatbox a{
	display:block;
	width:120px;
	height:90px;
	position:absolute;
	right:26%;
	top:64px;
}
.popup-record{
	width:490px;
	height:317px;
	background-color:#ffffff;
	border:1px solid #415d13;
}
.popup-record .content{
	font-size:18px;
	color:#575757;
	margin-bottom:40px;
	padding-top:34px;
	line-height:34px;
	margin-top:60px;
	border-top:1px solid #ebebeb;
}
.popup-record a{
	color:#ffffff;
	font-size:24px;
	background-color:#f65c5d;
	border-radius:20px;
	padding:5px 30px;
}

</style>
</head>
<body>
	<!--Container begin-->
	<div id="container">
		<!-- head -->
		<jsp:include page="/WEB-INF/views/hc9/header_new.jsp" />
		<!-- end head -->
		<!--Main begin-->
  <main id="flopDraw" role="main">
  		<section id="peakedness">
        	<header>
            	<span class="tag tag1 animated tada" data-delay="200"><img src="${oss }/resources/public/images/activity/april/banner-img1.png" /></span>
            	<span class="tag tag2 animated wave infinite" data-delay="600"><img src="${oss }/resources/public/images/activity/april/banner-img2.png" /></span>
            </header>
            
            <article>
                <div class="part_1">
                	<div class="title txt-c">
                    	<img src="${oss }/resources/public/images/activity/april/title_1.png" />
                        <p class="px14 clr-white">活动期间，新老客户进行投资，即可攀爬“鹏城第一峰”，投资到一定金额即进行攀爬<br>每个阶段都有不一样的攀爬奖励，累计当月投资金额，活动结束后即可获得对应投资金额档次的奖励</p>
                    </div>
                    
                    <div class="content">
                    	<div class="hill inner">
                        	<c:if test="${empty session_user }">
	                           	 <!--未登录-->
	                        	<div class="person person1">
	                        		<div class="bubble txt-c animated wave infinite">
	                                	<a href="${https }/visitor/to-login?skip=april/toclimbtop.htm" class="px14">登录</a>
	                                    <p class="px14"><font color="#8bc82b">查看攀爬高度！</font></p>
	                                </div>
	                            </div>
                        	</c:if>
                            <c:if test="${!empty session_user }">
                        		<!--已登录-->
                        		<c:if test="${floorNum == 0 }">
		                        	<div class="person person1">
		                        		<div class="bubble txt-c animated wave infinite">
		                                    <p class="px14"><font color="#8bc82b">投资进行攀登，累计投资<br>越多，获得奖励越大！</font></p>
		                                </div>
	                                </div>
                        		</c:if>
                        		<c:if test="${floorNum eq 0.5 }">
		                        	<div class="person person2">
		                        		<div class="bubble txt-c animated wave infinite">
		                                    <p class="px14"><font color="#8bc82b">累计投资金额${totalInvest }元<br>离第1阶梯还差${subNetMoney }<br>继续加油！</font></p>
		                                </div>
	                                </div>
                        		</c:if>
                        		<c:if test="${floorNum eq 1 }">
		                        	<div class="person person3">
		                        		<div class="bubble txt-c animated wave infinite">
		                                    <p class="px14"><font color="#8bc82b">累计投资金额${totalInvest }元<br>可获得奖品<br>10元红包</font></p>
		                                </div>
	                                </div>
                        		</c:if>
                        		<c:if test="${floorNum eq 1.5 }">
		                        	<div class="person person4">
		                        		<div class="bubble txt-c animated wave infinite">
		                                    <p class="px14"><font color="#8bc82b">累计投资金额${totalInvest }元<br>可获得奖品<br>10元红包</font></p>
		                                </div>
	                                </div>
                        		</c:if>
                        		<c:if test="${floorNum eq 2 }">
		                        	<div class="person person5">
		                        		<div class="bubble txt-c animated wave infinite">
		                                    <p class="px14"><font color="#8bc82b">累计投资金额${totalInvest }元<br>可获得奖品<br>50元京东购物卡</font></p>
		                                </div>
	                                </div>
                        		</c:if>
                        		<c:if test="${floorNum eq 2.5 }">
		                        	<div class="person person6">
		                        		<div class="bubble txt-c animated wave infinite">
		                                    <p class="px14"><font color="#8bc82b">累计投资金额${totalInvest }元<br>可获得奖品<br>50元京东购物卡</font></p>
		                                </div>
	                                </div>
                        		</c:if>
                        		<c:if test="${floorNum eq 3 }">
		                        	<div class="person person7">
		                        		<div class="bubble txt-c animated wave infinite">
		                                    <p class="px14"><font color="#8bc82b">累计投资金额${totalInvest }元<br>可获得奖品<br>飞利浦电动牙刷</font></p>
		                                </div>
	                                </div>
                        		</c:if>
                        		<c:if test="${floorNum eq 3.5 }">
		                        	<div class="person person8">
		                        		<div class="bubble txt-c animated wave infinite">
		                                    <p class="px14"><font color="#8bc82b">累计投资金额${totalInvest }元<br>可获得奖品<br>飞利浦电动牙刷</font></p>
		                                </div>
	                                </div>
                        		</c:if>
                        		<c:if test="${floorNum eq 4 }">
		                        	<div class="person person9">
		                        		<div class="bubble txt-c animated wave infinite">
		                                    <p class="px14"><font color="#8bc82b">累计投资金额${totalInvest }元<br>可获得奖品<br>富士相机</font></p>
		                                </div>
	                                </div>
                        		</c:if>
                        		<c:if test="${floorNum eq 4.5 }">
		                        	<div class="person person10">
		                        		<div class="bubble txt-c animated wave infinite">
		                                    <p class="px14"><font color="#8bc82b">累计投资金额${totalInvest }元<br>可获得奖品<br>富士相机</font></p>
		                                </div>
	                                </div>
                        		</c:if>
                        		<c:if test="${floorNum eq 5 }">
		                        	<div class="person person11">
		                        		<div class="bubble txt-c animated wave infinite">
		                                    <p class="px14"><font color="#8bc82b">累计投资金额${totalInvest }元<br>恭喜您已成功登顶，可获得<br>小米套装一份</font></p>
		                                </div>
	                                </div>
                        		</c:if>
                        	</c:if>
                        	<c:if test="${oneLevelNum ne 0 || twoLevelNum ne 0 || threeLevelNum ne 0 || fourLevelNum ne 0 || fiveLevelNum ne 0  }">
	                        	<p class="px16 clr-white sum sum5">${oneLevelNum }人到达此高度</p>
	                            <p class="px16 clr-white sum sum4">${twoLevelNum }人到达此高度</p>
	                            <p class="px16 clr-white sum sum3">${threeLevelNum }人到达此高度</p>
	                            <p class="px16 clr-white sum sum2">${fourLevelNum }人到达此高度</p>
	                            <p class="px16 clr-white sum sum1">${fiveLevelNum }人到达此高度</p>
                        	</c:if>
                            <span class="adorn-1"><img src="${oss }/resources/public/images/activity/april/adorn-ico1.png" /></span>
                        	<span class="adorn-2"><img src="${oss }/resources/public/images/activity/april/adorn-ico2.png" /></span>
                        	<span class="adorn-3"><img src="${oss }/resources/public/images/activity/april/adorn-ico3.png" /></span>
                        </div>
                    </div>
                    
                    <a href="/loaninfo/loanList.htm?nav=2" class="button"></a>
                    
                    <div class="prize inner">
                    	<div class="clearfix line_1">
                        	<div class="fl-l">
                            	<dl class="clr-white txt-c">
                                	<dt class="px18">小米套装(代步器、运动相机、空气净化器)</dt>
                                    <dd class="px14">投资2000000以上奖品区</dd>
                                </dl>
                            </div>
                        	<div class="fl-r">
                            	<dl class="clr-white txt-c">
                                	<dt class="px18">富士相机S8600相机</dt>
                                    <dd class="px14">投资500000 - 1999900奖品区</dd>
                                </dl>
                            </div>
                        </div>
                        <div class="line_2">
                            <dl class="clr-white txt-c">
                                <dt class="pb15"><img src="${oss }/resources/public/images/activity/april/prize-ico1.jpg" /></dt>
                                <dd class="px14"><em class="px18">飞利浦电动牙刷</em><br>投资100000 - 499900奖品区</dd>
                            </dl>
                            <dl class="clr-white txt-c">
                                <dt class="pb30"><img src="${oss }/resources/public/images/activity/april/prize-ico2.jpg" /></dt>
                                <dd class="px14"><em class="px18">50元京东购物卡</em><br>投资10000 - 99900奖品区</dd>
                            </dl>
                            <dl class="clr-white txt-c">
                                <dt class="pb30"><img src="${oss }/resources/public/images/activity/april/prize-ico3.jpg" /></dt>
                                <dd class="px14"><em class="px18">10元红包</em><br>投资1000 - 9900奖品区</dd>
                            </dl>
                            <span class="adorn"><img src="${oss }/resources/public/images/activity/april/adorn-ico4.png" /></span>
                        </div>
                        <div class="line_3">
                        	<p class="clr-white px14 pl50 pt25 pb10">温馨提示：</p>
                            <p class="clr-white px14 pl50">1.活动时间：2016年4月1日 - 2016年5月2日；<br>
                               2.活动结束后，累计投资金额达到相应档次即获得相应奖励，奖励由低至高，人人皆可参与，每人仅可领取奖励一次；<br>
                               3.奖品以活动结束后相对应当月的投资额结算，活动结束10个工作日发放；<br>
                               4.投资优先、夹层产品皆计入当月投资额，劣后不参与；<br>
                               5.累计认购金额计算方式：<font color="#ffeb00">（月标）投资金额*月份数，（天标）投资金额/30*投资天数；例如：投资10000元三个月的标的，则累计投资金额为10000元*3=30000元；</font><br>
                               6.活动最终解释权归前海红筹所有。</p>
                            <span class="adorn"><img src="${oss }/resources/public/images/activity/april/adorn-ico1.png" /></span>
                        </div>
                    </div>
                </div>
                
                
                <div class="part_2">
                	<div class="title txt-c">
                    	<img src="${oss }/resources/public/images/activity/april/title_2.png" style="padding-top:90px;" />
                        <p class="clr-white px14 pt20">活动期间，每日送您五个幸运，每日投资前五笔即可参与幸运抽奖， 可成功抽取对应投资金额的3种奖励之一，100%中奖！<br>如投资时使用红包/加息券时，将不记录抽奖次数。</p>
                    </div>
                    
                    <div class="content inner pt40">
                    	<div class="line line_1">
                            <div class="parcel">
                            	<div class="piece">
                            		<c:if test="${oneLeveLeftNum <= 0 && !empty session_user }"> <div class="disabled"></div> </c:if>
                            		<div class="friendly">单笔投资额<br>满100 - 900元区间<br>可获得一次抽奖机会</div>
                                    <div class="draw clearfix">
                                    	<a href="javascript:;" class="fl-l" data-type="1"></a>
                                        <a href="javascript:;" class="fl-l" data-type="1"></a>
                                        <a href="javascript:;" class="fl-l" data-type="1"></a>
                                    </div>
                                    
                                    <div class="award txt-c">
                                    	<p class="px18 clr-white mb10 mt20">您有<span class="num">${oneLeveLeftNum }</span>次抽奖机会</p>
                                        <ul class="min-title clearfix mt10">
                                        	<li class="fl-l"></li>
                                        	<li class="px14 fl-l clr-white">友善卡奖品</li>
                                        	<li class="fl-l"></li>
                                        </ul>
                                        <ul class="clearfix">
                                        	<li class="fl-l">
                                            	<dl>
                                                	<dt class="award-1"></dt>
                                                    <dd class="clr-white px14">1元现金</dd>
                                                </dl>
                                            </li>
                                        	<li class="fl-l">
                                            	<dl>
                                                	<dt class="award-2"></dt>
                                                    <dd class="clr-white px14">3元红包</dd>
                                                </dl>
                                            </li>
                                        	<li class="fl-l">
                                            	<dl>
                                                	<dt class="award-3"></dt>
                                                    <dd class="clr-white px14">0.1%加息券</dd>
                                                </dl>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="line line_2">
                        	<div class="parcel">
                            	<div class="piece">
                            		<c:if test="${twoLeveLeftNum <= 0 && !empty session_user }"> <div class="disabled"></div> </c:if>
                            		<div class="friendly">单笔投资额<br>满1000 - 9900元区间<br>可获得一次抽奖机会</div>
                                    <div class="draw clearfix">
                                    	<a href="javascript:;" class="fl-l" data-type="2"></a>
                                        <a href="javascript:;" class="fl-l" data-type="2"></a>
                                        <a href="javascript:;" class="fl-l" data-type="2"></a>
                                    </div>
                                    
                                    <div class="award txt-c">
                                    	<p class="px18 clr-white mb10 mt20">您有<span class="num">${twoLeveLeftNum }</span>次抽奖机会</p>
                                        <ul class="min-title clearfix mt10">
                                        	<li class="fl-l"></li>
                                        	<li class="px14 fl-l clr-white">富强卡奖品</li>
                                        	<li class="fl-l"></li>
                                        </ul>
                                        <ul class="clearfix">
                                        	<li class="fl-l">
                                            	<dl>
                                                	<dt class="award-1"></dt>
                                                    <dd class="clr-white px14">5元现金</dd>
                                                </dl>
                                            </li>
                                        	<li class="fl-l">
                                            	<dl>
                                                	<dt class="award-2"></dt>
                                                    <dd class="clr-white px14">10元红包</dd>
                                                </dl>
                                            </li>
                                        	<li class="fl-l">
                                            	<dl>
                                                	<dt class="award-3"></dt>
                                                    <dd class="clr-white px14">0.3%加息券</dd>
                                                </dl>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="line line_3">
                        	<div class="parcel">
                            	<div class="piece">
                            		<c:if test="${threeLeveLeftNum <= 0 && !empty session_user }"> <div class="disabled"></div> </c:if>
                            		<div class="friendly">单笔投资额<br>满10000 - 99900元区间<br>可获得一次抽奖机会</div>
                                    <div class="draw clearfix">
                                    	<a href="javascript:;" class="fl-l" data-type="3"></a>
                                        <a href="javascript:;" class="fl-l" data-type="3"></a>
                                        <a href="javascript:;" class="fl-l" data-type="3"></a>
                                    </div>
                                    
                                    <div class="award txt-c">
                                    	<p class="px18 clr-white mb10 mt20">您有<span class="num">${threeLeveLeftNum }</span>次抽奖机会</p>
                                        <ul class="min-title clearfix mt10">
                                        	<li class="fl-l"></li>
                                        	<li class="px14 fl-l clr-white">爱国卡奖品</li>
                                        	<li class="fl-l"></li>
                                        </ul>
                                        <ul class="clearfix">
                                        	<li class="fl-l">
                                            	<dl>
                                                	<dt class="award-1"></dt>
                                                    <dd class="clr-white px14">20元现金</dd>
                                                </dl>
                                            </li>
                                        	<li class="fl-l">
                                            	<dl>
                                                	<dt class="award-2"></dt>
                                                    <dd class="clr-white px14">60元红包</dd>
                                                </dl>
                                            </li>
                                        	<li class="fl-l">
                                            	<dl>
                                                	<dt class="award-3"></dt>
                                                    <dd class="clr-white px14">0.8%加息券</dd>
                                                </dl>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="line line_4">
                        	<div class="parcel">
                            	<div class="piece">
                            		<c:if test="${fourLeveLeftNum <= 0 && !empty session_user}"> <div class="disabled"></div> </c:if>
                            		<div class="friendly">单笔投资额<br>100000以上区间<br>可获得一次抽奖机会</div>
                                    <div class="draw clearfix">
                                    	<a href="javascript:;" class="fl-l" data-type="4"></a>
                                        <a href="javascript:;" class="fl-l" data-type="4"></a>
                                        <a href="javascript:;" class="fl-l" data-type="4"></a>
                                    </div>
                                    
                                    <div class="award txt-c">
                                    	<p class="px18 clr-white mb10 mt20">您有<span class="num">${fourLeveLeftNum }</span>次抽奖机会</p>
                                        <ul class="min-title clearfix mt10">
                                        	<li class="fl-l"></li>
                                        	<li class="px14 fl-l clr-white">敬业卡奖品</li>
                                        	<li class="fl-l"></li>
                                        </ul>
                                        <ul class="clearfix">
                                        	<li class="fl-l">
                                            	<dl>
                                                	<dt class="award-1"></dt>
                                                    <dd class="clr-white px14">100元现金</dd>
                                                </dl>
                                            </li>
                                        	<li class="fl-l">
                                            	<dl>
                                                	<dt class="award-2"></dt>
                                                    <dd class="clr-white px14">200元红包</dd>
                                                </dl>
                                            </li>
                                        	<li class="fl-l">
                                            	<dl>
                                                	<dt class="award-3"></dt>
                                                    <dd class="clr-white px14">1.5%加息券</dd>
                                                </dl>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <a href="/loaninfo/loanList.htm?nav=2" class="button" style="margin:75px auto;"></a>
                        
                        <div <c:choose>
                        	<c:when test="${!empty session_user }">class="explain pb50"</c:when>
                        	<c:otherwise>class="explain"</c:otherwise>
                        </c:choose>>
                        	<p class="clr-white px14 pl50 pt30 pb10 ml30">温馨提示：</p>
                            <p class="clr-white px14 pl50 ml35" style="line-height: 22px;">1.活动时间：2016年4月1日 - 2016年5月2日；<br>
                                2.200元红包为2张10元，2张30元，2张60元；<br>
                                3.每日前五笔单笔投资可进行相应投资金额的幸运奖励抽取，若进行前五笔认购时使用红包、加息券则不计入幸运抽奖中，抽奖次数作废；<br>
                                4.抽取到的红包、加息券只仅限优先级产品使用，有效期为1个月，具体使用规则请登陆“会员中心”-“我的优惠券”进行查询；<br>
                                5.抽取到的现金奖励将在3个工作日内发放到个人账户，现金奖励可进行投资或提现；<br>
                                6.投资期限低于25天（不含25天）的标的不参加本次抽奖活动。<br>
                                7.劣后不参与此活动；<br>
                                8.抽奖次数当日有效，次日00:00清零。<br>
                                9.活动最终解释权归前海红筹所有</p>
                        </div>
                    </div>
                </div>
            </article>
            <c:if test="${empty session_user }">
	            <footer>
	            	<div class="title"></div>
	            	<div class="register pb50">
	                    <div class="inner">
	                        <form class="regist-box clearfix">
	                                <a href="javascript:;" id="immediate" class="px18 fl-r">立即注册</a>
	                                <input id="phone" type="text" placeholder='输入手机号码' class="fl-r" />
	                        </form>
	                        <span class="adorn-1"><img src="${oss }/resources/public/images/activity/april/adorn-ico5.png" /></span>
	                        <span class="adorn-2"><img src="${oss }/resources/public/images/activity/april/adorn-ico6.png" /></span>
	                    </div>
	                </div>
	            </footer>
	        </c:if>
  		</section>
        <c:if test="${empty session_user }">
		    <div class="floatbox">
		    	<a href="${https }/visitor/to-regist"></a>
		    </div>
	    </c:if>
  </main>
  <!--Main end-->
	   	<div style="display:none">
	        <div class="popup-record txt-c" id="record">
	        	<div id="content" class="content"></div>
	            <a id="btnTxt"></a>
	        </div>
	    </div>
		<!-- footer -->
		<jsp:include page="/WEB-INF/views/hc9/footer_new.jsp" />
		<!-- end footer -->
	</div>
	<!--Container end-->
	<script src="${oss }/resources/public/js/flip/jquery-ui.min.js"></script>
	<script src="${oss }/resources/public/js/flip/jquery.flip.min.js"></script>
	<script>
	var aprilAlert = function(content,btnTxt,href) {
		$("#content").html(content);
		$("#btnTxt").html(btnTxt);
		$("#btnTxt").attr("href",href);
		$.fancybox.open({
			href : '#record',
			padding : 0,
			margin:0,
			overlayColor: '#000000',
			overlayOpacity: 1,
			scrolling: 'no',
			closeBtn: true,
			wrapCSS: 'fancybox-transparent',
			helpers: {
				  overlay : {
					  closeClick : false,
				  }
			  },
			  tpl:{
				  closeBtn : '<a title="关闭" class="fancybox-custom-close" href="javascript:;" style="right:22px;top:18px;background:url(/resources/public/js/fancybox/close-gray_24x24.png);width:24px;height:24px;"></a>'
			  },
			  afterClose : function () {
				  resetFlip();
			  }
		})
	}
	var t = {};
	t.flip = {};
	t.flip.imgnum = 1;  // 翻牌图片显示结果值
	t.flip.prizeTxt = '';  // 翻牌中奖后的中奖内容
	/* 设置翻牌结果值 */
	function flipResult(type,result) {
		var _imgNum = 2;  
		if (type == 1) {  // 友善卡
			if (result == 1) {
				t.flip.imgnum = 1;
				t.flip.prizeTxt = '1元现金';
			} else if (result == 2) {
				t.flip.imgnum = 2;
				t.flip.prizeTxt = '3元红包';
			} else {
				t.flip.imgnum = 3;
				t.flip.prizeTxt = '0.1%加息券';
			}
		}
		if (type == 2) {  // 富强卡
			if (result == 1) {
				t.flip.imgnum = 4;
				t.flip.prizeTxt = '5元现金';
			} else if (result == 2) {
				t.flip.imgnum = 5;
				t.flip.prizeTxt = '10元红包';
			} else {
				t.flip.imgnum = 6;
				t.flip.prizeTxt = '0.3%加息券';
			}
		}
		if (type == 3) {  // 爱国卡
			if (result == 1) {
				t.flip.imgnum = 7;
				t.flip.prizeTxt = '20元现金';
			} else if (result == 2) {
				t.flip.imgnum = 8;
				t.flip.prizeTxt = '60元红包';
			} else {
				t.flip.imgnum = 9;
				t.flip.prizeTxt = '0.8%加息券';
			}
		}
		if (type == 4) {  // 敬业卡
			if (result == 1) {
				t.flip.imgnum = 10;
				t.flip.prizeTxt = '100元现金';
			} else if (result == 2) {
				t.flip.imgnum = 11;
				t.flip.prizeTxt = '200元红包';
			} else {
				t.flip.imgnum = 12;
				t.flip.prizeTxt = '1.5%加息券';
			}
		}
	}
	function resetFlip() {
		window.location.reload();
		var top = $(window).scrollTop();
		$(window).scrollTop(top);
	}
	$(function(){
		// 设置抽奖位置
		if ("${sit}" == 1) {
			$(window).scrollTop(3036);
		}
		$(".draw a").click(function(){
			if ("${session_user}" == '') {
				layer.alert('亲，您还没有登录',{title:'提示',icon:0},function(index){
					window.location.href = '${https}/to-login?skip=april/toclimbtop.htm';
					layer.close(index);
				});
			} else {
				var _this = $(this);
				var _type = $(this).attr("data-type");
				if (_type != '') {
					$(".draw a").unbind('click');
					$.ajax({type : 'post',data : {lotteryType:_type},url : '/april/openCardLottery.htm',success : function(data) {
						data = JSON.parse(data)
						var _code = data.code;
						if (_code == 0) {
							var _result = data.lotteryResult;
							var _num = (5-data.totalInvestNum);
							flipResult(_type,_result);
							var prizeTxt = t.flip.prizeTxt;
						    var _imgNum = t.flip.imgnum;
							var _msg = "";
							if (_result == 1) {
								_msg = "恭喜您获得"+prizeTxt+"奖励，我们会在5个工作日内发放<br/>至您的账户";
							} else if (_result == 2) {
								_msg = "恭喜您获得"+prizeTxt;
							} else {
								_msg = "恭喜您获得"+prizeTxt;
							}
							if (_num > 0) {
								_msg =  _msg + "，您今天还有"+_num+"次投资<br/>抽奖机会哦！";
							} else {
								_msg = _msg + "！";
							}
							_this.flip({
								direction: 'lr',
								speed: 300,
								onEnd: function(){
									_this.css({
										background:'url(/resources/public/images/activity/april/prize-img'+_imgNum+'.png) center center no-repeat',
										width:'133',
										height:'180',
										color: 'white',
									});
								}
							});
							setTimeout(function(){
								aprilAlert(_msg,'去投资吧','/loaninfo/loanList.htm?nav=2');
							},1200);
						} else if (_code == -1) {
							layer.alert(data.msg,{title:'提示',icon:0},function(index){
								window.location.href = '/loaninfo/loanList.htm?nav=2';
								layer.close(index);
							});
						} else if (_code == -2) {
							layer.alert('亲，您还没有登录',{title:'提示',icon:0},function(index){
								window.location.href = '${https}/to-login?skip=april/toclimbtop.htm';
								layer.close(index);
							});
						} else if (_code == -3) {
							layer.alert("非法请求，抽奖失败",{title:'提示',icon:0},function(index){
								layer.close(index);
								resetFlip();
							});
						} else if (_code == -4) {
							layer.alert("抽奖活动尚未开始或已结束，感谢您的支持",{title:'提示',icon:0},function(index){
								layer.close(index);
								resetFlip();
							});
						} else {
							layer.alert("系统异常，请稍后重试",{title:'提示',icon:0},function(index){
								layer.close(index);
								resetFlip();
							});
						}
					}});
				}
			}
		});
		$("#immediate").click(function(){
			var phone = $("#phone").val();
			if (/^1[3,4,5,8,7]{1}\d{9}$/.test(phone)) {
				location.href= "${https}/visitor/to-regist?phone="+phone;
			} else {
				layer.alert('手机号格式有误',{title:'提示',icon:0});
			}
		});
	});
	</script>
</body>
</html>