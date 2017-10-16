$(document).ready(function(){
	
	//数据源面板
	$('#loantypemygrid').omGrid({
		width:'300',
		height:400,
        dataSource : '/loansigntype/querypage',
        limit : 10,
        autoFit:true,
        method:'POST',
        emptyMsg:'暂时还没有您想要的数据',
        singleSelect : false,
        colModel : [ {header : '序号', name : 'id', width : 40, align : 'center'}, 
                     {header : '项目类型key', name : 'typeKey', width : 80, align : 'center'}, 
                     {header : '项目类型名称', name : 'typeName', width : 80, align : 'center'}, 
                     {header : '添加时间', name : 'typeTime', width : 80, align : 'center'}, 
                     {header : '添加Id', name : 'typeValue', width : 80, align : 'center'}
                     ]
    });
	
	 //查询面板初始化
	 $("#search-lstype-panel").omPanel({
    	title : "高级搜索",collapsible:true,
    	width:'fit'
    });
	 
	 $('span#button-lstype-search').omButton({
 	    icons : {left : '/resources/operamasks-ui/themes/default/images/search.png'},width : 70
	 	});
   $('span#button-lstype-search').click(function(){
 	  $('#loantypemygrid').omGrid('setData', '/loansigntype/querypage?'+$("#searchlotypefrom").serialize());

   });
   /**
	 * 编辑标
	 */
	$("#editloansigntype").click(function(){
		//取到选中记录
		var selections=$('#loantypemygrid').omGrid('getSelections',true);
		//判断是否选中
		if(selections==null || selections=="" || selections==undefined || selections.length!=1){
			alertMsg.info("请选择一条信息！");
		}else{
			$.pdialog.open('/loansigntype/seeDetails?id='+selections[0].id,
					'addExamine', '项目类型', {
						width : 450,
						height : 180
					});
		}
	});
   

    
    $("#deleteone").click(function(){
    	 var selections=$('#loantypemygrid').omGrid('getSelections',true);
         if (selections.length ==0) {
         	alertMsg.info("请选择一条或多条信息！");
             return false;
         }
         var ids='';
         for (var i in selections) 
			{
				ids +=selections[i].id+",";
			}
         $.ajax({
 			data:'ids='+ids,
 			url:'/loansigntype/delete',
 			type:'post',
 			success:function(msg){
 				if(msg){
 					 $('#loantypemygrid').omGrid('reload');//刷新当前页数据
 	                 alertMsg.correct("删除信息成功！");
 				}else{
 					alertMsg.info("删除信息失败！");
 				}
 			}
 		});
    });
});
