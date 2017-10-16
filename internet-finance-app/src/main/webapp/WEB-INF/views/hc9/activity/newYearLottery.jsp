<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE HTML>
<html>
<head>
<jsp:include page="/WEB-INF/views/hc9/common/common_new.jsp" />
<link rel="stylesheet"
	href="${oss}/resources/public/css/style.css?v=1.0" />
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
#main {
	max-width: 1920px;
	margin: 0 auto;
	background: #f06460;
}

.dada-content {
	background: url(/resources/public/images/dada/dada-bg2.jpg) 0 0
		no-repeat;
	height: 610px;
}

.dada-content dl {
	display: inline;
	float: left;
	margin-right: 20px;
	text-align: center;
}

.dada-content article {
	position: relative;
}

.dada-content article .dada-prize {
	position: absolute;
	left: 535px;
}

/* 转盘 */
#roulette {
	width: 472px;
	height: 472px;
	background: url(/resources/public/images/dada/roulette-base.png) 0 0
		no-repeat;
	position: absolute;
	left: 0;
	margin-top: 40px;
	border-radius: 50%;
	-webkit-border-radius: 50%;
	-moz-border-radius: 50%;
	-webkit-box-shadow: 0 0 10px rgba(0, 0, 0, .5);
	-moz-box-shadow: 0 0 10px rgba(0, 0, 0, .5);
	box-shadow: 0 0 10px rgba(0, 0, 0, .5);
}

#roulette .prize {
	position: absolute;
	left: 20px;
	top: 18px;
}

#roulette .btn-begin {
	position: absolute;
	left: 172px;
	top: 150px;
	z-index: 10;
	cursor: pointer;
}

#roulette .mask {
	position: absolute;
	width: 100%;
	height: 100%;
	z-index: 30;
	display: none;
}

#roulette .count {
	color: white;
	font-size: 20px;
	position: absolute;
	width: 100%;
	text-align: center;
	left: 0;
	top: 510px;
}

#roulette .count em {
	font-size: 36px;
	font-family: Arial, Helvetica, sans-serif;
	color: #fff15e;
	padding: 0 10px;
	font-style: normal;
}

.myprizeBox {
	position: fixed;
	z-index: 99;
	right: 5%;
	top: 50%;
}

.myprizeBox a {
	background: url(/resources/public/images/dada/myprize-bg.png) 0 0
		no-repeat;
	width: 120px;
	height: 138px;
	display: block;
	text-align: center;
	position: absolute;
	right: -15px;
	top: -80px;
	padding-right: -6px;
	line-height: 22px;
	color: #d9534f;
	font-size: 18px;
	padding-top: 60px;
}

.myprizeBox ul {
	display: block;
	background-color: #fff;
}

.myprizePopup {
	border-radius: 10px;
	-moz-border-radius: 10px;
	-webkit-border-radius: 10px;
	-ms-border-radius: 10px;
	background-color: white;
	width: 330px;
	padding: 20px 30px;
	margin-right: 50px;
	font-size: 16px;
}

.myprize {
	position: absolute;
	right: 90px;
	top: 80px;
	background-color: #ffffff;
	border-radius: 10px;
	-moz-border-radius: 10px;
	-o-border-radius: 10px;
	-ms-border-radius: 10px;
	-webkit-border-radius: 10px;
	padding: 20px 50px 20px 20px;
	display: none;
}

.winners ul {
	margin-left: 30px;
}

.winners ul li {
	width: 490px;
	color: white;
	font-size: 16px;
}

.winners {
	position: absolute;
	right: 145px;
	margin-top: 350px;
}

.centen img {
	position: relative;
	left: 50%;
	margin-left: -960px;
}

.centen {
	overflow: hidden;
	width: 100%;
	position: relative;
}

.gift-box .inner{
	width:920px;
	padding:30px 0;
}
</style>
</head>
<body>
	<!--Container begin-->
	<div id="container">
		<!-- head -->
		<jsp:include page="/WEB-INF/views/hc9/header_new.jsp" />
		<!-- end head -->
		<input id="session_user" type="hidden" value="${session_user }">
		<!--Main begin-->
		<main id="main" role="main">
		  	<div class="centen"><img src="${oss }/resources/public/images/dada/dada-bg.jpg"/></div>
		    <section class="dada-content">
		    	<article class="inner">
		    		<div class="dada-prize">
		            	<p class="mb20 px22 clr-title">自己投资或者推荐好友首投都有机会获得</p>
		                <div class="clearfix">
		                    <dl>
		                        <dt><img src="${oss }/resources/public/images/dada/dada-prize-ico1.png" /></dt>
		                        <dd class="px14 clr-title">ipad&nbsp;mini2</dd>
		                    </dl>
		                    <dl>
		                        <dt><img src="${oss }/resources/public/images/dada/dada-prize-ico2.png" /></dt>
		                        <dd class="px14 clr-title">Kindle电子书阅读器</dd>
		                    </dl>
		                    <dl>
		                        <dt><img src="${oss }/resources/public/images/dada/dada-prize-ico3.png" /></dt>
		                        <dd class="px14 clr-title">红筹台历</dd>
		                    </dl>
		                    <dl>
		                        <dt><img src="${oss }/resources/public/images/dada/dada-prize-ico4.png" /></dt>
		                        <dd class="px14 clr-title">嗒嗒巴士代金券</dd>
		                    </dl>
		                    <dl>
		                        <dt><img src="${oss }/resources/public/images/dada/dada-prize-ico5.png" /></dt>
		                        <dd class="px14 clr-title">红筹红包</dd>
		                    </dl>
		                </div>
		                <p class="mt20 px22 clr-title">中奖率100%，还在等什么，快来抽奖吧！</p>
		            </div>
		            
		            <div id="roulette">
		                <img src="${oss }/resources/public/images/dada/roulette-prize.png" class="prize" width="436" height="436"/>
		                <img src="${oss }/resources/public/images/dada/roulette-begin.png" class="btn-begin" />
		                <div class="mask"></div>
		                <div class="count">您还有<em id="lottery_num"><c:choose><c:when test="${lotteryNum > 0}">${lotteryNum }</c:when><c:otherwise>0</c:otherwise></c:choose></em>次抽奖机会</div>
		            </div>
		             
		            <div class="winners">
						<p class="px20 clr-white">中奖用户</p>
							<div id="slider">
								<ul>
									<c:if test="${!empty lotteryList }">
										<c:forEach var="lottery" items="${lotteryList }" varStatus="i">
											<c:set var="phone" value="${lottery.mobilePhone.toString() }" />
											<li><em style="width: 50px; margin-right: 20px;">恭喜</em><em
												style="width: 150px; margin-right: 20px;">${phone.replace(phone.substring(3,phone.length()-4),'****') }</em><em
												style="width: 100px; margin-right: 20px;">抽中</em><em
												style="width: 200px;"><font color="#ffff5a">${lottery.prizeName }</font></em></li>
										</c:forEach>
									</c:if>
									<c:if test="${empty lotteryList }">
										<li>还没中奖用户，赶紧投资抽奖吧！先到先得~</li>
									</c:if>
								</ul>
							</div>
					</div>
		        </article>
		    </section>
		    
		    <section class="gift-box bg-redlight">
		    	<article>
		            <div class="centen">
		                <img src="${oss }/resources/public/images/dada/gift-bg1.jpg" />
		                <img src="${oss }/resources/public/images/dada/gift-bg2.jpg" />
		                <img src="${oss }/resources/public/images/dada/gift-bg3.jpg" />
		            </div>
		            <div class="inner">
		            	<ul class="clr-white px14">
			            	<li>一、活动时间：<font color="#ffff5a">2015年12月29日-2016年2月29日；</font></li>
			                <li>二、参与方式：投资标的优先、夹层均可参与，劣后除外；</li>
			                <li>三、抽奖机会获取方式：<br><span class="pl20">&nbsp;&nbsp;A、每日单笔首投100元（含）及以上，即送1次抽奖机会，该机会当天有效；当日单笔复投每满2000元，额外赠送1次抽奖机会，该机会可在活<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;动期内累计；<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;例如：用户A当日首投100元，再投2000元，他可获得2次抽奖机会，如用户A当日首投2000元，再投100元，他只能获得1次抽奖机会；<br><em class="pl20">&nbsp;&nbsp;B、推荐好友实名注册并产生首投的，额外赠送1次抽奖机会，该机会可在活动期间累计；</em></span></li>
			                <!-- <li>四、VIP区抽奖机会获取方式：<br><font color="#ffff5a" class="pl20">A、活动期间用户累计投资达10万元，开放抽奖礼品为 Kindle电子书阅读器（价值499元）；<br><em class="pl20">B、活动期间用户累计投资达30万元，开放抽奖礼品包括 IPad mini (价值1988元)与Kindle电子书阅读器（价值499元）；</em></font></li> -->
			                <li>四、红包使用方法：投资100元即可使用红包，使用区间为标的优先项，红包期限为30天；</li>
			                <li>五、嗒嗒巴士代金券使用方法：代金券可在嗒嗒巴士app使用，代金券使用无门槛，嗒嗒巴士任何乘车项目均可抵扣，有效期为365天;</li>
			                <li>六、奖品发放安排：实物奖品客服将于活动结束后3个工作日内联系客户并发放奖品，红包奖励与嗒嗒巴士代金券在抽中后立马到账，如有其他问题<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;请联系前海红筹客服部，客服联系QQ：4008223499，客服热线：400-822-3499；</li>
			                <li>七、用户在参与本活动的同时，不影响该用户参与平台其他活动；</li>
			                <li>八、本活动最终解释权归前海红筹所有；</li>
			            </ul>
			            <p>&nbsp;</p>
			            <p>&nbsp;</p>
		            </div>
		        </article>
		    </section>
		    <c:if test="${!empty myLottery }">
			    <div class="myprizeBox">
			    	<a href="javascript:;">查看我的<br/>中奖礼品</a>
			        <div class="myprizePopup" style="display: none;">
			        	<ul class="clr-title">
			        		<c:forEach var="lottery" items="${myLottery }">
			        			<c:set var="time" value="${lottery.receiveTime }"/>
			        			<c:set var="name" value="${lottery.prizeName }"/>
				                <li>${time.substring(0,10) }&nbsp;&nbsp;${time.substring(11,16) }&nbsp;&nbsp;抽中&nbsp;&nbsp;<c:choose><c:when test="${lotter.prizeType eq 12 }">红筹台历</c:when><c:otherwise>${name }</c:otherwise></c:choose></li>
			        		</c:forEach>
			            </ul>
			        </div>
			    </div>
		  	</c:if>
		  </main>
		<!--Main end-->
		<jsp:include page="/WEB-INF/views/hc9/footer_new.jsp" />
	</div>
	<!--Container end-->
	<script src="${oss}/resources/public/js/jquery.rotate.min.js"></script>
	<script src="${oss}/resources/assets/script/newYearLottery.js"></script>
</body>
</html>