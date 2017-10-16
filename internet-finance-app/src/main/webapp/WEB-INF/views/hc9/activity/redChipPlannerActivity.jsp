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
#planner .inner{
	width:1200px;
}
#planner .banner{
	background:url(http://hcfile.hc9.com/resources/public/images/activity/planner/banner.jpg) top center no-repeat;
	height:740px;
}
#planner .partOne{
	background:#fff7e3;
}
#planner .partOne article dl{
	display:inline;
	float:left;
	font-size:18px;
	color:#806511;
	text-align:center;
	padding-left:48px;
}
#planner .partOne article dl:nth-child(1){
	margin-left:-58px;
}
#planner .partOne article .fl-l{
	background:url(/resources/public/images/activity/planner/rebate-ico1.png) 0 0 no-repeat;
}
#planner .partOne article .fl-r{
	background:url(/resources/public/images/activity/planner/rebate-ico2.png) 0 0 no-repeat;
}
#planner .partOne article ul{
	font-size:18px;
	color:#806511;
	padding:20px 0 0 140px;
}
#planner .partOne article ul li:nth-child(1){
	font-size:28px;
	color:#302502;
}
#planner .partOne footer{
	background:url(/resources/public/images/activity/planner/bg-img.jpg) top center no-repeat;
	height:132px;
}
#planner .register,
#planner .partTwo,
#planner .partThree,
#planner .partFour{
	background-color:#f3d26d;
}
#planner .partTwo .tag {
	display:block;
	position:absolute;
	background-repeat:no-repeat;
}

#planner .partTwo p{
	font-size:14px;
	color:#806511;
}
#planner .partTwo .part_1{
	position:relative;
	height:435px;
}
#planner .partTwo .part_1 .sprites{
	background-image:url(/resources/public/images/activity/planner/part1-sprites.png);
}
#planner .partTwo .part_1 .tag1{
	width:180px;
	height:352px;
	background-position:0 -102px;
	left:159px;
	top:80px;
}
#planner .partTwo .part_1 .tag2{
	width:97px;
	height:102px;
	background-position:0 0;
	left:109px;
	top:134px;
}
#planner .partTwo .part_1 .tag3{
	width:164px;
	height:40px;
	background-position:0 -454px;
	left:522px;
	top:145px;
}
#planner .partTwo .part_1 .tag4 ul li{
	background-color:#eb4d4c;
	width:129px;
	height:27px;
	line-height:27px;
	text-align:center;
	color:#ffffff;
	font-size:18px;
}
#planner .partTwo .part_1 .tag4 ul{
	background-color:#f2f2f2;
	padding:20px 33px;
	border-radius:6px;
}
#planner .partTwo .part_1 .tag4{
	background-color:#fefefe;
	padding:10px;
	border-radius:8px;
	box-shadow:0 10px 1px rgba(0,0,0,0.1);
	-webkit-box-shadow:0 10px 1px rgba(0,0,0,0.1);
	-moz-box-shadow:0 10px 1px rgba(0,0,0,0.1);
	-o-box-shadow:0 10px 1px rgba(0,0,0,0.1);
	-ms-box-shadow:0 10px 1px rgba(0,0,0,0.1);
	left:230px;
	top:234px;
}
#planner .partTwo .part_1 .tag5{
	left:522px;
	top:194px;
}
#planner .partTwo .part_1 .tag6{
	background-color:#ffffff;
	color:#eb4d4c;
	padding:10px 40px;
	border-radius:6px;
	box-shadow:0 10px 1px rgba(0,0,0,0.1);
	-webkit-box-shadow:0 10px 1px rgba(0,0,0,0.1);
	-moz-box-shadow:0 10px 1px rgba(0,0,0,0.1);
	-o-box-shadow:0 10px 1px rgba(0,0,0,0.1);
	-ms-box-shadow:0 10px 1px rgba(0,0,0,0.1);
	left:533px;
	top:253px;
}
#planner .partTwo .part_1 .tag6:active{
	top:260px;
	box-shadow:0 3px 1px rgba(0,0,0,0.1);
	-webkit-box-shadow:0 3px 1px rgba(0,0,0,0.1);
	-moz-box-shadow:0 3px 1px rgba(0,0,0,0.1);
	-o-box-shadow:0 3px 1px rgba(0,0,0,0.1);
	-ms-box-shadow:0 3px 1px rgba(0,0,0,0.1);
}


#planner .partTwo .part_2{
	position:relative;
	height:320px;
}
#planner .partTwo .part_2 .sprites{
	background-image:url(/resources/public/images/activity/planner/part2-sprites.png);
}
#planner .partTwo .part_2 .tag1{
	width:164px;
	height:40px;
	background-position:0 -160px;
	left:159px;
	top:106px;
}
#planner .partTwo .part_2 .tag2 ul li{
	background-color:#eb4d4c;
	width:220px;
	height:42px;
	line-height:42px;
	text-align:center;
	color:#ffffff;
	font-size:30px;
}
#planner .partTwo .part_2 .tag2 ul{
	background-color:#f2f2f2;
	padding:64px 56px;
	border-radius:6px;
}
#planner .partTwo .part_2 .tag2{
	background-color:#fefefe;
	padding:20px;
	border-radius:8px;
	box-shadow:0 10px 1px rgba(0,0,0,0.1);
	-webkit-box-shadow:0 10px 1px rgba(0,0,0,0.1);
	-moz-box-shadow:0 10px 1px rgba(0,0,0,0.1);
	-o-box-shadow:0 10px 1px rgba(0,0,0,0.1);
	-ms-box-shadow:0 10px 1px rgba(0,0,0,0.1);
	left:703px;
	top:76px;
}
#planner .partTwo .part_2 .tag3{
	width:97px;
	height:102px;
	background-position:0 0;
	left:686px;
	top:45px;
}
#planner .partTwo .part_2 .tag4{
	width:84px;
	height:160px;
	background-position:-97px 0;
	left:1032px;
	top:160px;
}
#planner .partTwo .part_2 .tag5{
	left:164px;
	top:155px;
}

#planner .partTwo .part_3{
	position:relative;
	height:380px;
}
#planner .partTwo .part_3 .sprites{
	background-image:url(/resources/public/images/activity/planner/part3-sprites.png);
}
#planner .partTwo .part_3 .tag1{
	width:180px;
	height:352px;
	background-position:0 -102px;
	left:159px;
	top:28px;
}
#planner .partTwo .part_3 .tag2{
	width:97px;
	height:102px;
	background-position:0 0;
	left:109px;
	top:81px;
}
#planner .partTwo .part_3 .tag3{
	width:164px;
	height:40px;
	background-position:0 -454px;
	left:524px;
	top:139px;
}
#planner .partTwo .part_3 .tag4 ul{
	background-color:#f2f2f2;
	padding:25px 28px;
	border-radius:6px;
}
#planner .partTwo .part_3 .tag4{
	background-color:#fefefe;
	padding:10px;
	border-radius:8px;
	box-shadow:0 10px 1px rgba(0,0,0,0.1);
	-webkit-box-shadow:0 10px 1px rgba(0,0,0,0.1);
	-moz-box-shadow:0 10px 1px rgba(0,0,0,0.1);
	-o-box-shadow:0 10px 1px rgba(0,0,0,0.1);
	-ms-box-shadow:0 10px 1px rgba(0,0,0,0.1);
	left:230px;
	top:126px;
}
#planner .partTwo .part_3 .tag5{
	left:524px;
	top:188px;
}

#planner .partThree header{
	padding:100px 0 70px 0;
	color:#ee3f45;
	font-size:22px;
	line-height:50px;
}
#planner .partThree .redPacket ul{
	width:1244px;
}
#planner .partThree .redPacket ul li{
	text-align:center;
	font-size:14px;
	color:#806511;
}
#planner .partThree .ranklist p{
	font-size:30px;
	color:#ee3f45;
	text-align:center;
}
#planner .partThree .ranklist table{
	border:1px solid #ee3f45;
}
#planner .partThree .ranklist table td{
	color:#ee3f45;
	font-size:18px;
	padding:10px 0;
	border:1px solid #fcdada;
}
#planner .partThree .ranklist table tr:nth-child(1) td{
	color:#ffe684;
	border:none;
	font-size:22px;
}

#planner .partFour ul{
	color:#806511;
	padding-bottom:120px;
}
#planner .register .regist-box{
	padding:54px 65px;
    border: 1px solid #e9e9e9;
    background: #fafafa url(/resources/assets/images/home/logo.png) 86px center no-repeat;
	text-align:right;
	background-color:#fafafa;
}
#planner .register .regist-box input{
    width: 290px;
    height: 49px;
    border: 1px solid #f94040;
	padding:0 20px;
}
#planner .register .regist-box a{
    width: 157px;
    height: 51px;
    line-height: 51px;
    background-color: #f94040;
    color: #fff;
    text-align: center;
}
#planner .floatbox{
	position:fixed;
	z-index:99;
	left:50%;
	top:50%;
	margin-left:600px;
	background:url(/resources/public/images/activity/planner/fixed-bg.png) 0 0 no-repeat;
	width:272px;
	height:177px;
}
#planner .floatbox a{
	display:block;
	width:120px;
	height:90px;
	position:absolute;
	left:81px;
	top:64px;
}
.popup-record{
	width:490px;
	height:317px;
	background-color:#ffffff;
}
.popup-record ul{
	font-size:18px;
	color:#575757;
	margin-bottom:40px;
	padding-top:50px;
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
		<jsp:include page="/WEB-INF/views/hc9/header_new.jsp" />
		<!--Main begin-->
		  <main id="planner" role="main">
		        <div class="banner"></div>
		        
		        <section class="partOne">
		        	<header class="inner pt50 pb50"><img src="${oss }/resources/public/images/activity/planner/title-img1.jpg" /></header>
		            <article class="inner pt30">
		            	<div>
		                	<dl>
		                        <dt><img src="${oss }/resources/public/images/activity/planner/icon1-178x184.png" /></dt>
		                        <dd>用户A</dd>
		                    </dl>
		                    <dl class="arrow pt35">
		                        <dt class="pr15">推荐</dt>
		                        <dd><img src="${oss }/resources/public/images/activity/planner/arrows-ico.png" /></dd>
		                    </dl>
		                    <dl>
		                        <dt><img src="${oss }/resources/public/images/activity/planner/icon2-178x184.png" /></dt>
		                        <dd>好友B</dd>
		                    </dl>
		                    <dl class="arrow pt50">
		                        <dt></dt>
		                        <dd class="pt15"><img src="${oss }/resources/public/images/activity/planner/arrows-ico.png" /></dd>
		                    </dl>
		                    <dl>
		                        <dt><img src="${oss }/resources/public/images/activity/planner/icon3-178x184.png" /></dt>
		                        <dd></dd>
		                    </dl>
		                    <dl class="arrow pt50">
		                        <dt></dt>
		                        <dd class="pt15"><img src="${oss }/resources/public/images/activity/planner/arrows-ico.png" /></dd>
		                    </dl>
		                    <dl>
		                        <dt><img src="${oss }/resources/public/images/activity/planner/icon4-178x184.png" /></dt>
		                        <dd></dd>
		                    </dl>
		                    <div class="clear"></div>
		                </div>
		                
		                <div class="clearfix mt50 pt20 pl20 pr20">
		                	<div class="fl-l">
		                    	<ul>
		                        	<li>佣金返利计算方式</li>
		                            <li>月标计算方式</li>
		                            <li>&nbsp;&nbsp;&nbsp;&nbsp;佣金返利=好友B投资金额/12个月*投资月份数*0.5%</li>
		                            <li>天标计算方式</li>
		   							<li>&nbsp;&nbsp;&nbsp;&nbsp;佣金返利=好友B投资金额/360天*投资天数*0.5%</li>
		                        </ul>
		                    </div>
		                    <div class="fl-r">
		                    	<ul>
		                        	<li>举个栗子</li>
		                            <li>用户A 推荐 好友B 投资了  一个月标 100,000元</li>
		                            <li>用户A 可获返利计算如下：</li>
		   							<li>100000 / 12 * 1 * 0.5% ≈ 41.67 元</li>
		                        </ul>
		                    </div>
		                </div>
		                
		                <div class="px14 clr-title mt50 pt35 pb40">
		                	<p><font color="#d93939" class="pr10">*</font>用户A和好友B都必须开通宝付及宝付授权后，用户A才能成为红筹理财师。</p>
							<p><font color="#d93939" class="pr10">*</font>推荐关系一旦成立，佣金长期有效。</p>
							<p><font color="#d93939" class="pr10">*</font>3月1日前，已成功推荐好友注册并开通宝付与宝付授权的老用户，可自动升级为红筹理财师。</p>
		                </div>
		                
		            </article>
		            <footer></footer>
		        </section>
		        
		        <section class="partTwo">
		        	<header class="inner pt30 pb50"><img src="${oss }/resources/public/images/activity/planner/title-img2.jpg" /></header>
		            <article class="inner">
		            	<div class="scene part_1">
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
					        <a href="javascript:;" id="look_code" user="${session_user }" class="tag tag6 animated bounceInRight button" data-delay="700">查看推荐码</a>
		                </div>
		                
		                <div class="scene part_2">
		                	<span class="tag tag1 sprites animated fadeInDown" data-delay="200"></span>
		                    <div class="tag tag2 animated bounceInRight" data-delay="300">
		                        <ul>
		                            <li>发送专属链接</li>
		                        </ul>
		                    </div>
		                	<span class="tag tag3 sprites animated fadeInDown" data-delay="1000"></span>
		                	<span class="tag tag4 sprites animated fadeInUp" data-delay="900"></span>
		                    <p class="tag tag5 animated fadeInUp"  data-delay="400">发送专属链接，好友通过推荐人专属链接注册账户（可通过QQ、微博、微信分享）</p>
		                </div>
		                
		                <div class="scene part_3">
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

		            </article>
		        </section>
		        
		        <section class="partThree pb50">
		        	<header class="inner txt-c"><img src="${oss }/resources/public/images/activity/planner/title-img3.jpg" /><br>活动期间（3月1日- 4月30日），累计推荐好友投资金额</header>
		        	<article class="inner">
		                <div class="redPacket">
		                	<ul class="clearfix pb50">
		                        <li class="fl-l">
		                            <dl>
		                                <dt class="pb20"><img src="${oss }/resources/public/images/activity/planner/redPacket188.jpg" /></dt>
		                                <dd>累计推荐好友投资10万及以上可得</dd>
		                            </dl>
		                        </li>
		                        <li class="fl-l">
		                            <dl>
		                                <dt class="pb20"><img src="${oss }/resources/public/images/activity/planner/redPacket388.jpg" /></dt>
		                                <dd>累计推荐好友投资20万及以上可得</dd>
		                            </dl>
		                        </li>
		                        <li class="fl-l">
		                            <dl>
		                                <dt class="pb20"><img src="${oss }/resources/public/images/activity/planner/redPacket888.jpg" /></dt>
		                                <dd>累计推荐好友投资50万及以上可得</dd>
		                            </dl>
		                        </li>
		                        <li class="fl-l">
		                            <dl>
		                                <dt class="pb20"><img src="${oss }/resources/public/images/activity/planner/redPacket1888.jpg" /></dt>
		                                <dd>累计推荐好友投资100万及以上可得</dd>
		                            </dl>
		                        </li>
		                    </ul>
		                </div>
		                <div class="ranklist">
		                	<p class="pb30">推荐投资排行榜</p>
		                	<table width="1200"  border="0" cellpadding="0" cellspacing="0" class="txt-c">
                            <col width="20%"/>
                            <col width="25%"/> 
                            <col width="25%"/>
                            <col width="30%"/>
                     		
                            <tr>
                                <td bgcolor="#ee3f45">排名</td>
                                <td bgcolor="#ee3f45">手机号</td>
                                <td bgcolor="#ee3f45">推荐投资累计金额</td>
                                <td bgcolor="#ee3f45">已达到奖励标准</td>
                            </tr>
                            <c:forEach var="planner" items="${recommendTenders }" varStatus="i" begin="0" end="9">
                            	<tr>
	                                <td bgcolor="#ffffff">${i.count }</td>
	                                <c:set var="phone" value="${planner.phone.toString() }" />
	                                <td bgcolor="#ffffff">${phone.replace(phone.substring(3,phone.length()-4),'****') }</td>
		    							<c:set var="money" value="${planner.money }" />
	                                <td bgcolor="#ffffff"><fmt:formatNumber type="number" value="${money }" pattern="#0.00" /></td>
	                                <td bgcolor="#ffffff">
	                                	<c:if test="${money lt 100000.0 }">继续加油</c:if>
		                    			<c:if test="${money ge 100000.0 and money lt 200000.0 }">188</c:if>
		                    			<c:if test="${money ge 200000.0 and money lt 500000.0 }">388</c:if>
		                    			<c:if test="${money ge 500000.0 and money lt 1000000.0 }">888</c:if>
		                    			<c:if test="${money ge 1000000.0 }">1888</c:if>
	                                </td>
	                            </tr>
	                    	</c:forEach>
                        </table>
	                    	<c:if test="${empty recommendTenders }">
								<p style="text-align: center;font-size: 25px;color: #fff;padding: 50px;">还没用户入榜</p>
							</c:if>
		                </div>
		            </article>
		        </section>
		        
		    <section class="partFour pt50">
		        	<header class="inner txt-c pb50"><img src="${oss }/resources/public/images/activity/planner/title-img4.jpg" /></header>
		            <article class="inner">
		            	<ul>
		                	<li>1、本活动仅限普通会员参与，推荐红包及现金奖励仅限<font color="#ee3f45">2016年3月1日-2016年5月2日</font>；</li>
		                  	<li>2、3月1日起，成为红筹理财师后即可享受佣金福利；</li>
		                  	<li>3、佣金发放：推荐好友投资标的满标放款后3个工作日内发放至推荐人账户中；</li>
		                  	<li>4、严禁恶意刷单行为，一经发现，前海红筹有权取消其参与资格；</li>
		                  	<li>5、具体推荐好友详情，请登录前海红筹-我的账户-推荐好友中查看；</li>
		                  	<li>6、现金奖励每人仅限领取一次，活动结束后按照满足奖励条件的最高金额发放；</li>
		                  	<li>7、现金奖励将于活动结束后5个工作日内发放至账户余额中，用户可直接提现或购买产品；</li>
		                	<li>8、本活动最终解释权归前海红筹所有。</li>
		                </ul>
		        	</article>
		    </section>
		    <div class="register pb50">
		        <div class="inner">
		            <form class="regist-box clearfix">
		                <a href="javascript:;" id="immediate" class="px18 fl-r">立即注册</a><input type="text" id="phone" placeholder='输入手机号码' class="fl-r" />
		            </form>
		        </div>
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
</body>
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
</html>