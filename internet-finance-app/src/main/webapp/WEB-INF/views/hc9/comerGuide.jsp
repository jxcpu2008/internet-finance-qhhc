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
<link rel="stylesheet" href="${oss}/resources/public/css/page.css" />
<link rel="stylesheet" href="${oss}/resources/public/css/animate.css" />
<link rel="stylesheet" href="${oss}/resources/public/js/layer/skin/layer.css" />
<script src="${oss}/resources/public/js/main.js"></script>
<script src="${oss}/resources/public/js/layer/layer.js"></script>
<!--[if lte IE 9]> 
<script src="${oss}/resources/public/js/html5.js"></script> 
<script src="${oss}/resources/public/js/selector.js"></script>
<![endif]-->
</head>
<body>
	<input id="navId" type="hidden" value="3">
	<!-- head -->
	<jsp:include page="/WEB-INF/views/hc9/header_new.jsp" />
	<!-- end head -->

	<!--Main begin-->
	<main id="main" role="main">
		<div class="banner" style="background-image:url(${oss}/resources/public/images/comer/page-banner_bg.jpg)"><img src="${oss}/resources/public/images/comer/guide-banner.jpg" width="1920" height="220" /></div>
	    
	    <section class="bg-white pt50 pb50">
	    	<div class="inner">
	            <header class="caption mb40"> 
	                <hgroup>什么是众持模式</hgroup>
	            </header>
	            <article class="pl50 pr50 pb50">
	                	<p>"众持"是由互联网金融衍生而来，就是把大量的碎片状资金集中起来形成大资金帮助微小企业。</p>
	                    <p>前海红筹首创了“众持”模式，通过对投资人的投资风险级别区分（优先、夹层、劣后），加上有力的风控系统，首创性地帮助解决小微企业融资难、融资贵的问题，成功搭建起小微企业同民间资本直接对接的桥梁，以助力小微企业健康发展，同时为投资者提供高收益、更安全的投资理财服务。</p>
	                    <p>&nbsp;</p>
	               	<ul class="clearfix clr-light mt50 custom-list">
	               	  <li style="background:url(${oss}/resources/public/images/comer/pattern-heading-ico-1.jpg) 0 center no-repeat;" class="fl-l"><span class="px18 clr-dark">优先级别</span><br/>本息保障，收益固定</li>
	                  <li style="background:url(${oss}/resources/public/images/comer/pattern-heading-ico-2.jpg) 0 center no-repeat;" class="fl-l"><span class="px18 clr-dark">夹层级别</span><br/>本金保障，浮动收益，根据项目实际收益进行分配</li>
	                  <li style="background:url(${oss}/resources/public/images/comer/pattern-heading-ico-3.jpg) 0 center no-repeat;" class="fl-l"><span class="px18 clr-dark">劣后级别</span><br/>本息不保障，高风险高收益，并且对投资人资格有限制</li>
	                  </ul>
	            </article>
	       </div>
	    </section>
	    <section class="bg-grey pt40 pb40">
	    	<div class="inner">
	            <header class="caption mb40"> 
	                <hgroup>为什么选择前海红筹</hgroup>
	            </header>
	            <article class="pt50 pb50 pl30">
	                <ul class="clearfix">
	                    	<li class="fl-l pos-r ml20 mr40">
	                        	<img src="${oss}/resources/public/images/comer/choice-ico-224x194.jpg" width="224" height="194" />
	                        	<div class="pos-a top left full">
	                            	<p class="px18 clr-white pt10 pb50 txt-c">高收益、低门槛</p>
	                                <p class="pl25 pr25">100元起投，10%-14%的年化收益，最高可逾同期银行活期利率的30倍</p>
	                            </div>
	                         </li>
	                    	<li class="fl-l pos-r ml20 mr40">
	                        	<img src="${oss}/resources/public/images/comer/choice-ico2-224x194.jpg" width="224" height="194" />
	                        	<div class="pos-a top left full">
	                            	<p class="px18 clr-white pt10 pb50 txt-c">多重保障</p>
	                                <p class="pl25 pr25">平台五大风控措施，保障您的资金安全</p>
	                            </div>
	                         </li>
	                    	<li class="fl-l pos-r ml20 mr40">
	                        	<img src="${oss}/resources/public/images/comer/choice-ico3-224x194.jpg" width="224" height="194" />
	                        	<div class="pos-a top left full">
	                            	<p class="px18 clr-white pt10 pb50 txt-c">多种收益方式</p>
	                                <p class="pl25 pr25">不同收益、不同风险的投资产品满足客户不同的资金配置需求</p>
	                            </div>
	                         </li>
	                    	<li class="fl-l pos-r ml20">
	                        	<img src="${oss}/resources/public/images/comer/choice-ico4-224x194.jpg" width="224" height="194" />
	                        	<div class="pos-a top left full">
	                            	<p class="px18 clr-white pt10 pb50 txt-c">零管理费</p>
	                                <p class="pl25 pr25">平台不收取投资人任何的平台服务费，确保投资人利益最大化</p>
	                            </div>
	                         </li>
	                    </ul>
	            </article>
	      	</div>
	    </section>
	    <section class="bg-white pt40 pb40">
	    	<div class="inner">
	            <header class="caption mb40"> 
	                <hgroup>如何投资</hgroup>
	            </header>
	            <article class="pl50 pr50 pb50">
	            	<div class="step">
	            	 <p class="red-block"><span class="px18 clr-dark pr10">注册实名</span>实名注册，保障资金安全</p
	                    ><div class="step-content txt-c">
	                    	<img src="${oss}/resources/public/images/comer/login-ico.jpg" />
	                    </div>
	                 </div>
	            </article>
	      	</div>
	    </section>
	    <section class="bg-grey pt40 pb40">
	    	<div class="inner">
	            <article class="pl50 pr50 pb50">
	            	<div class="step">
	            	<p class="red-block"><span class="px18 clr-dark pr10">开通宝付</span>首次注册，登录完成后即会提示开通宝付流程，也可前往  会员中心 \ 账户设置  完成开通宝付操作 </p>
	                    <div class="step-content txt-c">
	                    	<img src="${oss}/resources/public/images/comer/autonym-ico.jpg"/ class="mb30">
	                        <p class="px18 clr-dark pl50 txt-l">点击&nbsp;&nbsp;立即开通宝付&nbsp;&nbsp;跳转到&nbsp;&nbsp;宝付授权页面</p>
	                        <img src="${oss}/resources/public/images/comer/autonym-ico2.jpg" class="mt30"/>
	                    </div>
	                </div>
	            </article>
	      	</div>
	    </section>
	    <section class="bg-white pt40 pb40">
	    	<div class="inner">
	            <article class="pl50 pr50 pb50">
	            	<div class="step">
	                    <p class="red-block"><span class="px18 clr-dark pr10">充值</span>支持国内主流银行充值</p>
	                    <div class="step-content txt-c">
	                    	<img src="${oss}/resources/public/images/comer/topup-ico.jpg" />
	                    </div>
	                </div>
	            </article>
	      	</div>
	    </section>
	    <section class="bg-grey pt40 pb40">
	    	<div class="inner">
	            <article class="pl50 pr50 pb50">
	            	<div class="step">
	                    <p class="mt50 red-block"><span class="px18 clr-dark pr10">认购</span>在我要众持页面可认购理财产品</p>
	                    <div class="step-content txt-c">
	                    	<img src="${oss}/resources/public/images/comer/subscribe-ico.jpg" />
	                    </div>
	                 </div>
	            </article>
	      	</div>
	    </section>
	    <section class="bg-white pt40 pb40">
	    	<div class="inner">
	            <article class="pl50 pr50 pb50">
	            	<div class="step">
	                    <p class="red-block"><span class="px18 clr-dark pr10">提现</span>进入用户中心，将余额提现至绑定的银行卡内</p>
	                    <div class="step-content txt-c">
	                    	<img src="${oss}/resources/public/images/comer/withdraw-ico1.jpg" class="mb30"/>
	                        <p class="px18 clr-dark pl50 txt-l">选择提现银行卡，填写完整信息</p>
	                        <img src="${oss}/resources/public/images/comer/withdraw-ico2.jpg" class="mt30 mb30"/>
	                        <p class="px18 clr-dark pl50 txt-l">输入宝付支付密码、验证码后，点击提现完成整个流程</p>
	                        <img src="${oss}/resources/public/images/comer/withdraw-ico3.jpg" class="mt30"/>
	                    </div>
	                  </div>
	            </article>
	      	</div>
	    </section>
	    <c:if test="${empty session_user }">
	         <div class="bg-white pb50 pt50">
	            <div class="inner">
	                <form class="regist-box clearfix">
	                        <a href="javascript:;" id="immediate" class="px18 fl-r">立即注册</a><input type="text" id="phone" placeholder='输入手机号码' class="fl-r" />
	                </form>
	            </div>
	        </div>
	    </c:if>
	  </main>
	<!--Main end-->

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/hc9/footer_new.jsp" />
	<!-- end footer -->
</body>
<script type="text/javascript">
$(function(){
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