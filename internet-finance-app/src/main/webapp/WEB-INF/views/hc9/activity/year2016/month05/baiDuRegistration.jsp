<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${oss}/resources/public/js/jDialog/jDialog.css" type="text/css">
<script type="text/javascript" src="${oss}/resources/public/js/jquery.js"></script>
<script type="text/javascript" src="${oss}/resources/public/js/jDialog.js"></script>
<script type="text/javascript" src="${oss}/resources/public/js/jDialog/jquery.drag.js"></script>
<script type="text/javascript" src="${oss}/resources/public/js/jDialog/jquery.mask.js"></script>
<script type="text/javascript" src="${oss}/resources/public/js/jDialog/jquery.dialog.js"></script>

<script src="${oss}/resources/public/js/jquery-1.7.2.min.js"></script>
<title>前海红筹-每天钱进一点</title>
<link rel="stylesheet" href="${oss}/resources/public/css/reset.css"/>
<link rel="stylesheet" href="${oss}/resources/public/css/common.css" />
<link rel="stylesheet" href="${oss}/resources/public/css/animate.css" />
<link rel="stylesheet" href="${oss}/resources/activity/year2016/month05/baidu/js/jquery-ui.min.css" />
<script src="${oss}/resources/activity/year2016/month05/baidu/js/jquery-ui.min.js?v=1.0"></script>
<script src="${oss}/resources/activity/year2016/month05/baidu/js/ffpic.js?v=1.0"></script>
<link href="${oss}/resources/public/js/fancybox/jquery.fancybox.css" rel="stylesheet" />
<script src="${oss}/resources/public/js/fancybox/jquery.fancybox.js"></script>
<!--[if lte IE 9]> 
<script src="../js/html5.js"></script>
<script src="../js/selector.js"></script>
<![endif]-->
<style>
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
#floorPage .inner{
	width:1160px;
}

#floorPage .tag{
	position:absolute;
	display:block;
	left:50%;
}
#floorPage header{
	background-color:white;
	border-bottom:1px solid #709095;
	padding:43px 0;
}
#floorPage header .btn{
	border:1px solid #ef4c44;
	color:#ef4c44;
	font-size:16px;
	padding:5px 20px;
	border-radius:5px;
}
#floorPage article{
	background-color:#bdf6ff;
}
#floorPage article .banner{
	background:url(${oss}/resources/activity/year2016/month05/baidu/images/banner-bg.jpg) top center no-repeat;
	height:667px;
	position:relative;
}
#floorPage article .banner .tag{
	background-image:url(${oss}/resources/activity/year2016/month05/baidu/images/sprite-ico.png);
	background-repeat:no-repeat;
}
#floorPage article .banner .login{
	background:url(${oss}/resources/activity/year2016/month05/baidu/images/login-bg.png) 0 0 no-repeat;
	width:460px;
	height:513px;
	position:absolute;
	left:50%;
	top:22px;
	margin-left:170px;
	color:#ffffff;
}
#floorPage article .banner .login .content{
	position:absolute;
	top:86px;
	left:100px;
}
#floorPage article .banner .login .content .mt12{
	margin-top:12px;
}
#floorPage article .banner .login .content .title{
	margin-left:80px;
}
#floorPage article .banner .login .content .bg-white{
	border:1px solid #e2e2e2;
	border-radius:25px;
	-ms-border-radius:25px;
	-webkit-border-radius:25px;
	-o-border-radius:25px;
	height:20px;
	padding:10px;
	line-height:18px;
	width:270px;
}
#floorPage article .banner .login .content .bg-white input{
	background-color:white;
	border-width:0;
	height:20px;
	line-height:20px;
	padding:0;
	width:230px;
}
#floorPage article .banner .login .content .captcha{
	background-color:#5b8fed;
	width:120px;
	height:42px;
	border-radius:25px;
	text-align:center;
	line-height:42px;
	color:#ffffff;
}
#floorPage article .banner .login .content .protocol a{
	color:#ffffff;
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
	border:1px solid #fbe1e6;
}
.input-checkbox:after {
	display:none;
	height:11px;
	width:11px;
	background:url(${oss}/resources/activity/year2016/month05/baidu/images/checked-ico.png) no-repeat;
	background-size:contain;
	left:3px;
	margin-top:-5px;
}
.input-checkbox.checked:after{
	display:block;
}
#floorPage article .banner .tag1{
	background-position:0 -121px;
	width:96px;
	height:98px;
	top:384px;
	margin-left:137px;
}
#floorPage article .banner .tag2{
	background-position:0 0;
	width:119px;
	height:121px;
	top:350px;
	margin-left:44px;
}
#floorPage article .banner .tag3{
	background-position:-193px -61px;
	width:32px;
	height:36px;
	top:308px;
	margin-left:154px;
}
#floorPage article .banner .tag4{
	background-position:-193px -97px;
	width:25px;
	height:27px;
	top:360px;
	margin-left:208px;
}
#floorPage article .banner .tag5{
	background-position:-193px -151px;
	width:83px;
	height:63px;
	top:428px;
	margin-left:-148px;
}
#floorPage article .banner .tag6{
	background-position:-119px 0;
	width:55px;
	height:61px;
	top:342px;
	margin-left:-490px;
}
#floorPage article .banner .tag7{
	background-position:-119px -61px;
	width:74px;
	height:33px;
	top:56px;
	margin-left:-128px;
}
#floorPage article .banner .tag8{
	background-position:-119px -94px;
	width:31px;
	height:20px;
	top:55px;
	margin-left:110px;
}
#floorPage article .banner .tag9{
	background-position:-119px -114px;
	width:27px;
	height:34px;
	top:140px;
	margin-left:190px;
}
#floorPage article .banner .tag10{
	background-position:-225px -61px;
	width:69px;
	height:26px;
	top:585px;
	margin-left:-550px;
}

#floorPage article .main{
	background:url(${oss}/resources/activity/year2016/month05/baidu/images/content-bg.png) 0 0 repeat-y;
}
#floorPage article .main .part_1{
	background:url(${oss}/resources/activity/year2016/month05/baidu/images/part-bg1.jpg) 0 0 no-repeat;
	width:1160px;
	height:445px;
	position:relative;
}
#floorPage article .main .part_1 .tag1{
	margin-left:-550px;
	top:194px;
}
#floorPage article .main .part_1 .tag2{
	margin-left:-245px;
	top:194px;
}
#floorPage article .main .part_1 .tag3{
	margin-left:60px;
	top:194px;
}
#floorPage article .main .part_1 .tag4{
	margin-left:365px;
	top:194px;
}
#floorPage article .main .part_1 .feet{
	background-image:url(${oss}/resources/activity/year2016/month05/baidu/images/feet-50x27.png);
	background-repeat:no-repeat;
	width:50px;
	height:27px;
}
#floorPage article .main .part_1 .tag5{
	background-position:0 0;
	margin-left:-383px;
	top:264px;
}
#floorPage article .main .part_1 .tag6{
	background-position:0 -27px;
	margin-left:-304px;
	top:229px;
}
#floorPage article .main .part_1 .tag7{
	background-position:0 0;
	margin-left:-78px;
	top:264px;
}
#floorPage article .main .part_1 .tag8{
	background-position:0 -27px;
	margin-left:1px;
	top:229px;
}
#floorPage article .main .part_1 .tag9{
	background-position:0 0;
	margin-left:227px;
	top:264px;
}
#floorPage article .main .part_1 .tag10{
	background-position:0 -27px;
	margin-left:306px;
	top:229px;
}
#floorPage article .main .part_2{
	background:url(${oss}/resources/activity/year2016/month05/baidu/images/part-bg2.jpg) 0 0 no-repeat;
	width:1160px;
	height:699px;
	margin-top:60px;
}
#floorPage article .main .part_2 .left{
	margin:210px 0 0 30px;
}
#floorPage article .main .part_2 .right{
	margin:210px 30px 0 0;
}
#floorPage article .main .part_2 .btn{
	background:url(${oss}/resources/activity/year2016/month05/baidu/images/btn-active.png) 0 0 no-repeat;
	width:380px;
	height:78px;
	display:block;
	margin:25px 0 0 76px;
}
#floorPage article .main .part_3{
	background:url(${oss}/resources/activity/year2016/month05/baidu/images/part-bg3.jpg) 0 0 no-repeat;
	width:1160px;
	height:759px;
	margin-top:60px;
	position:relative;
}
#floorPage article .main .part_3 .tag1{
	margin-left:434px;
	top:60px;
}
#floorPage article .main .part_3 .cloud{
	background-image:url(${oss}/resources/activity/year2016/month05/baidu/images/cloud-btn.png);
	background-repeat:no-repeat;
}
#floorPage article .main .part_3 .tag2{
	background-position:0 0;
	width:138px;
	height:93px;
	margin-left:-346px;
	top:210px;
}
#floorPage article .main .part_3 .tag2.active{
	background-position:-138px 0;
	width:212px;
	height:137px;
	margin-left:-378px;
	top:175px;
}
#floorPage article .main .part_3 .tag3{
	background-position:0 -93px;
	width:138px;
	height:93px;
	margin-left:-64px;
	top:210px;
}
#floorPage article .main .part_3 .tag3.active{
	background-position:-138px -137px;
	width:212px;
	height:137px;
	margin-left:-96px;
	top:175px;
}
#floorPage article .main .part_3 .tag4{
	background-position:0 -186px;
	width:138px;
	height:93px;
	margin-left:208px;
	top:210px;
}
#floorPage article .main .part_3 .tag4.active{
	background-position:-138px -274px;
	width:212px;
	height:137px;
	margin-left:176px;
	top:175px;
}
#floorPage article .main .part_3 .bar{
	top:468px;
	margin-left:-502px;
}
#floorPage article .main .part_3 .cube {
  position:absolute;
  background:url(${oss}/resources/activity/year2016/month05/baidu/images/bar-978x134.png) 0 0 no-repeat;
  width:978px;
  height:134px;
}
#slider-range-min {
  position:absolute;
  width: 88%;
  left:10%;
  top:80px;
  margin: 0px;
  z-index:999;
}
.ui-slider {
  height:5px;
  border:none;
  background:#40a3ea;
}
.ui-slider:before, .ui-slider:after {
  content:'';
  position:absolute;
  left:2px;
  width:100%;
  font-family: 'Source Sans Pro', sans-serif;
  font-size:1.2rem;
  font-weight:300;
  color:rgba(0,0,0,0.3);
  letter-spacing:41px;
  text-shadow:1px 1px 0px rgba(255,255,255,0.2);
}
.ui-slider:before {
  top:-1.4rem;
}
.ui-slider:after {
  bottom:-1.4rem;
}
.ui-slider-range {background:transparent;}
.ui-slider .ui-slider-handle {
  top:-208px;
  width:177px;
  height:144px;
  margin-left:-60px;
  padding-top:100px;
  border:none;
  background:url(${oss}/resources/activity/year2016/month05/baidu/images/hint-bg.png) 0 0 no-repeat;
  border-radius:2px;
  text-align:center;
  font-family: 'Microsoft YaHei';
  font-size:16px;
  line-height:20px;
  color:#666666;
  text-decoration:none;
  cursor:pointer;
}
.ui-slider .ui-slider-handle:focus {
  outline:none;
}
#floorPage article .main .part_3 .red-bag{
	background:url(${oss}/resources/activity/year2016/month05/baidu/images/red-bag.png) 0 0 no-repeat;
	width:80px;
	height:53px;
	color:#ffffff;
	text-align:center;
	padding-top:40px;
	top:620px;
}
#floorPage article .main .part_3 .tag5{
	margin-left:-445px;
}
#floorPage article .main .part_3 .tag6{
	margin-left:-274px;
}
#floorPage article .main .part_3 .tag7{
	margin-left:-100px;
}
#floorPage article .main .part_3 .tag8{
	margin-left:70px;
}
#floorPage article .main .part_3 .tag9{
	margin-left:245px;
}
#floorPage article .main .part_3 .tag10{
	margin-left:415px;
}

#floorPage article .main .part_3 .red-bag .hint{
	background:url(${oss}/resources/activity/year2016/month05/baidu/images/hint-bg.png) 0 0 no-repeat;
	width:177px;
	height:154px;
	top:-280px;
	margin-left:-60px;
	color:#666666;
	font-size:16px;
	padding-top:90px;
}
#floorPage article .main .part_4{
	background:url(${oss}/resources/activity/year2016/month05/baidu/images/part-bg4.jpg) 0 0 no-repeat;
	width:1160px;
	height:684px;
	margin-top:60px;
}
#floorPage article .main .part_4 ul{
	position:relative;
	width:1160px;
	height:684px;
}
#floorPage article .main .part_4 ul li{
	position:absolute;
	width:0;
	height:0;
	top:146px;
	left:377px;
	z-index:0;
	cursor:pointer;
	overflow:hidden;
}
#floorPage article .main .part_4 ul li img{
	width:100%;
	height:100%;
	vertical-align:top;
}



#floorPage article .main .part_5{
	background:url(${oss}/resources/activity/year2016/month05/baidu/images/part-bg5.jpg) 0 0 no-repeat;
	width:1160px;
	height:1598px;
	margin-top:60px;
	position:relative;
}
#floorPage article .main .part_5 .figure{
	background-image:url(${oss}/resources/activity/year2016/month05/baidu/images/figure-ico.png);
	background-repeat:no-repeat;
	width:50px;
	height:50px;
}
#floorPage article .main .part_5 .tag1{
	background-position:0 0;
	margin-left:-305px;
	top:1291px;
}
#floorPage article .main .part_5 .tag2{
	background-position:-50px 0;
	margin-left:-340px;
	top:1100px;
}
#floorPage article .main .part_5 .tag3{
	background-position:-100px 0;
	margin-left:-310px;
	top:909px;
}
#floorPage article .main .part_5 .tag4{
	background-position:0 -50px;
	margin-left:-211px;
	top:737px;
}
#floorPage article .main .part_5 .tag5{
	background-position:-50px -50px;
	margin-left:-73px;
	top:588px;
}
#floorPage article .main .part_5 .tag6{
	background-position:-100px -50px;
	margin-left:72px;
	top:446px;
}
#floorPage article .main .part_5 .tag7{
	background-position:0 -100px;
	margin-left:203px;
	top:300px;
}
#floorPage article .main .part_5 .hint{
	background-image:url(${oss}/resources/activity/year2016/month05/baidu/images/hint-sprite.png);
	background-repeat:no-repeat;
	width:554px;
	height:77px;
}
#floorPage article .main .part_5 .tag8{
	background-position:0 0px;
	margin-left:-237px;
	top:1277px;
}
#floorPage article .main .part_5 .tag9{
	background-position:0 -77px;
	margin-left:-272px;
	top:1087px;
}
#floorPage article .main .part_5 .tag10{
	background-position:0 -154px;
	margin-left:-242px;
	top:898px;
}
#floorPage article .main .part_5 .tag11{
	background-position:0 -231px;
	margin-left:-143px;
	top:725px;
}
#floorPage article .main .part_5 .tag12{
	background-position:0 -308px;
	margin-left:-5px;
	top:580px;
}
#floorPage article .main .part_5 .tag13{
	background-position:0 -385px;
	margin-left:-526px;
	top:433px;
}
#floorPage article .main .part_5 .tag14{
	background-position:0 -462px;
	margin-left:-380px;
	top:285px;
}
#floorPage article .main .part_5 .rocket{
	background:url(${oss}/resources/activity/year2016/month05/baidu/images/rocket-227x311.png) 0 0 no-repeat;
	width:227px;
	height:311px;
	margin-left:252px;
	top:-14px;
}
#floorPage article .main .part_5 .btn{
	background:url(${oss}/resources/activity/year2016/month05/baidu/images/regist-btn100.png) 0 0 no-repeat;
	width:188px;
	height:191px;
	margin-left:360px;
	top:1392px;
}



#floorPage footer{
	background:url(${oss}/resources/activity/year2016/month05/baidu/images/footer-bg.png) top center no-repeat;
	height:535px;
	margin-top:-205px;
	color:white;
	font-size:16px;
}
#floorPage footer .inner{
	padding-top:290px;
}
#floorPage footer .service dl{
	background:url(${oss}/resources/activity/year2016/month05/baidu/images/service-img.png) 0 0 no-repeat;
	height:75px;
	padding:10px 0 0 85px;
	line-height:32px;
}
#floorPage footer .service dl dd{
	font-size:30px;
	font-weight:bold;
}
#floorPage footer .service ul{
	margin:30px 0 0 85px;
}
#floorPage footer .border{
	border-right:1px solid #698efa;
	padding-right:25px;
	margin-right:30px;
}
#floorPage footer .site ul{
	padding-top:85px;
	line-height:40px;
}
#floorPage footer .qrcode dl{
	padding-top:15px;
	text-align:center;
}
#floorPage footer .qrcode dl dt{
	background:url(${oss}/resources/activity/year2016/month05/baidu/images/qrcode-hc9.jpg) 0 0 no-repeat;
	width:144px;
	padding-top:155px;
	margin-right:20px;
}
#floorPage footer .qrcode dl dd{
	background:url(${oss}/resources/activity/year2016/month05/baidu/images/qrcode-app.png) 0 0 no-repeat;
	width:148px;
	padding-top:155px;
}
#floorPage article .banner .login .content .prompt{
	position:absolute;
	display:block;
	background:url(${oss}/resources/activity/year2016/month05/baidu/images/prompt-box.png) 0 0 no-repeat;
	width:204px;
	height:42px;
	line-height:42px;
	text-align:center;
	color:#eb5771;
	font-size:14px;
	left:50%;
	margin-left:150px;
}
#floorPage article .banner .login .content .prompt-1{
	display:none;
	top:40px;
} 
#floorPage article .banner .login .content .prompt-2{
	display:none;
	top:95px;
	line-height:20px;
}
#floorPage article .banner .login .content .prompt-3{
	display:none;
	top:148px;
}
#floorPage article .banner .login .content .prompt-4{
	display:none;
	top:203px;
}
#floorPage article .banner .login .content .prompt-5{
	display:none;
	top:258px;
}
/* 弹框 */
.popup-record .popup-bg{
		background:url(${oss}/resources/activity/year2016/month05/baidu/images/popup-img.png) 0 0 no-repeat;
		width:614px;
		height:511px;
		position:relative;
}
.popup-record .popup-bg .tag1{
	position:absolute;
	left:50%;
	margin-left:-250px;
	top:300px;
	font-size:16px;
	color:#333333;
	line-height:32px;
}
.popup-record .popup-bg .tag2{
	display:block;
	width:240px;
	height:42px;
	background-color:#fe5041;
	border-radius:5px;
	-ms-border-radius:5px;
	-webkit-border-radius:5px;
	-o-border-radius:5px;
	color:#ffffff;
	font-size:18px;
	line-height:42px;
	text-align:center;
	position:absolute;
	top:435px;
	left:50%;
	margin-left:-125px;
}
#protocol-record section{
	background-color:white;
	width: 600px;
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
        
        <section id="floorPage">  
            <!--Header begin-->
            <header>
            	<div class="clearfix inner">
                	<div class="fl-l"><a href="/index.htm"><img src="${oss}/resources/activity/year2016/month05/baidu/images/logo-340x44.jpg"/></a></div>
                	<a href="/index.htm" class="fl-r btn">进入首页</a>
                </div>
            </header>
            <!--Header end-->
              
            <!--article begin-->
            <article>
            	<div class="banner scene">
                	<span class="tag tag1 animated fadeInDown" data-delay="300"></span>
                	<span class="tag tag2 animated fadeInDown" data-delay="400"></span>
                	<span class="tag tag3 animated flash" data-delay="700"></span>
                	<span class="tag tag4 animated flash" data-delay="900"></span>
                	<span class="tag tag5 animated wave infinite" data-delay="100"></span>
                	<span class="tag tag6 animated wave infinite" data-delay="200"></span>
                	<span class="tag tag7 animated level infinite" data-delay="100"></span>
                	<span class="tag tag8 animated wave infinite" data-delay="100"></span>
                	<span class="tag tag9 animated level infinite" data-delay="100"></span>
                	<span class="tag tag10 animated level infinite" data-delay="200"></span>
                	<div class="login">
                    	<div class="content">
                        	<span class="title"><img src="${oss}/resources/activity/year2016/month05/baidu/images/title.png" /></span>
                            <form method="post" id="regForm">
                              	<input type="hidden" id="CSRFToken" name="CSRFToken" value="${csrf}" />
                              	<input type="hidden" id="tgId" value="${tgId }" />
                               	<input type="hidden" id="registryFlag" value="0"/>
                                <p class="overflow bg-white mt5">
                                    <img src="${oss}/resources/activity/year2016/month05/baidu/images/login-ico1.gif" width="20" height="22"  class="fl-l mr10" />
                                    <input type="text" id="phone1" name="phone1" maxlength="11" placeholder="请输入手机号码" class="fl-l"> value="userName"/>
                                   	<input type="hidden" id="userName" name="userName" value="${phone1}"/>          
                                    <br class="clear">
                                </p>
                                <p class="overflow bg-white mt12">
                                    <img src="${oss}/resources/activity/year2016/month05/baidu/images/login-ico2.gif" width="20" height="22"  class="fl-l mr10" />
                                    <input type="password" id="pwd" name="pwd" placeholder="请输入6-18位字符的密码" maxlength="18" class="fl-l">    
                                    <br class="clear">
                                </p>
                                <p class="overflow bg-white mt12 fl-l" style="width:142px;">
                                    <img src="${oss}/resources/activity/year2016/month05/baidu/images/login-ico3.gif" width="20" height="22"  class="fl-l mr10" />
                                    <input type="text" id="imgcode" name="imgcode" placeholder="图形验证码"  maxlength="4" class="fl-l" style="width:100px;">
                                    <br class="clear">
                                </p>
                                <a href="#" class="fl-l ml15 mt12"><img src="/cic/code?name=user_login" onclick="this.src='/cic/code?name=user_login&amp;id='+new Date();" title="看不清，点击换一张" /></a>
                                <div class="clear"></div>
                                <p class="overflow bg-white mt12 fl-l" style="width:142px;">
                                    <img src="${oss}/resources/activity/year2016/month05/baidu/images/login-ico4.gif" width="20" height="22"  class="fl-l mr10" />
                                    <input type="text" id="pcode" disabled="disabled" name="pcode" placeholder="手机验证码" maxlength="6" class="fl-l" style="width:100px;">
                                    <br class="clear">
                                </p>
                                <a href="javascript:;" id="sendPCode" class="fl-l mt12 ml10 captcha">获取验证码</a>
                                <div class="clear"></div>
                                <p class="overflow bg-white mt12">
                                    <img src="${oss}/resources/activity/year2016/month05/baidu/images/login-ico5.gif" width="20" height="22"  class="fl-l mr10" />
                                    <input type="text" id="number" name="number" value="${tgId}" maxlength="20" placeholder="推荐码，如无则不填" class="fl-l">
                                    <br class="clear">
                                </p>
                                <div class="protocol mt12 mb10"><span class="input-checkbox">您已阅读并同意</span><a href="#protocol-record" id="protocol">《前海红筹用户服务协议》</a></div>
                      			<a href="javascript:;" id="registSubmit" class="regist-btn"><img src="${oss}/resources/activity/year2016/month05/baidu/images/regist-btn.png" /></a> 
                            </form>
                            <div class="prompt prompt-1"></div>
                            <div class="prompt prompt-2"></div>
                            <div class="prompt prompt-3"></div> 
                            <div class="prompt prompt-4"></div> 
                            <div class="prompt prompt-5"></div> 
                        </div>                         
                    </div>
                </div>
                                                    <!-- <div class="prompt">图形验证码</div> -->
                
                <div class="main">
                	<div class="part_1 inner scene">
                    	<span class="tag tag1 animated bounceIn" data-delay="100"><img src="${oss}/resources/activity/year2016/month05/baidu/images/part-img1.jpg" /></span>
                    	<span class="tag feet tag5 animated flash2" data-delay="300"></span>
                    	<span class="tag feet tag6 animated flash2" data-delay="400"></span>
                    	<span class="tag tag2 animated bounceIn" data-delay="800"><img src="${oss}/resources/activity/year2016/month05/baidu/images/part-img2.jpg" /></span>
                    	<span class="tag feet tag7 animated flash2" data-delay="1000"></span>
                    	<span class="tag feet tag8 animated flash2" data-delay="1100"></span>
                    	<span class="tag tag3 animated bounceIn" data-delay="1500"><img src="${oss}/resources/activity/year2016/month05/baidu/images/part-img3.jpg" /></span>
                    	<span class="tag feet tag9 animated flash2" data-delay="1700"></span>
                    	<span class="tag feet tag10 animated flash2" data-delay="1800"></span>
                    	<span class="tag tag4 animated bounceIn" data-delay="2200"><img src="${oss}/resources/activity/year2016/month05/baidu/images/part-img4.jpg" /></span>
                    </div>
                	
                    <div class="part_2 inner clearfix">
                    	<dl class="left fl-l">
                        	<dt><img src="${oss}/resources/activity/year2016/month05/baidu/images/active-img1.jpg"/></dt>
                            <dd><a href="/neweractivity/totask.htm" class="btn"></a></dd> 
                        </dl>
                        <dl class="right fl-r">
                        	<dt><img src="${oss}/resources/activity/year2016/month05/baidu/images/active-img2.jpg"/></dt>
                            <dd><a href="/activity201605/tofeedback.htm" class="btn"></a></dd>
                        </dl>
                    </div> 
                    <div class="part_3 inner">
                    	<span class="tag tag1"><img src="${oss}/resources/activity/year2016/month05/baidu/images/cloud-ico.png" /></span>
                        <a href="javascript:;" class="tag cloud tag2 active" id="status1"></a>
                        <a href="javascript:;" class="tag cloud tag3" id="status2"></a>
                        <a href="javascript:;" class="tag cloud tag4" id="status3"></a>
                        <div class="tag bar">
                        	<div class="cube">
                        		<div id="slider-range-min"></div>
                            </div>
                        </div>
                        <span class="tag red-bag tag5">0</span>
                        <span class="tag red-bag tag6">1000元</span>
                        <span class="tag red-bag tag7">5000元</span>
                        <span class="tag red-bag tag8">10000元</span>
                        <span class="tag red-bag tag9">10万元</span>
                        <span class="tag red-bag tag10">100万元</span>
                    </div>
                    
                    <div class="part_4 inner" id="safety">
                    	<ul>
                            <li><img src="${oss}/resources/activity/year2016/month05/baidu/images/safety-img1.png" /></li>
                            <li><img src="${oss}/resources/activity/year2016/month05/baidu/images/safety-img2.png" /></li>
                            <li><img src="${oss}/resources/activity/year2016/month05/baidu/images/safety-img3.png" /></li>
                            <li><img src="${oss}/resources/activity/year2016/month05/baidu/images/safety-img4.png" /></li>
                            <li><img src="${oss}/resources/activity/year2016/month05/baidu/images/safety-img5.png" /></li>
                            <li><img src="${oss}/resources/activity/year2016/month05/baidu/images/safety-img1.png" /></li>
                            <li><img src="${oss}/resources/activity/year2016/month05/baidu/images/safety-img2.png" /></li>
                            <li><img src="${oss}/resources/activity/year2016/month05/baidu/images/safety-img3.png" /></li>
                            <li><img src="${oss}/resources/activity/year2016/month05/baidu/images/safety-img4.png" /></li>
                            <li><img src="${oss}/resources/activity/year2016/month05/baidu/images/safety-img5.png" /></li>
                        </ul>
                    </div>
                    
                    <div class="part_5 inner scene">
                    	<span class="tag tag1 figure animated flash2" data-delay="200"></span>
                    	<span class="tag tag2 figure animated flash2" data-delay="400"></span>
                    	<span class="tag tag3 figure animated flash2" data-delay="600"></span>
                    	<span class="tag tag4 figure animated flash2" data-delay="800"></span>
                    	<span class="tag tag5 figure animated flash2" data-delay="1000"></span>
                    	<span class="tag tag6 figure animated flash2" data-delay="1200"></span>
                    	<span class="tag tag7 figure animated flash2" data-delay="1400"></span>
                    	<span class="tag tag8 hint animated rotateInDownLeft" data-delay="600"></span>
                    	<span class="tag tag9 hint animated rotateInDownLeft" data-delay="800"></span>
                    	<span class="tag tag10 hint animated rotateInDownLeft" data-delay="1000"></span>
                    	<span class="tag tag11 hint animated rotateInDownLeft" data-delay="1200"></span>
                    	<span class="tag tag12 hint animated rotateInDownLeft" data-delay="1400"></span>
                    	<span class="tag tag13 hint animated rotateInDownRight" data-delay="1600"></span>
                    	<span class="tag tag14 hint animated rotateInDownRight" data-delay="1800"></span>
                        <span class="tag rocket"></span>
                        <a href="#" id="#registSubmit" class="tag btn"></a>
                    </div>
                </div>
            </article>
            <!--article end-->  
            <!--Footer begin-->
            <footer>
            	<div class="inner clearfix">
                	<div class="fl-l service border">
                    	<dl>
                        	<dt>客服热线：</dt>
                            <dd>400-822-3499</dd>
                        </dl>
                        <ul>
                        	<li>服务时间：</li>
                        	<li>工作日：9:00-17:30</li>
                        	<li>周末及法定节假日：10:00-17:00</li>
                        </ul>
                    </div>
                	<div class="fl-l site border">
                    	<ul>
                        	<li>粤ICP备14077584号</li>
                        	<li>版权所有：深圳市前海红筹互联网金融服务有限公司</li>
                        	<li>地址：深圳市福田区深南大道4001号时代金融中心15楼</li>
                        </ul>
                    </div>
                	<div class="fl-l qrcode">
                    	<dl class="clearfix">
                        	<dt class="fl-l">关注公众号</dt>
                            <dd class="fl-l">下载APP</dd>
                        </dl>
                    </div>
                </div>
            </footer>            
            <!--Footer end-->
    	</section>
        
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
					<a style="position: absolute;top:540px;left:50%;margin-left: -130px;background-color: #f15252; color:#ffffff; text-decoration: none; padding: 10px 100px;border-radius:25px;" id="Lqload"  href="/neweractivity/totask.htm">去领取</a>
					<a style="position: absolute;top:600px;left:50%;margin-left: -130px;background-color: white; color:#f15252; text-decoration: none;border:1px solid #f15252; padding: 8px 88px;border-radius:25px;" id="KtLoad" href="/member_index/member_center.htm?index=0_0_3&nav=5">开通宝付</a>
				</div>
			</div>
		</div>
        
    </div>
    <!--Container end-->
   
    <script src="${oss}/resources/public/js/jquery.appear.js?v=1.0.0"></script>
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
		//拉拽
		$('#slider-range-min').slider({
	        range: 'min',
	        value: 0,
	        min: 0,
	        max: 5,
	        slide: function (event, ui) {
				var value=ui.value;				
				var earnings=0;
				if(value ==0) {
					 $('.ui-slider-handle').html('拖至对应金额算收益');
				} else
				if(value ==1) {
					 $('.ui-slider-handle').html('红筹收益：<font color="#fe738a">' + 8.33 + '</font>元<font color="#fe738a">+</font><br>某宝收益：<font color="#fe738a">' + 2.08 + '</font>元');
				} else if(value == 2) {
					 $('.ui-slider-handle').html('红筹收益：<font color="#fe738a">' + 41.66 + '</font>元<font color="#fe738a">+</font><br>某宝收益：<font color="#fe738a">' + 10.41 + '</font>元');
				} else if(value == 3) {
					 $('.ui-slider-handle').html('红筹收益：<font color="#fe738a">' + 83.33 + '</font>元<font color="#fe738a">+</font><br>某宝收益：<font color="#fe738a">' + 20.83 + '</font>元');
				} else if(value == 4) {
					 $('.ui-slider-handle').html('红筹收益：<font color="#fe738a">' + 833.33 + '</font>元<font color="#fe738a">+</font><br>某宝收益：<font color="#fe738a">' + 208.33 + '</font>元');
				}else if(value == 5) {
					 $('.ui-slider-handle').html('红筹收益：<font color="#fe738a">' + 8333.33 + '</font>元<font color="#fe738a">+</font><br>某宝收益：<font color="#fe738a">' + 2083.33 + '</font>元');
				}
	        }
	    });
	    $('.ui-slider-handle').html('拖至对应金额算收益');
		
		$('#status1').click(function(){
			$(this).addClass("active")	
			$('#status2').removeClass("active")
			$('#status3').removeClass("active")
			$('.ui-slider-handle').css("background-image","url(${oss}/resources/activity/year2016/month05/baidu/images/hint-bg.png)")
			//拉拽
			$('.ui-slider-handle').html('拖至对应金额算收益');
			$('#slider-range-min').slider({
				range: 'min',
				value: 0,
				min: 0,
				max: 5,
				slide: function (event, ui) {
					var value=ui.value;				
					var earnings=0;
					if(value ==0) {
						 $('.ui-slider-handle').html('拖至对应金额算收益');
					} else
					if(value ==1) {
						 $('.ui-slider-handle').html('红筹收益：<font color="#fe738a">' + 8.33 + '</font>元<font color="#fe738a">+</font><br>某宝收益：<font color="#fe738a">' + 2.08 + '</font>元');
					} else if(value == 2) {
						 $('.ui-slider-handle').html('红筹收益：<font color="#fe738a">' + 41.66 + '</font>元<font color="#fe738a">+</font><br>某宝收益：<font color="#fe738a">' + 10.41 + '</font>元');
					} else if(value == 3) {
						 $('.ui-slider-handle').html('红筹收益：<font color="#fe738a">' + 83.33 + '</font>元<font color="#fe738a">+</font><br>某宝收益：<font color="#fe738a">' + 20.83 + '</font>元');
					} else if(value == 4) {
						 $('.ui-slider-handle').html('红筹收益：<font color="#fe738a">' + 833.33 + '</font>元<font color="#fe738a">+</font><br>某宝收益：<font color="#fe738a">' + 208.33 + '</font>元');
					}else if(value == 5) {
						 $('.ui-slider-handle').html('红筹收益：<font color="#fe738a">' + 8333.33 + '</font>元<font color="#fe738a">+</font><br>某宝收益：<font color="#fe738a">' + 2083.33 + '</font>元');
					}
				}
			});
		})
$('#status2').click(function(){
			$(this).addClass("active")
			$('#status1').removeClass("active")
			$('#status3').removeClass("active")
			$('.ui-slider-handle').css("background-image","url(${oss}/resources/activity/year2016/month05/baidu/images/hint-bg02.png)")
			//拉拽
			$('.ui-slider-handle').html('拖至对应金额算收益');
			$('#slider-range-min').slider({
				range: 'min',
	        	value: 0,
				min: 0,
				max: 5,
				slide: function (event, ui) {
					var value=ui.value;				
					var earnings=0;
					if(value ==0) {
						 $('.ui-slider-handle').html('拖至对应金额算收益');
					} else
					if(value ==0) {
						 $('.ui-slider-handle').html('拖至对应金额算收益');
					} else
					if(value ==1) {
						 $('.ui-slider-handle').html('红筹收益：<font color="#fe738a">' + 26.49 + '</font>元<font color="#fe738a">+</font><br>某宝收益：<font color="#fe738a">' + 2.08 + '</font>元');
					} else if(value == 2) {
						 $('.ui-slider-handle').html('红筹收益：<font color="#fe738a">' + 132.49 + '</font>元<font color="#fe738a">+</font><br>某宝收益：<font color="#fe738a">' + 10.41 + '</font>元');
					} else if(value == 3) {
						 $('.ui-slider-handle').html('红筹收益：<font color="#fe738a">' + 264.99 + '</font>元<font color="#fe738a">+</font><br>某宝收益：<font color="#fe738a">' + 20.83 + '</font>元');
					} else if(value == 4) {
						 $('.ui-slider-handle').html('红筹收益：<font color="#fe738a">' + 2649.99 + '</font>元<font color="#fe738a">+</font><br>某宝收益：<font color="#fe738a">' + 208.33 + '</font>元');
					}else if(value == 5) {
						 $('.ui-slider-handle').html('红筹收益：<font color="#fe738a">' + 26499.9+ '</font>元<font color="#fe738a">+</font><br>某宝收益：<font color="#fe738a">' + 2083.33 + '</font>元');
					}
				}
			});
		})
		$('#status3').click(function(){
			$(this).addClass("active")	
			$('#status1').removeClass("active")
			$('#status2').removeClass("active")
			$('.ui-slider-handle').css("background-image","url(${oss}/resources/activity/year2016/month05/baidu/images/hint-bg03.png)")
			//拉拽
			$('.ui-slider-handle').html('拖至对应金额算收益');
			$('#slider-range-min').slider({
				range: 'min',
	        	value: 0,
				min: 0,
				max: 5,
				slide: function (event, ui) {
					var value=ui.value;				
					var earnings=0;
					if(value ==0) {
						 $('.ui-slider-handle').html('拖至对应金额算收益');
					} else
					if(value ==0) {
						 $('.ui-slider-handle').html('拖至对应金额算收益');
					} else
					if(value ==1) {
						 $('.ui-slider-handle').html('红筹收益：<font color="#fe738a">' + 57.99 + '</font>元<font color="#fe738a">+</font><br>某宝收益：<font color="#fe738a">' + 2.08 + '</font>元');
					} else if(value == 2) {
						 $('.ui-slider-handle').html('红筹收益：<font color="#fe738a">' + 289.99 + '</font>元<font color="#fe738a">+</font><br>某宝收益：<font color="#fe738a">' + 10.41 + '</font>元');
					} else if(value == 3) {
						 $('.ui-slider-handle').html('红筹收益：<font color="#fe738a">' + 579.99 + '</font>元<font color="#fe738a">+</font><br>某宝收益：<font color="#fe738a">' + 20.83 + '</font>元');
					} else if(value == 4) {
						 $('.ui-slider-handle').html('红筹收益：<font color="#fe738a">' + 5799.99 + '</font>元<font color="#fe738a">+</font><br>某宝收益：<font color="#fe738a">' + 208.33 + '</font>元');
					}else if(value == 5) {
						 $('.ui-slider-handle').html('红筹收益：<font color="#fe738a">' + 57999.9 + '</font>元<font color="#fe738a">+</font><br>某宝收益：<font color="#fe738a">' + 2083.33 + '</font>元');
					}
				}
			});
		})

	});
	</script>
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
	   	          },tpl:{
	   	              closeBtn : '<a title="关闭" class="fancybox-custom-close" href="javascript:;" style="right:30px;top:10px;background:url(${oss}/resources/public/js/fancybox/close-gray_24x24.png);width:24px;height:24px;"></a>'
	   	          }
	   	    	})
	    });
    </script>
	<script type="text/javascript" src="${oss}/resources/activity/year2016/month05/baidu/js/baiduSignup.js?v=1.0.4"></script>
	<div style="display:none">
		<script src="https://s4.cnzz.com/z_stat.php?id=1254954304&web_id=1254954304" language="JavaScript"></script>
	</div>
</body>
</html>