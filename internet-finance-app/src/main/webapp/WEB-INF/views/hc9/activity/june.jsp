<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<jsp:include page="/WEB-INF/views/hc9/common/common_css.jsp" />
<link href="/resources/assets/css/activities.css" rel="stylesheet" />

</head>
<body>
	<div class="container-fluid">
		<div class=" main">

			<div class="ahed row"></div>


			<div class="ahed2  row">
				<div>
					<a href="${https }/visitor/to-regist" class="btn bg-danger regbutton">5秒注册，马上赚钱</a>
					<br> <span class="at1">活动时间：2015年06月23日-2015年7月31日</span> <br>
					<a href="${https }/visitor/to-regist"><span
						class="glyphicon glyphicon-menu-down at2" aria-hidden="true"></span></a>
				</div>
			</div>


			<div class="newreget row ">
				<div>
					<div style="float: left">
						<span> 新朋注册现金福利</span>
						<p></p>
						<p>活动期间，新老注册用户完成平台首次投资，且金额达单笔</p>
						<p>
							1000元及以上，立得<label>20元现金奖励</label>。
						</p>
						<a class="btn btn-danger" href="/loaninfo/loanList.htm?nav=2">开始众持</a>
					</div>
					<div style="float: right;">
						<a><img src="/resources/images/main/active/act03.jpg"></a>
					</div>
				</div>
			</div>


			<div class="newreget2 row"></div>


			<div class="oldreget row">
				<div>

					<div style="float: left;">
						<a><img src="/resources/images/main/active/act04.jpg"></a>
					</div>
					<div style="float: right" class="text-right">
						<span> 老友推荐返钱惊喜</span>
						<p></p>
						<p>活动期间，招朋呼友来注册吧</p>
						<p>使用你的推荐链接（推广码）邀请好友注册</p>
						<p>+平台首次投资且达1000元以上</p>
						<p>
							推荐人立得<label>10元现金奖励</label>，被推荐人立得<label>20元现金奖励</label>
						</p>
						<c:if test="${empty session_user }">
							<a class="btn btn-danger" data-toggle="modal"
								data-target="#myModal">立即查看我的推荐码</a>
						</c:if>
						<c:if test="${!empty session_user }">
							<a class="btn btn-danger" data-toggle="modal"
								data-target="#myModal2">立即查看我的推荐码</a>
						</c:if>
					</div>

				</div>
			</div>
			<div class="oldreget2 row">
				<div>
					<p>1、活动时间：2015年6月23日0：00 – 2015年7月31日24：00；</p>
					<p>2、用户需完整注册（实名认证、同步注册宝付、绑定银行卡），方具备参与活动资格；</p>
					<p>3、现金奖励仅针对尚未在平台投资的新老帐户；</p>
					<p>4、活动奖励将在3-5个工作日内返还现金奖励至个人账户，该奖励可直接提现或投资认购；</p>
					<p>5、通过非法手段恶意套取活动奖励，经查证属实后，前海红筹将有权取消其获奖资格；</p>
					<p>6、本活动最终解释权归前海红筹所有 。</p>

				</div>
			</div>
			<div class="abot row">
				<a href="${https }/visitor/to-regist" class="regest img-responsive"> </a>
			</div>
			<div class="abot2 text-center row">
				<a href="/index.htm" class="btn bg-danger retu">返回首页</a>
			</div>
		</div>
		<!--模态框-->
		<!-- Modal 已登录-->
		<div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" data-backdrop="static">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">我的推荐码</h4>
					</div>
					<div class="modal-body row">
						<div class="col-lg-9">
							<form class="recode">
								<div class="form-group">
									<span class="control-label">推荐链接</span> <label
										class="control-label">推荐好友通过此链接注册会员，注册成功后即可成为您推荐的会员</label> <input
										id="promote_link" type="text" class="form-control"
										value="${promoteLikn }" disabled>
									<button type="button" class="btn btn-danger" id="copy_url">复制推荐链接</button>

								</div>
								<div class="form-group">
									<span class="control-label">推荐码</span> <label
										class="control-label">推荐好友注册时，将此号码填入推荐码输入框</label> <input
										id="promote_code" type="text" class="form-control"
										value="${promoteNo }" disabled>
									<button type="button" class="btn btn-danger" id="copy_code">复制推荐号码</button>
									<label class="phonered">*也可以填写注册手机号</label>

								</div>

							</form>
						</div>
						<div class="col-lg-3 text-center regrt">
							<img src="/cic/QRcode">
							<p>分享二维码</p>
							<p>推荐好友注册</p>
						</div>
					</div>
					<div class="modal-footer"></div>
				</div>
			</div>
		</div>
		<!-- Modal 未登录-->
		<jsp:include page="/WEB-INF/views/hc9/activity/login_alert.jsp" />
	</div>
	<jsp:include page="/WEB-INF/views/hc9/common/common_js.jsp" />
	<script src="/resources/assets/script/jquery.zclip.min.js"></script>
	<script src="/resources/assets/script/june.js"></script>
	<script type="text/javascript">
		var _py = _py || [];
		_py.push(['a', 'qY..4AyEUXiQBP3MigyYHZOCTP']);
		_py.push(['domain','stats.ipinyou.com']);
		_py.push(['e','']);
		-function(d) {
			var s = d.createElement('script'),
			e = d.body.getElementsByTagName('script')[0]; e.parentNode.insertBefore(s, e),
			f = 'https:' == location.protocol;
			s.src = (f ? 'https' : 'http') + '://'+(f?'fm.ipinyou.com':'fm.p0y.cn')+'/j/adv.js';
		}(document);
	</script>
<noscript><img src="//stats.ipinyou.com/adv.gif?a=qY..4AyEUXiQBP3MigyYHZOCTP&e=" style="display:none;"/></noscript>
</body>
</html>