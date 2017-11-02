function initbodys(){
	hidetou();
}

//隱藏投票的
function hidetou(){
	$('#tablesub0').parent().parent().hide();
	$('#subtitletou').hide();
	c.fieldshide('startdt');
	c.fieldshide('enddt');
	c.fieldshide('maxtou');
}

//顯示投票
function showtou(){
	$('#tablesub0').parent().parent().show();
	$('#subtitletou').show();
	c.fieldsshow('startdt');
	c.fieldsshow('enddt');
	c.fieldsshow('maxtou');
}

function oninputblur(fid,zb){
	if(fid=='mintou'){
		var val = form(fid).value;
		if(val=='' || val=='0'){
			hidetou();	
		}else{
			showtou();
		}
	}
}

function changesubmitbefore(){
	if(!form('mintou'))return;
	var min = form('mintou').value;
	if(min=='' || min=='0'){
		subdataminlen[0] = 0;
	}else{
		subdataminlen[0] = 2; //投票必須2個選項
	}
}
function changesubmit(d){
	if(d.mintou>0){
		if(d.startdt=='')return '投票的開始時間不能為空';
		if(d.enddt=='')return '投票的截止時間不能為空';
		
		if(d.startdt>=d.enddt)return '截止時間必須大于開始時間';
	}
}