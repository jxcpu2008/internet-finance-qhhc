// JavaScript Document
var submit_confirm = false;
$( document ).ready(function(e) {
	
$("#imageOne").change(function(){
		
		$("#projlogo_form").ajaxSubmit({
			url:'/shop/uploadFile',
			type:'post',
			success:function(data){
				$("#imagew").attr("src",data);
			}
		});
		
	});
	
	$("#uploadShop").click(function(){
		var $imagew=$("#imagew").attr('src');
		var $shopId = $("#shopId").val();
		
		if($imagew==""){
			$("#errorImg").html("请选择上传图片！")
			return false;
		}
		$.ajax({
			url:'/shop/uploadShopImg.htm',
			type:'post',
			data:{imagew:$imagew,shopId:$shopId},
			success:function(data){
				$(".maskBox").attr("src",data);
				$("#projlogo_form .btn_tk2").click(); 
			}
		});
		
		
	});
	
	
	var loading = function(){
		$("#loadingdiv").ajaxStart(function(){
				 $(this).show();
				 setElementTopLeft($('#loadingdiv div.mtck_cont'));//设置此弹出框的margin-top和margin-left
		}).ajaxStop(function(){
			   $(this).hide();
		});
	}
	var hideDiolag = function()
	{
		$('form#confirm_form').find('.btn_tk1').unbind('click');
		$( ".mtck" ).fadeOut(300);
	};

	var Dialog = function(msg)
	{
		$('form#confirm_form').find('.btn_tk1').unbind('click');
		$("#msg").html(msg);
		$( ".mtck.dialog" ).fadeIn(300);
		setElementTopLeft($('.dialog div.mtck_cont'));//设置此弹出框的margin-top和margin-left
	}
	//导航切换
	$('#content_nav').find('ul li').click(function(){
			$(this).siblings().removeClass( "press" );
			$(this).addClass('press');
			$('#main_content').find('.left_box').hide();
			$('#main_content').find('.left_box').eq($(this).index()).show();
		});
	//创始人描上去出现删除和编辑
	$('.tuandui_info ul li:not([class=team_tianjia])').live('mouseenter',function(){
		$(this).find('.td_cover').fadeToggle();
	});$('.tuandui_info ul li:not([class=team_tianjia])').live('mouseleave',function(){
         $(this).find('.td_cover').fadeToggle();
     });
	//叉号的事件
    $('.mtck').find('span a').click(function(){
			$(this).parents('.mtck').fadeToggle();
			$(".video").css("visibility","");//  视频层的显示，因为样式问题  这里是显示出来 显示  在project_editview.js里有相应的隐藏代码
        });
    //取消按钮的事件
    $( ".mtck .tk1 h3 a,.mtck .btn_tk2" ).unbind('click').click( function(){
    	 if($(this).parents( ".mtck" ).fadeToggle(300)){
    		 $(".video").css("visibility","");//  视频层的显示，因为样式问题  这里是显示出来 显示  在project_editview.js里有相应的隐藏代码
        	}
         $('.u_zcBLrfj.u_tb_red').hide();
        return false;
    });
	var pid=$('#pid').val();

	//这个是自定义confirm框的取消事件
	$('.rrt_confirm_dialog').find('#rrt_confirm_false').unbind('click');
		$('.rrt_confirm_dialog').find('#rrt_confirm_false').click(function(){
			$(this).parents('.rrt_confirm_dialog').fadeToggle(300);
		});	
		
		//店铺图片
		$('#imagedialog').click(function(){
	        //if($('#slidesImgs li').length >= 8){
	            //alert('最多添加8张图片,你可以把原来的替换。');
	        //}
			$('.finishupload').hide();
	        $('.mtck.setimage_dialog .btn_tk1').unbind('click');
			$( ".mtck.setimage_dialog" ).fadeToggle(300);
			$('.setimage_dialog #error').hide();//错误显示取消
			setElementTopLeft($('.setimage_dialog .mtck_cont'));//设置此弹出框的margin-top和margin-left
		});
	
	//修改项目背景大图
	$('#editbigplogo').click(function(){
		$( ".mtck.setbiglogo_dialog .btn_tk1").unbind('click');
        $( ".mtck.setbiglogo_dialog" ).fadeToggle(300);
		$('.setbiglogo_dialog #error').hide();//错误显示取消
		setElementTopLeft($('.setbiglogo_dialog .mtck_cont'));//设置此弹出框的margin-top和margin-left
	});

	//大图上传
	$('#attach_biglogo').uploadFile({'path':'images/project/logo','field':'attach_biglogo',resize:[0],'types':'png|jpg|gif|jpeg'},function(status,data){
			if(status == 1 )
			{
				$('img.projectbiglogo').attr('src',data);
				$('#biglogo').val(data);
				var logospan='<span style="float:left; ">'+reverseSubString(basename(data))+'</span><span style="float:left; margin-left:10px;"><img src="/s/images/publish/xxd_r2_c2.gif" alt="删除" class="delete_bjgplogo"></span>';
				$('.pbiglogosrcspan').html(logospan);
			}
	});
	//提交
	$('form#projbiglogo_form').submit(function(){
			flag = check($(this));
			if(flag)
			{	
				loading();
				var url  = rooturl+'index.php?_c=publish&_a=AjaxSetLogo';
				var data = {
						'pblogo':$("input[name='pblogo']").val(),
						'pid':pid,
						'ran' :parseInt(Math.random()*1000)
				};
				$.post(url,data,function(res){
					if(res.status=='1')
					{	
						$( ".mtck.setbiglogo_dialog" ).fadeToggle(300);
						$('.content-hsl').css({"background":"url("+data.pblogo+") no-repeat","background-position": "50% 0px","padding-top":"325px"});
						//$("input[name='pblogo']").val('');
					}
					else{Dialog(res.info);}	
				},'json');
			}
			return false;
	});		
	
	
	
	//修改logo图片
	$('#editplogo').click(function(){
        $( ".mtck.setlogo_dialog .btn_tk1").unbind('click');
        $( ".mtck.setlogo_dialog" ).fadeToggle(300);
		$('.setlogo_dialog #error').hide();//错误显示取消
		setElementTopLeft($('.setlogo_dialog .mtck_cont'));//设置此弹出框的margin-top和margin-left
		setElementTopLeft($('.setlogo_dialog .rrt_img_resize'));//设置此弹出框的margin-top和margin-left
		
	});

	//提交
	$('form#projlogo_form').submit(function(){
			flag = check($(this));
			if(flag)
			{	
				loading();
				var url  = rooturl+'index.php?_c=publish&_a=AjaxSetLogo';
				var data = {
						'plogo':$("input[name='plogo']").val(),
						'pid':pid,
						'ran' :parseInt(Math.random()*1000)
				};
				$.post(url,data,function(res){
					if(res.status=='1')
					{	
						$( ".mtck.setlogo_dialog" ).fadeToggle(300);
						//$("input[name='plogo']").val('');
					}
					else{Dialog(res.info);}	
				},'json');
			}
			return false;
	});

	//修改项目基本信息	 
	$('.setinfo').live('click',function(){
		$(".setinfo_dialog").fadeToggle(300);
		$( ".mtck.setinfo_dialog .btn_tk1").unbind('click');
		$('.setinfo_dialog #error').hide();//错误显示取消
		setElementTopLeft($('.setinfo_dialog .mtck_cont'));//设置此弹出框的margin-top和margin-left
    }); 
	
		$('form#setinfo_form').submit(function(){
			flag = true;
			var $province = $("#loc_province option:selected").text(); // 省
   			var $city = $("#loc_city option:selected").text(); // 市
			var $street = $("#loc_town option:selected").text(); // 县
			$("#loc_province option:selected").val($province);    
			$("#loc_city option:selected").val($city);
			$("#loc_town option:selected").val($street);
            if(!shopNameBlur()){   // 调用项目名称校验
            	flag = false;
            }
            if(!introductBlur())    // 调用一句话介绍校验
            {
         	   	flag = false;
            }
            if(!locationBlur())     // 调用所在地校验
            {
            	flag = false;
            }
            if(!pshopNumBlur())     // 调用目前开店数量校验
            {
            	flag = false;
            }
            if(!pindustrieBlur()){   // 调用行业校验 
            	flag = false
            }
            var $street = $("#street").val();
            if($street=='街道地址'){
            	$street = '';
            }
			if(flag)
			{	
				loading();
				var url  = '/shop/prethebasicinformodify';
				var data =$("#setinfo_form").serialize();
				
				$.post(url,data,function(res){
					if(res==1)
					{				
						Dialog('修改成功');
						$('.dialog').find('.winclose').unbind('click');
						$('.dialog').find('.winclose').click(function(){
							window.location.reload();
						});
						$(".setinfo_dialog").fadeToggle(300);
					}
					else{Dialog(res.info);}	
				},'text');
			}
			return false;
	});

/* 修改项目融资需求 */
	$('#preqire').click(function(){
		$( ".mtck.setreqire_dialog .btn_tk1").unbind('click');
		$( ".mtck.setreqire_dialog" ).fadeToggle(300);
		$('.setreqire_dialog #error').hide();//错误显示取消
		setElementTopLeft($('.setreqire_dialog .mtck_cont'));//设置此弹出框的margin-top和margin-left

	});
	//计算融资金额
		   $('#fp,#totalF,#ip').blur(function(){
					var fp=$('#fp').val();
					var toltal=$('#totalF').val();
					if(toltal>0&&fp>0){
						$('#fpr').val((fp/toltal*100));
						$('#ip').val(toltal-fp);
						$('#ip').val($('#ip').val().toString()+'.00');
						$('#ipr').val(((toltal-fp)/toltal*100));
					}
				});
	
	/*修改奖励模式*/	
	$('.editexpenditure').click(function(){
		$( ".mtck.setreqireexpenditure_dialog .btn_tk1").unbind('click');
		$( ".mtck.setreqireexpenditure_dialog" ).fadeToggle(300);
		$('.setreqireexpenditure_dialog #error').hide();//错误显示取消
		setElementTopLeft($('.setreqireexpenditure_dialog .mtck_cont'));//设置此弹出框的margin-top和margin-left
	});

	//计算项目方出资比例
	$('#founder_pay_one').blur(function(){
		if(checkIsNum($("#founder_pay_one"))){
			calcRaiseFunds();
		}
	});
	// 项目方收益比例
	$('#self_rate').blur(function(){
		checkIsNum($("#self_rate"));
	});
	
	//提交
	$('form#reqireexpenditure_form').submit(function(){
		flag = true;
		if($("#shopType").val()=="1") {  // 如果不为抽奖店铺
			if(!checkIsNum($("#founder_pay_one"))){     // 项目方出资是否为数字
				flag = false;
			}
			if(!checkIsNum($("#self_rate"))){		// 项目方收益比例
				flag = false;
			}
		}
		if(!checkIsNum($("#shopRoMoney"))){		// 支持金额
			flag = false;
		}
		if(!remarkBlur()){   // 奖励、股权内容
			flag = false;
		}
		if($("#shopRoType").val()=="1"){   // 如果修改奖励
			if(!checkIsNum($("#rewardCount"))){			// 奖励人数
				flag = false;
			}
			if(!checkIsNum($("#shopRoDay"))){			// 店铺开业后天数
				flag = false;
			}
		}else{
			if(!checkIsNum($("#stockMoney"))){			// 股权金额
				flag = false;
			}
		}
		if(flag)
		{	
			var $shopRoId=$("#shopRoId").val();
			$.ajax({
				url: '/shop/editContribution?shopRoId='+$shopRoId,
				type: 'POST',
				data: $('#reqireexpenditure_form').serialize(),
				success:function(res){
					if(res=='1')
						{	
							Dialog('修改成功');
							$('.dialog').find('.winclose').unbind('click');
							$('.dialog').find('.winclose').click(function(){
								window.location.reload();								
							});
							$( ".setreqireexpenditure_dialog" ).fadeToggle(300);
						} else {
							Dialog(res.info);
						}
				}
			})
		}
			return false;
	});
	/* 修改项目视频 */
	$('#setvideos').click(function(){
		$( ".mtck.setvideos_dialog .btn_tk1").unbind('click');
		$( ".mtck.setvideos_dialog" ).fadeToggle(300);
		$('.setvideos_dialog #error').hide();//错误显示取消
		var videodiv=$('#videoorder').val();
		$("textarea[name='videos']").val($('#video'+videodiv).find('div').html().trim());
		setElementTopLeft($('.setvideos_dialog .mtck_cont'));//设置此弹出框的margin-top和margin-left

	});
	//视频切换的标签
	$('#videoTab dl dt').each(function(){
							$(this).click(function(){
								for(var i=0;i<7;i++){
									if($(this).index()==i){
										$('#videoorder').val(i+1);
										$('#video'+(i+1)).show();
										if($(this).attr('class')=='hover')
											$(this).attr('default','1');
										$(this).removeClass('hover').addClass('current');
										$(this).siblings().each(function(){
											if($(this).attr('default')=='1')
												$(this).addClass('hover');
											$(this).removeClass('current');
										});
									} 
									else
										$('#video'+(i+1)).hide();
								}
							});
						});
	//视频提交
	$('form#videos_form').submit(function(){
			flag = true;
			var videoshtml=$("textarea[name='videos']").val();
			if(videoshtml.toLowerCase().indexOf('embed')<0)
			{
                $(this).parents('div').find('#error').html("只能是html代码的视频格式");
                $(this).parents('div').find('#error').show();
                flag = false;
			}
			if(flag)
			{	
				loading();
				var url  = '/shop/uploadvideoFile';
				var data = {
						'videos':$("textarea[name='videos']").val(),
						'pId':pid
				};
				$.post(url,data,function(res){
					
					if(res=='1')
					{	
						$( ".mtck.setvideos_dialog" ).fadeToggle(300);
					    window.location.reload();
					}
					else{
							ymPrompt.info('添加失败！', 226, 150, '成功', null);
						}	
				},'json');
			}
			return false;
	});

	
	//修改投资人采访视频
	$('#edittzrvideo').click(function(){
		$( ".mtck.setvideos_dialog .btn_tk1").unbind('click');
		$( ".mtck.setvideos_dialog" ).fadeToggle(300);
		$('.setvideos_dialog #error').hide();//错误显示取消
		var videodiv=$('#videoorder').val(9);
		$("textarea[name='videos']").val($('.edittzrvideodiv').html().trim());
		setElementTopLeft($('.setvideos_dialog .mtck_cont'));//设置此弹出框的margin-top和margin-left
	});
	/* 修改店铺简介 */
	$('#setintro').click(function(){
		$("#projvideos").hide();
		$( ".mtck.setintro_dialog .btn_tk1").unbind('click');
		$( ".mtck.setintro_dialog" ).fadeToggle(300);
		$('.setintro_dialog #error').hide();//错误显示取消
		setElementTopLeft($('.setintro_dialog .mtck_cont'));//设置此弹出框的margin-top和margin-left
	});

	$('form#intro_form').submit(function(){
			flag = true;
			var $shopDesc = $("textarea[name='shopDescription']").val().trim();
			if($shopDesc=='' || $shopDesc==null){
				$("textarea[name='shopDescription']").parent().next().show();
				flag = false;
			}
			if(flag)
			{			
				loading();
				var url  ="shop/changepDescription";
				var data = {
						'shopDescription':$shopDesc,
						'pid':pid
				};
				$.post(url,data,function(res){
					$( ".articl_content").find('p').html(res);
					$( ".mtck.setintro_dialog" ).fadeToggle(300);
				},'text');
			}
			return false;
	});					 

	
	
	 /* 删除项目队员 */
    $('.delteam').live('click',function(){
        //if(!confirm('您确定要删除吗？')){
           // return;
        //}
        var parentLi = $(this).parents('li');
        var url  = rooturl+'index.php?_c=publish&_a=AjaxDelTeam';
        var data = {
            'team_id':$(this).attr('id'),
            'type':$(this).attr('type'),
            'pid':pid,
            'ran' :parseInt(Math.random()*1000)
        };

		//Dialog('<span style="text-align:center;font-size:20px;">您确定要删除吗？</span>');
        rrt.self_confirm('<span style="text-align:center;font-size:20px;">您确定要删除吗？</span>');
        $('form#confirm_form').find('#rrt_confirm_true').unbind('click');

		$('#rrt_confirm_true').click(function(){
			 loading();
			 $.post(url,data,function(res){
				if(res.status=='1')
				{
					hideDiolag();
					parentLi.fadeIn().remove();
				}
			 },'json');
		 });
    });
	//编辑创始人
	$('.eteam').live('click',function(){
       
        $( ".mtck.eteam_dialog .btn_tk1").unbind('click');
        $( ".mtck.eteam_dialog" ).fadeToggle(300);
		$('.eteam_dialog #error').hide();//错误显示取消
		setElementTopLeft($('.eteam_dialog .mtck_cont'));//设置此弹出框的margin-top和margin-left
    });

//编辑创始人
	$("#yubtn").click(function(){
		var flag = true;
		if(!realNameBlur()){    // 调用真实姓名校验
			return false;
		}
		if(!emailBlur()){     // 调用邮箱校验
			return false;
		}
		if(!imgPathBlur()){    // 调用头像校验
			return false;
		}
		if(!introduceBlur()){	// 调用个人介绍校验
			return false;
		}
		$.ajax({
			url : '/shop/preweditfouinfor',
			type : 'post',
			data : {
				'real_name':$('#eteam_form').find('input[name=real_name]').val(),
                'email':$('#eteam_form').find('input[name=email]').val(),
                'img_path':$('#eteam_form').find('input[name=img_path_edit]').val(),
                'introduce':$('#eteam_form').find('textarea[name=introduce]').val(),        
				'proid':$("#pid").val()
			},success : function(res) {
				if(res=="1"){
					window.location.href = "/shop/paymentThawedShop.htm?shopId="
						+ $("#pid").val();
					$(".mtck.eteam_dialog" ).fadeToggle(300);
				}
			}
		});	
	});


$("#yupic").change(function() {

	var srcc = $("#yupic").val();
	start = srcc.lastIndexOf(".");
	end = srcc.length;
	ts = srcc.substring(start + 1, end);
	nts = ts.toLowerCase();
	if (srcc.length > 0) {
		if (nts != 'jpg' && nts != 'png' && nts != 'gif' && nts != 'jpeg') {
			document.getElementById("formyupic").reset();
			ymPrompt.errorInfo('图片格式错误！', 226, 150, '失败', null);
		} else {
			$("#formyupic").ajaxSubmit({
				type : 'post',
				url : '/shop/uploadFile',
				success : function(data) {
					$('#img_path_view').attr('src', data);
					$('#img_path_edit').val(data);

				}
			});
		}

	}
});

	//添加成员
	$('.cteam').click(function(){
        $( ".mtck.cteam_dialog .btn_tk1").unbind('click');
        $( ".mtck.cteam_dialog" ).fadeToggle(300);
        $('input[name=type]').val($(this).attr('class'));
        clear_team_conent();
		$('.finishupload').hide();
		$('#img_path_add_view').attr('src','/s/images/none.jpg');
		$('.cteam_dialog #error').hide();//错误显示取消
		setElementTopLeft($('.cteam_dialog .mtck_cont'));//设置此弹出框的margin-top和margin-left

    });
				 
	/* 修改项目优势 */
	$('.padvantage').click(function(){
		$( ".mtck.setpadvantage_dialog .btn_tk1").unbind('click');
		$( ".mtck.setpadvantage_dialog" ).fadeToggle(300);
		$('.setpadvantage_dialog #error').hide();//错误显示取消
		setElementTopLeft($('.setpadvantage_dialog .mtck_cont'));//设置此弹出框的margin-top和margin-left

	});

	$('form#padvantage_form').submit(function(){
			
			flag = check($(this));
			if(flag)
			{	
				loading();
				var url  = "project/changeppadvantage";
				var data = {
						'padvantage':$("textarea[name='padvantage']").val(),
						'pid':pid
						//'ran' :parseInt(Math.random()*1000)
				};
				
				$.post(url,data,function(res){
					if(res!=null&&res!=null)
					{	
						$('.padvantage').parents('.youshi').find('.youshi_info').html(res);
						$( ".mtck.setpadvantage_dialog" ).fadeToggle(300);
					}
					else{Dialog(res.info);}	
				},'json');
			}
			return false;
	});
			//s删除项目优势
	$('#delete_padvantage').click(function(){
			Dialog('<span style="text-align:center;font-size:20px;">您确定要删除吗？</span>');
			$('form#confirm_form').find('.btn_tk1').click(function(){
				var url  = rooturl+'index.php?_c=publish&_a=AjaxSetInfo';
				var data = {
						'padvantage':' ',
						'pid':pid,
						'ran' :parseInt(Math.random()*1000)
				};
				loading();
				$.post(url,data,function(res){
					if(res.status=='1')
					{	
						hideDiolag();
						$("textarea[name='padvantage']").val();
						$('.padvantage').parents('.youshi').find('.youshi_info').html('');
					}
					else{Dialog(res.info);}	
				},'json');
			});
		});
	//修改创始人寄语
	$('#set_csrsendword').click(function(){
		$( ".mtck.setcsrsendword_dialog .btn_tk1").unbind('click');
		$( ".mtck.setcsrsendword_dialog" ).fadeToggle(300);
		$('.setcsrsendword_dialog #error').hide();//错误显示取消
		setElementTopLeft($('.setcsrsendword_dialog .mtck_cont'));//设置此弹出框的margin-top和margin-left

	});
	$('form#csrsendword_form').submit(function(){
			flag = true;
			var $crewords = $("textarea[name='crewords']").val().trim();
			if($crewords=='' || $crewords==null){
				$("textarea[name='crewords']").parent().next().show();
				flag = false;
			}
			if(flag)
			{	
				loading();
				var url  = "shop/changepCrewords";
				var data = {
						'crewords':$crewords,
						'pid':pid
				};
				$.post(url,data,function(res){
					$('#set_csrsendword').parents('.jiyu').find('p').html(res);
					$( ".mtck.setcsrsendword_dialog" ).fadeToggle(300);
				},'text');
			}
			return false;
	});						 
	
	
		//修改团队介绍
		$('#set_cteampresent').click(function(){
			$( ".mtck.setcteampresent_dialog .btn_tk1").unbind('click');
			$( ".mtck.setcteampresent_dialog" ).fadeToggle(300);
			$('.setcteampresent_dialog #error').hide();//错误显示取消
			setElementTopLeft($('.setcteampresent_dialog .mtck_cont'));//设置此弹出框的margin-top和margin-left
		});
		$('form#cteampresent_form').submit(function(){
			flag =true;
			var $teamProfiles = $("textarea[name='teamProfiles']").val().trim();
			if($teamProfiles=='' || $teamProfiles==null){
				$("textarea[name='teamProfiles']").parent().next().show();
				flag = false;
			}
			if(flag)
			{	
				loading();
				var url  = "shop/changepcteampresent";
				var data = {
						'teamProfiles':$teamProfiles,
						'pid':pid
				};
				$.post(url,data,function(res){
					$('#set_cteampresent').parents('.td_jianjie').find('p').html(res);
					$( ".mtck.setcteampresent_dialog" ).fadeToggle(300);
				},'text');
			}
			return false;
	});		
	
	
	//一堆证件的上传和修改
	$('#zhengjian').click(function(){
			$( ".mtck.company_dialog  .btn_tk1").unbind('click');
			$( ".mtck.company_dialog" ).fadeToggle(300);
			//$('.company_dialog').find('mtck_cont').css('margin-top','-300');
			$('.company_dialog #error').hide();//错误显示取消
			setElementTopLeft($('.company_dialog .mtck_cont'));//设置此弹出框的margin-top和margin-left
		});						 
	
		
   //一大堆证件照片结束	
	$("#savepic").click(function() {
				var $facard = $("#img1").val();
				var $yyzz = $("#img2").val();
				var $swdj = $("#img3").val();
				var $zzjg = $("#img4").val();
				var $company = $("#img5").val();
				var $cdzl = $("#img6").val();
				var $wsxk = $("#img7").val();
				var $shopId = $("#shopId").val();
				var $shopFileId = $("#shopFileId").val();

				if ($facard == "" || $facard == null) {
					$("#dbform").next().removeClass("Vf_P1");
					$("#dbform").next().addClass("Vf_P2");
					return;
				}
				if ($yyzz == "" || $yyzz == null) {
					$("#yyzzform").next().removeClass("Vf_P1");
					$("#yyzzform").next().addClass("Vf_P2");
					return;
				}
				if ($swdj == "" || $swdj == null) {
					$("#swdjform").next().removeClass("Vf_P1");
					$("#swdjform").next().addClass("Vf_P2");
					return;
				}
				if ($zzjg == "" || $zzjg == null) {
					$("#zzjgform").next().removeClass("Vf_P1");
					$("#zzjgform").next().addClass("Vf_P2");
					return;
				}
				$.ajax({
					url : '/shop/saveShopFile.htm',
					type : 'post',
					data : {
						facardimg : $facard,
						yyzz : $yyzz,
						swdj : $swdj,
						zzjg : $zzjg,
						company : $company,
						cdzl : $cdzl,
						wsxk : $wsxk,
						shopId : $shopId,
						shopFileId : $shopFileId
					},
					success : function() {
						window.location.reload();
					}
				});
				
			});
		
		//修改开店计划
		$('#setpplan').click(function(){
			$( ".mtck.setpplan_dialog  .btn_tk1").unbind('click');
			$( ".mtck.setpplan_dialog" ).fadeToggle(300);
			$('.setpplan_dialog #error').hide();//错误显示取消
			setElementTopLeft($('.setpplan_dialog .mtck_cont'));//设置此弹出框的margin-top和margin-left
			//获取已有值
			var value = $('#sj_contentx01_1 .setpplanp').html();
			$('textarea[name="pplan"]').val(value);

		});

		$('form#pplan_form').submit(function(){
			flag = true;
			var $plan = $("textarea[name='plan']").val().trim();
			if($plan=='' || $plan==null){
				$("textarea[name='plan']").parent().next().show();
				flag = false;
			}
			if(flag)
			{	
				loading();
				var url  = '/shop/modifyPlan';
				var data = {
						'plan':$plan,
						'pid':pid
				};
				$.post(url,data,function(res){
					$('#planhtml').html(data.plan);
					$( ".mtck.setpplan_dialog" ).fadeToggle(300);
				},'text');				
			}
			return false;
	});							 
		//增加常见问题
		$('#addquestions').click(function(){
			$( ".mtck.questions_dialog .btn_tk1").unbind('click');
			$( ".mtck.questions_dialog" ).fadeToggle(300);
			$('#question_answer_count').html(120);
			$('#question_title_count').html(30);
			$('.questions_dialog #error').hide();//错误显示取消
			setElementTopLeft($('.questions_dialog .mtck_cont'));//设置此弹出框的margin-top和margin-left
		});
		$('form#questions_form').submit(function(){
			flag = true;
			var $question_title = $("textarea[name='question_title']").val().trim();
			var $question_answer = $("textarea[name='question_answer']").val().trim();
			if($question_title=='' || $question_title==null){
				$("textarea[name='question_title']").parent().next().show();
				flag = false;
			}else{
				$("textarea[name='question_title']").parent().next().hide();
			}
			if($question_answer=='' || $question_answer==null){
				$("textarea[name='question_answer']").parent().next().show();
				flag = false;
			}else{
				$("textarea[name='question_answer']").parent().next().hide();
			}
			if(flag)
			{	
				loading();
				var url  = "shop/addCommonQuestions";
				var data = {
						'question_title':$question_title,
						'question_answer':$question_answer,
						'pid':pid
				};
				
				$.post(url,data,function(res){
					if(res!=null&&res!="")
					{	
						var questionc ='<dd>问题：'+data.question_title+'<a href="javascript:;"  class="deletequestions"></a><a href="javascript:;" class="editquestions"></a> </dd> <dt>答案： '+data.question_answer+'</dt>';
						if(res)
						{
							$("textarea[name='question_title']").val('');
							$("textarea[name='question_answer']").val('');
							$('.wenti_box').append(questionc);
						}
						$( ".mtck.questions_dialog" ).fadeToggle(300);
					}
					else{Dialog(res.info);}	
				},'json');
			}
			return false;
	});								 
	

		/* 项目上传附件 */
	$('#attach').click(function(){
		$( ".mtck.setattach_dialog .btn_tk1").unbind('click');
		$( ".mtck.setattach_dialog" ).fadeToggle(300);
		$('.setattach_dialog #error').hide();//错误显示取消
		$('.finishupload').hide();
		setElementTopLeft($('.setattach_dialog .mtck_cont'));//设置此弹出框的margin-top和margin-left

	});
	//上传附件
	$('#upattach').uploadFile({'path':'attachment/project',resize:[0],'field':'upattach','types':'doc|docx|ppt|pptx|excel|xlsx|png|jpg|gif|jpeg'},function(status,data){
			if(status == 1 )
			{
				$('#attachment').val(data);
				$('#upattach').parents('dl').find('#error').hide();
			}
	});
	$('form#attach_form').submit(function(){
			
			flag = check($(this));
			if(flag)
			{	
				loading();
				var url  = rooturl+'index.php?_c=publish&_a=AjaxAddAttach';
				var data = {
						'info_title':$("input[name='attachment_title']").val(),
						'attachment':$("input[name='attachment']").val(),
						'pid':pid,
						'ran' :parseInt(Math.random()*1000)
				};
				
				$.post(url,data,function(res){
					if(res.status=='1')
					{	
						$('#widthoutattach').hide();
						var attachmentc='<li><div class="img"><img src="/s/images/investor/Ccie_01.jpg" alt="" /></div> <div class="down_cover"> <a href="/publish/attachdown/id/'+res.data.id+'" ></a></div> <div class="down_del"><span class="delattachment" attid="'+res.data.id+'">删除</span></div> <p><a href="/publish/attachdown/id/'+res.data.id+'">'+res.data.info_title+'</a></p></li>';
						$('.fujian_box').find('ul').prepend(attachmentc);
						$("input[name='attachment_title']").val('');
						$("input[name='attachment']").val('');
						$( ".mtck.setattach_dialog" ).fadeToggle(300);
						$('.zanwufujian').hide();
					}
					else{Dialog(res.info);}	
				},'json');
			}
			return false;
	});
	/* 删除项目附件 */

	$('.delattachment').live('click',function(){
		var parentLi = $(this).parents('li');
		var id=$(this).attr('attid');
		rrt.self_confirm('<span style="text-align:center;font-size:20px;">您确定要删除吗？</span>');
		
		$('form#confirm_form').find('#rrt_confirm_true').unbind('click');
		$('form#confirm_form').find('#rrt_confirm_true').click(function(){	
				var url  = rooturl+'index.php?_c=publish&_a=AjaxDelAttachment';
				var data = {
						'id':id,
						'pid':pid,
						'ran' :parseInt(Math.random()*1000)
				};
				loading();
				$.post(url,data,function(res){
					if(res.status=='1')
					{
						$('.rrt_confirm_dialog').fadeToggle(300);
						parentLi.fadeIn().remove();
					}
					else{$('.rrt_confirm_dialog').fadeToggle(300);
						Dialog(res.info);
					}
				},'json');
		});
	});
	//附件图片描上去出现下载和删除
	$('.fujian_box ul li').live('mouseover',function (){
		//$(this).children('.down_cover').fadeIn(300);
		$(this).children('.down_del').show();												  
	}).live('mouseout',function (){
		//$(this).children('.down_cover').fadeOut(300);
		$(this).children('.down_del').hide();	
	});
	
	//动态切换标签
	$('.dongtai_tabs').find('a').click(function(){
			$(this).addClass('active').siblings().removeClass( "active" );
			$('.rongzi_dongtai').children('div').eq($(this).index()).show().siblings().hide();
		});
 });
var $updateReward = $("#updateReward").html();
var $updateStock = $("#updateStock").html();
 function getRewardOption(id){
	 $.ajax({
		 url:'/shop/getShopRoInfo',
		 data:{
			 id:id
		 },
		 type:'post',
		 dataType:'json',
		 success:function(data){
			 // 判断是修改奖励还是股权
			 $("#shopRoType").val(data.shopRoMap.type);
			// 奖励、股权支持金额
			if(data.shopRoMap.type=="1"){
				$("#updateReward").html($updateReward);
				$("#updateStock").html('');
			}else{
				$("#updateStock").html($updateStock);
				$("#updateReward").html('');
			}
			 $("#shopRoMoney").val(data.shopRoMap.money);
			 $("#shopRoRemark").val(data.shopRoMap.remark);
			 $("#shopRoDay").val(data.shopRoMap.awardTime);
			 $("#stockMoney").val(data.shopRoMap.stockMoney);
			 $("#rewardCount").val(data.shopRoMap.rewardCount);
			 $("#shopRoId").val(data.shopRoMap.id);
			 // 奖励支持金额、股权出资金额
			 $('#shopRoMoney').blur(function(){
				checkIsNum($("#shopRoMoney"));
			 });
			// 奖励、股权内容
			$('#shopRoRemark').blur(function(){
				remarkBlur();
			});
			// 奖励人数
			$('#rewardCount').blur(function(){
				checkIsNum($("#rewardCount"));
			});
			// 股权金额
			$('#stockMoney').blur(function(){
				checkIsNum($("#stockMoney"));
			});
		 }
	 });
 }

function calcRaiseFunds(){
	// 所有奖励编号
	var shopRoIds = document.getElementsByName("shopRoIds");
	// 当前奖励编号
	var shopRoId = $("#shopRoId").val();
	// 奖励金额
	var moneys = document.getElementsByName("money");
	// 奖励人数
	var counts = document.getElementsByName("rewardCount");
	// 股权金额
	var stockMoney = 0;
	if($("#shopType").val()=="1") {   // 如果不为抽奖店铺
		if($("#shopRoType").val()=="2"){   // 如果修改的为股权
			var totals = document.getElementsByName("total");
			stockMoney = totals[1].value;
		}else{
			stockMoney = $("[name=total]").val();
		}
	} else {
		stockMoney = 0;
	}
	var rewardSum = 0;  // 计算奖励总额
	for(var i = 0;i < shopRoIds.length;i++){
		if(shopRoIds[i].value==shopRoId){
			var len = moneys.length-1;
			rewardSum += parseInt(moneys[len].value*counts[len].value);
		}else{
			rewardSum += parseInt(moneys[i].value*counts[i].value);
		}
	}
	// 项目方出资
	var founder_pay_one = $("#founder_pay_one").val();
	if(founder_pay_one==""){
		founder_pay_one = 0;
	}
	//alert("奖励总额："+rewardSum+"股权总额："+stockMoney+"项目方出资金额："+founder_pay_one);
	var isNum = /^\d+(\.\d+)?$/;
	if(!isNum.test(founder_pay_one) || !isNum.test(rewardSum)){   // 判断是否为合法数字
		return;
	}
	// 总额=奖励总额+股权金额+项目方出资金额
	$("#finance_total_one").val(parseInt(rewardSum)+parseInt(stockMoney)+parseInt(founder_pay_one));
	
	var financetotalone=$('#finance_total_one').val();  // 计算项目方出资比例
	if(founder_pay_one>0&&financetotalone>0) {
		$('#founder_pay_rate_one').val(founder_pay_one/financetotalone*100);
	} else {
		$('#founder_pay_rate_one').val(0);
	}
}
	 
 // 草稿页面的编辑店铺封面上传
$("#imagefile").live('change',function() {
		var srcc = $("#imagefile").val();
		start = srcc.lastIndexOf(".");
		end = srcc.length;
		ts = srcc.substring(start + 1, end);
		nts = ts.toLowerCase();
		if (srcc.length > 0) {
			if (nts != 'jpg' && nts != 'png' && nts != 'gif'
					&& nts != 'jpeg') {
				document.getElementById("form1").reset();
				ymPrompt.errorInfo('图片格式错误！', 226, 150, '失败',
						null);
			} else {
				var form = $('#form-upload');
				var oldInput = $("#imagefile");
				var newInput = $(oldInput).clone();
				$(oldInput).attr('id', 'form-upload-file');
				$(oldInput).before(newInput);
				if (form.length == 1) {
					form.find('input[type="file"]').remove();
					$(oldInput).appendTo(form);
				} else {
					form = $('<form method="POST" id="form-upload" enctype="multipart/form-data" style="display:none"></form>');
					$(oldInput).appendTo(form);
					$(form).appendTo('body');
				}
				$("#form-upload").ajaxSubmit(
					{
						type : 'post',
						url : '/shop/uploadFile',
						success : function(data) {
							$("#editImage").attr("src",data);
							$('#upimage').val(data);
							$("#upimage").next().next().hide();
							$("div[name=errorLogo]").css("display", "none");
					}
				});
		}
	}
});   // end

//草稿页面的编辑店铺封面修改
function editPic(){
	var $upimage = $("#upimage").val();
	var $shopId = $("#shopId").val();
	var flag =true;
	if($upimage=='' || $upimage == null) {
		$("#upimage").next().next().show();
		flag = false;
	}
	if(flag){
		$.ajax({
			url : '/shop/editPicture',
			data : {'upimage':$upimage,'shopId':$shopId},
			success : function(res) {
				$("#image_form .btn_tk2").click();   // 关闭编辑窗口
				$("#shopImage").attr("src",res);    // 改变店铺图片
			}
		});
	}
}
// 				begin 编辑团队相关信息
// 真实姓名校验
function realNameBlur(){
	var $real_name = $('#eteam_form').find('input[name=real_name]').val();
	if($real_name == '' || $real_name==null) {
		$('#eteam_form').find('input[name=real_name]').parent().next().show();
		return false;
	}else{
		$('#eteam_form').find('input[name=real_name]').parent().next().hide();
		return true;
	}
}

// 邮箱校验
function emailBlur(){
	var $email = $('#eteam_form').find('input[name=email]').val();
	if($email == '' || $email==null){
		$('#eteam_form').find('input[name=email]').parent().next().show();
		return false;
	}else{
		var reg =  /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((.[a-zA-Z0-9_-]{2,3}){1,2})$/;
		if(!reg.test($email)){
			$('#eteam_form').find('input[name=email]').parent().next().show();
			return false;
		}
		$('#eteam_form').find('input[name=email]').parent().next().hide();
		return true;
	}
}

// 头像校验
function imgPathBlur(){
	var $img_path = $('#eteam_form').find('input[name=img_path_edit]').val();
	if($img_path == '' || $img_path==null){
		$('#eteam_form').find('input[name=img_path_edit]').parent().next().show();
		return false;
	}else{
		$('#eteam_form').find('input[name=img_path_edit]').parent().next().hide();
		return true;
	}
}

// 个人介绍校验
function introduceBlur(){
	var $introduce = $('#eteam_form').find('textarea[name=introduce]').val();
	if($introduce == '' || $introduce==null){
		$('#eteam_form').find('textarea[name=introduce]').parent().next().show();
		return false;
	}else{
		$('#eteam_form').find('textarea[name=introduce]').parent().next().hide();
		return true;
	}
}       
// 			end

// 			begin 编辑基本信息校验
function shopNameBlur(){     // 项目名称校验
	var $shopName = $('#shopName').val().trim();
	if($shopName=="" || $shopName==null){
		$('#shopName').focus();
        $("dd[name='errorPname']").html('此项不能为空！');
        $("dd[name='errorPname']").show();
        return false;
    }else if($shopName.length > 15){
		$('#shopName').focus();
	    $("dd[name='errorPname']").html('请输入15字及内的名称！');
	    $("dd[name='errorPname']").show();
	    return false;
    }else{
	   	$("dd[name='errorPname']").hide();
	   	return true;
    }
}
function introductBlur(){     // 一句话介绍
	var $introduct = $('#introduct').val();
	if($introduct=="" || $introduct==null){
		$('#introduct').focus();
		$("dd[name='errorPoneword']").html('此项不能为空！');
		$("dd[name='errorPoneword']").show();
		return false;
	}else if($introduct.length > 20){
		$('#introduct').focus();
        $("dd[name='errorPoneword']").html('请输入20字及内的介绍！');
        $("dd[name='errorPoneword']").show();
		return false;
	}else{
		$("dd[name='errorPoneword']").hide();
		return true;
	}
}
function locationBlur(){      // 所在地
	var $loc_province = $('#loc_province').val();
	var $loc_city = $('#loc_city').val();
	var $loc_town = $('#loc_town').val();
	if($loc_province==''||$loc_city==''||$loc_town==''
		||$loc_province=='请选择'||$loc_city=='请选择'||$loc_town=='请选择'){
		$("dd[name='errorplace']").html('请选择省、市、区县！');
        $("dd[name='errorplace']").show();
        return false;
	}else{
		$("dd[name='errorplace']").hide();
		return true;
	}
}
function pindustrieBlur(){    // 行业校验
	var $ptrade_one = $("#ptrade_one option:selected").text();
	var $ptrade_two = $("#ptrade_two option:selected").text();
	var $error = $("#ptrade_two").parent().next();
	if($ptrade_one=='' || $ptrade_one==null){
		$error.html('请选择行业！');
		$error.show();
		return false;
    }else if($ptrade_two=='' || $ptrade_two=='请选择'){
		$error.html('请选择行业子项！');
		$error.show();
		return false;
    }else{
    	$error.hide();
    	return true;
    }
}
function pshopNumBlur(){       // 目前开店数
    var reg = /^\d+$/;
	if($('#pshopNum').val()=="" || !reg.test($('#pshopNum').val()))
    {
		$('#pshopNum').focus();
        $("dd[name='errorpshopNum']").html('此项必须由数字组成！');
        $("dd[name='errorpshopNum']").show();
        return false;
    }else{
    	$("dd[name='errorpshopNum']").hide();
    	return true;
    }
}
//          end
function sendWrodChange(wordNum,textareaName, spanName) {    // 创始人寄语字符限定
	document.getElementById(spanName).innerHTML = wordNum - document
			.getElementById(textareaName).value.length;
}
function remarkBlur() {  // 奖励、股权内容
	var $shopRoRemark = $("#shopRoRemark").val();
	$("#shopRoRemark").parent().next().html('内容不能为空！');
	if($shopRoRemark==''){
		$("#shopRoRemark").parent().next().show();
		return false;
	}else{
		$("#shopRoRemark").parent().next().hide();
		return true;
	}
}
function checkIsNum(input){     // 检查是否输入的为数字
	var isNum = /^\d+(\.\d+)?$/;
	if(!isNum.test(input.val())){
		input.parent().next().text('此项必须由数字组成！');
		input.parent().next().show();
		return false;
	}else{
		input.parent().next().hide();
		calcRaiseFunds();
		return true;
	}
}


 

