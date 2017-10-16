$(document).ready(function(){
	
	//用户选择要导出的会员
	var selectIds = [];

	//数据源面板
	$('#identitycard_list').omGrid({
		width:'fit',
		height:340,
        dataSource : '/userinfo/identityauth',
        limit : 10,
        autoFit:true,
        method:'POST',
        showIndex : false,
        emptyMsg:'暂时还没有您想要的数据',
        singleSelect : false,
        onRowClick:function(rowIndex,rowData,event){     	
			if(rowData.id){
				$("#iden_img1").attr("src",rowData.cardone);
				$("#iden_img2").attr("src",rowData.cardtwo);
			
			}
    	},
    	onRowSelect : function(index, data){
			if($.inArray(data.id, selectIds)== -1)
       			selectIds.push(data.id);
		},
		onRowDeselect : function(index, data){
			var i = $.inArray(data.id, selectIds);
			selectIds.splice(i,1);
		},
		//还原过去选中的记录
	    onRefresh : function(nowpage, records){
			var len = selectIds.length;
			var indexs = [];
			for(var i=0; i<len; i++){
			   $.each(records, function(n,item){
				   if(item.id === selectIds[i]){
				      	   indexs.push(n);
				   }
			   });
			}
			$("#identitycard_list").omGrid("setSelections", indexs);
		},
        colModel : [ {header : '序号', name : 'id', width : 50, align : 'center'}, 
                     {header : '用户名', name : 'username', width : 120, align : 'center'}, 
                     {header : '真实姓名', name : 'realname', align : 'center', width : 100}, 
                     {header : '身份证号', name : 'cardId', align : 'center', width : 100},
                     {header : '身份证正面', name : 'cardone', align : 'center', width : 100},
                     {header : '身份证反面', name : 'cardtwo', align : 'center', width : 100},                                   
                     {header : '提交时间', name : 'userSubtimer', align : 'center', width : 100},
                     {header : '审核时间', name : 'manatoverifyuser', align : 'center', width : 100},                                      
                     {header : '审核状态', name : 'cardStatus', align : 'center', width : 50, renderer : function(v, rowData , rowIndex) {   
                    	 if(v==1){
                          	return "待审核";
                          }else if(v==2){
                        	 
                          	return "通过";
                          }else{
                        	  return "未通过";
                          }
                       }},
                     {header : '审核人', name : 'adminame', align : 'center', width : 50}
                     ]
    });
	

	 $("#iden_img1").click(function(){
		
		 	 var $pic=$(this).attr("src");
		 	
			 $.pdialog.open('/userinfo/to_bigpic?pic='+$pic, 'sdffasdfasd', '图片浏览' ,{ width:612,height:400,mask:false,maxable:false,resizable:false});		
		 
	 });
	 $("#iden_img2").click(function(){
		 var $pic=$(this).attr("src");
		 $.pdialog.open('/userinfo/to_bigpic?pic='+$pic, 'update_user_relation', '图片浏览' , { width:612,height:400,mask:false,maxable:false,resizable:false });
		
	 });

	 
	 //通过
	 $("#percardpasstou").click(function(){
		 var ids="";
		 //获取选中行数据
		 var selectedRecords = $('#identitycard_list').omGrid('getSelections',true);
		 //判断用户是否选中数据
		 if(selectedRecords.length>0){
			 alertMsg.confirm("确认修改吗?", {
					okCall: function(){
						for (var i in selectedRecords) 
						{							
							ids +=selectedRecords[i].id+",";
						}
											
						$.ajax({
							url : '/userinfo/percardpasstou',
							data : 'ids=' + ids,
							type : 'post',
							success : function(msg) {	
								
								if(msg=="2"){
									$('#identitycard_list').omGrid('reload');// 刷新当前页
									alertMsg.correct("修改成功！");
								}
								if(msg=="1"){
									alertMsg.info("存在已审核项，请重新选择！");								
								}
											
							}
						});
									
				 		//防止打开链接
				 		event.preventDefault();
					}
				});
		 }else{
			alertMsg.warn("没有选择审核对象"); 
		 }
	 });
	 
	//不通过
	 $("#percarderrortou").click(function(){
		 
		 var ids="";
		 //获取选中行数据
		 var selectedRecords = $('#identitycard_list').omGrid('getSelections',true);
		 //判断用户是否选中数据
		 if(selectedRecords.length>0){
			 alertMsg.confirm("确认修改吗?", {
					okCall: function(){
						for (var i in selectedRecords) 
						{
							ids +=selectedRecords[i].id+",";
						}
						$.ajax({
							url : '/userinfo/percarderrortou',
							data : 'ids=' + ids,
							type : 'post',
							success : function(msg) {
								
								if(msg=="2"){
									$('#identitycard_list').omGrid('reload');// 刷新当前页
									alertMsg.correct("修改成功！");
								}
								if(msg=="1"){
									alertMsg.info("存在已审核项，请重新选择！");								
								}
								
							}
						});
				 		//防止打开链接
				 		event.preventDefault();
					}
				});
		 }else{
			alertMsg.warn("没有选择审核对象"); 
		 }
	 });
		//搜索面板
		$("#identity-search-panel").omPanel({
	    	title : "高级搜索",
	    	collapsible:true,
	    	collapsed:true,
	    	onBeforeCollapse:function(event){
				$('.om-panel-title').omTooltip({
			        html : '可以通过单击，展开高级搜索面板哦'
			    });
			},
			onBeforeExpand:function(event){
				$('.om-panel-title').omTooltip({
			        html : '可以通过单击，收缩高级搜索面板哦'
			    });
			}
	    });
		
		//鼠标悬浮在面板头显示的信息
		$('.om-panel-title').omTooltip({
	        html : '可以通过单击，展开高级搜索面板哦'
	    });
	 //搜索按钮
	 $('#userstatus-button-search').omButton({
		 icons : {left : '/resources/operamasks-ui/themes/default/images/search.png'},width : 70
	 	});
	 
		//审核类型
	 $("#search-cardStatus").omCombo({
     	width : 70,
     	forceSelection:true,
         dataSource : [ {text : '全部', value : ''},
                        {text : '待审核', value : '1'},
                        {text : '审核通过', value : '2'},
                        {text : '审核不通过', value : '3'} ]
     });
	 
	 
	 $("#userstatus-button-search").click(function(){
		 var ajaxbg = $("#background,#progressBar");
		 ajaxbg.show();
		 var url=encodeURI("/userinfo/identityauth?"+$("#searchfrom3").serialize());
		 $('#identitycard_list').omGrid('setData', url);
	 });
	 
	 
});
