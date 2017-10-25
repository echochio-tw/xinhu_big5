function initbodys(){
	$(form('startdt')).blur(function(){
		changetotal();
	});
	$(form('enddt')).blur(function(){
		changetotal();
	});
}
function changesubmit(d){
	if(d.enddt<=d.startdt)return '截止時間必須大于開始時間';
	if(d.enddt.substr(0,10)!=d.startdt.substr(0,10)){
		return '不允許跨天申請';
	}
}

function changetotal(){
	var st = form('startdt').value,
		et = form('enddt').value;
	if(st.substr(0,10)!=et.substr(0,10)){
		js.setmsg('不允許跨天申請');
		return;
	}
	js.setmsg('');
}