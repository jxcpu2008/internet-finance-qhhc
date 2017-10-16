<%@ page language="java" contentType="text/html; utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<jsp:include page="/WEB-INF/views/hc9/common/common_css.jsp" />
<link href="${oss}/resources/assets/css/home.css?v=1.02" rel="stylesheet">
<link href="${oss}/resources/assets/css/talkUser.css?v=1.0.3" rel="stylesheet">
<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_css.jsp" />
</head>
<body>
	<!-- head -->
	<jsp:include page="/WEB-INF/views/hc9/header.jsp" />
	<!-- end head -->
	<!-- banner -->
	<div id="banner" class="carousel slide" data-ride="carousel">
		<ol class="carousel-indicators">
			<c:forEach var="imgUrl" items="${application_banner}"
				varStatus="banner">
				<c:choose>
					<c:when test="${banner.index eq 0 }">
						<li data-target="#banner" data-slide-to="${banner.index }"
							class="ie-opacity-lightest active"></li>
					</c:when>
					<c:otherwise>
						<li data-target="#banner" data-slide-to="${banner.index }"
							class="ie-opacity-lightest"></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</ol>
		<div class="carousel-inner" role="listbox">
			<c:forEach var="imgUrl" items="${application_banner}"
				varStatus="banner">
				<c:choose>
					<c:when test="${banner.index eq 0 }">
						<div class="item active"
							style="background-image: url(${imgUrl.imgurl});">
							<a href="${imgUrl.url}" style="display: block; height: 350px;"
								target="_blank"></a>
						</div>
					</c:when>
					<c:otherwise>
						<c:if test="${empty imgUrl.url}">
							<div class="item"
								style="background-image: url(${imgUrl.imgurl});">
								<a href="javascript:;" style="display: block; height: 350px;"></a>
							</div>
						</c:if>
			
						<c:if test="${!empty imgUrl.url}">
							<div class="item"
								style="background-image: url(${imgUrl.imgurl});">
								<a href="${imgUrl.url}" style="display: block; height: 350px;"
									target="_blank"></a>
							</div>
						</c:if>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		<c:if test="${empty session_user }">
			<div class="carousel-widget">
				<div class="mask-widget ie-opacity-lighter"></div>
				<div class="wrap-widget">
					<p class="lg-font">
						<span class="smmedium-font">收益</span><span class="text-alert">(10%-14%)</span>
					</p>
					<p class="lg-font">30倍活期存款收益</p>
					<a href="${https }/visitor/to-regist" class="btn btn-line" role="button">免费注册</a>
					<p>已有账号，
						<a href="${https }/visitor/to-login"
							class="text-alert text-center ljdl">立即登录</a>
					</p>
				</div>
			</div>
		</c:if>
		<c:if test="${!empty session_user }">
			<div class="carousel-widget">
				<div class="mask-widget ie-opacity-lighter"></div>
				<div class="wrap-widget">
					<p class="lg-font">
						<span class="smmedium-font">收益</span><span class="text-alert">(10%-14%)</span>
					</p>
					<p class="lg-font">30倍活期存款收益</p>
					<a href="/member_index/member_center.htm?index=0_0&nav=5"
						class="btn btn-line" role="button">进入我的账户</a>
					<!-- <p class="text-alert text-center lgmedium-font">
						<a href="/travelHc9.htm"
							class="text-alert text-center lgmedium-font sn">小9带你游红筹</a>
					</p> -->
				</div>
			</div>
		</c:if>

	</div>
	<div class="profile bg-danger clearfix">
		<div class="container clearfix">
			<div class="pull-left">
				<h3 class="text-alert">什么是众持模式？</h3>
				<p>
					众持模式是互联网金融行业中的新锐企业前海红筹首创，以专业的态度、健全的风控体系、创新的精神、合理化的利率，及独立的第三方资金托管模式，为投资者实现卓越的理财计划。
					<!-- <a href="/visitor/whatIsHold.htm">查看更多&gt;&gt;</a> -->
				</p>
			</div>
			<div class="pull-right">
				<div id="info" class="carousel slide" data-ride="carousel">
					<!-- <ol class="carousel-indicators info-indicators">
						<li data-target="#info" data-slide-to="0"
							class="ie-opacity-lightest active"></li>
						<li data-target="#info" data-slide-to="1"
							class="ie-opacity-lightest"></li>
					</ol> -->
					<div class="carousel-inner" role="listbox">
						<div class="item active clearfix" style="overflow:hidden;zoom:1;">
							<div class="info-caption pull-left">
								<h3>
									<fmt:formatNumber type="number" value="${totalInvest}"
										pattern="#0.00" />
								</h3>
								<p>累计投资 ( 元 )</p>
							</div>
							<div class="info-caption pull-right">
								<h3>${currentRegUsers}</h3>
								<p>当前网站注册人数</p>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="bg-container">
		<div class="container">
			<!-- 新闻公告 -->
			<div class="newspub clearfix">
				<section class="pull-left cleargap">
					<ul class="list-unstyled list-inline">
						<li><a href="/visitor/toSafeSecurity.htm?nav=3"> <img
								class="animated bounceIn img-responsive center-block img-thumbnail img-circle"
								src="${oss}/resources/assets/images/home/icon-pig.png" alt="全资金托管">
								<h3 class="text-danger">全资金托管</h3>
								<p class="text-left text-para">采用第三方支付平台进行全资金托管，资金流向安全透明</p>
						</a></li>
						<li><a href="/visitor/toSafeSecurity.htm?nav=3"> <img
								class="animated bounceIn img-responsive center-block img-thumbnail img-circle"
								src="${oss}/resources/assets/images/home/icon-box.png" alt="安全保障">
								<h3 class="text-danger">安全保障</h3>
								<p class="text-left text-para">专业的风控体系，五大安全保障，为您的资金安全保驾护航</p>
						</a></li>
						<li><a href="/visitor/toSafeSecurity.htm?nav=3"> <img
								class="animated bounceIn img-responsive center-block img-thumbnail img-circle"
								src="${oss}/resources/assets/images/home/icon-hand.png" alt="超值体验">
								<h3 class="text-danger">多元投资</h3>
								<p class="text-left text-para">三种投资方式匹配浮动收益，满足投资人不同的投资喜好</p>
						</a></li>
					</ul>
				</section>
				<section class="pull-right cleargap" role="tabpanel">
					<ul class="nav nav-tabs nav-justified" role="tablist">
						<li role="presentation" class="active"><a href="#news"
							aria-controls="news" role="tab" data-toggle="tab">新闻公告</a></li>
						<li role="presentation"><a href="#reback"
							aria-controls="reback" role="tab" data-toggle="tab">回款信息</a></li>
					</ul>
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane fade in active" id="news">
							<ul class="cleargap">
								<c:forEach items="${artList01}" var="art" varStatus="i"
									begin="0" end="3">
									<c:if test="${i.count eq 1 }">
										<li><a href="${art.url}" class="text-ellipsis"><c:if
													test="${fn:length(art.title) ge 11 }">&bull;&nbsp;${fn:substring(art.title,0,10)}...</c:if>
													<c:if test="${fn:length(art.title) lt 11}">&bull;&nbsp;${art.title}</c:if><img
												src="${oss}/resources/assets/images/home/icon_new.jpg"></a> <time
												class="text-snower">${fn:substring(art.createTime,0,10) }</time></li>
									</c:if>
									<c:if test="${i.count ne 1 }">
										<li><a href="${art.url}" class="text-ellipsis"><c:if
													test="${fn:length(art.title) ge 11 }">&bull;&nbsp;${fn:substring(art.title,0,10)}...</c:if><c:if test="${fn:length(art.title) lt 11}">&bull;&nbsp;${art.title}</c:if></a>
											<time class="text-snower">${fn:substring(art.createTime,0,10) }</time></li>
									</c:if>
								</c:forEach>
							</ul>
							<p class="text-right">
								<a href="/to/list-1-4.htm">&gt;&gt; 更多 </a>
							</p>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="reback">
							<ul class="list-unstyled">
								<c:forEach items="${dynamic}" var="dy">
									<li><a href="/loaninfo/loansignInfo.htm?loanId=${dy.loanId}"
										class="text-ellipsis">&bull;&nbsp;${dy.title}</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</section>
			</div>

			<!-- 热门推荐 -->
			<div style="margin: 10px 0 30px 0;" id="pro-stress" class="clearfix">
				<h3 style="color: #777777; padding-bottom: 10px;">热门推荐</h3>
				<div>
					<c:forEach var="loanlist" items="${loanlist}" begin="0" end="1" varStatus="i">
						<div style="width: 570px; height:260px; border: 1px #dddddd solid; background-color: #f8f8f8; border-radius:4px;" <c:choose><c:when test="${i.count eq 1 }">class="pull-left"</c:when><c:otherwise>class="pull-right"</c:otherwise></c:choose>>
							<div style="overflow: hidden; padding:10px 15px;background-color: white; border-radius:4px;" class="clearfix" >
								<a href="/loaninfo/loansignInfo.htm?loanId=${loanlist.id}" class="pull-left" style=" color: #d9534f;font-size: 18px;">${loanlist.name }</a>
								<span class="pull-right" style="color: #777;font-size: 14px;line-height: 28px;">标期:<c:if test="${loanlist.type eq 2}">${loanlist.remonth}个月</c:if>
										<c:if test="${loanlist.type eq 3}">${loanlist.remonth}天 </c:if></span>
							</div>
							<div style="padding-bottom: 10px;border-bottom: 1px solid #dddddd;background-color: white;" class="clearfix">
								<div id="process-${i.count + 29 }" class="autox110 pull-left" data-process="<fmt:formatNumber type="number" value="${(loanlist.issueLoan-loanlist.restMoney)/loanlist.issueLoan*100}" pattern="#0.0" />" style=" margin-right: 30px;"></div>
								<div class="pull-left">
									<p>
										<span style="background-color: #61b347; width: 22px; height: 22px; line-height: 22px; display: inline-block; text-align: center; color: white; border-radius:4px;">优</span>
										<span style="font-size: 16px;">预期年化收益：</span><span class="medium-font text-success sub-align"><fmt:formatNumber type="number" value="${loanlist.prioRate*100}" pattern="#0.00" /><span class="normal-font">%</span>+<fmt:formatNumber type="number" value="${loanlist.prioAwordRate*100}" pattern="#0.00" /><span class="normal-font">%</span></span>
									</p>
									<p>
										<span style="background-color: #fbca3f; width: 22px; height: 22px; line-height: 22px; display: inline-block; text-align: center; color: white; border-radius:4px;">夹</span>
										<span style="font-size: 16px;">预期年化收益：</span><span class="medium-font text-success sub-align" style="color: #fbca3f;font-size: 24px;">0~14%</span>
									</p>
									<p>
										<span style="background-color: #ea564c; width: 22px; height: 22px; line-height: 22px; display: inline-block; text-align: center; color: white; border-radius:4px;">劣</span>
										<span style="font-size: 16px;">预期年化收益：</span><span class="medium-font text-success sub-align" style="color: #ea564c;font-size: 24px;">浮动收益</span>
									</p>
								</div>
								<div style="background: 0; border: 0; clear: both; display: block; float: none; font-size: 0; margin: 0; padding: 0; width: 0; height: 0; line-height: 0; overflow: hidden; visibility: hidden; font-size: 0"></div>
							</div>
							<div class="clearfix" style="padding: 0 15px 0 15px; font-size: 14px; color: #656565;">
								<span class="pull-left" style="padding-top:15px;">融资总额: ¥ <fmt:formatNumber type="number" value="${loanlist.issueLoan}" pattern="#0.00" /> 元</span>
								<c:if test="${loanlist.status eq 1 }">
									<a href="/loaninfo/loansignInfo.htm?loanId=${loanlist.id}" class="pull-right" style="color: white; background-color: #d95350;text-decoration:none; padding: 10px 20px;margin: 5px 0 0 80px; border-radius:4px;">立即抢购</a>
								</c:if>
								<c:if test="${loanlist.status eq 2 || loanlist.status eq 3 ||loanlist.status eq 4 ||loanlist.status eq 5 }">
									<a href="javascript:;" class="pull-right" style="color: white; background-color: #d95350;text-decoration:none; padding: 10px 20px;margin: 5px 0 0 80px; border-radius:4px;">融资成功</a>
								</c:if>
								<c:if test="${loanlist.status eq 6 || loanlist.status eq 7 }">
									<a href="javascript:;" class="pull-right" style="color: white; background-color: #999999;text-decoration:none; padding: 10px 20px;margin: 5px 0 0 80px; border-radius:4px;">还款中</a>
								</c:if>
								<c:if test="${loanlist.status eq 8 }">
									<a href="javascript:;" class="pull-right" style="color: white; background-color: #999999;text-decoration:none; padding: 10px 20px;margin: 5px 0 0 80px; border-radius:4px;">已完成</a>
								</c:if>
								<c:if test="${loanlist.status eq -1 }">
									<a href="javascript:;" class="pull-right" style="color: white; background-color: #999999;text-decoration:none; padding: 10px 20px;margin: 5px 0 0 80px; border-radius:4px;">已清盘</a>
								</c:if>
								<span class="pull-right" style="padding-top:15px;">起投金额: ¥ <fmt:formatNumber type="number" value="${loanlist.loanUnit}" pattern="#0.00" /> 元</span>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	
	
	<!-- 广告位 -->
	<div class="ad"><a href="/neweractivity/totask.htm" style="display:block;height:120px;"></a></div>
	<div class="bg-container">
		<div class="container product-list">
			<h3>产品列表</h3>
			<a href="/loaninfo/loanList.htm?nav=2" class="more">更多 &gt;&gt;</a>
			<div id="products" class="carousel slide" data-ride="carousel">
				<div class="carousel-inner" role="listbox">
					<c:set var="begin" value="0"></c:set>
					<c:set var="end" value="3"></c:set>
					<c:forEach items="${loanlist}" end="1" varStatus="sta">
						<div class="item active clearfix">
							<c:forEach items="${loanlist}" var="loanlist" varStatus="statvar"
								begin="${begin}" end="${end}">
								<div class="product-info" style="position: relative;">
									<c:if test="${loanlist.activityStatus eq 1 || loanlist.id==378}">
										<img src="${oss}/resources/assets/images/home/award-ico.png" style="position:absolute;right:20px;top:45px;" />
									</c:if>
									<div>
										<h4 class="text-danger text-ellipsis">
											<a href="/loaninfo/loansignInfo.htm?loanId=${loanlist.id}"
												class="text-danger" data-id="modifyDot">${loanlist.name }</a>
										</h4>
										<small class="text-label pull-right">标期:<c:if
												test="${loanlist.type eq 2}">${loanlist.remonth}个月</c:if> <c:if
												test="${loanlist.type eq 3}">${loanlist.remonth}天 </c:if></small>
										<p>
											<span class="text-label">融资总额:</span> &yen; <span
												data-id="fm"><fmt:formatNumber type="number"
													value="${loanlist.issueLoan}" pattern="#0.00" /></span> 元
										</p>
										<p>
											<span class="text-label">起投金额:</span> &yen; <span
												data-id="fm"><fmt:formatNumber type="number"
													value="${loanlist.loanUnit}" pattern="#0.00" /></span> 元
										</p>
										<div id="process-${end+statvar.index }" class="autox110"
											data-process="<fmt:formatNumber
												type="number"
												value="${(loanlist.issueLoan-loanlist.restMoney)/loanlist.issueLoan*100}"
												pattern="#0.0" />"></div>
										<ul class="list-unstyled list-inline clearfix">		
											<c:if test="${loanlist.typeId ne 5 }">
												<li class="text-label micmedium-font text-center"><span
													class="label label-clip label-priority"><span
														class="texttop-align">优</span></span><span
													class="medium-font text-success sub-align"><fmt:formatNumber
															type="number" value="${loanlist.prioRate*100}" pattern="#0.00" /><span
																				class="normal-font">%</span>+<fmt:formatNumber
															type="number" value="${loanlist.prioAwordRate*100}" pattern="#0.00" /><span
														class="normal-font">%</span></span></li>
												<li class="text-label micmedium-font" style="width: 49%;"><span
													class="label label-clip label-sandwich"><span
														class="texttop-align">夹</span></span>0~14<span class="normal-font">%</span></li>
												<li class="text-label micmedium-font" style="width: 49%;"><span
													class="label label-clip label-inferior"><span
														class="texttop-align">劣</span></span>浮动收益</li>
											</c:if>
											<c:if test="${loanlist.typeId eq 5 }">
												<li class="text-label micmedium-font text-center" style="padding-top: 15px;"><span
													class="label label-clip label-priority"></span><span
													class="medium-font text-success sub-align"><fmt:formatNumber
													type="number" value="${(loanlist.prioRate+loanlist.prioAwordRate)*100}" pattern="#0.00" /><span
													class="normal-font">%</span></span></li>
											</c:if>
										</ul>
									</div>
									<c:if test="${loanlist.status eq 1 }">
										<a href="/loaninfo/loansignInfo.htm?loanId=${loanlist.id}"
											class="btn btn-default btn-lg btn-block bg-danger text-snow"
											role="button">立即众持</a>
									</c:if>
									<c:if
										test="${loanlist.status eq 2 || loanlist.status eq 3 ||loanlist.status eq 4 ||loanlist.status eq 5 }">
										<a href="javascript:;"
											class="btn btn-default btn-lg btn-block bg-muted text-snow"
											role="button">融资成功</a>
									</c:if>
									<c:if test="${loanlist.status eq 6 || loanlist.status eq 7 }">
										<a href="javascript:;"
											class="btn btn-default btn-lg btn-block bg-muted text-snow"
											role="button">还款中</a>
									</c:if>
									<c:if test="${loanlist.status eq 8 }">
										<a href="javascript:;"
											class="btn btn-default btn-lg btn-block bg-muted text-snow"
											role="button">已完成</a>
									</c:if>
									<c:if test="${loanlist.status eq -1 }">
										<a href="javascript:;"
											class="btn btn-default btn-lg btn-block bg-muted text-snow"
											role="button">已清盘</a>
									</c:if>
								</div>
							</c:forEach>
							<c:set var="begin" value="${begin+4 }"></c:set>
							<c:set var="end" value="${end+4 }"></c:set>
						</div>
					</c:forEach>
				</div>
				<a class="left carousel-control ie-opacity-snow" href="#products"
					role="button" data-slide="prev"> <span
					class="glyphicon glyphicon-menu-left text-danger"
					aria-hidden="true"></span>
				</a> <a class="right carousel-control ie-opacity-snow" href="#products"
					role="button" data-slide="next"> <span
					class="glyphicon glyphicon-menu-right text-danger"
					aria-hidden="true"></span>
				</a>
			</div>
		</div>
		<!-- <div class="bg-container">
			<div class="container">
				<div class="hc-help">
					<ul class="list-unstyled list-inline text-center cleargap clearfix">
						<li class="col-md-4"><a href="/helper/toHelper.htm?sign=1"><span
								class="icon-hc icon-helper"></span>
								<h3 class="text-label">常见问题</h3></a></li>
						<li class="col-md-4"><a href="/visitor/hcschool.htm?nav=4"><span
								class="icon-hc icon-school"></span>
								<h3 class="text-label">红筹学堂</h3></a></li>
						<li class="col-md-4"><a href="#"><span
								class="icon-hc icon-history"></span>
								<h3 class="text-label">红筹历程</h3></a></li>
					</ul>
				</div>
			</div>
		</div> -->
		<div class="bg-container">
			<div class="container">
				<div class="media-report">
					<h3 class="text-label bg-container text-center">媒体报道</h3>
					<ul class="list-unstyled list-inline cleargap clearfix">
						<li class="col-md-3"><a href="/to/list-1-3.htm"><img
								src="${oss}/resources/assets/images/media/cctv.jpg"
								class="img-responsive center-block" alt="cctv"></a></li>
						<li class="col-md-3"><a href="/to/list-1-3.htm"><img
								src="${oss}/resources/assets/images/media/sina.jpg"
								class="img-responsive center-block" alt="新浪"></a></li>
						<li class="col-md-3"><a href="/to/list-1-3.htm"><img
								src="${oss}/resources/assets/images/media/tencent.jpg"
								class="img-responsive center-block" alt="腾讯"></a></li>
						<li class="col-md-3"><a href="/to/list-1-3.htm"><img
								src="${oss}/resources/assets/images/media/sznews.jpg"
								class="img-responsive center-block" alt="深圳特区报"></a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/hc9/footer.jsp" />
	<!-- end footer -->
	<c:if test="${empty session_user }">
		<div class="masklg-container">
			<div class="mask-lg ie-opacity"></div>
			<div class="wrap">
				<div class="container">
					<a href="#" class="cancel"><span
						class="icon-icomoon icon-cancel-circle text-snow"></span></a>
					<ul class="list-unstyled list-inline text-center">
						<li><p class="lgmedium-font text-snow">财富增值&nbsp;&nbsp;从红筹开始</p></li>
						<li><a href="${https }/visitor/to-login?skip=index.htm"
							class="btn btn-danger micmedium-font" role="button">登录</a></li>
						<li><a href="${https }/visitor/to-regist"
							class="btn btn-warning micmedium-font" role="button">注册</a></li>
					</ul>
				</div>
			</div>
		</div>
	</c:if>
	<jsp:include page="/WEB-INF/views/hc9/common/common_js.jsp" />
	<script src="${oss}/resources/assets/js/src/home-modules.js"></script>
	<script src="${oss}/resources/assets/js/home.js"></script>
	<script src="${oss}/resources/assets/js/talkUser.js?v=1.1.6"></script>
	<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_js.jsp" />
</body>
</html>