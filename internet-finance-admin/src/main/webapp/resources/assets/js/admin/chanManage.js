$(function() {
	var ajaxbg = $("#background");
	ajaxbg.hide();
	// 渠道
	$("#addChannel").click(
			function() {
				$("#domelChannel").css('display', 'block');
				$("#domelChannel").html(
						addModel("添加渠道", "渠道名称", "添加", "1", "", "", "5"));
				ajaxbg.show();
			});

	$(".code").click(
			function() {
				$("#domelChannel").css('display', 'block');
				$("#domelChannel").html(
						showModel("渠道-ID", "渠道ID", $(this).attr('data-id')));
				ajaxbg.show();
			});

	$(".addAdv").click(
			function() {
				$("#domelChannel").css('display', 'block');
				$("#domelChannel").html(
						addModel("添加广告位", "广告位名称", "添加", "2", "", $(this).attr(
								'data-sid'), "5"));
				$(".made").css({
					"padding" : "15px 15px"
				});
				$(".made").html(
						"<label>所属渠道:" + $(this).attr('data-id') + "("+$(this).attr('data-name')+")</label>");
				ajaxbg.show();
			});
	$(".edit").click(
			function() {
				$("#domelChannel").css('display', 'block');
				$("#domelChannel").html(
						addModel("渠道-修改", "渠道名称", "修改", "1", $(this).attr(
								'data-sid'), "", "6"));
				$(".made").css({
					"padding" : "15px 15px"
				});
				$(".made").html(
						"<label>渠道ID:" + $(this).attr('data-id') + "</label>");
				ajaxbg.show();
			});

	// 广告位

	$(".adv_code").click(
			function() {
				$("#domelChannel").css('display', 'block');
				$("#domelChannel").html(
						showModel("广告位-ID", "广告位ID", $(this).attr('data-id')));
				ajaxbg.show();
			});

	$(".adv_edit")
			.click(
					function() {
						$("#domelChannel").css('display', 'block');
						$("#domelChannel").html(
								addModel("广告位-修改", "广告位名称", "修改", "2", $(this)
										.attr('data-sid'), $(this).attr(
										'data-pid'), "6"));
						$(".made").css({
							"padding" : "15px 15px"
						});
						$(".made").html(
								"<label>所属渠道:" + $(this).attr('data-uid')
										+ "("+$(this).attr('data-name')+")</label>");
						ajaxbg.show();
					});

	// 关闭弹出框
	$('#domelChannel').on('click', '#closeModel,#closebtn', function() {
		$("#domelChannel").css('display', 'none');
		ajaxbg.hide();
	});

	$(".seeDetail").click(
			function() {
				var sid = $(this).attr('data-sid');
				navTab.openTab("channelSeeDetails",
						"/channelSpread/channelDetails?sId=" + sid, {
							title : "查看广告位详情",
							fresh : true
						});
			});

	$(".advst").click(
			function() {
				var sid = $(this).attr('data-sid');
				navTab.openTab("channelSeeAdvDetails",
						"/channelSpread/channelAdvDetails?sId=" + sid, {
							title : "查看广告详情",
							fresh : true
						});
			});

});

function addModel(title, text1, text2, type, id, sid, url) {
	var htm = "<div style='padding: 10px 5px; border-bottom: 1px solid #ccc;'>";
	htm += "<h1>" + title + "</h1>";
	htm += "<span id='closeModel'style='float: right; margin-top: -16px; cursor: pointer; padding: 0px 3px;'>X</span></div>";
	htm += "<form method='post' id='form" + type + "'>";
	htm += "<input type='hidden' name='type' value='" + type + "'/>"
	htm += "<input type='hidden' name='id' value='" + id + "'/>"
	htm += "<input type='hidden' name='upSpreadId' value='" + sid + "'/>"
	htm += "<div class='made'></div>";
	htm += "<div style='padding: 25px 15px;'><label>"
			+ text1
			+ ":&nbsp;</label><input id='nameValue' type='text' name='name' maxlength='128' style='width:170px;height:20px;'/><label></label></div>";
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
	if ($.trim($("#nameValue").val()) == "") {
		$("#nameValue").next().text("不能为空！").css('color', 'red');
		return;
	} else {
		$.ajax({
			url : uri,
			type : 'post',
			data : $("#form" + type).serialize(),
			success : function(data) {
				if (data == "1") {
					navTab.reload("/channelSpread/channelManage", "", 94);
				} else {

				}

			}

		});
	}

}

function jumpPage(pageno, totalPage) {
	if (pageno <= 0 || pageno > totalPage) {
		return;
	}

	navTab.reload("/channelSpread/channelManage?no=" + pageno, "", 94);
}
