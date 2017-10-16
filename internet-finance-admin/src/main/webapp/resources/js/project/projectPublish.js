//ajax请求：请求地址,参数,回调方法
function fn_ajax(_url, _param, _callback) {
	$.ajax({
		url : _url,
		type : "post",
		data : _param,
		contentType : "application/x-www-form-urlencoded;charset=utf-8",
		success : function(_msg) {
			if (_callback) {
				_callback(_msg);
			}
		}
	});
}

function setElementTopLeft(element) {
	var leftnum = element.outerWidth();
	var topnum = element.outerHeight();
	element.css('margin-left', -(leftnum / 2));
	element.css('margin-top', -(topnum / 2));
	$(".video").css("visibility", "hidden");// 这个是视频的弹出层，因为样式问题，暂时隐藏起来 隐藏
}
function checkSaveProject() {
	var $pname = $("#projectName").val();// 项目名称
	var $plogoimg = $("#plogoimg").attr("src");// 项目封面图
	var $proPoneword = $("#proPoneword").val();// 一句话介绍
	var $ptrade_one = $("#ptrade_one option:selected").text(); // 行业1
	var $ptrade_two = $("#ptrade_two option:selected").text(); // 行业2
	var $pdescription = $("#pdescription").val();// 项目简介
	var $pplace_one = $("#loc_province option:selected").text(); // 省
	var $pplace_two = $("#loc_city option:selected").text(); // 市
	var $pplace_three = $("#loc_town option:selected").text(); // 县
	var $paddress = $("#paddress").val();// 地址
	var $pshopNum = $("#pshopNum").val();// 目前开店数
	var $pfounderName = $("#pfounderName").val();// 创始人姓名
	var $pfounderEmail = $("#pfounderEmail").val();// 创始人邮箱
	var $plogoimg2 = $("#plogoimg2").attr("src");// 创始人头像
	var $pfounderDesc = $("#pfounderDesc").val();// 创始人简介
	var $psite = $("#psite").val();// 网址
	var $optOut = $("#optOut").val();// 退出机制
	if ($pname == "") {
		$("div[name=errorPname]").css("display", "block");
		return;
	}
	if ($proPoneword == "") {
		$("div[name=errorPoneword]").css("display", "block");
		return;
	}
	if ($ptrade_one == "请选择") {
		$("div[name=errorHang]").css("display", "block");
		return;
	}
	if ($ptrade_one != "互联网金融") {
		if ($ptrade_two == "请选择" || $ptrade_two == "") {
			$("div[name=errorHang]").css("display", "block");
			return;
		}
	}
	if ($pdescription == "") {
		$("div[name=errorProDesc]").css("display", "block");
		return;
	}
	if ($pplace_one == "请选择") {
		$("div[name=errorAddress]").css("display", "block");
		return;
	}
	var reg = /^\d+$/;
	if ($pshopNum == "" || !reg.test($pshopNum)) {
		$("div[name=errorNumx]").css("display", "block");
		return;
	}
	if ($pfounderName == "") {
		$("div[name=errorCreatName]").css("display", "block");
		return;
	}
	var regEmail = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
	if (!regEmail.test($pfounderEmail)) {
		$("div[name=errorEmail]").css("display", "block");
		return;
	}
	if ($pfounderDesc == "") {
		$("div[name=errorPerDesc]").css("display", "block");
		return;
	}
	if (!$("#protocol").attr("checked")) {
		ymPrompt.alert("您还未同意前海红筹委托融资服务协议");
		return;
	}
	return true;
}
$(function() {
	// 第一步的店铺封面上传
	$("#attach").live('change', function() {
		var srcc = $("#attach").val();
		start = srcc.lastIndexOf(".");
		end = srcc.length;
		ts = srcc.substring(start + 1, end);
		nts = ts.toLowerCase();
		if (srcc.length > 0) {
			if (nts != 'jpg' && nts != 'png' && nts != 'gif' && nts != 'jpeg') {
				document.getElementById("form1").reset();
				ymPrompt.errorInfo('图片格式错误！', 226, 150, '失败', null);
			} else {
				var form = $('#form-upload');
				var oldInput = $("#attach");   
			    var newInput = $(oldInput).clone();
			    $(oldInput).attr('id', 'form-upload-file');   
			    $(oldInput).before(newInput);
				if(form.length == 1) {
					form.find('input[type="file"]').remove();
					$(oldInput).appendTo(form);
				} else {
					form = $('<form method="POST" id="form-upload" enctype="multipart/form-data" style="display:none"></form>');    
			        $(oldInput).appendTo(form);  
			        $(form).appendTo('body');
				}
				$("#form-upload").ajaxSubmit({
					type : 'post',
					url : '/project/uploadFile',
					success : function(data) {
						$('#plogoimg').attr('src', data);
						$('#logo').val(data);
					}
				});
			}
		}
	});

	// 创始人头像
	$("#attach2").live('change', function() {
		var srcc = $("#attach2").val();
		start = srcc.lastIndexOf(".");
		end = srcc.length;
		ts = srcc.substring(start + 1, end);
		nts = ts.toLowerCase();
		if (srcc.length > 0) {
			if (nts != 'jpg' && nts != 'png' && nts != 'gif' && nts != 'jpeg') {
				document.getElementById("form2").reset();
				ymPrompt.errorInfo('图片格式错误！', 226, 150, '失败', null);
			} else {
				var form = $('#form-upload');
				var oldInput = $("#attach2");   
			    var newInput = $(oldInput).clone();
			    $(oldInput).attr('id', 'form-upload-file');   
			    $(oldInput).before(newInput);
				if(form.length == 1) {
					form.find('input[type="file"]').remove();
					$(oldInput).appendTo(form);
				} else {
					form = $('<form method="POST" id="form-upload" enctype="multipart/form-data" style="display:none"></form>');    
			        $(oldInput).appendTo(form);  
			        $(form).appendTo('body');
				}
				$("#form-upload").ajaxSubmit({
					type : 'post',
					url : '/project/uploadFile',
					success : function(data) {
						$('#plogoimg2').attr('src', data);
						$('#img_path').val(data);
					}
				});				

			}

		}
	});

	// 法人代表上传
	$("#dbcard").change(function() {
		var srcc = $("#dbcard").val();
		start = srcc.lastIndexOf(".");
		end = srcc.length;
		ts = srcc.substring(start + 1, end);
		nts = ts.toLowerCase();
		if (srcc.length > 0) {
			if (nts != 'jpg' && nts != 'png' && nts != 'gif' && nts != 'jpeg') {
				document.getElementById("dbform").reset();
				ymPrompt.errorInfo('图片格式错误！', 226, 150, '失败', null);
			} else {
				$("#dbform").next().removeClass("Vf_P2");
				$("#dbform").next().addClass("Vf_P1");
				$("#dbform").ajaxSubmit({
					type : 'post',
					url : '/project/uploadfile',
					success : function(data) {
						start2=data.lastIndexOf("/");
						end2=data.length;
						ts2 = data.substring(start2 + 1, end2);
						$("#image1").text(ts2);
						$("#img1").val(data);
					}
				});
			}

		}
	});

	// 营业执照上传
	$("#yyzz").change(function() {
		var srcc = $("#yyzz").val();
		start = srcc.lastIndexOf(".");
		end = srcc.length;
		ts = srcc.substring(start + 1, end);
		nts = ts.toLowerCase();
		if (srcc.length > 0) {
			if (nts != 'jpg' && nts != 'png' && nts != 'gif' && nts != 'jpeg') {
				document.getElementById("yyzzform").reset();
				ymPrompt.errorInfo('图片格式错误！', 226, 150, '失败', null);
			} else {
				$("#yyzzform").next().removeClass("Vf_P2");
				$("#yyzzform").next().addClass("Vf_P1");
				$("#yyzzform").ajaxSubmit({
					type : 'post',
					url : '/project/uploadfile',
					success : function(data) {
						start2=data.lastIndexOf("/");
						end2=data.length;
						ts2 = data.substring(start2 + 1, end2);
						$("#image2").text(ts2);
						$("#img2").val(data);
					}
				});
			}
		}
	});

	// 税务登记上传
	$("#swdj").change(function() {
		var srcc = $("#swdj").val();
		start = srcc.lastIndexOf(".");
		end = srcc.length;
		ts = srcc.substring(start + 1, end);
		nts = ts.toLowerCase();
		if (srcc.length > 0) {
			if (nts != 'jpg' && nts != 'png' && nts != 'gif' && nts != 'jpeg') {
				document.getElementById("swdjform").reset();
				ymPrompt.errorInfo('图片格式错误！', 226, 150, '失败', null);
			} else {
				$("#swdjform").next().removeClass("Vf_P2");
				$("#swdjform").next().addClass("Vf_P1");
				$("#swdjform").ajaxSubmit({
					type : 'post',
					url : '/project/uploadfile',
					success : function(data) {
						start2=data.lastIndexOf("/");
						end2=data.length;
						ts2 = data.substring(start2 + 1, end2);
						$("#image4").text(ts2);
						$("#img4").val(data);
					}
				});
			}

		}
	});

	// 组织机构代码上传
	$("#zzjg").change(function() {
		var srcc = $("#zzjg").val();
		start = srcc.lastIndexOf(".");
		end = srcc.length;
		ts = srcc.substring(start + 1, end);
		nts = ts.toLowerCase();
		if (srcc.length > 0) {
			if (nts != 'jpg' && nts != 'png' && nts != 'gif' && nts != 'jpeg') {
				document.getElementById("zzjgform").reset();
				ymPrompt.errorInfo('图片格式错误！', 226, 150, '失败', null);
			} else {
				$("#zzjgform").next().removeClass("Vf_P2");
				$("#zzjgform").next().addClass("Vf_P1");
				$("#zzjgform").ajaxSubmit({
					type : 'post',
					url : '/project/uploadfile',
					success : function(data) {
						start2=data.lastIndexOf("/");
						end2=data.length;
						ts2 = data.substring(start2 + 1, end2);
						$("#image6").text(ts2);
						$("#img6").val(data);
					}
				});
			}

		}
	});

	// 公司照片
	$("#company").change(function() {
		var srcc = $("#company").val();
		start = srcc.lastIndexOf(".");
		end = srcc.length;
		ts = srcc.substring(start + 1, end);
		nts = ts.toLowerCase();
		if (srcc.length > 0) {
			if (nts != 'jpg' && nts != 'png' && nts != 'gif' && nts != 'jpeg') {
				document.getElementById("companyform").reset();
				ymPrompt.errorInfo('图片格式错误！', 226, 150, '失败', null);
			} else {
				$("#companyform").ajaxSubmit({
					type : 'post',
					url : '/project/uploadfile',
					success : function(data) {
						start2=data.lastIndexOf("/");
						end2=data.length;
						ts2 = data.substring(start2 + 1, end2);
						$("#image8").text(ts2);
						$("#img8").val(data);
					}
				});
			}

		}
	});

	// 场地租赁
	$("#cdzl").change(function() {
		var srcc = $("#cdzl").val();
		start = srcc.lastIndexOf(".");
		end = srcc.length;
		ts = srcc.substring(start + 1, end);
		nts = ts.toLowerCase();
		if (srcc.length > 0) {
			if (nts != 'jpg' && nts != 'png' && nts != 'gif' && nts != 'jpeg') {
				document.getElementById("cdzlform").reset();
				ymPrompt.errorInfo('图片格式错误！', 226, 150, '失败', null);
			} else {
				$("#cdzlform").ajaxSubmit({
					type : 'post',
					url : '/project/uploadfile',
					success : function(data) {
						start2=data.lastIndexOf("/");
						end2=data.length;
						ts2 = data.substring(start2 + 1, end2);
						$("#image9").text(ts2);
						$("#img9").val(data);
					}
				});
			}

		}
	});

	// 卫生许可
	$("#wsxk").change(function() {
		var srcc = $("#wsxk").val();
		start = srcc.lastIndexOf(".");
		end = srcc.length;
		ts = srcc.substring(start + 1, end);
		nts = ts.toLowerCase();
		if (srcc.length > 0) {
			if (nts != 'jpg' && nts != 'png' && nts != 'gif' && nts != 'jpeg') {
				document.getElementById("wsxkform").reset();
				ymPrompt.errorInfo('图片格式错误！', 226, 150, '失败', null);
			} else {
				$("#wsxkform").ajaxSubmit({
					type : 'post',
					url : '/project/uploadfile',
					success : function(data) {
						start2=data.lastIndexOf("/");
						end2=data.length;
						ts2 = data.substring(start2 + 1, end2);
						$("#image10").text(ts2);
						$("#img10").val(data);
					}
				});
			}

		}
	});

	// 下一步
	$('#next1')
			.click(
					function() {
						var $facard = $("#img1").val();
						var $yyzz = $("#img2").val();
						var $swdj = $("#img4").val();
						var $zzjg = $("#img6").val();
						var $company = $("#img8").val();
						var $cdzl = $("#img9").val();
						var $wsxk = $("#img10").val();
						var $projectId = $("#projectId").val();
						if($facard==""||$facard==null){
							$("#dbform").next().removeClass("Vf_P1");
							$("#dbform").next().addClass("Vf_P2");
							return;
						}
						if($yyzz==""||$yyzz==null){
							$("#yyzzform").next().removeClass("Vf_P1");
							$("#yyzzform").next().addClass("Vf_P2");
							return;
						}
						if($swdj==""||$swdj==null){
							$("#swdjform").next().removeClass("Vf_P1");
							$("#swdjform").next().addClass("Vf_P2");
							return;
						}
						if($zzjg==""||$zzjg==null){
							$("#zzjgform").next().removeClass("Vf_P1");
							$("#zzjgform").next().addClass("Vf_P2");
							return;
						}
						$.ajax({
									url : '/project/saveProjectStoreTwo',
									type : 'post',
									data : {
										facardimg : $facard,
										yyzz : $yyzz,
										swdj : $swdj,
										zzjg : $zzjg,
										company : $company,
										cdzl : $cdzl,
										wsxk : $wsxk,
										projectId : $projectId
									},
									success : function() {
										window.location.href = "/project/projectPublishThree?projectId="
												+ $projectId;
									}
								});
					});

	/*
	 * $('.sc_error').click(function() { if (confirm('确认要删除吗？')) { $('#' +
	 * $(this).parent().find('input').attr('dbstr')).val('');
	 * $(this).parent('li').find('.sc_error').hide();
	 * $(this).parent('li').find('.shangchuan').hide();
	 * $(this).parent('li').find('.files').html(''); } });
	 */

	
	// 正式投资
	$("#invests").click(
			function() {
				var $userId = $("#user_id").val();
				var $equityMoney = $("#equityMoney").val();
				var $amount = $("#amount").text(); // 融资总金额
				var $prouserId = $("#prouser_id").val();
				var $pbaseId = $("#pbaseId").val();
				var $investMoney = $("#investMoney").val(); // 投资金额
				var $remoney=$("#remoney").val();	//当前店铺的剩余融资金额				
				var $cardStatus=$("#cardStatus").val();		//实名认证
				var $phonePass=$("#phonePass").val();		//手机认证
				var $pMerBillNo=$("#pMerBillNo").val();		//宝付注册
				if ($userId == "") {
					ymPrompt.errorInfo('您还未登录,请先登录在执行此操作!', 400, 200, '提示',
							function() {
								window.location.href = "visitor/to-login";
							});
					return;
				}
				
				  if($cardStatus!=2){
						 
					  $("#mtck-02").css("display","block");
					  return;
				  }
				  if($phonePass!=1){
					 
					  $("#mtck-05").css("display","block");
					  return;
				  }
				  if($pMerBillNo==""){
					  
					  $("#mtck-03").css("display","block");
					  return;
				  }
				
				
				if ($prouserId == $userId) {
					ymPrompt.errorInfo('您不能投自己的项目!', 400, 200, '提示',
							function() {
							});
					return;
				}
				if ($investMoney == "") {
					ymPrompt.errorInfo('请输入出资金额!', 400, 200, '提示', function() {
					});
					return;
				}
				if (isNaN($investMoney)) {
					ymPrompt.errorInfo('输入含非法字符!', 400, 200, '提示', function() {
					});
					return;
				}
				if (parseInt($investMoney) < parseInt($equityMoney)) {
					ymPrompt.errorInfo('您出资的单笔不能低于 ' + $equityMoney + '!', 400,
							200, '提示', function() {
							});
					return;
				}
				if (parseInt($investMoney) % parseInt($equityMoney) != 0) {
					ymPrompt.errorInfo('您出资的金额只能以最低出资金额 ' + $equityMoney + '增加！',
							400, 200, '提示', function() {
							});
					return;
				}
				if (parseInt($investMoney) > parseInt($remoney)) {
					ymPrompt.errorInfo('该店铺融资已满,请选择其它店铺投资！！', 400, 200,'失败', null);
					return;
				}
				$.ajax({
							url : '/project/investProject',
							type : 'post',
							data : {
								pId : $pbaseId,
								investMoney : $investMoney
							},
							success : function(data) {
								if(data=="member/central.htm") {		
									window.open(data);
								}else{
								}
							}

						});

			});

	// 预热投资
	$("#investyr").click(
			
			function() {
				
				var $userId = $("#user_id").val();
				var $equityMoney = $("#equityMoney").val(); //
				var $prouserId = $("#prouser_id").val();
				var $pbaseId = $("#pbaseId").val();
				var $investMoney = $("#investMoney").val();
				var $remoney=$("#remoney").val();	//当前登录用户的余额
				var $cardStatus=$("#cardStatus").val();		//实名认证
				var $phonePass=$("#phonePass").val();		//手机认证
				var $pMerBillNo=$("#pMerBillNo").val();		//宝付注册
				
				if ($userId == "") {
					ymPrompt.errorInfo('您还未登录,请先登录在执行此操作!', 400, 200, '提示',
							function() {
								window.location.href = "visitor/to-login";
							});
					return;
				}
				if ($prouserId == $userId) {
					ymPrompt.errorInfo('您不能投自己的项目!', 400, 200, '提示',
							function() {
							});
					return;
				}
				if ($investMoney == "") {
					ymPrompt.errorInfo('请输入出资金额!', 400, 200, '提示', function() {
					});
					return;
				}
				if (isNaN($investMoney)) {
					ymPrompt.errorInfo('输入含非法字符!', 400, 200, '提示', function() {
					});
					return;
				}
				if (parseInt($investMoney) < parseInt($equityMoney)) {
					ymPrompt.errorInfo('您预热出资的单笔不能低于 ' + $equityMoney + '!',
							400, 200, '提示', function() {
							});
					return;
				}
				if (parseInt($investMoney) % parseInt($equityMoney) != 0) {
					ymPrompt.errorInfo('您出资的金额只能以整数 ' + $equityMoney + '增加！',
							400, 200, '提示', function() {
							});
					return;
				}
				if (parseInt($investMoney) > parseInt($remoney)) {
					ymPrompt.errorInfo('该店铺融资已满,请选择其它店铺投资！', 400, 200,'失败', null);
					return;
				}

				$.ajax({
					url : '/project/investyure',
					type : 'post',
					data : {
						pId : $pbaseId,
						investMoney : $investMoney
					},
					success : function(data) {
						if (data == '2') {
							ymPrompt.succeedInfo('预热投资成功！', 400, 200, '成功',
									function() {
										location.reload();
										$("#investMoney").val("");
									});
						}
						
						
						else if (data == '1') {
							ymPrompt.errorInfo('您的余额不足,请充值！', 400, 200, '失败',
									null);
						}

							ymPrompt.succeedInfo('预热投资成功！', 400, 200, '成功',function() {
							location.reload();$("#investMoney").val("");
					});
						} 

				});

			});

	var $userId = $("#user_id").val();
	if($userId !=""){
		$.ajax({
			url:'project/getCashBalance.htm',
			type:'post',
			data:'userId='+$userId,
			success : function(data) {
				$("#userMoney").html(data);
			}
		})
	}
	
	
	// 关注
	$("#p_attention").click(function() {
		var $pbaseId = $("#pbaseId").val();
		var $userId = $("#user_id").val();
		var $projectid = $("#prouser_id").val();
		var $success = $("#success").val();
		if ($userId == "") {
			ymPrompt.errorInfo('您还未登录,请先登录在执行此操作!', 400, 200, '提示', function() {
				window.location.href = "http://hc9.com/visitor/to-login";
			});
			return;
		}
		if ($projectid == $userId) {
			ymPrompt.errorInfo('您不能关注自己的店铺!', 400, 200, '提示', function() {
			});
			return;
		}

		$.ajax({
			url : '/project/attentionProject',
			type : 'post',
			data : {
				pId : $pbaseId,
				success : $success
			},
			success : function(data) {
				if (data == '1') {
					ymPrompt.succeedInfo('关注成功！', 226, 150, '成功', function(){location.reload();});
					
				} else if (data == '2') {
					ymPrompt.errorInfo('店铺已关注！', 226, 150, '失败', null);
				} else {
					ymPrompt.errorInfo('关注失败！', 226, 150, '失败', null);
				}

			}

		});

	});

	// 取消关注
	$("#p_attention2").click(function() {

		var $pbaseId = $("#pbaseId").val();
		var $userId = $("#user_id").val();
		if ($userId == "") {
			ymPrompt.errorInfo('您还未登录,请先登录在执行此操作!', 400, 200, '提示', function() {
				window.location.href = "http://hc9.com/visitor/to-login";
			});
			return;
		}

		$.ajax({
			url : '/project/attentionProject2',
			type : 'post',
			data : {
				pId : $pbaseId
			},
			success : function(data) {
				if (data == '1') {
					ymPrompt.succeedInfo('取消关注失败！', 226, 150, '失败', null);
				} else if (data == '0') {
					ymPrompt.succeedInfo('取消关注成功！', 226, 150, '成功', null);
					location.reload();
				} else {
					ymPrompt.errorInfo('取消失败！', 226, 150, '失败', null);
				}

			}

		});

	});

	// 约谈
	$('#talkp').click(function() {

		var $userId = $("#user_id").val();
		var $projectid = $("#prouser_id").val();
		if ($userId == "") {
			ymPrompt.errorInfo('您还未登录,请先登录在执行此操作!', 400, 200, '提示', function() {
				window.location.href = "http://hc9.com/visitor/to-login";
			});
			return;
		}
		if ($projectid == $userId) {
			ymPrompt.errorInfo('您不能约谈自己的店铺!', 400, 200, '提示', function() {
			});
			return;
		}

		$(".mtck.talk_dialog #tkpr").unbind('click');
		$(".mtck.talk_dialog").fadeToggle(300);
		$('.talk_dialog #error').hide();// 错误显示取消
		$('.talk_dialog #error2').hide();// 错误显示取消
		setElementTopLeft($('.talk_dialog .mtck_cont'));// 设置此弹出框的margin-top和margin-left
	});

	$("#cardid1").change(function() {
		var srcc = $("#cardid1").val();
		start = srcc.lastIndexOf(".");
		end = srcc.length;
		ts = srcc.substring(start + 1, end);
		nts = ts.toLowerCase();

		if (srcc.length > 0) {
			if (nts != 'jpg' && nts != 'png' && nts != 'gif' && nts != 'jpeg') {
				document.getElementById("idform1").reset();
				ymPrompt.errorInfo('图片格式错误！', 226, 150, '失败', null);
			} else {
				$("#cardid1").next().removeClass("Vf_P2");
			$("#cardid1").next().addClass("Vf_P1");
				
				
				
				$("#idform1").ajaxSubmit({
					type : 'post',
					url : '/project/uploadcredential',
					success : function(data) {
						
						$("#cardImg").val(data);
						$("#u_card_img").attr("src", data);
					}
				});
			}

		}
	});

	$("#cardid2").change(function() {
		var srcc = $("#cardid2").val();
		start = srcc.lastIndexOf(".");
		end = srcc.length;
		ts = srcc.substring(start + 1, end);
		nts = ts.toLowerCase();
		if (srcc.length > 0) {
			if (nts != 'jpg' && nts != 'png' && nts != 'gif' && nts != 'jpeg') {
				document.getElementById("idform2").reset();
				ymPrompt.errorInfo('图片格式错误！', 226, 150, '失败', null);
			} else {
				
				$("#cardid2").next().removeClass("Vf_P2");
				$("#cardid2").next().addClass("Vf_P1");
				$("#idform2").ajaxSubmit({
					type : 'post',
					url : '/project/uploadcredential',
					success : function(data) {
						$("#cardImg1").val(data);
						$("#u_card_img1").attr("src", data);
					}
				});
			}

		}
	});

	if( $('#ptrade_one').length > 0 && $('#pindustrie2').length > 0 ) {
		redirec();
	}

});

// 约谈
function checktalk() {

	var $talk = $("textarea[name='msg']").val();
	var $msgtoid = $("#msgtoid").attr("checked");
	var $msgtoemail = $("#msgtoemail").attr("checked");
	var $email = $("#msgtoemail").val();
	var $pid = $("#pid").val();
	var $userid = $("#userid").val();

	if ($msgtoid == null && $msgtoemail == null) {

		$('.talk_dialog #error2').show();// 发送选择无
		return false;
	} else {
		$('.talk_dialog #error2').hide();
	}
	if ($talk == "" || $talk == null) {
		$('.talk_dialog #error').show();// 错误显示
		return false;
	}

	$.ajax({
				url : '/project/interview',
				type : 'post',
				data : {
					msg : $("textarea[name='msg']").val(),
					msgtoid : $msgtoid,
					msgtoemail : $msgtoemail,
					pid : $pid,
					userid : $userid,
					email : $email,
				},
				success : function(msg) {
					if (msg == '1') {
						ymPrompt.succeedInfo('约谈成功！', 226, 150, '成功', null);
						window.location.href = "/project/getProjectBaseAll?pId="
								+ $pid;
					} else if (msg == '2') {
						ymPrompt.errorInfo('该店铺已约谈过！', 226, 150, '失败', null);
					} else {
						ymPrompt.errorInfo('约谈失败！', 226, 150, '失败', null);
					}
				}
			});

}

//实名认证
/* 身份证图片url提交 */
function uploadcard() {
	var reg = /^[1-9]{1}[0-9]{16}[0-9(X|x)]{1}$/;
	var rag=/^[u4e00-u9fa5],{0,}$/;
	if ($("#realname").val() == "" || $("#realname").val() == null) {
		
		$("#realname").next().addClass("Vf_P2");
		$("#realname").next().text("用户名不能为空!");
		return false;
	}


	if (!reg.test($("#idCard").val())) {
		
		$("#idCard").next().addClass("Vf_P2");
		$("#idCard").next().text("请输入正确的身份证号!");
		
		return false;
	}

	if ($("#u_card_img").attr("src") == "/resources/img/hcimg/adduser.gif") {
		
		$("#cardid1").next().addClass("Vf_P2");
		$("#cardid1").next().text("请选择身份证附件!");
		return false;
	}
	
	if ($("#u_card_img1").attr("src") == "/resources/img/hcimg/adduser.gif") {

		$("#cardid2").next().addClass("Vf_P2");
		$("#cardid2").next().text("请选择身份证附件!");
		return false;
	}
	

	$.ajax({
		
		url:'/visitor/submitCrad',
        type:'post',
        data:$("#uploadform").serialize(),
		success: function(data) {
			if(data==1){
				ymPrompt.succeedInfo('提交成功！', 226, 150, '成功', function() {
			     window.location.href = "/to-authentication";
	          });
			}else{
				ymPrompt.errorInfo('提交失败,请重新填写！', 226, 150, '失败', null);
			}
		}
		

	});

}



function Comment(){
	var $userId = $("#user_id").val();
	var $contents=$("#contents").val();
	if($userId==""){
		ymPrompt.errorInfo('您还未登录,请先登录在执行此操作!', 400, 200, '提示', function() {
			window.location.href = "http://hc9.com/visitor/to-login";
		});
		return;
	}	
	if($contents==""){
		ymPrompt.errorInfo('评论内容不能为空!', 300, 200, '提示', function() {
		});
		return;
	}
	
	$("#com_form").submit();
}
