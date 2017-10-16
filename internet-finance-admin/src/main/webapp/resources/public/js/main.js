// JavaScript Document

$(function(){
	if($("[data-quality]").size()){
		$("[data-quality]").each(function(index, element) {
            var $this = $(this);
			var url = $this.attr("data-quality");
			var img=new Image();
			img.onload=function(){
				if($this.is("img")){
					$this.attr("src",url);
				}else{
					$this.css("background-image","url("+url+")");
				}
			}
			img.src=url;
        });
	};
	
	if($(".input-group").size()){
		$(".input-group").find("input[type='text']").focus(function(){
			$(this).parents(".input-group").addClass("focus");
		});
		
		$(".input-group").find("input[type='text']").blur(function(){
			$(this).parents(".input-group").removeClass("focus");
		});
	};
	if($("[class^='checkbox']").size()){
		$("[class^='checkbox']").click(function(){
			$(this).toggleClass("checked");
		});
	};
});