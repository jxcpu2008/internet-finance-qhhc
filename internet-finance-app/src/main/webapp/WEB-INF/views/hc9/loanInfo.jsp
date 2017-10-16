<%@ page language="java" contentType="text/html; utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<jsp:include page="/WEB-INF/views/hc9/common/common_css.jsp" />
<link href="${oss}/resources/assets/css/loan.css" rel="stylesheet">
<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_css.jsp" />
<link href="${oss}/resources/public/js/fancybox/jquery.fancybox.css?v=2.1.5" rel="stylesheet" />
<style>
	.dada_popup{
		background:url(/resources/public/images/dada_popup-ico.png) center center no-repeat;
		width:542px;
		height:485px;
		position:relative;
	}
	.coupon{
		background:url(/resources/public/images/dada_popup-ico2.png) center center no-repeat;
		width:355px;
		height:161px;
		line-height:161px;
		display:block;
		position:absolute;
		top:50%;
		margin-top:-80px;
		left:50%;
		margin-left:-178px;
	}
	.coupon_text{
		width:542px;
		position:absolute;
		top:70%;
		text-align:center;
	}
	.popup-record .popup-bg{
		background:url(${oss }/resources/activity/year2016/month05/jucheng/images/popup-img.png) 0 0 no-repeat;
		width:614px;
		height:511px;
		position:relative;
	}
	.popup-record .popup-bg .tag1{
		position:absolute;
		left:50%;
		margin-left:-250px;
		top:300px;
		font-size:16px;
		color:#333333;
		line-height:32px;
	}
	.popup-record .popup-bg .tag2{
		display:block;
		width:240px;
		height:42px;
		background-color:#fe5041;
		border-radius:5px;
		-ms-border-radius:5px;
		-webkit-border-radius:5px;
		-o-border-radius:5px;
		color:#ffffff;
		font-size:18px;
		line-height:42px;
		text-align:center;
		position:absolute;
		top:435px;
		left:50%;
		margin-left:-125px;
	}
</style>
</head>
<body>
	<!-- head -->
	<jsp:include page="/WEB-INF/views/hc9/header.jsp" />
	<!-- end head -->
	<div class="bg-container">
		<div class="container">
			<div class="bread">
				<span class="text-label">您当前的位置：</span>
				<ol class="list-unstyled list-inline">
					<li class="glyphicon-custom"><a href="/index.htm">首页</a></li>
					<li class="glyphicon-custom"><a href="/loaninfo/loanList.htm?nav=2">我要众持</a></li>
					<li class="active" data-id="modifyDot">${loan.name }</li>
				</ol>
			</div>
			<!-- hidden -->
			<input type="hidden" id="loanType" value="${loan.type}" />
			<input type="hidden" id="loanId" value="${loan.id}" /> <input
				type="hidden" id="prioRate"
				value="${loan.prioRate+loan.prioAwordRate}" /> <input type="hidden"
				id="loanUnit" value="${loan.loanUnit}" /><input type="hidden"
				id="remonth" value="${loan.remonth}" /><input type="hidden"
				id="loanType_id" value="${loan.loansignType.id }" />
			<c:if test="${loan.loansignType.id ne 5 }">     <!-- 普通项目 -->
				<!-- hidden end -->
				<div class="loan bg-snow clearfix">
					<section class="pull-left clearfix">
						<div class="clearfix">
							<h3 class="text-para" data-id="modifyDot">${loan.name}</h3>
							<p class="text-label text-right" style="width:48.3%;">投标开始时间：${fn:substring(loan.publishTime,0,10) }</p>
						</div>
						<div class="pull-left">
							<div id="process-1" class="w230x130"
								data-process="<fmt:formatNumber type="number"
												value="${(loan.issueLoan-loan.restMoney)/loan.issueLoan*100}"
												pattern="#0.0" />"></div>
							<ul class="list-unstyled text-center">
								<li class="micmedium-font text-label">融资余额</li>
								<li><span class="text-danger lg-font" data-id="fm"><fmt:formatNumber
											type="number" value="${loan.restMoney }" pattern="#00.00#" /></span><span
									class="normal-font text-label"> 元</span></li>
								<li class="micmedium-font text-label">计息方式：放款计息</li>
							</ul>
						</div>
						<div class="pull-right">
							<div>
								<h4 class="text-para">
									融资金额：<span class="text-danger lg-font" data-id="fm"><fmt:formatNumber
											type="number" value="${loan.issueLoan }" pattern="#00.00#" /></span>元
								</h4>
								<h4 class="text-para">
									借款期限：
									<c:if test="${loan.type eq  3}">
										<span class="text-danger lg-font">${loan.remonth }</span>天</c:if>
									<c:if test="${loan.type eq 2}">
										<span class="text-danger lg-font">${loan.remonth }</span>个月</c:if>
								</h4>
								<h4 class="text-para">剩余金额：<span data-id="fm" class="text-danger lg-font"><fmt:formatNumber
											value="${loan.prioRestMoney+loan.midRestMoney+loan.afterRestMoney}" pattern="#0.00#" /></span>元</h4>
							</div>
							<ul class="list-unstyled">
								<li class="text-label micmedium-font"><span
									class="label label-clip label-priority">优</span>预期年化收益 : <span
									class="lgmedium-font text-success"><fmt:formatNumber
											type="number" value="${loan.prioRate * 100}" pattern="#0.00#" /><span class="normal-font">%</span>+<fmt:formatNumber
											type="number" value="${loan.prioAwordRate * 100}"
											pattern="#0.00#" /><span class="normal-font">%</span></span><span
									class="normal-font pull-right">剩余金额：<span data-id="fm"><fmt:formatNumber
											value="${loan.prioRestMoney}" pattern="#0.00#" /></span></span></li>
								<li class="text-label micmedium-font"><span
									class="label label-clip label-sandwich">夹</span>预期年化收益 : <span
									class="lgmedium-font text-warning">0~14<span
										class="normal-font">%</span></span> <span
									class="normal-font pull-right">剩余金额：<span data-id="fm"><fmt:formatNumber
											value="${loan.midRestMoney}" pattern="#0.00#" /></span></span></li>
								<li class="text-label micmedium-font"><span
									class="label label-clip label-inferior">劣</span>预期年化收益 : <span
									class="mmedium-font text-danger">浮动收益</span><span
									class="normal-font pull-right">剩余金额：<span data-id="fm"><fmt:formatNumber
											value="${loan.afterRestMoney}" pattern="#0.00#" /></span></span></li>
							</ul>
						</div>
					</section>
					<section class="form-horizontal get-involved text-label pull-right">
						<div>
							<c:if test="${!empty session_user}">
								<!-- 已经登录 -->
								<h4 class="text-center" data-status="online">
									<span class="text-danger">账户余额</span> | <a
										href="/recharge/openRecharge.htm?index=8_8" class="text-dark">立即充值</a>
								</h4>
								<p class="text-center lgmedium-font">
									&yen; <span class="text-danger">${userCashBalance}</span><span
										class="normal-font"> 元</span>
								</p>
							</c:if>
							<c:if test="${empty session_user}">
								<!-- 没有登录 -->
								<h4 class="text-center" data-status="offline">
									<a href="${https }/visitor/to-login?skip=loaninfo/loansignInfo.htm?loanId=${loan.id }" class="text-dark">登录</a> | <a
										href="${https }/visitor/to-regist" class="text-dark">注册</a>
								</h4>
								<p class="text-center micmedium-font">您还没有登录</p>
							</c:if>
						</div>
						<c:if test="${loan.status eq 1 }">
							<div class="form-group has-feedback">
								<div class="checkbox">
									<label>优先 : </label>
								</div>
								<input type="text" class="form-control input-sm" id="priority"
									name="priority" placeholder="" data-id="feed-priority"
									data-container="body" data-toggle="popover"
									data-placement="right" data-trigger="focus"
									data-content="只接受合法的数字"
									<c:if test="${empty session_user || (loan.prioRestMoney+loan.midRestMoney) eq 0}">disabled="disabled"</c:if>><span
									class="glyphicon glyphicon-ok form-control-feedback"></span> 元 <span
									class="help-block" id="pincome">预计收益：<span>0</span>元
								</span>
								<div class="form-group redenvelope" style="margin-bottom:0;margin-left:71px;display: none;">
									<div class="text-left">
										<div class="checkbox" style="margin-bottom:0;">
											<label style="display:inline-block;"><input id="isuse_redenve" type="checkbox" style="margin-top:4px;"><small class="text-danger">红包&nbsp;&nbsp;<span class="how-much">0</span>元&nbsp;&nbsp;</small><a id="changeRe" class="text-label hc-protocol"
							data-toggle="modal"><small>更换红包</small></a>
											</label>
										</div>
									</div>
								</div>
								<div class="form-group interest" style="margin-bottom:0;margin-left:71px;display: none;">
									<div class="text-left">
										<div class="checkbox" style="margin-bottom:0;">
											<label style="display:inline-block;"> <input id="isuse_interest" type="checkbox" style="margin-top:4px;"> 
											<small class="text-danger">加息券&nbsp;<span class="interest_rate">0</span>&nbsp;</small><a id="change_interest" class="text-label hc-protocol" data-toggle="modal"><small>更换加息券</small></a>
											</label>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group has-feedback">
								<div class="checkbox">
									<label>夹层 : </label>
								</div>
								<input type="text" class="form-control input-sm" id="middle"
									name="sandwich" placeholder="" data-id="feed-sandwich"
									data-container="body" data-toggle="popover"
									data-placement="right" data-trigger="focus"
									data-content="只接受合法的数字"
									<c:if test="${empty session_user || (loan.prioRestMoney+loan.midRestMoney) eq 0}">disabled="disabled"</c:if>><span
									class="glyphicon glyphicon-remove form-control-feedback"></span>
								元 <span class="help-block" id="mincome">预计收益：<span>0</span>元
								</span>
							</div>
							<c:if test="${!empty session_user}">
								<c:if test="${session_user.isorgperson eq 1 }">
									<!-- 机构投资人才显示 -->
									<div class="form-group has-feedback">
										<div class="checkbox">
											<label>劣后 : </label>
										</div>
										<input type="text" class="form-control input-sm" id="after"
											<c:if test="${loan.afterRestMoney eq 0}">disabled="disabled"</c:if>
											name="inferior" placeholder="" data-id="feed-inferior"
											data-container="body" data-toggle="popover"
											data-placement="right" data-trigger="focus"
											data-content="只接受合法的数字"><span
											class="glyphicon glyphicon-ok form-control-feedback"></span> 元
										<span class="help-block">预计收益：浮动收益</span>
									</div>
								</c:if>
							</c:if>
							<c:if test="${empty session_user}">
								<div class="form-group has-feedback">
									<div class="checkbox">
										<label>劣后 : </label>
									</div>
									<input type="text" class="form-control input-sm" id=""
										name="inferior" placeholder="" data-id="feed-inferior"
										data-container="body" data-toggle="popover"
										data-placement="right" data-trigger="focus"
										data-content="只接受合法的数字" disabled="disabled"><span
										class="glyphicon glyphicon-ok form-control-feedback"></span> 元
									<span class="help-block">预计收益：浮动收益</span>
								</div>
							</c:if>
							<div class="form-group text-center smmedium-font"><p>${loan.loanUnit }起投，倍数递增</p>
							<div class="checkbox normal-font" id="delete-book">
								<label><input type="checkbox" checked="checked"> 我已阅读并同意</label> <a
									href="#" id="delegate" class="hc-protocol text-label">&lt;&lt;授权委托书&gt;&gt;</a>
							</div>
							</div>
							<button type="button" id="loanInvest"
								class="btn btn-lg btn-block bg-danger text-snow"
								data-toggle="modal" data-target="">开始众持</button>
						</c:if>
						<c:if test="${loan.status ne 1 }">
							<div class="form-group">
								<div class="mmedium-font" id="form-done">
									<c:if
										test="${loan.status eq 2 || loan.status eq 3 || loan.status eq 4 || loan.status eq 5}">该项目已投满</c:if>
									<c:if test="${loan.status eq 6 || loan.status eq 7}">该项目回款中</c:if>
									<c:if test="${loan.status eq 8}">该项目已完成</c:if>
									<c:if test="${loan.status eq 9}">该项目已流标</c:if>
									<c:if test="${loan.status eq -1}">该项目已清盘</c:if>
								</div>
	
							</div>
							<div class="form-group">
								<div class="smedium-font" id="form-done">
									该项目 <span class="text-danger mmedium-font">火速 </span>被抢光了
	
								</div>
							</div>
							<div class="form-group has-feedback">
								<div class="smedium-font" id="form-done">
									一共 <span class="text-danger mmedium-font">${obj}</span> 人投资
	
								</div>
							</div>
							<a href="/loaninfo/loanList.htm?nav=2" role="button"
								class="btn btn-lg btn-block bg-danger text-snow">关注其他项目</a>
						</c:if>
					</section>
				</div>
				<c:if test="${loan.activityStatus eq 1 }">
					<c:choose>
						<c:when test="${activSign eq 0 }">
							<c:set var="maxMoney" value="199"/>
							<c:set var="minMoney" value="99"/>
							<c:set var="activUrl" value="/to/article-1-4-170.htm"/>
						</c:when>
						<c:otherwise>
							<c:set var="maxMoney" value="168"/>
							<c:set var="minMoney" value="68"/>
							<c:set var="activUrl" value="/april/grabQualifying.htm"/>
						</c:otherwise>
					</c:choose>
					<div class="clearfix" style="margin-bottom:10px;">
	    				<c:if test="${!empty maxMap }">
								<div class="clearfix" style="border:1px solid #dddddd; border-radius:4px; float:left;padding:25px 0 25px 70px;background-color:white; width:49%;height:180px;">
							    	<div style="float:left; margin-right:30px;"><img src="${oss }/resources/public/images/monkey/award-ico1.png" /></div>
							    	<div style="float:left;">
							    		<c:set var="isBool" value="${!empty maxMap && (loan.prioRestMoney+loan.midRestMoney) eq 0 }"/>
							    		<c:if test="${!isBool }">
								        	<dl style="color:#848484; text-align: center;">
								            	<dt>目前<font color="#d9534f">${fn:replace(maxMap.nickname, fn:substring(maxMap.nickname, 1, fn:length(maxMap.nickname)-1), "***")}</font>单笔投资金额最高，金额为<br><font color="#d9534f" style="font-size:40px"><fmt:formatNumber value="${maxMap.money }" pattern="#0.00#" /></font>元</dt>
								                <dd style="margin:20px 0;"></dd>
							                <dd style="color:#333333;">快去超越他！</dd>
								            </dl>
							            </c:if>
							            <c:if test="${isBool }">
								            <dl style="text-align: center; margin-top:20px;color:#848484;">
								            	<dt>恭喜<font color="#d9534f">${fn:replace(maxMap.nickname, fn:substring(maxMap.nickname, 1, fn:length(maxMap.nickname)-1), "***")}</font>获得一鸣金人的奖励，将获得现金奖励</dt>
								            	<dd><font color="#d9534f" style="font-size:40px">${maxMoney }</font>元</dd>
								            </dl>
							            </c:if>
							        </div>
						    </div>
						</c:if>
		    			<c:if test="${!empty maxMap }">
							<div class="clearfix" style="border:1px solid #dddddd; border-radius:4px; float:right;padding:25px 0 25px 70px;background-color:white; width:49%;height:180px;">
						    	<div style="float:left; margin-right:30px;"><img src="${oss }/resources/public/images/monkey/award-ico2.png" /></div>
						    	<div style="float:left;">
						    		<c:if test="${empty lastMap }">
						    			<dl style="color:#848484;text-align: center;padding-top:5px;">
							            	<dt>目前还剩余总可投金额（劣后除外）为<br><font color="#d9534f" style="font-size:40px">
												<fmt:formatNumber value="${loan.prioRestMoney+loan.midRestMoney}" pattern="#0.00#" /></font>元</dt>
							            	<dd>&nbsp;</dd>
							                <dd style="color:#333333;">快抓住机会哦！</dd>
							            </dl>
						    		</c:if>
						    		<c:if test="${!empty lastMap }">
						    			<dl style="text-align: center; margin-top:20px;color:#848484;">
							            	<dt>恭喜<font color="#d9534f">${fn:replace(lastMap.nickname, fn:substring(lastMap.nickname, 1, fn:length(lastMap.nickname)-1), "***")}</font>获得一锤定音的奖励，将获得现金奖励</dt>
							            	<dd><font color="#d9534f" style="font-size:40px">${minMoney }</font>元</dd>
							            </dl>
						    		</c:if>
						        </div>
						    </div>
			            </c:if>
			            <c:if test="${empty maxMap }">
			            	<div class="clearfix" style="border:1px solid #dddddd; border-radius:4px; float:left;padding:25px 0 25px 70px;background-color:white; width:49%;height:180px;">
						    	<div style="float:left; margin-right:30px;"><img src="${oss }/resources/public/images/monkey/award-ico1.png" /></div>
						    	<div style="float:left;">
						            <dl style="text-align: center; margin-top:20px;color:#848484;">
						            	<dt>项目单笔投资最多的投资者，将获得现金奖励</dt>
						            	<dd><font color="#d9534f" style="font-size:40px">${maxMoney }</font>元</dd>
						            </dl>
						        </div>
						    </div>
			            
			            	<div class="clearfix" style="border:1px solid #dddddd; border-radius:4px; float:right;padding:25px 0 25px 70px;background-color:white; width:49%;height:180px;">
						    	<div style="float:left; margin-right:30px;"><img src="${oss }/resources/public/images/monkey/award-ico2.png" /></div>
						    	<div style="float:left;">
					    			<dl style="text-align: center; margin-top:20px;color:#848484;">
						            	<dt>项目最后一笔投资的投资者，将获得现金奖励</dt>
						            	<dd><font color="#d9534f" style="font-size:40px">${minMoney }</font>元</dd>
						            </dl>
						        </div>
						    </div>
			            </c:if>
					</div>
					<div style="overflow: hidden;margin-bottom:20px;">
		            	<a href="${activUrl }" style="color:#5688f5;font-size:12px;float:right;">查看活动规则</a>
					</div>
				</c:if>
				<c:if test="${loan.id eq 378}">
					<div style=" background: url('${oss }/resources/activity/year2016/month05/jucheng/images/jucheng.jpg');height:124px;margin-bottom:30px;position:relative;">
						<a href="http://www.hc9.com/to/article-1-4-192.htm" style="position: absolute; left:50%; margin-left: 450px; bottom:15px;"><img src="${oss }/resources/activity/year2016/month05/jucheng/images/jucheng-btn.png" /></a>
					</div>
				</c:if>
				<div class="bg-snow proj-desc" role="tabpanel">
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#details"
							aria-controls="details" role="tab" data-toggle="tab">项目详情</a></li>
						<li role="presentation"><a href="#guide" aria-controls="guide"
							role="tab" data-toggle="tab">投资指引</a></li>
						<li role="presentation"><a href="#control"
							aria-controls="control" role="tab" data-toggle="tab">风控流程</a></li>
						<li role="presentation"><a href="#history"
							aria-controls="history" role="tab" data-toggle="tab">项目历程</a></li>
						<li role="presentation"><a href="#record"
							aria-controls="record" role="tab" data-toggle="tab">投资记录</a></li>
					</ul>
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane fade in active clearfix"
							id="details">
							<h4>项目简介</h4>
							<p>${loan.loansignbasics.remark}</p>
							<h4>资金用途</h4>
							<p>${loan.loansignbasics.behoof }</p>
							<h4>图片披露</h4>
							<ul class="nav nav-pills nav-stacked pull-left" role="tablist">
								<li role="presentation"><a href="#pre-1"
									aria-controls="pre-1" role="tab" data-toggle="tab">项目证明</a></li>
								<li role="presentation"><a href="#pre-2"
									aria-controls="pre-2" role="tab" data-toggle="tab">资产包证明</a></li>
								<li role="presentation"><a href="#pre-3"
									aria-controls="pre-3" role="tab" data-toggle="tab">担保证明</a></li>
								<li role="presentation"><a href="#pre-4"
									aria-controls="pre-4" role="tab" data-toggle="tab">保障证明</a></li>
							</ul>
							<div class="tab-content pull-right pre-img">
								<c:forEach varStatus="flags" begin="1" end="4">
										<div role="tabpanel" class="tab-pane fade" id="pre-${flags.index }">
		                                    <div id="pre-${flags.index }-${flags.index }" class="carousel slide" data-ride="carousel">
		                                        <div class="carousel-inner onebyone-carousel" role="listbox">
													<c:if test="${flags.index eq 1 }">
			                                        	<c:forEach items="${attachList1}" var="list">
															<div class="item">
																<div class="col-md-4">
																	<a href="#" data-toggle="modal" data-target=".preview">
																		<img src="${list[3]}"
																		class="img-responsive center-block"> <span
																		class="overlay-sm ie-opacity">${list[1] }</span>
																	</a>
																</div>
															</div>
														</c:forEach>
													</c:if>
													<c:if test="${flags.index eq 2 }">
														<c:forEach items="${attachList2}" var="list">
															<div class="item">
																<div class="col-md-4">
																	<a href="#" data-toggle="modal" data-target=".preview">
																		<img src="${list[3]}"
																		class="img-responsive center-block"> <span
																		class="overlay-sm ie-opacity">${list[1] }</span>
																	</a>
																</div>
															</div>
														</c:forEach>
													</c:if>
													<c:if test="${flags.index eq 3 }">
														<c:forEach items="${attachList3}" var="list">
															<div class="item">
																<div class="col-md-4">
																	<a href="#" data-toggle="modal" data-target=".preview">
																		<img src="${list[3]}"
																		class="img-responsive center-block"> <span
																		class="overlay-sm ie-opacity">${list[1] }</span>
																	</a>
																</div>
															</div>
														</c:forEach>
													</c:if>
													<c:if test="${flags.index eq 4 }">
														<c:forEach items="${attachList4}" var="list">
															<div class="item">
																<div class="col-md-4">
																	<a href="#" data-toggle="modal" data-target=".preview">
																		<img src="${list[3]}"
																		class="img-responsive center-block"> <span
																		class="overlay-sm ie-opacity">${list[1] }</span>
																	</a>
																</div>
															</div>
														</c:forEach>
													</c:if>
		                                        </div>
		                                        <a class="left carousel-control ie-opacity-snow" href="#pre-${flags.index }-${flags.index }" role="button" data-slide="prev">
		                                            <span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>
		                                        </a>
		                                        <a class="right carousel-control ie-opacity-snow" href="#pre-${flags.index }-${flags.index }" role="button" data-slide="next">
		                                            <span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
		                                        </a>
		                                    </div>
		                                </div>
								</c:forEach>
							</div>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="guide">
							<h4>众持模式</h4>
							<ul class="list-unstyled text-label micmedium-font">
								<li><span class="label label-clip label-priority">优</span>优先：本息有保障，收益稳定。还款方式：按月付息，到期还本</li>
								<li><span class="label label-clip label-sandwich">夹</span>夹层：本金有保障，浮动收益，根据项目实际收益进行分配。还款方式：到期还本付息</li>
								<li><span class="label label-clip label-inferior">劣</span>劣后：本息不保障，高风险高收益，对投资人资格有限制。还款方式：到期还本付息</li>
							</ul>
							<h4 class="bg-warning text-snow inv_guide">赔付流程</h4>
							<img src="${oss}/resources/assets/images/home/inv_guide.png"
								class="img-responsive center-block" alt="赔付流程">
						</div>
						<div role="tabpanel" class="tab-pane fade" id="control">
							<h4>平台风险保障措施</h4>
							<p>资金第三方托管：投资人充值、投资均由第三方宝付进行托管，确保资金与平台的严格分离，保障投资人的资金安全；</p>
							<p>劣后资金安全垫：根据投资人风险——收益偏好程度，独创优先、夹层、劣后项目层供投资人灵活选择。若项目发生逾期时，劣后资金作为安全垫，优先投资人本息和夹层投资人本金先于劣后资金获得赔付；</p>
							<p>抵押/质押保障：每个项目均要求融资方提供动产、不动产、股票、股权等变现能力强的抵押或质押物，为投资人提供重大保障措施；</p>
							<p>第三方、大股东及配偶连带责任担保：每个项目要求有第三方或项目方的大股东及配偶等提供无限连带责任担保，以保证在项目发生风险时明确可追偿人，为投资人再添保障；</p>
							<p>收购方债权收购：所有项目均与资产实力雄厚的收购方签订收购协议，在项目发现风险时，以保障优先投资人的本息和夹层投资者的本金安全；</p>
	
							<h4>项目众持流程图</h4>
							<img src="${oss}/resources/assets/images/home/wc_control.jpg"
								class="img-responsive center-block" alt="项目众持流程图">
							<div class="page-line"></div>
							<h4>风控措施</h4>
							<p>${loan.loansignbasics.history }</p>
							<h4>风控意见</h4>
							<p>${loan.loansignbasics.riskAdvice}</p>
						</div>
						<div role="tabpanel" class="tab-pane fade active" id="history">
							<div class="time-vline"></div>
							<ul class="list-unstyled cleargap">
								<li><span class="icon-timeline timeline-step-1"></span>
									<div>
										<h4 class="text-para">项目上线</h4>
										<time class="text-label">上线时间：${loan.publishTime} </time>
									</div></li>
								<li><span class="icon-timeline timeline-step-2"></span>
									<div>
										<h4 class="text-para">项目募集</h4>
										<time class="text-label">开始时间：${loan.publishTime}</time>
									</div></li>
								<li><c:choose>
										<c:when test="${loan.creditTime ne null }">
											<span class="icon-timeline timeline-step-3"></span>
										</c:when>
										<c:otherwise>
											<span class="icon-timeline timeline-revstep-3"></span>
										</c:otherwise>
									</c:choose>
	
									<div>
										<h4 class="text-para">项目放款</h4>
										<time class="text-label"><c:if test="${!empty loan.creditTime }">操作时间：${loan.creditTime}</c:if></time>
									</div></li>
								<li><c:choose>
										<c:when test="${loan.status eq 8}">
											<span class="icon-timeline timeline-step-4"></span>
										</c:when>
										<c:otherwise>
											<span class="icon-timeline timeline-revstep-4"></span>
										</c:otherwise>
									</c:choose>
									<div>
										<h4 class="text-para">项目还款</h4>
										<c:forEach items="${loan.repaymentrecords}" var="repay">
											<c:if
												test="${repay.repayState eq 2 or repay.repayState eq 4 or repay.repayState eq 5  }">
												<time class="text-label">第${repay.periods}期，还款时间：${repay.repayTime}</time>
											</c:if>
										</c:forEach>
									</div></li>
							</ul>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="record"></div>
					</div>
				</div>
			</c:if>
			<c:if test="${loan.loansignType.id eq 5 }">     <!-- 甜城项目 -->
				<!-- hidden end -->
				<div class="loan bg-snow clearfix">
					<section class="pull-left clearfix">
						<div class="clearfix">
							<h3 class="text-para" data-id="modifyDot">${loan.name}</h3>
							<p class="text-label text-right" style="width:48.3%;">投标开始时间：${fn:substring(loan.publishTime,0,10) }</p>
						</div>
						<div class="pull-left">
							<div id="process-1" class="w230x130"
								data-process="<fmt:formatNumber type="number"
												value="${(loan.issueLoan-loan.restMoney)/loan.issueLoan*100}"
												pattern="#0.0" />"></div>
							<ul class="list-unstyled text-center">
								<li class="micmedium-font text-label">融资余额</li>
								<li><span class="text-danger lg-font" data-id="fm"><fmt:formatNumber
											type="number" value="${loan.restMoney }" pattern="#00.00#" /></span><span
									class="normal-font text-label"> 元</span></li>
								<li class="micmedium-font text-label">还款方式：等本等息</li>
							</ul>
						</div>
						<div class="pull-right">
							<div>
								<h4 class="text-para">
									融资金额：<span class="text-danger lg-font" data-id="fm"><fmt:formatNumber
											type="number" value="${loan.issueLoan }" pattern="#00.00#" /></span>元
								</h4>
								<h4 class="text-para">
									借款期限：
									<c:if test="${loan.type eq  3}">
										<span class="text-danger lg-font">${loan.remonth }</span>天</c:if>
									<c:if test="${loan.type eq 2}">
										<span class="text-danger lg-font">${loan.remonth }</span>个月</c:if>
								</h4>
								<h4 class="text-para">剩余金额：<span data-id="fm" class="text-danger lg-font"><fmt:formatNumber
											value="${loan.prioRestMoney+loan.midRestMoney+loan.afterRestMoney}" pattern="#0.00#" /></span>元</h4>
							</div>
							<ul class="list-unstyled">
								<li class="text-label micmedium-font">年化利率 : <span
									class="lgmedium-font text-success"><fmt:formatNumber
											type="number" value="${(loan.prioRate+loan.prioAwordRate) * 100}" pattern="#0.00#" /><span class="normal-font">%</span></span><span
									class="normal-font pull-right">剩余金额：<span data-id="fm"><fmt:formatNumber
											value="${loan.prioRestMoney}" pattern="#0.00#" /></span></span></li>
							</ul>
						</div>
					</section>
					<section class="form-horizontal get-involved text-label pull-right">
						<div>
							<c:if test="${!empty session_user}">
								<!-- 已经登录 -->
								<h4 class="text-center" data-status="online">
									<span class="text-danger">账户余额</span> | <a
										href="/recharge/openRecharge.htm?index=8_8" class="text-dark">立即充值</a>
								</h4>
								<p class="text-center lgmedium-font">
									&yen; <span class="text-danger">${session_user.userfundinfo.cashBalance}</span><span
										class="normal-font"> 元</span>
								</p>
							</c:if>
							<c:if test="${empty session_user}">
								<!-- 没有登录 -->
								<h4 class="text-center" data-status="offline">
									<a href="${https }/visitor/to-login?skip=loaninfo/loansignInfo.htm?loanId=${loan.id }" class="text-dark">登录</a> | <a
										href="${https }/visitor/to-regist" class="text-dark">注册</a>
								</h4>
								<p class="text-center micmedium-font">您还没有登录</p>
							</c:if>
						</div>
						<c:if test="${loan.status eq 1 }">
							<div class="form-group has-feedback">
								<div class="checkbox">
									<label>金额 : </label>
								</div>
								<input type="text" class="form-control input-sm" id="priority"
									name="priority" placeholder="" data-id="feed-priority"
									data-container="body" data-toggle="popover"
									data-placement="right" data-trigger="focus"
									data-content="只接受合法的数字"
									<c:if test="${empty session_user || (loan.prioRestMoney+loan.midRestMoney) eq 0}">disabled="disabled"</c:if>><span
									class="glyphicon glyphicon-ok form-control-feedback"></span> 元 <span
									class="help-block" id="pincome">预计收益：<span>0</span>元
								</span>
								<div class="form-group redenvelope" style="margin-bottom:0;margin-left:71px;display: none;">
									<div class="text-left">
										<div class="checkbox" style="margin-bottom:0;">
											<label style="display:inline-block;"><input id="isuse_redenve" type="checkbox" style="margin-top:4px;"><small class="text-danger">红包&nbsp;&nbsp;<span class="how-much">0</span>元&nbsp;&nbsp;</small><a id="changeRe" class="text-label hc-protocol"
							data-toggle="modal"><small>更换红包</small></a>
											</label>
										</div>
									</div>
								</div>
								<div class="form-group interest" style="margin-bottom:0;margin-left:71px;display: none;">
									<div class="text-left">
										<div class="checkbox" style="margin-bottom:0;">
											<label style="display:inline-block;"> <input id="isuse_interest" type="checkbox" style="margin-top:4px;"> 
											<small class="text-danger">加息券&nbsp;<span class="interest_rate">0</span>&nbsp;</small><a id="change_interest" class="text-label hc-protocol" data-toggle="modal"><small>更换加息券</small></a>
											</label>
										</div>
									</div>
								</div>
							</div>
							<div class="form-group text-center smmedium-font"><p>${loan.loanUnit }起投，倍数递增</p>
							<div class="checkbox normal-font" id="delete-book">
								<label><input type="checkbox" checked="checked"> 我已阅读并同意</label> <a
									href="#" id="delegate" class="hc-protocol text-label">&lt;&lt;授权委托书&gt;&gt;</a>
							</div>
							</div>
							<button type="button" id="loanInvest"
								class="btn btn-lg btn-block bg-danger text-snow"
								data-toggle="modal" data-target="">开始众持</button>
						</c:if>
						<c:if test="${loan.status ne 1 }">
							<div class="form-group">
								<div class="mmedium-font" id="form-done">
									<c:if
										test="${loan.status eq 2 || loan.status eq 3 || loan.status eq 4 || loan.status eq 5}">该项目已投满</c:if>
									<c:if test="${loan.status eq 6 || loan.status eq 7}">该项目回款中</c:if>
									<c:if test="${loan.status eq 8}">该项目已完成</c:if>
									<c:if test="${loan.status eq 9}">该项目已流标</c:if>
									<c:if test="${loan.status eq -1}">该项目已清盘</c:if>
								</div>
	
							</div>
							<div class="form-group">
								<div class="smedium-font" id="form-done">
									该项目 <span class="text-danger mmedium-font">火速 </span>被抢光了
	
								</div>
							</div>
							<div class="form-group has-feedback">
								<div class="smedium-font" id="form-done">
									一共 <span class="text-danger mmedium-font">${obj}</span> 人投资
	
								</div>
							</div>
							<a href="/loaninfo/loanList.htm?nav=2" role="button"
								class="btn btn-lg btn-block bg-danger text-snow">关注其他项目</a>
						</c:if>
					</section>
				</div>
				<div class="bg-snow proj-desc" role="tabpanel">
					<ul class="nav nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#details"
							aria-controls="details" role="tab" data-toggle="tab">项目详情</a></li>
						<li role="presentation"><a href="#control"
							aria-controls="control" role="tab" data-toggle="tab">风控流程</a></li>
						<li role="presentation"><a href="#history"
							aria-controls="history" role="tab" data-toggle="tab">项目历程</a></li>
						<li role="presentation"><a href="#record"
							aria-controls="record" role="tab" data-toggle="tab">投资记录</a></li>
					</ul>
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane fade in active clearfix"
							id="details">
							<h4>项目简介</h4>
							<p>${loan.loansignbasics.remark}</p>
							<h4>资金用途</h4>
							<p>${loan.loansignbasics.behoof }</p>
							<h4>图片披露</h4>
							<ul class="nav nav-pills nav-stacked pull-left" role="tablist">
								<li role="presentation"><a href="#pre-1"
									aria-controls="pre-1" role="tab" data-toggle="tab">项目证明</a></li>
								<li role="presentation"><a href="#pre-2"
									aria-controls="pre-2" role="tab" data-toggle="tab">资产包证明</a></li>
								<li role="presentation"><a href="#pre-3"
									aria-controls="pre-3" role="tab" data-toggle="tab">担保证明</a></li>
								<li role="presentation"><a href="#pre-4"
									aria-controls="pre-4" role="tab" data-toggle="tab">保障证明</a></li>
							</ul>
							<div class="tab-content pull-right pre-img">
								<c:forEach varStatus="flags" begin="1" end="4">
										<div role="tabpanel" class="tab-pane fade" id="pre-${flags.index }">
		                                    <div id="pre-${flags.index }-${flags.index }" class="carousel slide" data-ride="carousel">
		                                        <div class="carousel-inner onebyone-carousel" role="listbox">
													<c:if test="${flags.index eq 1 }">
			                                        	<c:forEach items="${attachList1}" var="list">
															<div class="item">
																<div class="col-md-4">
																	<a href="#" data-toggle="modal" data-target=".preview">
																		<img src="${list[3]}"
																		class="img-responsive center-block"> <span
																		class="overlay-sm ie-opacity">${list[1] }</span>
																	</a>
																</div>
															</div>
														</c:forEach>
													</c:if>
													<c:if test="${flags.index eq 2 }">
														<c:forEach items="${attachList2}" var="list">
															<div class="item">
																<div class="col-md-4">
																	<a href="#" data-toggle="modal" data-target=".preview">
																		<img src="${list[3]}"
																		class="img-responsive center-block"> <span
																		class="overlay-sm ie-opacity">${list[1] }</span>
																	</a>
																</div>
															</div>
														</c:forEach>
													</c:if>
													<c:if test="${flags.index eq 3 }">
														<c:forEach items="${attachList3}" var="list">
															<div class="item">
																<div class="col-md-4">
																	<a href="#" data-toggle="modal" data-target=".preview">
																		<img src="${list[3]}"
																		class="img-responsive center-block"> <span
																		class="overlay-sm ie-opacity">${list[1] }</span>
																	</a>
																</div>
															</div>
														</c:forEach>
													</c:if>
													<c:if test="${flags.index eq 4 }">
														<c:forEach items="${attachList4}" var="list">
															<div class="item">
																<div class="col-md-4">
																	<a href="#" data-toggle="modal" data-target=".preview">
																		<img src="${list[3]}"
																		class="img-responsive center-block"> <span
																		class="overlay-sm ie-opacity">${list[1] }</span>
																	</a>
																</div>
															</div>
														</c:forEach>
													</c:if>
		                                        </div>
		                                        <a class="left carousel-control ie-opacity-snow" href="#pre-${flags.index }-${flags.index }" role="button" data-slide="prev">
		                                            <span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>
		                                        </a>
		                                        <a class="right carousel-control ie-opacity-snow" href="#pre-${flags.index }-${flags.index }" role="button" data-slide="next">
		                                            <span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
		                                        </a>
		                                    </div>
		                                </div>
								</c:forEach>
							</div>
						</div>
						<!-- <div role="tabpanel" class="tab-pane fade" id="guide">
							<h4>什么是众持模式？</h4>
							<ul class="list-unstyled text-label micmedium-font">
								<li><span class="label label-clip label-priority">优</span>优先：保本保收益，收益稳定。还款方式：按月付息，到期还本</li>
								<li><span class="label label-clip label-sandwich">夹</span>夹层：保本不保收益，根据项目实际融资额分配收益。还款方式：到期还本付息</li>
								<li><span class="label label-clip label-inferior">劣</span>劣后：不保本不保收益，风险高收益高，对投资人有限制。还款方式：到期还本付息</li>
							</ul>
							<h4 class="bg-warning text-snow inv_guide">赔付流程</h4>
							<img src="${oss}/resources/assets/images/home/inv_guide.png"
								class="img-responsive center-block" alt="赔付流程">
						</div> -->
						<div role="tabpanel" class="tab-pane fade" id="control">
							<h4>平台风险保障措施</h4>
							<p>资金第三方托管：投资人充值、投资均由第三方宝付进行托管，确保资金与平台的严格分离，保障投资人的资金安全；</p>
							<!-- <p>劣后资金安全垫：根据投资人风险——收益偏好程度，独创优先、夹层、劣后项目层供投资人灵活选择。若项目发生逾期时，劣后资金作为安全垫，优先投资人本息和夹层投资人本金先于劣后资金获得赔付；</p> -->
							<p>抵押/质押保障：每个项目均要求融资方提供动产、不动产、股票、股权等变现能力强的抵押或质押物，为投资人提供重大保障措施；</p>
							<p>第三方、大股东及配偶连带责任担保：每个项目要求有第三方或项目方的大股东及配偶等提供无限连带责任担保，以保证在项目发生风险时明确可追偿人，为投资人再添保障；</p>
							<p>收购方债权收购：所有项目均与资产实力雄厚的收购方签订收购协议，在项目发现风险时，以保障优先投资人的本息和夹层投资者的本金安全；</p>
	
							<h4>项目众持流程图</h4>
							<img src="${oss}/resources/assets/images/home/wc_control.jpg"
								class="img-responsive center-block" alt="项目众持流程图">
							<div class="page-line"></div>
							<h4>风控措施</h4>
							<p>${loan.loansignbasics.history }</p>
							<h4>风控意见</h4>
							<p>${loan.loansignbasics.riskAdvice}</p>
						</div>
						<div role="tabpanel" class="tab-pane fade active" id="history">
							<div class="time-vline"></div>
							<ul class="list-unstyled cleargap">
								<li><span class="icon-timeline timeline-step-1"></span>
									<div>
										<h4 class="text-para">项目上线</h4>
										<time class="text-label">上线时间：${loan.publishTime} </time>
									</div></li>
								<li><span class="icon-timeline timeline-step-2"></span>
									<div>
										<h4 class="text-para">项目募集</h4>
										<time class="text-label">开始时间：${loan.publishTime}</time>
									</div></li>
								<li><c:choose>
										<c:when test="${loan.creditTime ne null }">
											<span class="icon-timeline timeline-step-3"></span>
										</c:when>
										<c:otherwise>
											<span class="icon-timeline timeline-revstep-3"></span>
										</c:otherwise>
									</c:choose>
	
									<div>
										<h4 class="text-para">项目放款</h4>
										<time class="text-label"><c:if test="${!empty loan.creditTime }">操作时间：${loan.creditTime}</c:if></time>
									</div></li>
								<li><c:choose>
										<c:when test="${loan.status eq 8}">
											<span class="icon-timeline timeline-step-4"></span>
										</c:when>
										<c:otherwise>
											<span class="icon-timeline timeline-revstep-4"></span>
										</c:otherwise>
									</c:choose>
									<div>
										<h4 class="text-para">项目还款</h4>
										<c:forEach items="${loan.repaymentrecords}" var="repay">
											<c:if
												test="${repay.repayState eq 2 or repay.repayState eq 4 or repay.repayState eq 5  }">
												<time class="text-label">第${repay.periods}期，还款时间：${repay.repayTime}</time>
											</c:if>
										</c:forEach>
									</div></li>
							</ul>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="record"></div>
					</div>
				</div>
			</c:if>
		</div>
	</div>
	<!-- footer -->
	<jsp:include page="/WEB-INF/views/hc9/footer.jsp" />
	<!-- end footer -->
	<!-- 图片预览 -->
	<div class="modal fade preview" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog" style="width:966px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title"></h4>
				</div>
				<div class="modal-body">
					<img src="" class="img-responsive center-block">
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>
	<!-- 开始众持模态框 -->
	<div class="modal fade" id="zcModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">支付</h4>
				</div>
				<div class="modal-body">
					<ul class="list-unstyled clearfix">
						<li class="text-label normal-font clearfix sr-only">
							<div class="col-sm-6">
								<span class="label label-clip label-priority">优</span>认购金额 : <span
									class="mmedium-font text-danger" data-type="priority"></span> 元
									<span style="display:none;margin-left:25px;" id="contain_redenv">(内含红包 <span class="how-much text-danger"></span> 元)</span>
							</div>
							<div class="col-sm-6">
								预计收益 : <span class="mmedium-font text-danger"></span> 元
							</div>
						</li>
						<li class="text-label normal-font clearfix sr-only">
							<div class="col-sm-6">
								<span class="label label-clip label-sandwich">夹</span>认购金额 : <span
									class="mmedium-font text-danger" data-type="sandwich"></span> 元
							</div>
							<div class="col-sm-6">
								预计收益 : <span class="mmedium-font text-danger"></span> 元
							</div>
						</li>
						<li class="text-label normal-font clearfix sr-only">
							<div class="col-sm-6">
								<span class="label label-clip label-inferior">劣</span>认购金额 : <span
									class="mmedium-font text-danger" data-type="inferior"></span> 元
							</div>
							<div class="col-sm-6">
								预计收益 : <span class="mmedium-font text-danger">浮动收益</span>
							</div>
						</li>
						<li class="col-sm-12 mmedium-font padding20">
							总计：<span class="text-danger" data-type="all"></span> 元<!--  <span class="redenvelope add_redenv">- 红包 <span class="how-much">30</span> 元</span> -->
							<!-- <p id="redenv_prompt" class="help-block text-danger" style="margin-left:20px;padding:5px;display:inline-block;background-color:#fff2f3;border:1px solid #d9534f;"><span class="glyphicon glyphicon-exclamation-sign text-danger" aria-hidden="true"></span><small> 只有“优先”时可以使用红包</small></p> -->
						</li>
					</ul>
				</div>
				<div class="modal-footer">
					<form class="form-horizontal text-label" id="payForm" method="post">
						<input type="hidden" id="redenve_id" name="redId" />
						<input type="hidden" id="interest_id" name="cardId" />
						<input type="hidden" id="priorityh" name="priority" /> <input
							type="hidden" id="middleh" name="middle" /> <input type="hidden"
							id="afterh" name="after" /> <input type="hidden" id="loansignId"
							name="loanId" />
						<div class="form-group">
							<label class="col-sm-3 control-label normal-weight">交易密码
								:</label>
							<div class="col-sm-5 cleargap">
								<input type="password" class="form-control input-sm" id="tpwd"
									name="tpwd" placeholder="">
							</div>
						</div>
						<c:if
							test="${session_user.password eq session_user.transPassword }">
							<div class="form-group friendly-tips">
								<small>温馨提示：您在平台的初始交易密码和登录密码一致，请及时到<a
									href="/member_index/selfInfo.htm?index=0_5_2&nav=5"
									class="text-danger">个人中心</a>修改您的交易密码，以确保安全。
								</small>
							</div>
						</c:if>
						<div class="form-group">
							<label class="col-sm-3 control-label normal-weight">验 证 码
								:</label>
							<div class="col-sm-3 cleargap">
								<input type="text" class="form-control input-sm" id="pcode"
									name="pcode" placeholder="">
							</div>
							<div class="col-sm-2 input-sm control-label" id="loanInfoValidCoodeId"></div>
						</div>
						<div class="form-group">
							<div class="text-left col-sm-offset-2">
								<div class="checkbox">
									<label> <input type="checkbox"> <small>勾选即代表您已仔细阅读并同意&nbsp;</small><a href="#"
										data-toggle="modal" id="protocol" class="text-label hc-protocol"><small>&lt;&lt;风险提示及免责声明&gt;&gt;</small></a>
									</label>
								</div>
							</div>
						</div>
						<button type="button" id="formSubmit"
							class="btn btn-lg btn-block bg-danger text-snow"
							disabled="disabled">开始众持</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 风险提示及免责申明模态框 -->
	<div class="modal fade" id="protocolModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">风险提示及免责声明</h4>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<!-- end  -->
	<!-- 授权委托书模态框 -->
	<div class="modal fade" id="delegateModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">授权委托书</h4>
				</div>
				<div class="modal-body"></div>
				<div class="modal-footer" style="text-align:right;">
					<button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
				</div>
			</div>
		</div>
	</div>
	<!-- end  -->
	<!-- 红包列表态框 -->
	<div class="modal fade" id="packetsModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">红包列表</h4>
				</div>
				<div class="modal-body">
					<div class="table-responsive text-label" id="redenve_list">
	                    
	                </div>
				</div>
				<div class="modal-footer" style="text-align:right;">
					<button type="button" class="btn btn-danger" data-dismiss="modal" id="sure_redenve">确定</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 加息券列表框 -->
	<div class="modal fade" id="interestModal" tabindex="-1" role="dialog"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">加息券列表</h4>
				</div>
				<div class="modal-body">
					<div class="table-responsive text-label" id="interest_list">
	                    
	                </div>
				</div>
				<div class="modal-footer" style="text-align:right;">
					<button type="button" class="btn btn-danger" data-dismiss="modal" id="sure_interest">确定</button>
				</div>
			</div>
		</div>
	</div>
	<!-- end  -->`
	<div style="display:none;">
       	<div class="popup-record" id="record-Juc">
           	<div class="popup-bg">
               	<span class="tag1">恭喜您获得《李荣浩【有理想】世界巡回演唱会-深圳站》门票<font color="#ce251f"><span id="jucnum">0</span></font>张，<br>中奖信息可在<font color="#ce251f">会员中心-中奖纪录</font>中查看，门票将由聚橙网进行统一的<br>寄送，请保持注册手机号的畅通！</span>
                   <a href="/member_index/monkeyRecord.htm?index=0_6&nav=5" class="tag2">去查看</a>
            </div>
        </div>
    </div>
	
	<!-- <div style="display:none;">
    	<div class="dada_popup" id="dadaPopup">
        	<div class="coupon" style="font-size:103px;color:#d84535;">
            	<span style="font-size:45px; margin-left:20px;">￥</span><span class="tapbus_money">200</span>
            </div>
            <div class="coupon_text">
            	<dl style="color:#ffce24; font-size:18px; margin-bottom:20px;">
                    <dt>恭喜您</dt>
                    <dd>获得<span class="tapbus_money">20</span>元嗒嗒巴士代金券</dd>
                </dl>
                <dl style="color:#ffce24; font-size:18px; margin-bottom:20px;">
                    <dt>使用本手机号注册嗒嗒巴士即可使用该代金券</dt>
                    <dd>在嗒嗒巴士APP个人中心查看</dd>
                </dl>
            </div>
        </div>
    </div> -->
    
	<jsp:include page="/WEB-INF/views/hc9/common/common_js.jsp" />
	<script src="${oss}/resources/assets/js/src/zc-modules.js?v=1.0.5"></script>
	<script src="${oss}/resources/assets/js/zc.js?v=1.0.2"></script>
	<script src="${oss}/resources/assets/script/loanRecord.js?v=1.0.2"></script>
	<script src="${oss}/resources/assets/script/loaninfo.js?v=1.0.8"></script>
	<jsp:include page="/WEB-INF/views/hc9/common/ie8fix_js.jsp" />
	<script src="${oss}/resources/public/js/fancybox/jquery.fancybox.js?v=2.1.5"></script>
</body>
</html>