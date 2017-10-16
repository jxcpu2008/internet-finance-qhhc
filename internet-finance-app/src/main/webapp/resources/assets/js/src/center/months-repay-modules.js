var monthsRepayModule = function() {
	var init = function() {
		$('#monthsRepayModule').on('show.bs.modal', function(e) {
			// e.target;	
			// e.relatedTarget;
		});
		$('#monthsRepayModule').on('hidden.bs.modal', function(e) {
			// e.target;	
			// e.relatedTarget;
		});
	};
	
	return {
		'init': init
	};
} ();