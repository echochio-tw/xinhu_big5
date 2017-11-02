//初始函數
function initbodys(){
	$(form('zinum')).change(function(){
		getfilenum();
	});
}

//得到文件編號：類別+年份+三位編號
function getfilenum(){
	var type = form('zinum').value;
	if(type==''){
		form('num').value='';
		return;
	}
	
	js.ajax(geturlact('getfilenum'),{type:type},function(s){
		form('num').value=s;
	},'post');
}
