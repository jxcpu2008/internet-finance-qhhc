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
<script src="${oss}/resources/public/js/main.js"></script>
<!--[if lte IE 9]> 
<script src="${oss}/resources/public/js/html5.js"></script> 
<script src="${oss}/resources/public/js/selector.js"></script>
<![endif]-->
<style>
#girdBid .inner{
	width:1200px;
}
#girdBid{
	background:url(/resources/public/images/activity/grab/background.jpg) top left repeat;
}
#girdBid .parcel header{
	background:url(/resources/public/images/activity/grab/banner.jpg) top center no-repeat;
	height:576px;
	line-height:576px;
	position:relative;
}
#girdBid .parcel header img{
	position:absolute;
	left:50%;
}
#girdBid .parcel header .tag1{
	margin-left:-288px;
	top:164px;
}
#girdBid .parcel header .tag2{
	margin-left:-360px;
	top:90px;
}
#girdBid .parcel article .title{
	background:url(/resources/public/images/activity/grab/title-bg.jpg) 0 0 no-repeat;
	height:94px;
	line-height:80px;
	position:relative;
}
#girdBid .parcel article .title .purse{
	position:absolute;
	top:-145px;
	left:50%;
	margin-left:-104px;
}
#girdBid .parcel article .content{
	background-color:#ffffff;
	margin-bottom:45px;
}
#girdBid .parcel article .content .clearfix{
	padding:42px 98px;
}
#girdBid .parcel article .hint{
	line-height:24px;
	padding:0 0 145px 16px;
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
  		<main id="girdBid" role="main" style="margin-bottom:-50px;">
	  		<section class="parcel">
	        	<header>
	                    <img src="${oss }/resources/public/images/activity/grab/banner-ico1.png" class="tag1 animated tada" />
	                    <img src="${oss }/resources/public/images/activity/grab/banner-ico2.png" class="tag2 animated tada" />
	            </header>
	            <article class="inner mt40">
	            	<div class="title txt-c">
	                	<p class="clr-white px16">投资带“<img src="${oss }/resources/public/images/activity/grab/title-ico.png" />”有奖标识的项目参与该活动</p>
	                    <img src="${oss }/resources/public/images/activity/grab/purse-img.png" class="purse" />
	                </div>
	                
	                <div class="content inner">
	                	<div class="clearfix">
	                    	<dl class="txt-c fl-l">
	                            <dt class="pb25"><img src="${oss }/resources/public/images/activity/grab/icon_1.jpg" /></dt>
	                            <dd class="pb35">每个项目<font color="#d70c0d">单笔投资最多</font>的投资者，可获得<font color="#d70c0d">“一鸣金人”</font>奖<br>现金奖励：</dd>
	                            <dd class="pb45"><img src="${oss }/resources/public/images/activity/grab/ico-168.jpg" /></dd>
	                        </dl>
	                        <dl class="txt-c fl-r">
	                            <dt class="pb25"><img src="${oss }/resources/public/images/activity/grab/icon_2.jpg" /></dt>
	                            <dd class="pb35">每个项目<font color="#d70c0d">最后一笔投资</font>的投资者，可获得<font color="#d70c0d">“一锤定音”</font>奖<br>现金奖励：</dd>
	                            <dd class="pb45"><img src="${oss }/resources/public/images/activity/grab/ico-68.jpg" /></dd>
	                        </dl>
	                    </div>
	                </div>
	                
	                <div class="hint inner">
	                	<p class="px20"><font color="#ffeb00">温馨提示：</font></p>
	                    <p class="px14 clr-white">1. 抢标活动以金额优先和时间优先为原则，即当两个用户在同一时间段且投资同样金额，将按照投资列表的先后顺序进行判定，靠前者判定为“一鸣金人”；<br>
	                    2.“一锤定音”奖励仅为认购优先、夹层级客户所有，劣后级不参与其中；<br>
	                    3.如两笔奖项为同一名用户，则两笔奖励都归其所有。<br>
	                    4.本活动最终解释权归前海红筹所有。</p>
	                </div>
	            </article>
	        </section>
	  </main>
  		<!--Main end-->
		<!-- footer -->
		<jsp:include page="/WEB-INF/views/hc9/footer_new.jsp" />
		<!-- end footer -->
	</div>
	<!--Container end-->
</body>
</html>