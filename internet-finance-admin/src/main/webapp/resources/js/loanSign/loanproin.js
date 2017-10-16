$(document).ready(function(){
	// 数据源面板
	$("#proindusty").omGrid({
		dataSource:"/loanSign/loanprolist",
		title : '项目行业管理',
		height : 336,
		limit : 10,
		colModel : [ {
			header : '项目名',
			name : 'xname',
			width : 25,
			align : 'center'
		},{
			header : '项目所属行业',
			name : 'proindusty',
			width : 70,
			align : 'center'
		}]
	})
});