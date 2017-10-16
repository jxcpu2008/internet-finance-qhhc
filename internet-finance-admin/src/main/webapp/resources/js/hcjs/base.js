// 设为首页
function setHomepage(){
	if (document.all){
		document.body.style.behavior='url(#default#homepage)';
		  document.body.setHomePage(window.location.href);
	}else if (window.sidebar){
		if(window.netscape){
			try{
				netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
			}catch (e){
				alert( "该操作被浏览器拒绝，如果想启用该功能，请在地址栏内输入 about:config,然后将项 signed.applets.codebase_principal_support 值该为true" );
			}
		}
		var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components. interfaces.nsIPrefBranch);
		prefs.setCharPref('browser.startup.homepage',window.location.href);
	}else{
		alert('您的浏览器不支持自动自动设置首页, 请使用浏览器菜单手动设置!');
	}
}

// 加入收藏
function addFavorite(){
	if (document.all){
		try{
			window.external.addFavorite(window.location.href,document.title);
		}catch(e){
			alert( "加入收藏失败，请使用Ctrl+D进行添加" );
		}
		
	}else if (window.sidebar){
		window.sidebar.addPanel(document.title, window.location.href, "");
	 }else{
		alert( "加入收藏失败，请使用Ctrl+D进行添加" );
	}
}

// 返回首页
$(function(){
	$.scrollUp({
		scrollName: 'scrollUp',
		topDistance: '300',
		topSpeed: 300,
		animation: 'fade',
		animationInSpeed: 200,
		animationOutSpeed: 200,
		scrollText: '',
		activeOverlay: false
	});
});

// 基础函数
var con_id = Array();
function checkFormAll(form) {	
	if(form.allcheck.checked==true){
		con_id.length=0;
	}
	for (var i=1;i<form.elements.length;i++)    {
		 if(form.elements[i].type=="checkbox"){ 
            e=form.elements[i]; 
            e.checked=(form.allcheck.checked)?true:false; 
			if(form.allcheck.checked==true){
				con_id[con_id.length] = e.value;
			}else{
				con_id.length=0;
			}
        } 
	}
}
function checkFormOne(val){
	if(con_id.chec(val)){
		con_id.chec(val);
	}else {
		con_id[con_id.length] = val;
	}
}
function goUrl(url,str){
	if (!str){
		window.location.href = url;	
	}else{
		var id = con_id.join();
		if (id!=""){
			window.location.href = url+con_id.join();
		}
	}
}

function  uploadImg(id){
	window.showModalDialog("/plugins/index.php?q=uploadimg&id="+id, window, "dialogWidth: 400px; dialogHeight: 230px; help: no; scroll: no; status: no");
}
function  uploadAnnex(id){
	window.showModalDialog("/plugins/?q=uploadannex&id="+id, window, "dialogWidth: 400px; dialogHeight: 230px; help: no; scroll: no; status: no");
}

function change_tr(siteid,pid){
	var imgopen_id = document.getElementById("imgopen_"+siteid);
	var imgclose_id = document.getElementById("imgclose_"+siteid);
	if (imgopen_id.style.display==""){ 
		imgopen_id.style.display = "none";
		imgclose_id.style.display = "";
	}
	else{ 
		imgopen_id.style.display = "";
		imgclose_id.style.display = "none";
	}
	var arrAll=document.getElementsByTagName("tr"); //获取所有的tr
	for(i=2;i <arrAll.length-1;i++) {   
		var strId = arrAll[i].id;
		var _strId=strId.split("_"); 
		//alert(strId);
		 if (_strId[1] == siteid){
			if (imgopen_id.style.display=="none"){
				document.getElementById(strId).style.display = "";
			}else{
				document.getElementById(strId).style.display = "none";
			}
			
			cha(_strId[2],imgopen_id.style.display);
		 } 
	}  
}
function cha(siteid,dis){	
	var aa = document.getElementById("ppd_"+siteid);
	if (aa.value==1){
		var imgopen_id = document.getElementById("imgopen_"+siteid);
		var imgclose_id = document.getElementById("imgclose_"+siteid);
		if (dis=="none"){ 
			imgopen_id.style.display = "none";
			imgclose_id.style.display = "";
		}
		else{ 
			imgopen_id.style.display = "";
			imgclose_id.style.display = "none";
		}
		var arrAll=document.getElementsByTagName("tr"); 
		for(j=2;j <arrAll.length-1;j++) {   
			var strId = arrAll[j].id;
			var _strId=strId.split("_"); 
			 if (_strId[1] == siteid){
				if (dis=="none"){
					document.getElementById(strId).style.display = "";
				}else{
					document.getElementById(strId).style.display = "none";
				}
				cha(_strId[2],dis);	
			 }
			 
		}  
	}
}
/*
function check_form(){
	 var frm = document.forms['form1'];
	 var title = frm.elements['name'].value;
	 var nid = frm.elements['nid'].value;
	  var code = frm.elements['code'].value;
	 var errorMsg = '';
	  if (title.length == 0 ) {
		errorMsg += '栏目名称不能为空' + '\n';
	  }
	  if (nid.length == 0 ) {
		errorMsg += '识别ID不能为空' + '\n';
	  }
	   if (code.length == 0 ) {
		errorMsg += '所属模块必须选择' + '\n';
	  }
	  if (errorMsg.length > 0){
		alert(errorMsg); return false;
	  } else{  
		return true;
	}
}
*/
function jump_url(){
	if (document.getElementById('jump_url').style.display == ""){
	document.getElementById('jump_url').style.display = "none";
	}else{
	document.getElementById('jump_url').style.display = "";
	}
}
function fillCheckBox (fill_value, check_box) {

    fill_arr = fill_value.split(',');
    cnt = check_box.length;
    for(i=0;i<cnt;i++) {
        chk = check_box[i];

        if (fill_arr.join().indexOf(chk.value) >= 0) {
            chk.checked = 'true';
        }
    }
}

function change_menu(id,aid){
	var id = document.getElementById(id);
	if (id.style.display=="none"){
		aid.innerHTML = "-";
		id.style.display=""	;
	}else{
		id.style.display="none";
		aid.innerHTML = "+";
	}
}
function change_display(id,aid){
	var id = document.getElementById(id);
	if (aid=='show'){
		id.style.display = ""	;
	}else if (aid=='hide'){
		id.style.display="none"	;
	}else{
		if (id.style.display=="none"){
			id.style.display=""	;
		}else{
			id.style.display="none";
		}
	}
}

//yyyy-MM-dd HH:mm:ss
function change_picktime(date){
		if (date){
		WdatePicker({dateFmt:''+date+''});
		}else{
			WdatePicker();
		}
}	

function change_menu_tab(id){
	var id = "#"+id;
	$(id+" a").click(
		function (){
			$(id+" a").removeClass('current');
			$(this).addClass('current');
			var tab = id+"_tab";
			var menu = id+"_"+$(this).attr('tab');
			$(tab+" > div").hide();
			$(menu).show();
		}
	)
}

function on_submit(path,id){
	$('#type').val(id);
	 $('#form1').action=path;
	 $('#form1').submit();
}
function updateavatar() {
	history.go(0);
}

function E(elementid)
{  
	var obj;
	try
	{
		obj = document.getElementById(elementid);
	}
	catch (err)
	{
		alert(elementid+" NOT Found!","System");
	}
	return obj;
}

function setDisplays(es,s){
	for(var n=0;n<es.length;n++){
		if(E(es[n])){
			E(es[n]).style.display = ((s[n])?"":"none");
		}
	}
}
function setDisplay(e,s){
	if(E(e)){
		E(e).style.display = (s?"":"none");
	}
}
//
//$(function(){
//    jQuery(".bl").each(function(i,m){
//        $(this).parent().css("border-bottom","1px #d6d4d4 solid");
//    })
//});


//滚动插件
(function($){
$.fn.extend({
        Scroll:function(opt,callback){
                //参数初始化
                if(!opt) var opt={};
                var _this=this.eq(0).find("ul:first");
                var        lineH=_this.find("li:first").height(), //获取行高
                        line=opt.line?parseInt(opt.line,10):parseInt(this.height()/lineH,10), //每次滚动的行数，默认为一屏，即父容器高度
                        speed=opt.speed?parseInt(opt.speed,10):500, //卷动速度，数值越大，速度越慢（毫秒）
                        timer=opt.timer?parseInt(opt.timer,10):3000; //滚动的时间间隔（毫秒）
                if(line==0) line=1;
                var upHeight=0-line*lineH;
                //滚动函数
                scrollUpTo = function(){
                	console.log(12);
                        _this.animate({
                                marginTop:upHeight
                        },speed,function(){
                                for(i=1;i<=line;i++){
                                        _this.find("li:first").appendTo(_this);
                                }
                                _this.css({marginTop:0});
                        });
                };
                //鼠标事件绑定
                _this.hover(function(){
                        clearInterval(timerID);
                },function(){
                        timerID=setInterval("scrollUpTo",timer);
                }).mouseout();
        }        
})
})(jQuery);

$(document).ready(function(){
        $("#scrollDiva").Scroll({line:1,speed:2000,timer:2000});
});




	
		$(".notice font").mouseover(function(){
			$('.notice font').removeClass("now");
			$(this).addClass("now");
			
			var likey = $(".notice font").index(this); 
			
			$('.notice_sub').addClass("hide").removeClass("block");
			$(".notice_sub:eq("+likey+")").addClass("block").removeClass("hide");
		});
		
		
		$(".noticetwo2 li").mouseover(function(){
			$('.noticetwo2 li').removeClass("onn");
			$(this).addClass("onn");
			
			var likey = $(".noticetwo2 li").index(this); 
			$('.notice_subtwo2').addClass("hide").removeClass("block");
			$(".notice_subtwo2:eq("+likey+")").addClass("block").removeClass("hide");
		});
