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
#newYear {
	color:#333;
	line-height:1.6;
}
#newYear .clr-darkRed {
	color:#d00808;
}
#newYear .clr-yellow {
	color:#ffe684;
}
#newYear .bg-darkRed,
#newYear tr.bg-darkRed td {
	background-color:#d00808;
}
#newYear .bg-lightRed,
#newYear tr.bg-lightRed td {
	background-color:#f14c4b;
}
#newYear .bg-yellow,
#newYear tr.bg-yellow td {
	background-color:#ffe684;
}
#newYear .inner {
	width:1194px;
}
#newYear .banner {
	background:url(/resources/public/images/monkey/banner.jpg) center top no-repeat;
	height:786px;
}

#newYear .common-table th,
#newYear .common-table td{
	min-height:46px;
	padding:.5rem;
}
#newYear .wrapper {
	position:relative;
	border:solid #d00808 1px;
	padding:70px 50px;
	margin:15px 0;
}
#newYear .wrapper .adorn {
	display:block;
	position:absolute;
	background-image:url(/resources/public/images/monkey/box-adorn_red.png);
	background-repeat:no-repeat;
}
#newYear .wrapper.yellow .adorn{
	background-image:url(/resources/public/images/monkey/box-adorn_yellow.png);
}
#newYear .wrapper .adorn.center {
	width:262px;
	height:41px;
	left:50%;
	margin-left:-141px;
}
#newYear .partFour .wrapper .adorn.center {
	margin-left:-130px;
}
#newYear .wrapper .adorn.center.top {
	background-position:center top;
}
#newYear .wrapper .adorn.center.bottom {
	background-position:center bottom;
}
#newYear .wrapper .adorn.left,
#newYear .wrapper .adorn.right {
	width:18px;
	height:16px;
	background-color:white;
}
#newYear .wrapper .adorn.left {
	left:-3px;
}
#newYear .wrapper .adorn.right {
	right:-3px;
}
#newYear .wrapper .adorn.top {
	top:-2px;
}
#newYear .wrapper .adorn.bottom {
	bottom:-2px;
}
#newYear .wrapper .adorn.left.top {
	background-position:left top;
}
#newYear .wrapper .adorn.left.bottom {
	background-position:left bottom;
}
#newYear .wrapper .adorn.right.top {
	background-position:right top;
}
#newYear .wrapper .adorn.right.bottom {
	background-position:right bottom;
}
#newYear a.wrapper{
	display:block;
	width:202px;
	font-size:22px;
	text-align:center;
	padding:10px 0;
	background-color:#d00808;
	margin:30px auto;
}
#newYear a.wrapper .adorn.left,
#newYear a.wrapper .adorn.right{
	background-color:#d00808;
}
#newYear a.wrapper .adorn.left {
	left:-1px;
}
#newYear a.wrapper .adorn.right {
	right:-1px;
}
#newYear a.wrapper .adorn.top {
	top:-1px;
}
#newYear a.wrapper .adorn.bottom {
	bottom:-1px;
}

#newYear .partOne .wrapper dl {
	background-repeat:no-repeat;
	background-position:0 0;
	width:216px;
	padding:210px 0 0 0;
	text-align:center;
	position:absolute;
}
#newYear .partOne .wrapper dt {
	font-size:24px;
}
#newYear .partOne .wrapper dd {
	font-size:18px;
}
#newYear .partOne .wrapper p{
	height:206px;
	line-height:206px;
}
#newYear .partTwo {
	background:#ee253d;
	position:relative;
	margin:180px 0;
}
#newYear .partTwo .cover-top,
#newYear .partTwo .cover-bottom {
	position:absolute;
	background-image:url(/resources/public/images/monkey/cover-sprites.png);
	background-repeat:no-repeat;
	height:180px;
	width:100%;
}
#newYear .partTwo .cover-top {
	background-position:left top;
	top:-180px;
}
#newYear .partTwo .cover-bottom {
	background-position:left bottom;
	bottom:-180px;
}
#newYear .partTwo .wrapper {
	border-color:#ffe684;
}
#newYear .partTwo a.wrapper{
	color:#ffe684;
}
#newYear .partTwo .wrapper .adorn.left,
#newYear .partTwo .wrapper .adorn.right {
	background-color:#ee253d;
}
#newYear .partTwo .wrapper figure:nth-child(odd){
	margin:0 90px;
}
#newYear .partTwo .award-list{
	margin-top:50px;
}
#newYear .partTwo .common-table td a{
	background-color:#ffffff;
	font-size:18px;
	border-radius:5px;
	padding:5px 10px;
}
#newYear .partTwo .wrapper{
	padding:50px;
}
#newYear .partTwo ul.fl-l {
	margin-top:-30px;
	width:180px;
}
#newYear .partTwo .fl-l .wrapper{
	padding:10px 0;
	background-color:#ee253d;
	font-size:22px;
	line-height:1.3;
}
#newYear .partTwo .fl-l .wrapper .adorn {
	-webkit-transition: all 420ms cubic-bezier(0.215, 0.610, 0.355, 1.000);
	-moz-transition: all 420ms cubic-bezier(0.215, 0.610, 0.355, 1.000);
	transition: all 420ms cubic-bezier(0.215, 0.610, 0.355, 1.000);
}
#newYear .partTwo .fl-l .wrapper em{
	display:block;
	font-size:14px;
}
#newYear .partTwo .fl-l .wrapper.active {
	color:#d00808;
	background:#ffe684; 
}
#newYear .partTwo .fl-l .wrapper.active .adorn {
	background-color:#ffe684;
	background-image:url(/resources/public/images/monkey/box-adorn_red.png);
	border-color:#d00808;
}
#newYear .partTwo .fl-r{
	width:950px;
}
#newYear .partTwo .common-table td{
	background:#ee253d;
}
#newYear .partTwo .common-table tr.lightcolor td{
	background:#f14c4b;
}
#newYear .partTwo .common-table tr:nth-child(1) td{
	background:#ffe684;
}
#newYear .partTwo .common-table td{
	 height:48px;
}
#newYear .partThree{
	background-color:#ffe684;
	padding-top:200px;
	margin-top:-100px;
}
#newYear .partThree article .prize{
	background:url(/resources/public/images/monkey/price.png) center center no-repeat;
	height:385px;
	padding:100px 0;
	position:relative;
}
#newYear .partThree article .prize li{
	position:absolute;
}
#newYear .partThree article .prize li:nth-child(1){
	top:130px;
	left:695px;
}
#newYear .partThree article .prize li:nth-child(2){
	top:235px;
	right:885px;
}
#newYear .partThree article .prize li:nth-child(3){
	top:300px;
	left:900px;
}
#newYear .partThree article .prize li{
	font-size:14px;
	color:#635621;
}

#newYear .partThree .common-table td{
	background:#ffe684;
}
#newYear .partThree .common-table tr.lightcolor td{
	background:#fcc979;
}
#newYear .partThree .common-table tr:nth-child(1) td{
	background:#d00808;
}
#newYear .partThree .common-table td{
	 height:48px;
}
#newYear .partThree .first-three td{
	background-color:#fcc979;
}
#newYear .partFour{
	background-color:#ffe684;
}
#newYear .partFour .wrapper .adorn {
	background-color:#ffe684;
}
#newYear .partFour footer{
	padding-bottom:20px;
}
#newYear .partFour article .wrapper {
	padding:50px;
}
.floatbox{
	position:fixed;
	z-index:99;
	left:50%;
	top:50%;
	margin-left:600px;
	background:url(/resources/public/images/monkey/fixed-bg.png) 0 0 no-repeat;
	width:272px;
	height:177px;
}
.floatbox a{
	display:block;
	width:120px;
	height:90px;
	position:absolute;
	left:81px;
	top:64px;
}

#newYear .partTwo .common-table{
	border:1px solid #ffe684;
}
#newYear .partTwo .common-table td{
	border:1px solid #ffe684;
}
#newYear .partThree .clr-darkRed{
	border:1px solid #ee253d;
}
#newYear .partThree .clr-darkRed td{
	border:1px solid #ee253d;
}


</style>
</head>
<body>
	<!--Container begin-->
	<div id="container">
		<jsp:include page="/WEB-INF/views/hc9/header_new.jsp" />
	  <!--Main begin-->
  <main id="newYear" role="main">

    
    <div class="banner">
    </div>
    
    <section class="partOne">
    	<header class="txt-c"><img src="${oss }/resources/public/images/monkey/box-title_1.png"><p class="mt20">每个项目<font class="clr-darkRed">单笔投资最高</font>的投资者，可获得<font class="clr-darkRed">“一鸣金人”</font>奖；<br>每个项目<font class="clr-darkRed">最后一笔投资</font>的投资者，可获得<font class="clr-darkRed">“一锤定音”</font>奖；</p></header>
        <article class="inner">
        	<div class="wrapper">
                <span class="adorn left top"></span>
                <span class="adorn left bottom"></span>
                <span class="adorn right top"></span>
                <span class="adorn right bottom"></span>
                <span class="adorn center top"></span>
                <span class="adorn center bottom"></span>
                <p class="txt-c clr-darkRed" style="font-size:60px;"><font color="#f9b7b7">现金奖励</font></p>
                <dl style="background-image:url(${oss }/resources/public/images/monkey/moneyAward-199.gif);left:175px;top:55px;">
                	<dt class="clr-darkRed">一鸣金人</dt>
                    <dd>单笔投资最高者得</dd>
                </dl>
                <dl style="background-image:url(${oss }/resources/public/images/monkey/moneyAward-99.gif);left:816px;top:55px;">
                	<dt class="clr-darkRed">一锤定音</dt>
                    <dd>最后一笔投资者得</dd>
                </dl>
            </div>
            <p><font color="#d00808">*</font> 投资劣后不参与，如项目只剩下劣后，将获取优先或夹层最后一笔的投资客户来发放奖励。<br>
              <font color="#d00808">*</font> 若用户同时投资优先和夹层，将分开记2笔投资记录。<br>
              <font color="#d00808">*</font> 活动现金奖励将在满标放款后五个工作日内发放，奖金可用于投资或提现。<br>
            <font color="#d00808">*</font> 带有“奖” 角标标识的项目参与活动。</p>
        </article>
    </section>
    
    <section class="partTwo">
    	<header class="txt-c"><img src="${oss }/resources/public/images/monkey/box-title_2.png"><p class="mt20">活动期间，每周在前海红筹累计投资最多的三位客户将获得<font class="clr-yellow">“金袍加身”</font>的奖励。<br>
    	  每周二为一个开奖结点，宣布上周获奖名单，奖励如下：</p>
    	</header>
      	<article class="inner">
        	<div class="wrapper yellow">
                <span class="adorn left top"></span>
                <span class="adorn left bottom"></span>
                <span class="adorn right top"></span>
                <span class="adorn right bottom"></span>
                <span class="adorn center top"></span>
                <span class="adorn center bottom"></span>
                <div class="clearfix txt-c px20 clr-yellow">
                	<figure class="fl-l"><img src="${oss }/resources/public/images/monkey/investRate-222x208x01.jpg" width="222" height="208" /><figcaption>现金返利投资总金额 0.8%</figcaption></figure>
                	<figure class="fl-l"><img src="${oss }/resources/public/images/monkey/investRate-222x208x02.jpg" width="222" height="208" /><figcaption>现金返利投资总金额 0.6%</figcaption></figure>
                	<figure class="fl-l"><img src="${oss }/resources/public/images/monkey/investRate-222x208x03.jpg" width="222" height="208" /><figcaption>现金返利投资总金额 0.3%</figcaption></figure>
                </div>
            </div>
            <p class="txt-c clr-yellow mt50 pt30 mb30" style="font-size:30px;">前十名投资排行榜<c:if test="${week ne 7 }">（实时更新中）</c:if></p>
            <div class="clearfix monkey">
               	<input id="week" type="hidden" value="${week }">
            	<ul class="fl-l clr-yellow">
                    <li>
                        <a  href="javascript:;" condition="1" class="wrapper yellow">第一周榜单<em>[ 1.19 - 1.25 ]</em>
                            <span class="adorn left top"></span>
                            <span class="adorn left bottom"></span>
                            <span class="adorn right top"></span>
                            <span class="adorn right bottom"></span>
                        </a>
                    </li>
                    <li>
                        <a  href="javascript:;" condition="2" class="wrapper yellow">第二周榜单<em>[ 1.26 - 2.1 ]</em>
                            <span class="adorn left top"></span>
                            <span class="adorn left bottom"></span>
                            <span class="adorn right top"></span>
                            <span class="adorn right bottom"></span>
                        </a>
                    </li>
                    <li>
                        <a  href="javascript:;" condition="3" class="wrapper yellow">第三周榜单<em>[ 2.2 - 2.8 ]</em>
                            <span class="adorn left top"></span>
                            <span class="adorn left bottom"></span>
                            <span class="adorn right top"></span>
                            <span class="adorn right bottom"></span>
                        </a>
                    </li>
                    <li>
                        <a  href="javascript:;" condition="4" class="wrapper yellow">第四周榜单<em>[ 2.9 - 2.15 ]</em>
                            <span class="adorn left top"></span>
                            <span class="adorn left bottom"></span>
                            <span class="adorn right top"></span>
                            <span class="adorn right bottom"></span>
                        </a>
                    </li>
                    <li>
                        <a  href="javascript:;" condition="5" class="wrapper yellow">第五周榜单<em>[ 2.16 - 2.22 ]</em>
                            <span class="adorn left top"></span>
                            <span class="adorn left bottom"></span>
                            <span class="adorn right top"></span>
                            <span class="adorn right bottom"></span>
                        </a>
                    </li>
                    <li>
                        <a  href="javascript:;" condition="6" class="wrapper yellow">第六周榜单<em>[ 2.23 - 2.29 ]</em>
                            <span class="adorn left top"></span>
                            <span class="adorn left bottom"></span>
                            <span class="adorn right top"></span>
                            <span class="adorn right bottom"></span>
                        </a>
                    </li>
                </ul>
                <div class="fl-r monkey-list">
                	
                </div>
            </div>
            <p class="mt20"><font color="#ffe684">*</font> 投资劣后不参与，活动奖励将在评选结果公布后的五个工作日内发放，奖励可用于投资或提现。</p>
		</article>
        <div class="cover-top"></div>
        <div class="cover-bottom"></div>
    </section>
    
    <section class="partThree">
    	<header class="txt-c"><img src="${oss }/resources/public/images/monkey/box-title_3.png"><p class="mt20">1月19日-2月29日 活动期间，在前海红筹累计投资金额最多的三位客户将获得<font class="clr-darkRed" style="border: none;">“红筹达人”</font>的奖励，奖励如下：</p></header>
    	<article class="inner">
    		<c:choose>
	    		<c:when test="${week ge 1 && week le 6 || empty eredar[0] }">
		            <ul class="prize inner">
		            	<li><img src="${oss }/resources/public/images/monkey/price-text_1.png" /></li>
		            	<li><img src="${oss }/resources/public/images/monkey/price-text_2.png" /></li>
		            	<li><img src="${oss }/resources/public/images/monkey/price-text_3.png" /></li>
		            </ul>
	    		</c:when>
	    		<c:otherwise>
	    			<ul class="prize inner">
	    				<c:set var="phone1" value="${eredar[0] }"/>
	    				<c:set var="phone2" value="${eredar[1] }"/>
	    				<c:set var="phone3" value="${eredar[2] }"/>
		    			<li><dl><dt>第一名获得者</dt><dd style="color:#d00808;font-size:32px;">${phone1.replace(phone1.substring(3,phone1.length()-4),'****') }</dd><dd>奖品 iPhone 6s 16G</dd></dl></li>
		            	<li><dl><dt>第二名获得者</dt><dd style="color:#d00808;font-size:32px;">${phone2.replace(phone2.substring(3,phone2.length()-4),'****') }</dd><dd>奖品 APPLE WATCH SPORT 手表</dd></dl></li>
		            	<li><dl><dt>第三名获得者</dt><dd style="color:#d00808;font-size:32px;">${phone3.replace(phone3.substring(3,phone3.length()-4),'****') }</dd><dd>奖品  Kindle 电子书 </dd></dl></li>
	            	</ul>
	    		</c:otherwise>
    		</c:choose>
            <p class="title clr-darkRed txt-c" style="font-size:30px;border: none;">1月19日-2月29日活动期间内前十名投资排行榜<c:if test="${week ne 7 }">（实时更新中）</c:if></p>
            	<table width="100%" border="0" cellpadding="1" cellspacing="1" bgcolor="#ee253d"  class="common-table txt-c clr-darkRed mt30 mb30 px18">
                    <col width="20%"/>
                    <col width="40%"/>
                    <col width="40%"/>
                    <tr  class="px22 bg-yellow clr-yellow" height="60">
                        <td style="border:1px solid #d00808 ">排名</td>
                        <td style="border:1px solid #d00808 ">手机号</th>
                        <td style="border:1px solid #d00808 ">投资累计金额</td>
                    </tr>
                    <c:forEach var="monkeyData" varStatus="i" items="${eredarList }" begin="0" end="9">
						<tr <c:if test="${i.count le 3 }">class="first-three"</c:if>>
				                <td><c:choose><c:when test="${i.count le 3 }"><img src="${oss }/resources/public/images/monkey/investRank-sprites${i.count }.png" /></c:when>
									<c:otherwise>${i.count }</c:otherwise>
								</c:choose></td>
								<c:set var="phone" value="${monkeyData.phone.toString() }" />
								<td>${phone.replace(phone.substring(3,phone.length()-4),'****') }</td>
				                <td>
				                <fmt:formatNumber type="number" value="${monkeyData.money }" pattern="#0.00" />
				                </td>
						</tr>
					</c:forEach>
					<c:if test="${empty eredarList }">
						<tr><td colspan="3">还没用户入榜</td></tr>
					</c:if>
                </table>
            <p><font color="#d00808">*</font> 投资劣后不参与，活动奖励将在活动结束后的十个工作日内由客服联系致电后发放，请保持电话畅通，过期奖励作废。</p>
        </article>
    </section>
    
    <section class="partFour">
    	<header class="txt-c pt50"><img src="${oss }/resources/public/images/monkey/box-title_4.png"></header>
        <article class="inner">
        	<div class="wrapper">
                <span class="adorn left top"></span>
                <span class="adorn left bottom"></span>
                <span class="adorn right top"></span>
                <span class="adorn right bottom"></span>
                <span class="adorn center top"></span>
                <span class="adorn center bottom"></span>
                <p class="clr-darkRed">1、活动时间：2016年1月19日-2016年2月29日；<br>
                2、本次活动仅针对认购优先、夹层级产品，劣后级不参与；<br>
                3、活动中如多名客户同时达到获奖标准，将默认最先达到标准的客户来发放奖励；<br>
                4、如有疑问，请拨打客服热线400-822-3499，我们将竭诚为您服务；<br>
                5、本活动最终解释权归前海红筹所有；</p>
            </div>
        </article>
        <footer>
        	<a href="/loaninfo/loanList.htm?nav=2" class="wrapper yellow">
                <span class="adorn left top"></span>
                <span class="adorn left bottom"></span>
                <span class="adorn right top"></span>
                <span class="adorn right bottom"></span>
                <p class="clr-yellow">立即投资</p>
            </a>
        </footer>
    </section>
    
    <c:if test="${empty session_user }">
    <div class="floatbox">
    	<a href="/visitor/to-regist"></a>
    </div>
    </c:if>
  </main>
  <!--Main end--> 
		<jsp:include page="/WEB-INF/views/hc9/footer_new.jsp" />
	</div>
	<!--Container end-->
	<script type="text/javascript">
		function queryData(week_num,week) {
			//alert(week_num+'---'+week);
			if (week != 0) {
				$(".monkey li").eq(week_num-1).find('a').addClass('active').parent().siblings().find('a').removeClass('active');
			}
			$.ajax({ type : 'post',url : '/activity/monkeyData.htm',
				data : { 
					weekNum : week_num,
					week : week
				},success : function(data) {$(".monkey-list").html(data);}
			});
		}
		$(function(){
			var week = $("#week").val();
			if (week == 7) {  // 如果为最后一期，显示最后一周的数据
				queryData(6,week);
			} else {
				queryData(week,week);
			}
			$(".monkey a").click(function(){
				var condi = $(this).attr('condition');
				queryData(condi,week);
			});
			if (week > 0) { // 当前周数之后的不可点击
				for(var i = week;i < 6;i++) {
					$(".monkey a").eq(i).unbind('click').css({'cursor':'default'});
				}
			}
		});
	</script>
</body>
</html>