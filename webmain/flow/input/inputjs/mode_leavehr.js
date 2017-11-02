var daytime = 8;//每天上班默認8個小時

function oninputblur(na){
	if(na=='stime'|| na=='uname'){
		changetotal();
	}
	if(na=='totals'){
		changedays();
	}
}

function changesubmit(d){
	if(d.etime<=d.stime)return '截止時間必須大于開始時間';
	var st=parseFloat(d.totals);
	if(st<=0)return '時間必須大于0';
}

function changetotal(){
	var st = form('stime').value,
		et = form('etime').value,
		uid= form('uid').value;
	if(uid==''||st=='')return;	
	js.ajax(geturlact('total'),{stime:st,etime:et,uid:uid}, function(a){
		daytime = parseFloat(a[2]);
		js.setmsg(a[1]);
		changedays();
	},'post,json');
}
//計算天數
function changedays(){
	if(!form('totday'))return;
	var to = parseFloat(form('totals').value);
	var day= js.float(to / daytime);
	form('totday').value = day;
}