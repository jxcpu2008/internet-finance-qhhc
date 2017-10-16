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
<link rel="stylesheet"
	href="${oss}/resources/public/js/layer/skin/layer.css" />
<script src="${oss}/resources/public/js/main.js"></script>
<script src="${oss}/resources/public/js/layer/layer.js"></script>
<!--[if lte IE 9]> 
<script src="${oss}/resources/public/js/html5.js"></script> 
<script src="${oss}/resources/public/js/selector.js"></script>
<![endif]-->
<style>
#peach{
	background-color:#f4f6e9;
}
#peach .inner{
	width:1050px;
}
#peach .banner{
	background:url(http://hcfile.hc9.com/resources/public/images/activity/gold/banner.jpg) top center no-repeat;
	height:700px;
	position:relative;
}
#peach .tag{
	display:block;
	position:absolute;
}
#peach .banner .tag1{
	left:50%;
	margin-left:-294px;
	top:79px;
}
#peach .banner span{
	font-size:20px;
	color:#80bc1b;
}
#peach .banner .tag2{
	left:50%;
	margin-left:-218px;
	top:500px;
}
#peach .banner .tag3{
	left:50%;
	margin-left:-182px;
	top:537px;
}

#peach .title{
	height:130px;
	position:relative;
}
#peach .title span{
	color:#80bc1b;
}
#peach .part_3,
#peach .part_2,
#peach .part_1{
	border-bottom:1px solid #d1e4ab;
}
#peach .part_1 .title .tag1{
	left:50%;
	margin-left:-528px;
	top:0;
}
#peach .part_1 .title .tag2{
	left:50%;
	margin-left:320px;
	top:0;
}
#peach .part_1 .title .tag3{
	left:50%;
	margin-left:-294px;
	top:32px;
}
#peach .part_1 .title .tag4{
	left:50%;
	margin-left:-210px;
	top:78px;
}
#peach .part_1 .title .tag5{
	left:50%;
	margin-left:-136px;
	top:100px;
}
#peach .part_1 article .branch-bg{
	background:url(/resources/public/images/activity/gold/branch-bg.png) top center no-repeat;
	width:996px;
	height:527px;
	margin-top:68px;
	position:relative;
}
/*#peach .part_1 article .branch-bg a{
	display:block;
	background:url(images/peach-img.png) center center no-repeat;
	width:227px;
	height:180px;
	position:absolute;
}
#peach .part_1 article .branch-bg a:nth-child(1){
	top:-36px;
	left:390px;
}
#peach .part_1 article .branch-bg a:nth-child(2){
	top:0;
	left:782px;
}
#peach .part_1 article .branch-bg a:nth-child(3){
	top:162px;
	left:590px;
}
#peach .part_1 article .branch-bg a:nth-child(4){
	top:132px;
	left:244px;
}
#peach .part_1 article .branch-bg a:nth-child(5){
	top:170px;
	left:52px;
}
#peach .part_1 article .branch-bg a:hover{
	background-image:url(images/peach-img2.png);
	animation: flash 1s linear;
}
#peach .part_1 article .branch-bg a:hover img{
	display:block;
}*/
#peach .part_1 article .branch-bg a{
	display:block;
	width:227px;
	height:190px;
	position:absolute;
}
#peach .part_1 article .branch-bg a:nth-child(1){
	top:-41px;
	left:390px;
}
#peach .part_1 article .branch-bg a:nth-child(2){
	top:-5px;
	left:782px;
}
#peach .part_1 article .branch-bg a:nth-child(3){
	top:157px;
	left:590px;
}
#peach .part_1 article .branch-bg a:nth-child(4){
	top:127px;
	left:244px;
}
#peach .part_1 article .branch-bg a:nth-child(5){
	top:165px;
	left:52px;
}
#peach .part_1 article .branch-bg .btn{
	width:228px;
	height:190px;
	position:relative;
}
#peach .part_1 article .branch-bg .btn-bg{
	display:block;
	background:url(/resources/public/images/activity/gold/star2.png) center center no-repeat;
	width:228px;
	height:190px;
	animation:none;
	position:absolute;
	left:0;
	top:0;
	display:none;
}
#peach .part_1 article .branch-bg .btn-bg2{
	background:url(/resources/public/images/activity/gold/star1.png) center center no-repeat;
	width:228px;
	height:190px;
	animation:none;
	position:absolute;
	left:0;
	top:0;
	display:none;
}
#peach .part_1 article .branch-bg .btn-bg3{
	background:url(/resources/public/images/activity/gold/peach-img.png) center center no-repeat;
	width:228px;
	height:190px;
	position:absolute;
	left:0;
	top:0;
}
#peach .part_1 article .branch-bg a:hover .btn .btn-bg3{
	background-image:url(/resources/public/images/activity/gold/peach-img2.png);
}
#peach .part_1 article .branch-bg a:hover .btn .btn-bg2{
	animation: flash2 4s linear infinite;
	-moz-animation: flash2 4s linear infinite;
	-ms-animation: flash2 4s linear infinite;
	-o-animation: flash2 4s linear infinite;
	-webkit-animation: flash2 4s linear infinite;
	display:block;
}
#peach .part_1 article .branch-bg a:hover .btn .btn-bg{
	animation: flash2 2s linear infinite;
	-moz-animation: flash2 2s linear infinite;
	-ms-animation: flash2 2s linear infinite;
	-o-animation: flash2 2s linear infinite;
	-webkit-animation: flash2 2s linear infinite;
	
	display:block;
}
@keyframes flash2 {
  0%,50%,100% {
    opacity: 1;
  }

  30%,70% {
    opacity: 0;
  }
}

@-webkit-keyframes flash2 {
  0%,50%,100% {
    opacity: 1;
  }

  30%,70% {
    opacity: 0;
  }
}
@-moz-keyframes flash2 {
  0%,50%,100% {
    opacity: 1;
  }

  30%,70% {
    opacity: 0;
  }
}

#peach .part_1 article .branch-bg ul{
	position:absolute;
	left:400px;
	top:420px;
}
#peach .part_1 article .branch-bg ul li{
	background-color:#f2eac3;
	font-size:18px;
	color:#332223;
	margin-bottom:8px;
	text-align:center;
	padding:8px 40px;
	border-radius:30px;
}
#peach footer p{
	color:#333333;
	font-size:14px;
	line-height:20px;
	padding:20px 0 70px 24px;
}

#peach .part_3{
	margin-top:32px;
}
#peach .part_2{
	margin-top:58px;
}
#peach .part_2 .title .tag1{
	left:50%;
	margin-left:-500px;
	top:0;
}
#peach .part_2 .title .tag2{
	left:50%;
	margin-left:286px;
	top:0;
}
#peach .part_2 .title .tag3{
	left:50%;
	margin-left:-259px;
	top:32px;
}
#peach .part_2 .parcel{
	position:relative;
	height:156px;
}
#peach .part_2 .parcel .tag1{
	background:url(/resources/public/images/activity/gold/part-bg1.png) 0 0 no-repeat;
	width:523px;
	height:134px;
	top:0;
	left:24px;
}
#peach .part_2 .parcel p{
	color:#ffffff;
	font-size:18px;
	line-height:24px;
	padding:30px 0 0 80px;
}
#peach .part_2 .parcel .tag2{
	background:url(/resources/public/images/activity/gold/part-bg2.png) 0 0 no-repeat;
	width:532px;
	height:134px;
	top:0;
	left:484px;
}

#peach .part_3 .title .tag1{
	left:50%;
	margin-left:-322px;
	top:0;
}
#peach .part_3 .title .tag2{
	left:50%;
	margin-left:114px;
	top:0;
}
#peach .part_3 .title .tag3{
	left:50%;
	margin-left:-84px;
	top:32px;
}
#peach .part_3 .title .tag4{
	left:50%;
	margin-left:-220px;
	top:100px;
}
#peach .part_3 .title .tag5{
	left:50%;
	margin-left:-288px;
	top:120px;
}
#peach .part_3 .prize{
	width:992px;
	height:330px;
	position:relative;
	margin-top:10px;
}
#peach .part_3 .prize .tag1{
	left:14px;
	top:84px;
}
#peach .part_3 .prize .tag2{
	left:122px;
	top:300px;
}
#peach .part_3 .prize .tag3{
	left:376px;
	top:84px;
}
#peach .part_3 .prize .tag4{
	left:484px;
	top:300px;
}
#peach .part_3 .prize .tag5{
	left:730px;
	top:84px;
}
#peach .part_3 .prize .tag6{
	left:838px;
	top:300px;
}
#peach .part_3 .ranklist{
	padding:0 24px;
	margin-top:74px;
}
#peach .part_3 .ranklist table{
	border:1px solid #80bc1b;
}
#peach .part_3 .ranklist table td{
	color:#80bc1b;
	font-size:18px;
	padding:10px 0;
	border:1px solid #e6f2d1;
}
#peach .part_3 .ranklist table tr:nth-child(2) td{
	padding:4px 0;
}
#peach .part_3 .ranklist table td.greenBg{
	color:white;
	background-color:#80bc1b;
	border:none;
}



#peach .partTwo p{
	font-size:14px;
	color:#80bc1b;
}
#peach .partTwo .part1{
	position:relative;
	height:435px;
}
#peach .partTwo .part1 .sprites{
	background-image:url(/resources/public/images/activity/gold/part1-sprites.png);
}
#peach .partTwo .part1 .tag1{
	width:180px;
	height:352px;
	background-position:0 -102px;
	left:50px;
	top:80px;
}
#peach .partTwo .part1 .tag2{
	width:97px;
	height:102px;
	background-position:0 0;
	left:0;
	top:134px;
}
#peach .partTwo .part1 .tag3{
	width:164px;
	height:40px;
	background-position:0 -454px;
	left:413px;
	top:145px;
}
#peach .partTwo .part1 .tag4 ul li{
	background-color:#eb4d4c;
	width:129px;
	height:27px;
	line-height:27px;
	text-align:center;
	color:#ffffff;
	font-size:14px;
	letter-spacing: 4px;
}
#peach .partTwo .part1 .tag4 ul{
	background-color:#f2f2f2;
	padding:20px 33px;
	border-radius:6px;
}
#peach .partTwo .part1 .tag4{
	background-color:#fefefe;
	padding:10px;
	border-radius:8px;
	box-shadow:0 10px 1px rgba(0,0,0,0.1);
	-webkit-box-shadow:0 10px 1px rgba(0,0,0,0.1);
	-moz-box-shadow:0 10px 1px rgba(0,0,0,0.1);
	-o-box-shadow:0 10px 1px rgba(0,0,0,0.1);
	-ms-box-shadow:0 10px 1px rgba(0,0,0,0.1);
	left:121px;
	top:234px;
}
#peach .partTwo .part1 .tag5{
	left:413px;
	top:194px;
}
#peach .partTwo .part1 .tag6{
	background-color:#ffffff;
	color:#eb4d4c;
	padding:10px 40px;
	border-radius:6px;
	box-shadow:0 10px 1px rgba(0,0,0,0.1);
	-webkit-box-shadow:0 10px 1px rgba(0,0,0,0.1);
	-moz-box-shadow:0 10px 1px rgba(0,0,0,0.1);
	-o-box-shadow:0 10px 1px rgba(0,0,0,0.1);
	-ms-box-shadow:0 10px 1px rgba(0,0,0,0.1);
	left:424px;
	top:253px;
}
#peach .partTwo .part1 .tag6:active{
	top:260px;
	box-shadow:0 3px 1px rgba(0,0,0,0.1);
	-webkit-box-shadow:0 3px 1px rgba(0,0,0,0.1);
	-moz-box-shadow:0 3px 1px rgba(0,0,0,0.1);
	-o-box-shadow:0 3px 1px rgba(0,0,0,0.1);
	-ms-box-shadow:0 3px 1px rgba(0,0,0,0.1);
}


#peach .partTwo .part2{
	position:relative;
	height:320px;
}
#peach .partTwo .part2 .sprites{
	background-image:url(/resources/public/images/activity/gold/part2-sprites.png);
}
#peach .partTwo .part2 .tag1{
	width:164px;
	height:40px;
	background-position:0 -160px;
	left:0;
	top:106px;
}
#peach .partTwo .part2 .tag2 ul li{
	background-color:#eb4d4c;
	width:220px;
	height:42px;
	line-height:42px;
	text-align:center;
	color:#ffffff;
	font-size:18px;
	letter-spacing: 4px;
}
#peach .partTwo .part2 .tag2 ul{
	background-color:#f2f2f2;
	padding:64px 56px;
	border-radius:6px;
}
#peach .partTwo .part2 .tag2{
	background-color:#fefefe;
	padding:20px;
	border-radius:8px;
	box-shadow:0 10px 1px rgba(0,0,0,0.1);
	-webkit-box-shadow:0 10px 1px rgba(0,0,0,0.1);
	-moz-box-shadow:0 10px 1px rgba(0,0,0,0.1);
	-o-box-shadow:0 10px 1px rgba(0,0,0,0.1);
	-ms-box-shadow:0 10px 1px rgba(0,0,0,0.1);
	left:544px;
	top:76px;
}
#peach .partTwo .part2 .tag3{
	width:97px;
	height:102px;
	background-position:0 0;
	left:527px;
	top:45px;
}
#peach .partTwo .part2 .tag4{
	width:84px;
	height:160px;
	background-position:-97px 0;
	left:873px;
	top:160px;
}
#peach .partTwo .part2 .tag5{
	left:5px;
	top:155px;
}

#peach .partTwo .part3{
	position:relative;
	height:380px;
}
#peach .partTwo .part3 .sprites{
	background-image:url(/resources/public/images/activity/gold/part3-sprites.png);
}
#peach .partTwo .part3 .tag1{
	width:180px;
	height:352px;
	background-position:0 -102px;
	left:50px;
	top:28px;
}
#peach .partTwo .part3 .tag2{
	width:97px;
	height:102px;
	background-position:0 0;
	left:0px;
	top:81px;
}
#peach .partTwo .part3 .tag3{
	width:164px;
	height:40px;
	background-position:0 -454px;
	left:415px;
	top:139px;
}
#peach .partTwo .part3 .tag4 ul{
	background-color:#f2f2f2;
	padding:25px 28px;
	border-radius:6px;
}
#peach .partTwo .part3 .tag4{
	background-color:#fefefe;
	padding:10px;
	border-radius:8px;
	box-shadow:0 10px 1px rgba(0,0,0,0.1);
	-webkit-box-shadow:0 10px 1px rgba(0,0,0,0.1);
	-moz-box-shadow:0 10px 1px rgba(0,0,0,0.1);
	-o-box-shadow:0 10px 1px rgba(0,0,0,0.1);
	-ms-box-shadow:0 10px 1px rgba(0,0,0,0.1);
	left:121px;
	top:126px;
}
#peach .partTwo .part3 .tag5{
	left:415px;
	top:188px;
}
.rule p{
	margin-left:24px;
	padding:45px 50px;
	background-color:#80bc1b;
	border-radius:8px;
	color:#ffffff;
	font-size:14px;
	line-height:32px;
}
#peach .register .regist-box{
	padding:54px 65px;
    border: 1px solid #80bc1b;
    background: #fafafa url(/resources/assets/images/home/logo.png) 86px center no-repeat;
	text-align:right;
	background-color:#fafafa;
	margin:115px 0 0 24px;
}
#peach .register .regist-box input{
    width: 290px;
    height: 49px;
    border: 1px solid #f94040;
	padding:0 20px;
}
#peach .register .regist-box a{
    width: 157px;
    height: 51px;
    line-height: 51px;
    background-color: #f94040;
    color: #fff;
    text-align: center;
}

#peach .part_3 article,
#peach .part_2 article,
#peach .part_1 article{
	position:relative;
}
#peach article .leaf{
	position:absolute;
}
#peach article .leaf_1{
	left:-400px;
	top:185px;
}
#peach article .leaf_2{
	right:-427px;
	top:312px;
}
#peach article .leaf_3{
	left:-427px;
	top:614px;
}
#peach article .leaf_4{
	right:-427px;
	top:1186px;
}
#peach article .leaf_5{
	right:-427px;
	top:915px;
}
.popup-record{
	width:338px;
	height:179px;
	background-color:#ffffff;
	border:6px solid #7e8078;
}
.popup-record p{
	font-size:14px;
	color:#575757;
	margin-bottom:40px;
	padding-top:50px;
}
.popup-record a{
	color:#ffffff;
	font-size:14px;
	background-color:#80bc1b;
	border-radius:20px;
	padding:5px 40px;
}
#peach .floatbox{
	position:fixed;
	z-index:99;
	left:50%;
	top:50%;
	margin-left:600px;
	background:url(/resources/public/images/activity/planner/fixed-bg-gold.png) 0 0 no-repeat;
	width:272px;
	height:177px;
}
#peach .floatbox a{
	display:block;
	width:120px;
	height:90px;
	position:absolute;
	left:81px;
	top:64px;
}
</style>
</head>
<body>
	<!--Container begin-->
	<div id="container">
		<jsp:include page="/WEB-INF/views/hc9/header_new.jsp" />
		
		<!--Main begin-->
  <main id="peach" role="main" style="margin-bottom:-50px;">
  
        <div class="banner scene">
        	<span class="tag tag1 animated tada" data-delay="300"><img src="${oss }/resources/public/images/activity/gold/banner-img.png" /></span>
        	<span class="tag tag2 animated bounceInDown" data-delay="500">注册即获2-100元开春礼金，推荐注册赢无上限奖励</span>
        	<span class="tag tag3 animated fadeInUp" data-delay="1200">活动时间：2016年3月1日-2016年3月31日</span>
        </div>
        
        <section class="part_1">
            <header class="title scene">
                <span class="tag tag1"><img src="${oss }/resources/public/images/activity/gold/title-left.png" /></span>
                <span class="tag tag2"><img src="${oss }/resources/public/images/activity/gold/title-right.png" /></span>
                <span class="tag tag3 animated fadeInUp" data-delay="200"><img src="${oss }/resources/public/images/activity/gold/title1.png" /></span>
                <span class="tag tag4 animated fadeInUp" data-delay="1000">活动期间，在前海红筹成功注册的用户，即可获得一次开启金桃机会</span>
				<span class="tag tag5 animated fadeInUp" data-delay="1200">每颗金桃内含奖金2-100元不等，100%中奖</span>
            </header>
            <article class="inner">
            	<div class="branch-bg">
                	<a href="javascript:;">
                        <div class="btn">
                        	<div class="btn-bg"></div>
                            <div class="btn-bg2"></div>
                            <div class="btn-bg3"></div>
                        </div>
                    </a>
                    <a href="javascript:;">
                        <div class="btn">
                        	<div class="btn-bg"></div>
                            <div class="btn-bg2"></div>
                            <div class="btn-bg3"></div>
                        </div>
                    </a>
                    <a href="javascript:;">
                        <div class="btn">
                        	<div class="btn-bg"></div>
                            <div class="btn-bg2"></div>
                            <div class="btn-bg3"></div>
                        </div>
                    </a>
                    <a href="javascript:;">
                        <div class="btn">
                        	<div class="btn-bg"></div>
                            <div class="btn-bg2"></div>
                            <div class="btn-bg3"></div>
                        </div>
                    </a>
                    <a href="javascript:;">
                        <div class="btn">
                        	<div class="btn-bg"></div>
                            <div class="btn-bg2"></div>
                            <div class="btn-bg3"></div>
                        </div>
                    </a>
                    <ul>
                    	<li>您还有  <span id="lotteryNum">${lotteryNum }</span>  次机会</li>
                        <li>选中金桃，抽取礼金</li>
                    </ul>
                </div>
                <div class="leaf leaf_1"><img src="${oss }/resources/public/images/activity/gold/leaf-img1.png" /></div>
                <div class="leaf leaf_2"><img src="${oss }/resources/public/images/activity/gold/leaf-img2.png" /></div>
            </article>
            <footer class="inner">
            	<p>温馨提示：<br>新用户抽取礼金后，有效工作日48小时内发放至奖励中奖账户；</p>
            </footer>
        </section>
        
        <section class="part_2">
            <header class="title scene">
                <span class="tag tag1"><img src="${oss }/resources/public/images/activity/gold/title-left.png" /></span>
                <span class="tag tag2"><img src="${oss }/resources/public/images/activity/gold/title-right.png" /></span>
                <span class="tag tag3 animated fadeInUp" data-delay="200"><img src="${oss }/resources/public/images/activity/gold/title2.png" /></span>
            </header>
            <article class="inner">
            	<div class="parcel scene">
                	<div class="tag tag1">
                		<p>每邀请1位好友注册<br>即赠送一次<br>开启金桃的机会</p>
                	</div>
                	<div class="tag tag2">
                		<p style="padding:30px 0 0 144px;">如您每邀请9位好友注册<br>并完成实名验证<br>您还可再获得20元红包</p>
                	</div>
                </div>
            </article>
            <footer class="inner">
            	<p>温馨提示：<br>1、20元红包分为2个10元无门槛红包，可认购优先级产品使用，有效期3个月；<br>2、当您邀请好友注册并验证身份的人数满足上述条件后，红包即时到账；现金奖励将在有效工作日48小时内发放至奖励中奖账户；</p>
            </footer>
        </section>
        
        <section class="part_3">
            <header class="title scene">
                <span class="tag tag1"><img src="${oss }/resources/public/images/activity/gold/title-left.png" /></span>
                <span class="tag tag2"><img src="${oss }/resources/public/images/activity/gold/title-right.png" /></span>
                <span class="tag tag3 animated fadeInUp" data-delay="200"><img src="${oss }/resources/public/images/activity/gold/title3.png" /></span>
                <span class="tag tag4 animated fadeInUp" data-delay="400">活动结束后，如您累计推荐好友数排在前10，您将荣登“红筹琅琊榜”；</span>
				<span class="tag tag5 animated fadeInUp" data-delay="600">如您累计推荐好友数排在前3，且不低于50名（含50名）好友，还能获得现金奖励，奖励如下：</span>
            </header>
            <article class="inner">
            	<div class="prize scene">
                	<span class="tag tag1"><img src="${oss }/resources/public/images/activity/gold/redPacket-200.png" /></span>
                    <span class="px18 tag tag2">第一名获得</span>
                	<span class="tag tag3"><img src="${oss }/resources/public/images/activity/gold/redPacket-100.png" /></span>
                    <span class="px18 tag tag4">第二名获得</span>
                	<span class="tag tag5"><img src="${oss }/resources/public/images/activity/gold/redPacket-50.png" /></span>
                    <span class="px18 tag tag6">第三名获得</span>
                </div>
                <div class="ranklist">
                	
                     <table width="1000"  border="0" cellpadding="0" cellspacing="0" class="txt-c">
                            <col width="20%"/>
                            <col width="40%"/> 
                            <col width="40%"/>
                     		
                            <tr>
                            	<td colspan="3" class="greenBg" style="font-size:22px;">红筹琅琊榜(实时更新中)</td>
                            </tr>
                            <tr>
                                <td bgcolor="#e6f2d1">排名</td>
                                <td bgcolor="#e6f2d1">手机号</td>
                                <td bgcolor="#e6f2d1">累计推荐注册人数</td>
                            </tr>
                            <c:forEach var="peach" items="${goldPeachBillBoards }" varStatus="i" begin="0" end="9">
                            	<tr>
	                                <td bgcolor="#ffffff">${i.count }</td>
	                                <c:set var="phone" value="${peach[0].toString() }" />
	                                <td bgcolor="#ffffff">${phone.replace(phone.substring(3,phone.length()-4),'****') }</td>
	                                <td bgcolor="#ffffff"><fmt:formatNumber type="number" value="${peach[1] }" /></td>
	                            </tr>
	                    	</c:forEach>
	                    	<c:if test="${empty goldPeachBillBoards }">
								<tr ><td colspan="3" style="text-align: center;font-size: 25px;color: #787878;padding: 50px;">暂时没有用户入榜</td></tr>
							</c:if>
                            <tr>
                            	<td colspan="3" class="greenBg"><em class="pr50 mr25">当前我的排名：  <c:if test="${empty session_user }"><a href="${https }/visitor/to-login?skip=activity/peachActivity.htm" >未登录</a></c:if><c:if test="${!empty session_user }"><c:if test="${billNum > 0 && billNum <= 10 }">${billNum }   名</c:if><c:if test="${billNum > 10 || billNum == 0 }">未上榜</c:if></c:if></em>累计推荐注册人数：${reffCount }  人</td>
                            </tr>
                     </table>
                </div>
                <div class="leaf leaf_3"><img src="${oss }/resources/public/images/activity/gold/leaf-img3.png" /></div>
                <div class="leaf leaf_4"><img src="${oss }/resources/public/images/activity/gold/leaf-img4.png" /></div>
            </article>
            <footer class="inner">
            	<p>温馨提示：<br>新用户抽取礼金后，有效工作日48小时内发放至奖励中奖账户；</p>
            </footer>
        </section>
        
        <section class="part_2">
            <header class="title scene">
                <span class="tag tag1"><img src="${oss }/resources/public/images/activity/gold/title-left.png" /></span>
                <span class="tag tag2"><img src="${oss }/resources/public/images/activity/gold/title-right.png" /></span>
                <span class="tag tag3 animated fadeInUp" data-delay="200"><img src="${oss }/resources/public/images/activity/gold/title4.png" /></span>
            </header>
            <article class="inner partTwo">
            	<div class="scene part1">
                	<span class="tag tag1 sprites animated bounceInLeft" data-delay="200"></span>
                	<span class="tag tag2 sprites animated bounceInLeft" data-delay="400"></span>
                	<span class="tag tag3 sprites animated fadeInDown"  data-delay="600"></span>
                    <div class="tag tag4 animated fadeInUp" data-delay="500">
                        <ul>
                            <li class="mb5">发送推荐码</li>
                            <li>手机号码</li>
                        </ul>
                    </div>
                    <p class="tag tag5 animated fadeInUp" data-delay="600">发送专属推荐码，好友注册红筹账户时，输入推荐人的推荐码或者注册手机号</p>
                    <a id="look_code" user="${session_user }" class="tag tag6 animated bounceInRight button" data-delay="700">查看推荐码</a>
                </div>
                
                <div class="scene part2">
                	<span class="tag tag1 sprites animated fadeInDown" data-delay="200"></span>
                    <div class="tag tag2 animated bounceInRight" data-delay="300">
                        <ul>
                            <li>发送专属链接</li>
                        </ul>
                    </div>
                	<span class="tag tag3 sprites animated fadeInDown" data-delay="1000"></span>
                	<span class="tag tag4 sprites animated fadeInUp" data-delay="900"></span>
                    <p class="tag tag5 animated fadeInUp"  data-delay="400">发送专属链接，好友通过推荐人专属链接注册账户（可通过QQ、微信、微博分享）</p>
                </div>
                
                <div class="scene part3">
                	<span class="tag tag1 sprites animated fadeInUp" data-delay="100"></span>
                	<span class="tag tag2 sprites animated bounceInLeft" data-delay="500"></span>
                	<span class="tag tag3 sprites animated fadeInDownBig" data-delay="300"></span>
                    <div class="tag tag4 animated bounceInRight" data-delay="500">
                        <ul>
                        	<c:if test="${!empty session_user }">
                        		<li><img src="/cic/QRcode" height="100" width="100" /></li>	
                        	</c:if>
                        	<c:if test="${empty session_user }">
                        		<li><img src="${oss }/resources/public/images/activity/planner/qrcode.png" /></li>	
                        	</c:if>
                        </ul>
                    	
                    </div>
                    <p class="tag tag5 animated fadeInUp" data-delay="1300">发送专属二维码，用手机分享专属二维码，推荐好友注册账户</p>
                </div>
                
                <div class="leaf leaf_5"><img src="${oss }/resources/public/images/activity/gold/leaf-img5.png" /></div>
            </article>
            <footer class="inner">
            	<p>温馨提示：<br>如您在活动结束后荣登琅琊榜，客服将在活动结束后5个工作日内联系您发放奖励；</p>
            </footer>
        </section>
        
        <section class="part_3">
            <header class="title scene">
                <span class="tag tag1"><img src="${oss }/resources/public/images/activity/gold/title-left.png" class="pl15" /></span>
                <span class="tag tag2"><img src="${oss }/resources/public/images/activity/gold/title-right.png" /></span>
                <span class="tag tag3 animated fadeInUp" data-delay="200"><img src="${oss }/resources/public/images/activity/gold/title5.png" class="pl25" /></span>
            </header>
            <article class="inner rule">
            	<p>1、活动时间：2016年3月1日-2016年3月31日；<br>
                   2、中奖金额可在会员中心-我的中奖纪录查看，中奖金额如想提取到账户，需完成实名验证（包含：开通宝付+宝付授权+上传身份证）<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请到会员中心的中奖记录进行上传身份证；<br>
				   3、成功提取到账户的奖金，可直接提现，也可进行投资，平台首次提现客户如在活动期间内进行首提，将免宝付手续费；<br>
   				   4、活动期间内，每推荐一位好友即赠送一次开启金桃机会，但是抽取到的金桃礼金需要好友完成实名验证并审核通过后方可到账（实名验证包含：<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;开通宝付+宝付授权+上传身份证）；<br>
				   5、本次活动若出现恶意刷单情况，一经查处，将取消获奖资格<br>
				   6、本活动最终解释权归前海红筹所有。</p>
            </article>
            <footer class="inner pb50">
            	<div class="register pb50">
                    <div class="inner">
                        <form class="regist-box clearfix">
                                <a href="javascript:;" id="immediate" class="px18 fl-r">立即注册</a>
                                <input type="text" id="phone" placeholder='输入手机号码' class="fl-r" />
                        </form>
                    </div>
                </div>
            </footer>
        </section>
        <c:if test="${empty session_user }">
		    <div class="floatbox">
		    	<a href="${https }/visitor/to-regist"></a>
		    </div>
	    </c:if>
  </main>
  <!--Main end-->
	<jsp:include page="/WEB-INF/views/hc9/footer_new.jsp" />
		<div style="display:none">
			<input id="session_user" type="hidden" value="${session_user }">
	        <div class="popup-record txt-c" id="record">
	            <p id="content"></p>
	            <a id="btnTxt"></a>
	        </div>
	    </div>
	</div>
	<!--Container end-->
<script src="${oss}/resources/public/js/jquery.appear.js"></script>
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
function goldAlert(content,btnTxt,href) {
	$("#content").text(content);
	$("#btnTxt").text(btnTxt);
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
		  }
	})
}
$(function(){
	transferParam();
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
	$(".branch-bg a").click(function() {
		var session_user = $("#session_user").val();
		if (session_user == '') {
			layer.alert('亲，您还没有登录',{title:'提示',icon:0},function(index){
				window.location.href = '${https}/to-login?skip=activity/peachActivity.htm';
				layer.close(index);
			});
		} else {
			var lotteryNum = $("#lotteryNum").text();
			if (lotteryNum > 0) {
				$.ajax({
					type : 'post',
					url : '/activity/lotteryPeach.htm',
					success : function(data) {
						data = JSON.parse(data);
						var code = data.code;
						if (code == 0) {
							if (data.flagMsg == 1) {
								goldAlert("恭喜您获得2元现金，好友实名验证后即能领取哦！","去查看","/member_index/monkeyRecord.htm?index=0_6&nav=5");
							} else {
								goldAlert("恭喜您获得2元现金，实名验证后即能领取哦！","去领奖","/member_index/monkeyRecord.htm?index=0_6_al&nav=5");
							}
							$("#lotteryNum").text(data.num);
						} else if (code == -1) { 
							layer.alert('金桃抽奖活动已结束，感谢您的参与',{title:'提示',icon:0});
						} else if (code == -2) { 
							goldAlert("您的抽奖机会已用完，赶紧推荐好友注册哦！","去推荐好友","/member_index/friendRecommend.htm?index=3_0&nav=5");
						} else {
							layer.alert('金桃抽取失败',{title:'提示',icon:0});				
						}
					},
				});
			} else {
				goldAlert("您的抽奖机会已用完，赶紧推荐好友注册哦！","去推荐好友","/member_index/friendRecommend.htm?index=3_0&nav=5");
			}
		}
	});
	$("#look_code").click(function(){
		var user = $(this).attr('user'); 
		if (user != '') {
			window.location.href = '/member_index/friendRecommend.htm?index=3_0&nav=5';
		} else {
			layer.alert('亲，您还没有登录',{title:'提示',icon:0},function(index){
				window.location.href = '${https}/to-login?skip=member_index/friendRecommend.htm?index=3_0&nav=5';
				layer.close(index);
			});
		}
	});
	$("#immediate").click(function(){
		var phone = $("#phone").val();
		if (/^1[3,4,5,8,7]{1}\d{9}$/.test(phone)) {
			location.href= "/visitor/to-regist?phone="+phone;
		} else {
			layer.alert('手机号格式有误',{title:'提示',icon:0});
		}
	});
});
</script>
</body>
</html>