/**
*	加班費的計算每個企業都不一樣，我們沒辦法寫出公式，請自己修改代碼哦
*/
function initbodys(){
	$(form('stime')).blur(function(){
		changetotal();
	});
	$(form('etime')).blur(function(){
		changetotal();
	});
	
	$(form('jiatype')).change(function(){
		changetype(true);
	});
	
	changetype(false);
}

function changetype(bo){
	var v = form('jiatype').value;
	var o = $('#div_jiafee').parent().parent();
	if(v=='1'){
		o.show();
		if(bo)changetotal();
	}else{
		o.hide();
		if(bo)form('jiafee').value='0';
	}
}

function changesubmit(d){
	if(d.etime<=d.stime)return '截止時間必須大于開始時間';
	if(d.stime.substr(0,10)!=d.etime.substr(0,10)){
		//return '不允許跨日申請';
	}
	var st=parseFloat(d.totals);
	if(st<=0)return '加班時間必須大于0';
}

function changetotal(){
	var st = form('stime').value,
		et = form('etime').value;
	if(isempt(st)||isempt(et)){
		form('totals').value='0';
		return;
	}
	if(et<=st){
		js.setmsg('截止時間必須大于開始時間');
		return;
	}
	if(st.substr(0,10)!=et.substr(0,10)){
		//js.setmsg('不允許跨日申請');
		//return;
	}
	js.ajax(geturlact('total'),{stime:st,etime:et,jiatype:form('jiatype').value}, function(da){
		var a= js.decode(da);
		form('totals').value=a[0];
		form('jiafee').value=a[2];
		js.setmsg(a[1]);
	},'post');
}