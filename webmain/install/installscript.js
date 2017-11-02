function initbody(){
	var tit = document.title;
	if(tit.indexOf('<?')>-1){
		alert('提示：您沒有開啟php短標簽，系統將不能使用\n\n請到php.ini下將short_open_tag = ON。');
	}
}
var bool = false;
function nextabc(){
	$('#step1').hide();
	$('#step2').show();
}

function backabc(){
	$('#step2').hide();
	$('#step1').show();
}

function wancla(){
	$('#step2').hide();
	$('#step3').show();
}

function delinstall(){
	var url = js.getajaxurl('delinstall','install');
	$.get(url,function(){
		js.msg('success','刪除成功');
	});
	return false;
}

function submitla(){
	if(bool)return;
	var a = js.getformdata();
	if(isempt(a.host)){
		js.setmsg('數據庫地址不能為空');
		return;
	}
	if(isempt(a.user)){
		js.setmsg('用戶名不能為空');
		return;
	}
	if(isempt(a.base)){
		js.setmsg('數據庫名稱不能為空');
		return;
	}
	if(isempt(a.perfix)){
		js.setmsg('表名前綴不能為空');
		return;
	}
	var url = location.href;
	a.url = url.substr(0, url.lastIndexOf('/')+1);
	js.setmsg('處理中...');
	bool = true;
	$.ajax({
		data:a,url:js.getajaxurl('save','install'),
		type:'post',
		success:function(da){
			js.setmsg();
			if(da!='success'){
				js.setmsg(da);
				bool = false;
			}else{
				wancla();
			}
		},
		error:function(e){
			js.setmsg('出錯：'+e.responseText+'');
			bool = false;
		}
	});
}