$(function() {		   
	function splitstring(str) {
		var path1 = str.split(".");
		var path2 = path1[0].split("//");
		return path2;
	};

	// 访问路径
	var newpathn = document.URL;
	// cookie 上一次访问路径
	var patht = getcookie("key");	
	if (patht == " " || patht == null || splitstring(newpathn)[1] == "www" ) {
		/* alert("Notcookie"); */
		// 默认是深圳sz
		/*alert("默认是全国");*/
		patht = splitstring(newpathn)[1];
		co2(patht);
	} else {	
		/* alert('Tocookie'); */
		// 这个是当document.URL以后改成newpathn
		var docpath = document.URL;
		var path2 = splitstring(patht);	
		docpath = splitstring(docpath);

		if (docpath[1] == path2[1]) {			
			  /*alert('相同,上一次的url');*/
			 co2(path2[1]);
		} else {
			 /*alert('不同，去doc.url肥合'); */
			co2(docpath[1]);
		}
	}
});

function Dsy() {
	this.Items = {};
}
Dsy.prototype.add = function(b, a) {
	this.Items[b] = a;
};
Dsy.prototype.Exists = function(a) {
	if (typeof (this.Items[a]) == "undefined") {
		return false;
	}
	return true;
};

var dsy = new Dsy();
dsy.add("0", [ "北京", "天津", "上海", "重庆", "河北", "河南", "黑龙江", "吉林", "辽宁", "山东",
		"内蒙古", "江苏", "安徽", "山西", "陕西", "甘肃", "浙江", "江西", "湖北", "湖南", "贵州",
		"四川", "云南", "新疆", "宁夏", "青海", "西藏", "广西", "广东", "福建", "海南", "台湾", "香港",
		"澳门", "其他" ]);
dsy.add("0_0", [ "bj|北京" ]);
dsy.add("0_1", [ "tj|天津" ]);
dsy.add("0_2", [ "sh|上海" ]);
dsy.add("0_3", [ "cq|重庆" ]);
dsy.add("0_4", [ "bd|保定", "cangzhou|沧州", "chengde|承德", "dingzhou|定州", "gt|馆陶",
		"hd|邯郸", "hs|衡水", "lf|廊坊", "qhd|秦皇岛", "sjz|石家庄", "ts|唐山", "xt|邢台",
		"zjk|张家口", "zd|正定", "zx|赵县", "zhangbei|张北" ]);
dsy.add("0_5", [ "ay|安阳", "changge|长葛", "hb|鹤壁", "jiaozuo|焦作", "jiyuan|济源",
		"kaifeng|开封", "luoyang|洛阳", "luohe|漯河", "mg|明港", "ny|南阳", "pds|平顶山",
		"puyang|濮阳", "sq|商丘", "smx|三门峡", "xx|新乡", "xc|许昌", "xy|信阳",
		"yuzhou|禹州", "yanling|鄢陵", "zz|郑州", "zk|周口", "zmd|驻马店" ]);
dsy.add("0_6", [ "dq|大庆", "dxal|大兴安岭", "hrb|哈尔滨", "hegang|鹤岗", "heihe|黑河",
		"jms|佳木斯", "jixi|鸡西", "mdj|牡丹江", "qqhr|齐齐哈尔", "qth|七台河", "suihua|绥化",
		"sys|双鸭山", "yich|伊春" ]);
dsy.add("0_7", [ "bc|白城", "baishan|白山", "cc|长春", "jl|吉林", "liaoyuan|辽源",
		"songyuan|松原", "sp|四平", "th|通化", "yanbian|延边" ]);
dsy.add("0_8", [ "as|鞍山", "benxi|本溪", "cy|朝阳", "dl|大连", "dandong|丹东",
		"fushun|抚顺", "fx|阜新", "hld|葫芦岛", "jinzhou|锦州", "liaoyang|辽阳", "pj|盘锦",
		"sy|沈阳", "tl|铁岭", "wfd|瓦房店", "yk|营口" ]);
dsy.add("0_9", [ "bz|滨州", "dz|德州", "dy|东营", "heze|菏泽", "jn|济南", "jining|济宁",
		"kl|垦利", "linyi|临沂", "lc|聊城", "lw|莱芜", "qd|青岛", "rizhao|日照", "ta|泰安",
		"wf|潍坊", "weihai|威海", "yt|烟台", "zb|淄博", "zaozhuang|枣庄", "zhangqiu|章丘",
		"zc|诸城" ]);
dsy.add("0_10", [ "alsm|阿拉善盟", "bt|包头", "bycem|巴彦淖尔盟", "chifeng|赤峰",
		"erds|鄂尔多斯", "hu|呼和浩特", "hlbe|呼伦贝尔", "hlr|海拉尔", "tongliao|通辽",
		"wuhai|乌海", "wlcb|乌兰察布", "xl|锡林郭勒盟", "xam|兴安盟" ]);
dsy.add("0_11", [ "cz|常州", "dafeng|大丰", "ha|淮安", "lyg|连云港", "nj|南京", "nt|南通",
		"su|苏州", "shuyang|沭阳", "suqian|宿迁", "taizhou|泰州", "wx|无锡", "xz|徐州",
		"yz|扬州", "yancheng|盐城", "zj|镇江" ]);
dsy.add("0_12", [ "anqing|安庆", "bengbu|蚌埠", "bozhou|亳州", "ch|巢湖", "chizhou|池州",
		"chuzhou|滁州", "fy|阜阳", "hf|合肥", "hn|淮南", "huaibei|淮北", "huangshan|黄山",
		"hexian|和县", "hq|霍邱", "la|六安", "mas|马鞍山", "suzhou|宿州", "tongling|铜陵",
		"tongcheng|桐城", "wuhu|芜湖", "xuancheng|宣城" ]);
dsy.add("0_13", [ "changzhi|长治", "dt|大同", "jincheng|晋城", "jz|晋中", "lvliang|吕梁",
		"linfen|临汾", "linyixian|临猗", "qingxu|清徐", "shuozhou|朔州", "ty|太原",
		"xinzhou|忻州", "yuncheng|运城", "yq|阳泉" ]);
dsy.add("0_14", [ "ankang|安康", "baoji|宝鸡", "hanzhong|汉中", "sl|商洛", "tc|铜川",
		"wn|渭南", "xa|西安", "xianyang|咸阳", "yanan|延安", "yl|榆林" ]);
dsy.add("0_15", [ "by|白银", "dx|定西", "gn|甘南", "jinchang|金昌", "jyg|嘉峪关", "jq|酒泉",
		"lz|兰州", "linxia|临夏", "ln|陇南", "pl|平凉", "qingyang|庆阳", "tianshui|天水",
		"wuwei|武威", "zhangye|张掖" ]);
dsy.add("0_16", [ "hz|杭州", "huzhou|湖州", "jx|嘉兴", "jh|金华", "lishui|丽水", "nb|宁波",
		"quzhou|衢州", "ruiancity|瑞安", "sx|绍兴", "tz|台州", "wz|温州", "yiwu|义乌",
		"yueqingcity|乐清", "zhoushan|舟山" ]);
dsy.add("0_17", [ "fuzhou|抚州", "ganzhou|赣州", "jj|九江", "ja|吉安", "jdz|景德镇",
		"nc|南昌", "px|萍乡", "sr|上饶", "xinyu|新余", "yingtan|鹰潭", "yichun|宜春",
		"yxx|永新" ]);
dsy.add("0_18", [ "es|恩施", "ez|鄂州", "hshi|黄石", "hg|黄冈", "jingzhou|荆州",
		"jingmen|荆门", "qianjiang|潜江", "shiyan|十堰", "snj|神农架", "suizhou|随州",
		"tm|天门", "wh|武汉", "xf|襄阳", "xiaogan|孝感", "xiantao|仙桃", "xianning|咸宁",
		"yc|宜昌" ]);
dsy.add("0_19", [ "cs|长沙", "changde|常德", "chenzhou|郴州", "hy|衡阳", "hh|怀化",
		"ld|娄底", "shaoyang|邵阳", "xiangtan|湘潭", "xiangxi|湘西", "yy|岳阳",
		"yongzhou|永州", "yiyang|益阳", "zhuzhou|株洲", "zjj|张家界" ]);
dsy.add("0_20", [ "anshun|安顺", "bijie|毕节", "gy|贵阳", "lps|六盘水", "qdn|黔东南",
		"qn|黔南", "qxn|黔西南", "tr|铜仁", "zunyi|遵义" ]);
dsy.add("0_21", [ "ab|阿坝", "bazhong|巴中", "cd|成都", "deyang|德阳", "dazhou|达州",
		"ga|广安", "guangyuan|广元", "ganzi|甘孜", "ls|乐山", "luzhou|泸州",
		"liangshan|凉山", "mianyang|绵阳", "ms|眉山", "scnj|内江", "nanchong|南充",
		"panzhihua|攀枝花", "suining|遂宁", "yb|宜宾", "ya|雅安", "zg|自贡", "zy|资阳" ]);
dsy.add("0_22", [ "bs|保山", "cx|楚雄", "dali|大理", "diqing|迪庆", "dh|德宏",
		"honghe|红河", "km|昆明", "lj|丽江", "lincang|临沧", "nujiang|怒江", "pe|普洱",
		"qj|曲靖", "ws|文山", "bn|西双版纳", "yx|玉溪", "zt|昭通" ]);
dsy.add("0_23", [ "aks|阿克苏", "ale|阿拉尔", "bygl|巴音郭楞", "betl|博尔塔拉", "changji|昌吉",
		"hami|哈密", "ht|和田", "klmy|克拉玛依", "kel|库尔勒", "ks|喀什", "kzls|克孜勒苏",
		"shz|石河子", "tlf|吐鲁番", "tmsk|图木舒克", "xj|乌鲁木齐", "wjq|五家渠", "yili|伊犁" ]);
dsy.add("0_24",
		[ "guyuan|固原", "szs|石嘴山", "wuzhong|吴忠", "yinchuan|银川", "zw|中卫" ]);
dsy.add("0_25", [ "guoluo|果洛", "huangnan|黄南", "hx|海西", "haidong|海东",
		"haibei|海北", "hainan|海南", "xn|西宁", "ys|玉树" ]);
dsy.add("0_26", [ "al|阿里", "changdu|昌都", "lasa|拉萨", "linzhi|林芝", "nq|那曲",
		"rkz|日喀则", "sn|山南" ]);
dsy.add("0_27", [ "baise|百色", "bh|北海", "chongzuo|崇左", "fcg|防城港", "gl|桂林",
		"gg|贵港", "hc|河池", "hezhou|贺州", "liuzhou|柳州", "lb|来宾", "nn|南宁",
		"qinzhou|钦州", "wuzhou|梧州", "yulin|玉林" ]);
dsy.add("0_28", [ "chaozhou|潮州", "dg|东莞", "fs|佛山", "gz|广州", "huizhou|惠州",
		"heyuan|河源", "jm|江门", "jy|揭阳", "mm|茂名", "mz|梅州", "qingyuan|清远",
		"sd|顺德", "sz|深圳", "st|汕头", "sg|韶关", "sw|汕尾", "taishan|台山", "yj|阳江",
		"yangchun|阳春", "yf|云浮", "zh|珠海", "zs|中山", "zhanjiang|湛江", "zq|肇庆" ]);
dsy.add("0_29", [ "fz|福州", "ly|龙岩", "nd|宁德", "np|南平", "pt|莆田", "qz|泉州",
		"sm|三明", "wuyishan|武夷山", "xm|厦门", "zhangzhou|漳州" ]);
dsy.add("0_30", [ "haikou|海口", "sansha|三沙", "sanya|三亚", "wzs|五指山" ]);
dsy.add("0_31", [ "tw|台湾" ]);
dsy.add("0_32", [ "hk|香港" ]);
dsy.add("0_33", [ "am|澳门" ]);
dsy.add("0_34", [ "cn|其他" ]);
dsy.add("0_35", [ "www|全国" ]);

function getcookie(objname) {
	var arrstr = document.cookie.split("; ");
	for (var i = 0; i < arrstr.length; i++) {
		var temp = arrstr[i].split("=");
		if (temp[0] == objname)
			return unescape(temp[1]);
	}
}

function co(b) {
	if (!b || b == "") {
		return false;
	}	
	var ai = 30;
		var c = new Date();
		c.setTime(c.getTime() + ai * 24 * 60 * 60 * 1000);
		document.cookie = "key = http://" + b + ".hc9.com";
    	goCity("", b);
}

function co2(b) {
	if (!b || b == "") {
		return false;
	}	
	var ai = 30;
		var c = new Date();
		c.setTime(c.getTime() + ai * 24 * 60 * 60 * 1000);
		document.cookie = "key = http://" + b + ".hc9.com";
     	goCity2("", b);
}

var arrCity = [];
for ( var key in dsy.Items) {
	if (key != 0) {
		for (var i = 0, leni = dsy.Items[key].length; i < leni; i++) {
			arrCity.push(dsy.Items[key][i]);
		}
	}
}

function goCity(d, b) {
	var a = "";
	var citysh = "";
	for (var e = 0, c = arrCity.length; e < c; e++) {
		if (arrCity[e].split("|")[0] == b) {
			a = arrCity[e];
			citysh = arrCity[e].split("|")[1];
			 break;
		}
	}
	if (a) {	
		$("#ccsh").html(citysh);
		window.location.href = "http://" + b + ".hc9.com/";
	} else {
		/*alert("对不起，没有找到该城市！");*/
	}
}

function splitstring(str) {
		var path1 = str.split(".");
		var path2 = path1[0].split("//");
		return path2;
	};	
	
function goCity2(d, b) {
	var a = "";
	var citysh = "";
	for (var e = 0, c = arrCity.length; e < c; e++) {
		if (arrCity[e].split("|")[0] == b) {
			a = arrCity[e];
			citysh = arrCity[e].split("|")[1];		
			break;
		}
	}
	if (a) {	
		$("#ccsh").html(citysh);	
	} else {
		/*alert("对不起，没有找到该城市！");*/
	}
}