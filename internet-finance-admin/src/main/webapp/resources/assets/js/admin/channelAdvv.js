$(function() {
	var ajaxbg = $("#background");
	ajaxbg.hide();

	$(".addAdvv").click(
			function() {
				$("#domelChannelAdvv").css('display', 'block');
				$("#domelChannelAdvv").html(
						addModel("添加广告", "广告名称", "添加", "3", "", $(this).attr(
								'data-sid'), "5"));
				$(".made").css({
					"padding" : "15px 15px"
				});
				$(".made").html(
						"<label>所属广告位:" + $(this).attr('data-id') + "("
								+ $(this).attr('data-name') + ")</label>");
				ajaxbg.show();
			});

	// 广告位

	$(".advv_code").click(
			function() {
				$("#domelChannelAdvv").css('display', 'block');
				$("#domelChannelAdvv").html(
						showModel("广告-ID", "广告位ID", $(this).attr('data-id')));
				ajaxbg.show();
			});

	$(".advv_edit").click(
			function() {
				$("#domelChannelAdvv").css('display', 'block');
				$("#domelChannelAdvv").html(
						addModel("广告-修改", "广告名称", "修改", "2", $(this).attr(
								'data-sid'), $(this).attr('data-pid'), "6"));
				$(".made").css({
					"padding" : "15px 15px"
				});
				$(".made").html(
						"<label>所属广告位:" + $(this).attr('data-uid') + "("
								+ $(this).attr('data-name') + ")</label>");
				ajaxbg.show();
			});

	// 关闭弹出框
	$('#domelChannelAdvv').on('click', '#closeModel,#closebtn', function() {
		$("#domelChannelAdvv").css('display', 'none');
		ajaxbg.hide();
	});

});

function addModel(title, text1, text2, type, id, sid, url) {
	var htm = "<div style='padding: 10px 5px; border-bottom: 1px solid #ccc;'>";
	htm += "<h1>" + title + "</h1>";
	htm += "<span id='closeModel'style='float: right; margin-top: -16px; cursor: pointer; padding: 0px 3px;'>X</span></div>";
	htm += "<form method='post' id='form3" + type + "'>";
	htm += "<input type='hidden' name='type' value='" + type + "'/>"
	htm += "<input type='hidden' name='id' value='" + id + "'/>"
	htm += "<input type='hidden' name='upSpreadId' value='" + sid + "'/>"
	htm += "<div class='made'></div>";
	htm += "<div style='padding: 25px 15px;'><label>"
			+ text1
			+ ":&nbsp;</label><input id='nameValue1' type='text' name='name' maxlength='128' style='width:170px;height:20px;'/><label></label></div>";
	htm += "<button type='button' onclick='saveOrEdit("
			+ type
			+ ","
			+ url
			+ ")'  style='padding: 8px 30px; background-color: #0099FF; color: #fff; border-style: none; margin-left: 129px;'>"
			+ text2 + "</button></form>";
	return htm;
}

function showModel(title, text1, text2) {
	var htm = "<div style='padding: 10px 5px; border-bottom: 1px solid #ccc;'>";
	htm += "<h1>" + title + "</h1>";
	htm += "<span id='closeModel'style='float: right; margin-top: -16px; cursor: pointer; padding: 0px 3px;'>X</span></div>";
	htm += "<div style='padding: 25px 15px;'><label>" + text1 + ":&nbsp;"
			+ text2 + "</label></div>";
	htm += "<button type='button' id='closebtn' style='cursor: pointer;padding: 8px 30px; background-color: #0099FF; color: #fff; border-style: none; margin-left: 129px;'>确定</button>";
	return htm;
}

function saveOrEdit(type, url) {
	var uri = "";
	if (url == "5") {
		// 保存
		uri = "/channelSpread/saveChannel"
	} else if (url == "6") {
		// 修改
		uri = "/channelSpread/updateChannel"
	}
	if ($.trim($("#nameValue1").val()) == "") {
		$("#nameValue1").next().text("不能为空！").css('color', 'red');
		return;
	} else {
		$.ajax({
			url : uri,
			type : 'post',
			data : $("#form3" + type).serialize(),
			success : function(data) {
				// navTab.reload("/channelSpread/channelManage", "", 94);
				navTab.reload("/channelSpread/channelAdvDetails?sId="
						+ $("#advId").val() + "&code=" + $("#advcode").val(),
						"", "channelSeeAdvDetails");
			}

		});
	}

}

function jumpPage3(pageno, totalPage) {
	if (pageno <= 0 || pageno > totalPage) {
		return;
	}
	navTab.openTab("channelSeeAdvDetails",
			"/channelSpread/channelAdvDetails?sId=" + $("#advId").val()
					+ "&no=" + pageno, {
				title : "查看详情",
				fresh : true
			});
}
