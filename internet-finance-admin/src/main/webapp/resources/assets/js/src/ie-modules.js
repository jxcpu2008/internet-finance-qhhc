/* 可视区域小于1200时，ie8正确换行显示 */
var RespondForIE8 = function() {
	var respondView = function() {
		if ($(window).width() < 1024) {
			$('.newspub').css({
				'border-style': 'none',
				'background-color': '#f4f4f4'
			});
			$('.newspub>section:first').css({
				'width': '100%',
				'float': 'none',
				'background-color': '#fff',
				'border': '1px solid #ddd',
				'border-radius': '4px',
				'margin-bottom': '30px'
			});
			$('.newspub>section:last').css({
				'display': 'block',
				'width': '100%',
				'float': 'none',
				'background-color': '#fff',
				'margin': 0,
				'border-radius': '4px'
			});
			$('.profile>div.container>div:first, .profile>div.container>div:last').css({
				'float': 'none',
				'width': '100%'
			}); 
		} else {
			$('.newspub').css({
				'border': '1px solid #ddd',
				'border-radius': '4px',
				'background-color': '#fff'
			});
			$('.newspub>section:first').css({
				'display': 'block',
				'width': '68%',
				'float': 'left',
				'border-style': 'none',
				'margin-bottom': '0'
			});
			$('.newspub>section:last').css({
				'display': 'block',
				'width': '30%',
				'float': 'right',
				'margin': '20px 20px 20px auto'
			});
			$('.profile>div.container>div:first').css({
				'float': 'left',
				'width': '39%'
			}); 
			$('.profile>div.container>div:last').css({
				'float': 'right',
				'width': '55%'
			}); 
		}
	}
	return {
		'respondView': respondView
	};
} ();