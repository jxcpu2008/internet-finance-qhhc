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
<script src="${oss}/resources/public/js/main.js"></script>
<!--[if lte IE 9]> 
<script src="${oss}/resources/public/js/html5.js"></script> 
<script src="${oss}/resources/public/js/selector.js"></script>
<![endif]-->
<link href="${oss}/resources/public/js/fancybox/jquery.fancybox.css?v=2.1.5" rel="stylesheet" />
<script src="${oss}/resources/public/js/fancybox/jquery.fancybox.js?v=2.1.5"></script>
</head>
<body>
	<input id="navId" type="hidden" value="2">
	<!-- head -->
	<jsp:include page="/WEB-INF/views/hc9/header_new.jsp" />
	<!-- end head -->

	<!--Main begin-->
	<main id="main" role="main">
		<div class="banner" style="background-image:url(${oss}/resources/public/images/comer/safety-banner_bg.jpg)"><img src="${oss}/resources/public/images/comer/safety-banner.jpg" width="1920" height="220" /></div>
	    <section class="bg-white pt50 pb50">
	    	<div class="inner">
	            <header class="caption mb40"> 
	                <hgroup>严格的准入机制</hgroup>
	            </header>
	            <article class="pl50 pr50 pb50">
	            	<div class="overflow">
	                	<ul class="clearfix access-list">
	                            <li class="fl-l clr-light">
	                            	<img src="${oss}/resources/public/images/comer/security-img1.png" class="fl-l mr20">
	                            	<p class="fl-l"><span class="px18 clr-dark">实地考察</span><br/>第三方合作机构实地考察借款人</p>
	                            </li>
	                            <li class="fl-l clr-light">
	                            	<img src="${oss}/resources/public/images/comer/security-img2.png" class="fl-l mr20">
	                            	<p class="fl-l"><span class="px18 clr-dark">资料审核</span><br/>审核包括银行流水、资产情况等<br>二十余项必备材料</p>
	                            </li>
	                            <li class="fl-l clr-light">
	                            	<img src="${oss}/resources/public/images/comer/security-img3.png" class="fl-l mr20">
	                            	<p class="fl-l"><span class="px18 clr-dark">背景调查</span><br/>对借款人背景、联系人信息详尽调查</p>
	                            </li>
	                            <li class="fl-l clr-light">
	                            	<img src="${oss}/resources/public/images/comer/security-img4.png" class="fl-l mr20">
	                            	<p class="fl-l"><span class="px18 clr-dark">还款能力</span><br/>结合资料审查和数据分析综合<br>评估其还款能力</p>
	                            </li>
	                            <li class="fl-l clr-light">
	                            	<img src="${oss}/resources/public/images/comer/security-img5.png" class="fl-l mr20">
	                            	<p class="fl-l"><span class="px18 clr-dark">抵押办理</span><br/>资产通过估值后办理相关抵押手续</p>
	                            </li>
	                            <li class="fl-l clr-light">
	                            	<img src="${oss}/resources/public/images/comer/security-img6.png" class="fl-l mr20">
	                            	<p class="fl-l"><span class="px18 clr-dark">二次审核</span><br/>由前海红筹自有风控团队二次严格把<br/>关</p>
	                            </li>
	                     </ul>
	                  </div>
	            </article>
	       </div>
	    </section>
	    <section class="bg-grey pt40 pb40">
	    	<div class="inner">
	            <header class="caption mb40"> 
	                <hgroup>五项风控措施</hgroup>
	            </header>
	            <article class="pl50 pr50 pt50 pb50">
	                         	<table width="960" align="center" cellpadding="0" cellspacing="0" border="0" class="center">
	                            	<tr valign="top">
	                                	<td width="500">
	                        	<dl>
	                            	<dt class="px18 clr-dark red-block">第三方资金托管</dt>
	                                <dd class="mt10">投资人充值、投资和借款人资金提取、还款等所有的资金往来都由<br/>第三方支付机构（宝付）进行资金托管，确保资金与平台的严格分离，保障投资人的资金安全</dd>
	                            </dl>
	                                    </td>
	                                    <td align="right"><img src="/resources/public/images/comer/security-content-img1.jpg"></td>
	                                </tr>
	                            </table>
	            </article>
	      	</div>
	    </section>
	    <section class="bg-white pt50 pb50">
	    	<div class="inner">
	            <article>
	            	<table width="960" align="center" cellpadding="0" cellspacing="0" border="0" class="center">
	                            	<tr valign="top">
	                                	<td width="500">
	                           			 <img src="${oss}/resources/public/images/comer/security-content-img2.jpg">
	                                    </td>
	                                    <td>
	                        	<dl>
	                            	<dt class="px18 clr-dark red-block">债权收购</dt>
	                                <dd class="mt10">所有项目均与资产实力雄厚的收购方签订收购协议，在项目发生风险时，<br/>对优先投资人的本息和夹层投资者的本金进行债权收购，确保投资者投资安全</dd>
	                            </dl>
	                                    </td>
	                                </tr>
	                            </table>
	            </article>
	      	</div>
	    </section>
	    <section class="bg-grey pt50 pb50">
	    	<div class="inner">
	            <article>
	            	<table width="960" align="center" cellpadding="0" cellspacing="0" border="0" class="center">
	                            	<tr valign="top">
	                                	<td width="500">
	                        	<dl>
	                            	<dt class="px18 clr-dark red-block">足值的担保物</dt>
	                                <dd class="mt10">第三方收购机构要求融资方提供动产、不动产、股票、股权等变现能力强的超过融资额度价值的抵押或质押物，为投资人提供保障</dd>
	                            </dl>
	                                    </td>
	                                    <td align="right"><img src="/resources/public/images/comer/security-content-img3.jpg"></td>
	                                </tr>
	                            </table>
	            </article>
	      	</div>
	    </section>
	    <section class="bg-white pt50 pb50">
	    	<div class="inner">
	            <article>
	            	<table width="960" align="center" cellpadding="0" cellspacing="0" border="0" class="center">
	                            	<tr valign="top">
	                                	<td width="500">
	                           			 <img src="${oss}/resources/public/images/comer/security-content-img4.jpg">
	                                    </td>
	                                    <td>
	                        	<dl>
	                            	<dt class="px18 clr-dark red-block">连带责任担保</dt>
	                                <dd class="mt5">每个项目要求有第三方或借款人的股东及配偶等提供无限连带责任担保，<br/>若项目发生风险，可向其追偿，为投资人再添保障</dd>
	                            </dl>
	                                    </td>
	                                </tr>
	                            </table>
	            </article>
	      	</div>
	    </section>
	    <section class="bg-grey pt50 pb50">
	    	<div class="inner">
	            <article>
	            	<table width="960" align="center" cellpadding="0" cellspacing="0" border="0" class="center">
	                            	<tr valign="top">
	                                	<td width="500">
	                        	<dl>
	                            	<dt class="px18 clr-dark red-block">劣后资金安全垫</dt>
	                                <dd class="mt10">根据投资人风险/收益偏好程度，独创优先、夹层、劣后分级投资模<br/>式供投资人灵活选择。若项目发生逾期时，劣后资金作为安全垫，<br/>优先投资人本息和夹层投资人本金先于劣后资金获得赔付</dd>
	                            </dl>
	                                    </td>
	                                    <td align="right"><img src="${oss}/resources/public/images/comer/security-content-img5.jpg"></td>
	                                </tr>
	                            </table>
	            </article>
	      	</div>
	    </section>
	    
	    <section class="bg-white pt40 pb40">
	    	<div class="inner">
	            <header class="caption mb40"> 
	                <hgroup>项目众持流程</hgroup>
	            </header>
	            <article class="pl50 pr50 pt50 pb50">
	            	<img src="${oss}/resources/public/images/comer/security-footer-img.jpg">
	            </article>
	      	</div>
	    </section>
	            
	    <div class="security-foot mt50">
	        <div class="inner txt-c pt50">
	        <a class="unblock bg-red radius5 px18 clr-white hov-yellow overflow txt-c" data-hover="expandDown" href="/loaninfo/loanList.htm?nav=2">查看项目，开始理财</a>
	        </div>
	    </div>
	  </main>
	<!--Main end-->

	<!-- footer -->
	<jsp:include page="/WEB-INF/views/hc9/footer_new.jsp" />
	<!-- end footer -->
</body>
</html>