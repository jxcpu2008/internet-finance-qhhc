<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<!-- ------------------开始-------------------------- -->
	<link href="${oss}/resources/vendor/css/bille-hc9.v2.0.css" rel="stylesheet">
	<div class="user-invest">
		<c:set var="loanId" value="0"></c:set>
		<c:set var="number" value="0"></c:set>
		<c:forEach var="loan" items="${page.list}">
			<c:if test="${loanId != loan[0]}">
				<c:if test="${loanId != 0}">
				        	</table>
				        </div>
				        <c:if test="${number >= 3}">
				        	<a href="javascript:;" class="btn-more" style="width:75px; height: 25px; background-position: center -24px;"></a>
				        </c:if>
				    </div>
				</c:if>
				<c:set var="loanId" value="${loan[0]}"></c:set>
				<c:set var="number" value="0"></c:set>
			    <div class="user-invest-item">
			    <c:if test="${a == 0 }"></c:if>
			    	<c:if test="${1 <= loan[14] && loan[14] <= 5}">
			        	<div class="label-progress"></div>
			    	</c:if>
			    	<c:if test="${6 <= loan[14] && loan[14] <= 7}">
	       				<div class="label-return"></div>
			    	</c:if>
			    	<c:if test="${loan[14] eq 8}">
			        	<div class="label-finish"></div>
			    	</c:if>
			        <table width="100%" cellpadding="0" cellspacing="0" border="0">
			        	<col width="40%" />
			        	<col width="30%" />
			        	<col width="30%" />
			            <tr>
			                <td>
				                <span class="text-danger smmedium-font" title="${loan[1]}">
				                	<c:if test="${fn:length(loan[1]) ge 19}">
				                		<a class="text-label" href="/loaninfo/loansignInfo.htm?loanId=${loan[0] }" style="color:#d9534f;">${loan[1].substring(0,19)}..</a>
				                	</c:if>
									<c:if test="${fn:length(loan[1]) lt 19}">
										<a class="text-label" href="/loaninfo/loansignInfo.htm?loanId=${loan[0] }" style="color:#d9534f;">${loan[1] }</a>
									</c:if>
								</span>
							</td>
			                <td>年化收益 ： 
			                	<span class="text-dark"><fmt:formatNumber type="number" value="${(loan[5]*100) + (loan[7]*100) }" pattern="#0.00" />%</span>
			                	<!--<c:if test="${!empty loan[12] }">+<span class="text-dark"><fmt:formatNumber type="number" value="${loan[12] *100 }" />%(加息券)</span></c:if>-->
			                </td>
			                <td>期限 ： <span class="text-dark">${loan[16]}<c:if test="${loan[15] eq 2}">个月</c:if><c:if test="${loan[15] eq 3}">天</c:if></span></td>
			            </tr>
			            <tr height="10"></tr>
			            <tr>
			            	<c:if test="${empty loan[17]}">
				                <td colspan="2">计息开始时间： <span class="text-dark">--</span></td>
				                <td>还款截止时间： <span class="text-dark">--</span></td>
			            	</c:if>
			            	<c:if test="${!empty loan[17]}">
				                <td colspan="2">计息开始时间： <span class="text-dark">${loan[17].substring(0,10) }</span></td>
				                <c:if test="${loan[15] eq 2}">
				                <td>还款截止时间： <span class="text-dark">${loan[18].toString().substring(0,10) }</span></td>
				                </c:if>
				                <c:if test="${loan[15] eq 3}">
				                	<td>还款截止时间： <span class="text-dark">${loan[21].toString().substring(0,10) }</span></td>
				                </c:if>
			                </c:if>
			            </tr>
			        </table>
			        <h1 class="text-dark normal-font">投资列表</h1>
			        <c:if test="${loan[20] == 1}">
			        	<div class="user-invest-list" style="height: 48px;">
			        </c:if>
			        <c:if test="${loan[20] >= 2}">
			        	<div class="user-invest-list">
			        </c:if>
			        <table width="100%" cellpadding="0" cellspacing="0" border="0" >
			            <col width="24%" />
			            <col width="28%" />
			            <col width="28%" />
			            <col width="20%" />
			</c:if>
			<c:set var="number" value="${number+1}"></c:set>
		            <tr>
		                <td>
			                <c:if test="${loan[13] ne 5}">
				                <c:if test="${loan[4] eq 1}">
									<span class="label label-clip label-priority">优</span>
								</c:if>
								<c:if test="${loan[4] eq 2}">
									<span class="label label-clip label-sandwich">夹</span>
								</c:if>
								<c:if test="${loan[4] eq 3}">
									<span class="label label-clip label-inferior">劣</span>
								</c:if>
							</c:if>
							<c:if test="${loan[13] eq 5}"></c:if>
			                <span class="text-dark">
			                <fmt:formatNumber type="number" value="${loan[2] }" pattern="#0.00" />
			                <c:if test="${!empty loan[11] }">(<fmt:formatNumber type="number" value="${loan[11] }" />元红包)</c:if>
							</span>
		                </td>
		                <td>投资时间： <span class="text-dark">${loan[3].substring(0,16) }</span></td>
		                <td>预计收益（元）： 
		                	<span class="text-dark">
						    	<c:if test="${1 <= loan[14] && loan[14] <= 5}">
						        	--
						    	</c:if>
						    	<c:if test="${6 <= loan[14] && loan[14] <= 8}">
						        	<fmt:formatNumber type="number" value="${loan[19]}" pattern="#0.00" />
						    	</c:if>
		                	</span>
		                </td>
		                <td>
		                <c:if test="${6 <= loan[14] && loan[14] <= 8}">
		                	<c:if test="${!empty loan[8] }">
								<a title="合同下载" class="btn-download" href="/loaninfo/loanCreditContact.htm?loanId=${loan[0] }&recordId=${loan[10] }"></a>
							</c:if>
							<c:if test="${empty loan[8] }">
								<a href="javascript:void(0)" class="btn-download disabled" title="请联系客服"></a>
							</c:if>
		                	<a href="javascript:findDetail(${loan[10] })" class="btn-detail">查看收益</a>
						</c:if>
						<c:if test="${1 <= loan[14] && loan[14] <= 5}">
		                	<a href="javascript:void(0)" class="btn-download disabled"></a>
		                	<a href="javascript:void(0)" class="btn-detail disabled">查看收益</a>
						</c:if>
		                </td>
		            </tr>
		</c:forEach>
		        </table>
		        </div>
				<c:if test="${number >= 3}">
					<a href="javascript:;" class="btn-more" style="width:75px; height: 25px; background-position: center -24px;"></a>
				</c:if>
		    </div>
	</div>
<style type="text/css">
	.page_div {
		width: auto;
		height: 40px;
		margin:20px auto 40px;
		text-align:center;
		padding-top:15px;
		clear: both;
	}
	.page_div>ul.page_ul>li{
		height: 24px;
	}
	.page_div>ul.page_ul>li>a {
		display: block;
		text-decoration: none;
	}
	.page_s_1, .page_s {
		line-height: 24px;
		border: 1px solid #bbb;
	}
	.page_div .page_s {
		color: #333;
		padding:1px 10px;
	}
	.page_div .page_s_1 {
		background-color: #ce251f;
		color: #fff;
		padding:1px 10px;
	}
	.page_div .first, .page_div .last {
		padding:1px 10px;
	}
</style>
<script>
$(function(){
	//var initHeight = $(".user-invest-list").innerHeight();
	var initHeight = 96;
	$(".user-invest-item").find(".btn-more").click(function(){
		var $this = $(this),
			$item = $this.parent(),
			$list = $item.find(".user-invest-list"),
			length = $list.find("tr").length,
			speed = 50;
		if(!$this.hasClass("opposite")){
			$this.addClass("opposite");
			$list.stop().animate({height:$list.children().innerHeight()},50 * length);
		}else{
			$this.removeClass("opposite");
			
			$list.stop().animate({height:initHeight},50 * length);
		}
	});
});
//收益明细-查看详情
function findDetail(lrId) {
	$.ajax({
		url : '/loaninfo/repayInfo.htm',
		type : 'post',
		data : {
			lrId : lrId
		},
		success : function(data) {
			$(".modal-dialog").html(data);
			$('#eachDetailsModal').modal('show');
		}
	});
}
</script>
<!-- 还款明细模态框 -->
<div class="modal fade" id="eachDetailsModal" tabindex="-1"
	role="dialog" aria-hidden="true">
	<div class="modal-dialog"></div>
</div>
	<!-- ------------------结束-------------------------- -->
<c:if test="${empty page.list }">
	<p class="text-center medium-font margin40">暂无数据</p>
</c:if>
<c:if test="${!empty page.list}">
	<jsp:include page="/WEB-INF/views/hc9/common/pageRed.jsp" />
</c:if>

