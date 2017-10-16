<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript" src="/resources/js/quickquery/allActivity.js"></script>
<style>
	#motherActivity-search-panel {vertical-align: middle;}
</style>
<div id="motherActivity-search-panel">
	<div>
	 <form method="post" id="motherActivitySearchForm">		
                   手机号码: <input id="MonthersDayPhone" type="text" maxlength="11" accept="请输入用户手机号码">
			<button type="button" onclick="monthersDay()">母亲节关注微信红包发放</button>
		<div>
		 手机号码: <input id="telephone"  type="text" accept="请输入用户手机号码">
			<button type="button" onclick="newWebChatAttentionReceive()">新手关注微信红包发放</button>
		</div>
	    </form>
	 </div>
</div>