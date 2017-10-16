function showAssign(loanId, loanTitile, tenderMoney, loanUnit,loanType) {
	var content = "";

	content += "<h3 class='tkh3'>	<b>债权转让</b><span><a onclick=\"removeAssign()\" id='button' href='javascript:;'>╳</a></span></h3>";
	content += "<div class=\"applyTransDiv\"><input type=\"hidden\" value=\""
			+ tenderMoney + "\" id=\"tenderMoney\">";
	content += "当前申请转让的标为：<font style=\"color:red\">" + loanTitile + "（￥"
			+ tenderMoney + "）</font>"
	content += "<input type=\"hidden\" value=\"" + loanId
			+ "\" id=\"loanId\"><input type=\"hidden\" value=\"" + loanUnit
			+ "\" id=\"loanUnit\"></div>";
	/*
	 * content+="<div class=\"applyTransDiv\">"; content+=" 转让份额："; content+="
	 * <select style='height: 30px;' name=\"transPercent\"
	 * id=\"transPercent\">"; content+=" <option value=\"1\">全部转让</option>";
	 * content+=" <option value=\"2\">部分转让</option>"; content+=" </select>";
	 * content+=" <input type=\"text\" name=\"transNum\" id=\"transNum\"
	 * class='vipTextBox' value=\""+parseInt(tenderMoney)/parseInt(loanUnit)+"\"
	 * width=\"80\" readonly=\"readonly\">份，共<span
	 * style=\"color:red\">"+tenderMoney+"</span>元（每份"+parseFloat(loanUnit).toFixed(1)+"元）";
	 * content+="</div>";
	 */
	/*
	 * content+="<div class=\"applyTransDiv\">"; content+=" 转让价格："; content+="
	 * <select style='height: 30px;' name=\"transValue\" id=\"transValue\">";
	 * content+=" <option value=\"3\">不变</option>"; content+=" <option
	 * value=\"1\">折扣</option>"; content+=" <option value=\"2\">升值</option>";
	 * content+=" </select>"; content+=" <input type=\"text\" name=\"percent\"
	 * id=\"percent\" class='vipTextBox' value=\"0\" width=\"80\"
	 * readonly=\"readonly\">％，<span>转让价每份<font
	 * style='color:red'>"+parseFloat(loanUnit).toFixed(1)+"</font>元</span>";
	 * content+="</div>";
	 */
	content += "<div style=\"line-height:25px;margin-top:5px\">";
	content += "    您决定转让 <font id=\"resultNum\" style=\"color:red\">"
			+ parseInt(tenderMoney) + "</font>&nbsp;元";
	content += "</div>";
	content += "<div>";
	content += " 债权折扣：";
	content += " <input type=\"text\" name=\"transNum\" id=\"transNum\"class='vipTextBox'width=\"80\">%";
	content += " <input type=\"hidden\" name=\"loanType\" id=\"loanType\" value=\""+ loanType + "\" >";
	content += "</div>";
	content += "<div style=\"line-height:25px;margin-top:5px\">";
	content += "    注:<font id=\"resultNum\" style=\"color:red\">项目一旦转让,由其它投资人认购，如截止时间无人认购，自动按原融资方回购。</font>";
	content += "</div>";
	content += "<div style=\"margin-top:10px\">";
	content += "<a class=\"authenticateBnt\" onclick=\"submitAssign()\" style=\"font-size: 16px;height:35px;line-height:35px;margin-left: 0;width: 100px;\">确认转让</a>";
	content += "</div>";
	/*
	 * content+="<script>"; content+="$(\"#transPercent\").change(function()
	 * {"; content+=" if ($(this).val()==\"1\") {"; content+="
	 * $(this).next().val("+parseInt(tenderMoney)/parseInt(loanUnit)+");";
	 * content+=" $(\"#transNum\").next().text(\""+tenderMoney+"\");";
	 * content+=" $(this).next().attr(\"readonly\",\"readonly\");"; content+="
	 * };"; content+=" if ($(this).val()==\"2\") {"; content+="
	 * $(this).next().removeAttr(\"readonly\");"; content+=" };";
	 * content+="});"; content+="$(\"#transValue\").change(function() {";
	 * content+=" if ($(this).val()==\"3\") {"; content+="
	 * $(this).next().val(\"0\");"; content+="
	 * $(this).next().attr(\"readonly\",\"readonly\");"; content+="
	 * $(this).next().next().html(\"转让价每份<font
	 * style='color:red'>\"+parseFloat("+loanUnit+").toFixed(1)+\"</font>元\");";
	 * content+=" }else if ($(this).val()==\"1\"){"; content+="
	 * $(this).next().val(\"0\");"; content+="
	 * $(this).next().removeAttr(\"readonly\");"; content+="
	 * $(this).next().next().html(\"转让价每份<font
	 * style='color:red'>\"+parseFloat("+loanUnit+"*(1-$(this).next().val()/100)).toFixed(1)+\"</font>元\");";
	 * content+=" }else{"; content+=" $(this).next().val(\"0\");"; content+="
	 * $(this).next().removeAttr(\"readonly\");"; content+="
	 * $(this).next().next().html(\"转让价每份<font
	 * style='color:red'>\"+parseFloat("+loanUnit+"*(1+$(this).next().val()/100)).toFixed(1)+\"</font>元\");";
	 * content+=" };"; content+="});"; content+="$(\"#transNum\").bind(\"input
	 * propertychange\",function(){"; content+=" if(isNaN($(this).val())){";
	 * content+=" $(this).val($(this).val().replace(/[^\\d]/g,''));"; content+="
	 * }else
	 * if(parseInt($(this).val())>"+parseInt(tenderMoney)/parseInt(loanUnit)+"){";
	 * content+=" ymPrompt.alert(\"转让份额不得大于总份额\");"; content+="
	 * $(this).val("+parseInt(tenderMoney)/parseInt(loanUnit)+")"; content+="
	 * }else if(parseInt($(this).val())<1){"; content+="
	 * ymPrompt.alert(\"最小转让份额为1\");"; content+=" $(this).val(1)"; content+="
	 * }else{"; content+=" $(\"#resultNum\").text($(this).val());"; content+="
	 * $(this).next().text(parseFloat($(this).val()*"+loanUnit+").toFixed(1));";
	 * content+=" }"; content+="});"; content+="$(\"#percent\").bind(\"input
	 * propertychange\",function(){"; content+=" if(isNaN($(this).val())){";
	 * content+=" $(this).val($(this).val().replace(/[^\\d]/g,''));"; content+="
	 * }else if($(this).val()>30){"; content+="
	 * ymPrompt.alert(\"折扣或升值不得超过30%\");"; content+=" $(this).val(30)";
	 * content+=" }else if($(this).val()<0){"; content+="
	 * ymPrompt.alert(\"请输入0-30范围内数字\");"; content+=" $(this).val(1)";
	 * content+=" }else{"; content+=" if($(this).prev().val()==\"1\"){";
	 * content+="
	 * $(\"#resultPrice\").text(parseFloat("+loanUnit+"*(1-$(this).val()/100)).toFixed(1));";
	 * content+="
	 * $(this).next().find(\"font\").text(parseFloat("+loanUnit+"*(1-$(this).val()/100)).toFixed(1));";
	 * content+=" }else{"; content+="
	 * $(\"#resultPrice\").text(parseFloat("+loanUnit+"*(1+$(this).val()/100)).toFixed(1));";
	 * content+="
	 * $(this).next().find(\"font\").text(parseFloat("+loanUnit+"*(1+$(this).val()/100)).toFixed(1));";
	 * content+=" }}"; content+="});"; content+="</script>";
	 */
	$(".applyTrans").html(content);
	$(".applyBg").css({
		display : 'block',
	});
	$(".applyTrans").css(
			{
				display : 'block',
				top : ($(".vipRightBox").outerHeight() - $(".applyTrans")
						.outerHeight())
						/ 2 - 20 + 'px'
			});
}

function removeAssign() {
	$(".applyBg").css({
		display : 'none'
	});
	$(".applyTrans").html("");
	$(".applyTrans").css({
		display : 'none'
	});
}
function submitAssign() {
	var loanId = $("#loanId").val();
	var tenderMoney = $("#tenderMoney").val();
	var transNum = $("#transNum").val();
	var loanType=$("#loanType").val();
	alert("dsfsdf");
	$.ajax({
		type : 'post',
		data : 'tenderMoney=' + tenderMoney + '&loanId=' + loanId+'&transNum='+transNum + '&loanType='+loanType,
		url : 'member_debt/assignmentPost',
		success : function(msg) {
			if (msg == "0") {
				ymPrompt.succeedInfo('申请债权转让成功', 300, 200, '成功', null);
				removeAssign();
			} else if (msg == 1) {
				ymPrompt.errorInfo('已申请转让过，不能再申请', 300, 200, '失败', null);
				removeAssign();
			} else if (msg == 2) {
				ymPrompt.errorInfo('申请债权转让失败', 300, 200, '失败', null);
			}
		}
	});
	// alert(loanId+"|"+tenderMoney+"|"+pcrettype+"|"+share+"|"+distype+"|"+appreciation+"|"+loanUnit);
}

function Progress(id){
	window.location.href ="/loaninfo/loansignInfo.htm?loanId="+id;
}


function select(no) {

	window.location.href = "visitor/to-project_manage_put1?no=" + no;

}

function jumpPage(pageno, totalPage) {

	if (pageno <= 0 || pageno > totalPage) {
		return;
	}
	select(pageno);
}

//显示标还款列表
function ShopRepayMent(loanId,subType) {
    $.ajax({
        url: "repayments/loanRepayment.htm?id="+loanId+"&subType="+subType,
        type: "GET",
        contentType: "application/x-www-form-urlencoded;charset=utf-8",
        success: function(_msg) {
            art.dialog({
                content: _msg,
                ok: function() {},
                lock: true
            });
        }
    });
}
