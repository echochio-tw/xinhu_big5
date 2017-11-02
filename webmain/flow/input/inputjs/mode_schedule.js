function initbodys(){
	$(form('rate')).change(function(){
		changeratess(this.value, 0);
	});
	changeratess(form('rate').value, 1);
}
function changeratess(v, lx){
	var d = {};
	if(v=='w')d={'1':'週一','2':'週二','3':'週三','4':'週四','5':'週五','6':'週六','0':'週日'};
	if(v=='m')for(var i=1;i<=31;i++)d[i]=''+i+'日';
	var s='',sel='',s11;
	if(data.rateval)s11=','+data.rateval+',';
	for(var d1 in d){
		sel='';
		if(lx==1&&s11){
			if(s11.indexOf(','+d1+',')>-1)sel='checked';
		}
		s+='<label><input name="rateval[]" '+sel+' value="'+d1+'" type="checkbox">'+d[d1]+'</label>&nbsp;&nbsp;';
	}
	$('#div_rateval').html(s);
}