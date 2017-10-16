$(document).ready(
		function() {
			
			var disFn = function disFn(date) {
				var nowMiddle = new Date();
				if (date > nowMiddle) {
					return false;
				}
			};
			
			$("#time-from").omCalendar({
				disabledFn : disFn
			});
			$("#time-to").omCalendar({
				disabledFn : disFn
			});
		});