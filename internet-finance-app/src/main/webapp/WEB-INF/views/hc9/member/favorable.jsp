<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<jsp:include page="/WEB-INF/views/hc9/common/common_css.jsp" />
<link href="${oss}/resources/vendor/css/calendar.css" rel="stylesheet">
<link href="${oss}/resources/assets/css/center/center.css?v=1.0.2" rel="stylesheet"><jsp:include
	page="/WEB-INF/views/hc9/common/ie8fix_css.jsp" />
</head>
<body>
	<!-- 页头 -->
	<!-- head -->
	<jsp:include page="/WEB-INF/views/hc9/header.jsp" />
	<!-- end head -->
	<div class="bg-container">
		<div class="container">
			<div class="center bg-snow clearfix">
				<jsp:include page="/WEB-INF/views/hc9/member/communal_center.jsp" />
				<jsp:include page="/WEB-INF/views/hc9/member/communal_left.jsp" />
				<div class="nav-right col-md-10 clearfix">
                        <div class="panel panel-default">
                            <div class="panel-heading text-center">
                                <h4 class="text-para text-left">我的优惠券</h4>
                                <div class="description">
                               		<!-- <div class="desc-info">
	                               		<p class="text-center">优惠券使用规则</p>
	                               		<ul>
	                               			<li>1.3元，5元红包投资任何期限的标的即可使用，10元，30元，60元红包需投资期限达到25天及以上的标的方可使用；</li>
	                               			<li>2.红包和加息券都是投资优先层可使用，满足最低认购额要求即可选择使用</li>
	                               			<li>3.红包与加息券不可同时使用，一次只能使用1张红包或1张加息券</li>
	                               			<li>4.提现券一次只能使用一张，抵扣宝付手续费2元。</li>
	                               			<li>5.更多优惠券规则，请咨询我们客服电话：400-822-3499</li>
	                               		</ul>
	                               	</div>
                                	<a href="javascript:;" class="ico"></a>
                                	<span class="text">优惠券使用规则</span> -->
                                	<a href="javascript:;" class="btnico">
	                                	 <div class="desc-info">
			                               	 <p class="text-center">优惠券使用规则</p>
			                               	 <ul>
				                               	 <li>1.3元，5元红包投资任何期限的标的即可使用，10元，30元，60元红包需投资期限达到25天及以上的标的方可使用；</li>
				                               	 <li>2.红包和加息券都是投资优先层可使用，满足最低认购额要求即可选择使用</li>
				                               	 <li>3.红包与加息券不可同时使用，一次只能使用1张红包或1张加息券</li>
				                               	 <li>4.提现券一次只能使用一张，抵扣宝付手续费2元。</li>
				                               	 <li>5.更多优惠券规则，请咨询我们客服电话：400-822-3499</li>
			                               	 </ul>
		                               	</div>
                                	</a>
                                	<span class="text">优惠券使用规则</span>
                                	<div class="clear"></div>
                                </div>
                            </div>
                            <div class="panel-body bg-panel">
                            	<div class="account-view w100-view bg-snow" role="tabpanel">
                            		<ul class="nav nav-tabs nav-justified" role="tablist">
										<li role="presentation" class="active"><a href="#packet"
											aria-controls="packet" role="tab" data-toggle="tab">我的红包</a></li>
										<li role="presentation"><a href="#coupon"
											aria-controls="coupon" role="tab" data-toggle="tab">我的加息券</a></li>
										<li role="presentation"><a href="#deposit"
											aria-controls="deposit" role="tab" data-toggle="tab">我的提现券</a></li>
									</ul>
									<div class="tab-content">
										<div role="tabpanel" class="tab-pane fade in active" id="packet"> <!-- 红包 -->
										
										</div>
										<div role="tabpanel" class="tab-pane fade" id="coupon">  <!-- 加息券 -->

										</div>
										<div role="tabpanel" class="tab-pane fade" id="deposit">  <!-- 提现券 -->

										</div>
									</div>
                            	</div>
                            </div>
                        </div>    
                    </div>
			</div>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/hc9/footer.jsp" />
	<!-- end footer -->
	<!-- required start -->
	<jsp:include page="/WEB-INF/views/hc9/common/common_js.jsp" />
	<script src="${oss}/resources/vendor/js/jquery-calendar.js"></script>
	<script src="${oss}/resources/My97DatePicker/WdatePicker.js"></script>
	<script src="${oss}/resources/assets/js/center.js"></script>
	<script src="${oss}/resources/assets/script/favorable.js"></script>
	<script src="${oss}/resources/assets/js/src/center/center-modules.js"></script>
	<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_js.jsp" />

</body>
</html>