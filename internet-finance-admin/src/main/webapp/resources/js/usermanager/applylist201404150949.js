$(document).ready(function(){
	 var genderOptions = {
 		    dataSource : [{text:"未提交",value:"0"},{text:"待审核" , value:"1"},{text:"已通过",value:"2"},{text:"未通过",value:"3"}],
 		    editable: false
 		};
	$('#apply_list').omGrid({
		width:'fit',
		height:520,
        dataSource : '/userinfo/apply_page',
        limit : 20,
        title:'申请记录',
        autoFit:true,
        method:'POST',
        singleSelect : false,
        emptyMsg:'暂时还没有数据',
        colModel : [ 
                     {header : '真实姓名', name : 'realname', width : 120, align : 'left'}, 
                     {header : '手机号码', name : 'phone', align : 'left', width : 100}, 
                     {header : '申请金额', name : 'money', align : 'left', width : 100},
                     {header : '申请时间', name : 'time', align : 'left', width : 100},
                    /* {header : '还款方式', name : 'refunway', align : 'left', width : 100},*/
                     
                     {header : '申请用途', name : 'behoof', align : 'left', width : 100,},
                     {header : '申请周期', name : 'borrowmonth', align : 'center', width : 50,},
                     {header : '企业名称', name : 'corporatename', align : 'left', width : 100,},
                     {header : '企业电话', name : 'telphone', align : 'left', width : 100,},
                     {header : '所在城市', name : 'city', align : 'left', width : 100,},
                     {header : '审核状态', name : 'status', align : 'center', width : 50,editor:{type:"omCombo", name:"status" ,options:genderOptions},renderer:genderRenderer},
                     {header : '审核人', name : 'adminuser', align : 'center', width : 100,}
                     ],
         rowDetailsProvider:function(rowData,rowIndex){
        	 var phone="无";
        	 if(!isNaN(rowData.phone)){
        		 phone=rowData.phone;
        	 }
             return '借款人<font color="red"><b>'+rowData.realname+'</b></font>在<font color="red">'
                         +rowData.time.substring(0,10)
                         +'</font>申请金额是<font color="red"><b>'+rowData.money+'</b></font>，联系电话<font color="red">'+phone+'</font>';
         },
         onBeforeEdit:function(rowIndex , rowData){
             
             if(rowData.status>0){
            	 if(rowData.status==1){
            		 alertMsg.info("已同意"+rowData.realname+"申请"+rowData.type+rowData.money+"元");
            	 }else{
            		 alertMsg.info("已拒绝"+rowData.realname+"申请"+rowData.type+rowData.money+"元");
            	 }
            	 return false;
             }
             
         },
         onAfterEdit:function(rowIndex , rowData){
             
        	 if(rowData.status==0){
        		 $("#apply_list").omGrid("saveChanges");
        		 return false;
        	 }
        	 
             var msg="同意"+rowData.realname+"申请"+rowData.type+rowData.money+"元";
             if(rowData.status==2){
            	 msg="不"+msg;
             }
             alertMsg.confirm(msg,{okCall:function(){
            	 ajaxTodo("/userinfo/apply_update?ids="+rowData.id+"&status="+rowData.status+"&remark="+rowData.remark);
			 	 //防止打开链接
			 	 event.preventDefault();
			 	$("#apply_list").omGrid("saveChanges");
            	}
             });
         }

    });
	
	function genderRenderer(value){

       if(1 == value){
            return "<span style='color:#45832B'><b>待审核</b></span>";
        }else if(2 == value){
            return "<span style='color:red'>通过</span>";
        }else if(3==value){
        	return "<span style='color:red'>不通过</span>";        
        }else{
            return "异常";
        }
    }
	
	$("#en_apply").click(function(){
		 var ids="";
		 //获取选中行数据
		 var selectedRecords = $('#apply_list').omGrid('getSelections',true);
		 //判断用户是否选中数据
		 if(selectedRecords.length>0){
			 alertMsg.confirm("是否同意选中的借款申请?", {
					okCall: function(){
						for (var i in selectedRecords) 
						{
							if(selectedRecords[i].status==1){
								ids +=selectedRecords[i].id+",";
							}
							else{
								alertMsg.info("已提交过审核记录，不能重复提交！");
								return false;
							}
						}
						ajaxTodo("/userinfo/update_applys?ids="+ids+"&status=2");
				 		//防止打开链接
				 		event.preventDefault();
					}
				});
		 }else{
			alertMsg.warn("没有选择要同意的借款申请"); 
		 }
	});
	
	$("#dis_apply").click(function(){
		 var ids="";
		 //获取选中行数据
		 var selectedRecords = $('#apply_list').omGrid('getSelections',true);
		 //判断用户是否选中数据
		 if(selectedRecords.length>0){
			 alertMsg.confirm("是否拒绝选中的借款申请?", {
					okCall: function(){
						for (var i in selectedRecords) 
						{
							if(selectedRecords[i].status==1){
								ids +=selectedRecords[i].id+",";
							}
							else{
								alertMsg.info("已提交过审核记录，不能重复提交！");
								return false;
							}
						}
						ajaxTodo("/userinfo/update_applys?ids="+ids+"&status=3");
				 		//防止打开链接
				 		event.preventDefault();
					}
				});
		 }else{
			alertMsg.warn("没有选择要拒绝的借款申请"); 
		 }
	});
	
	
	
	//搜索面板
	$("#search-panel").omPanel({
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
 $('#userapply-button-search').omButton({
	 icons : {left : '/resources/operamasks-ui/themes/default/images/search.png'},width : 70
 	});
 
	//审核类型
 $("#search-status").omCombo({
	width : 70,
	forceSelection:true,
  dataSource : [ {text : '全部', value : ''},
                 {text : '待审核', value : '1'},
                 {text : '审核通过', value : '2'},
                 {text : '审核不通过', value : '3'} ]
});
 
 
 $("#userapply-button-search").click(function(){
	 var ajaxbg = $("#background,#progressBar");
	 ajaxbg.show();
	 var url=encodeURI("/userinfo/apply_page?"+$("#searchfrom").serialize());
	 $('#apply_list').omGrid('setData', url);
 });
	
	
	
	
	
});