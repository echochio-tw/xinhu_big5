function initbodys(){
	$(form('type')).change(function(){changestype(1)});
	changestype(0);
	get('btnchange_recename').onclick=function(){
		changeuserss(0);
	}
	get('btnchange_ccname').onclick=function(){
		changeuserss(1);
	}
	//讀取轉發郵件的內容
	var zfid = js.request('zfid');
	if(mid==0&&zfid){
		js.ajax(geturlact('getzfcont',{zfid:zfid}),false,function(a){
			form('title').value='轉發：'+a.title+'';
			form('content').value=a.content;
			if(ismobile==1)form('content').value=a.content.replace(/<br>/g,"\n");
			if(ismobile==0)c.editorobj['content'].html(a.content);
			js.downupshow(a.filers,'fileidview');
		},'get,json');
	}
	if(mid==0){
		form('isturn').checked=true;
	}
	get('AltS').value='發送(S)';
}
var txlbool=false,txldata=[];
function changestype(lx){
	var val = form('type').value;
	if(lx==1){
		js.changeclear('changeccname');
		js.changeclear('changerecename');
	}
}
function changeuserss(lx){
	var val = form('type').value;
	if(val==1){
		var ss1 = 'receid',ss2='recename',tit='選擇收信人';
		if(lx==1){
			var ss1 = 'ccid',ss2='ccname';
			tit='抄送給';
		}
		c.selectdata('getvcard,'+ss1+'', true, ss2, tit);
		return;
	}
	if(lx==0){
		js.changeuser('changerecename','changedeptusercheck');
	}else{
		js.changeuser('changeccname','changeusercheck');
	}
}