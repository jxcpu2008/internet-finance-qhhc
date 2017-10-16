$(document).ready(function(){
	 var disFn=	function disFn(date) {
         var nowMiddle = new Date();
         if (date > nowMiddle) {
             return false;
         }
     };
	 //注册时间
	 $("#start-timeState").omCalendar({
		 disabledFn : disFn
	 });
	 $("#end_timeState").omCalendar({
		 disabledFn : disFn
	 });
	 
	 
});
