<?php defined('HOST') or die('not access');?>
<script >
$(document).ready(function(){
	{params}
	var modenum = params.modenum;
	var c={
		headers:'',
		yulan:function(){
			var cont = mobjs.val(),s='',a,a1,i,j,oi=0;
			s+='<table class="basetable" border="1">';
			s+='<tr><td></td>'+this.headers+'</tr>';
			a = cont.split('\n');
			for(i=0;i<a.length;i++){
				if(a[i]){
					oi++;
					a1 = a[i].replace(/[ ]/g,'').split('	');
					s+='<tr>';
					s+='<td>'+oi+'</td>';
					for(j=0;j<a1.length;j++)s+='<td>'+a1[j]+'</td>';
					s+='</tr>';
				}
			}
			s+='</table>';
			$('#showview_{rand}').html(s);
		},
		init:function(){
			var vis = 'msgview_{rand}';
			js.setmsg('初始化中...','', vis);
			js.ajax(publicmodeurl(modenum,'initdaoru'),{'modenum':modenum},function(ret){
				js.setmsg('','', vis);
				c.initshow(ret);
			},'get,json');
		},
		initshow:function(ret){
			this.bitian='';
			this.headers='';
			var i,len=ret.length,d;
			for(i=0;i<len;i++){
				d=ret[i];
				this.headers+='<td>';
				if(d.isbt=='1'){
					this.bitian+=','+d.fields+'';
					this.headers+='<font color=red>*</font>';
				}
				this.headers+=''+d.name+'</td>';
			}
			this.yulan();
		},
		insrtss:function(){
			var val = mobjs.val();
			mobjs.val(val+'	');
			mobjs.focus();
		},
		saveadd:function(o1){
			var val = mobjs.val();
			var vis = 'msgview_{rand}';
			if(isempt(val)){
				js.setmsg('沒有輸入任何東西','', vis);
				return;
			}
			js.setmsg('處理中...','', vis);
			o1.disabled=true;
			js.ajax(js.getajaxurl('daorudata','{mode}','{dir}'),{importcont:val,'modenum':modenum},function(ds){
				if(ds.success){
					js.setmsg(ds.data,'green', vis);
					try{window['managelist'+modenum+''].reload()}catch(e){}
				}else{
					js.setmsg(ds.msg+'','red', vis);
					o1.disabled=false;
				}
			},'post,json',function(s){
				js.setmsg(s,'red', vis);
				o1.disabled=false;
			});
		},
		downxz:function(){
			var url = '?m=input&a=daoruexcel&d=flow&modenum='+modenum+'';
			js.open(url);
		}
	}
	var mobjs = $('#maincont_{rand}');
	mobjs.keyup(function(){
		c.yulan();
	});

	
	js.initbtn(c);
	c.init();
});
</script>

<div align="left">
<div>請下面表格格式在Excel中添加數據，並復制到下面文本框中，也可以手動輸入，<a click="downxz" href="javascript:;">[下載Excel模版]</a>。<br>多行代表多記錄，整行字段用	分開，<a click="insrtss" href="javascript:;">插入間隔符</a></div>
<div><textarea style="height:250px;" id="maincont_{rand}" class="form-control"></textarea></div>
<div id="showview_{rand}"></div>
<div style="padding:10px 0px"><a click="yulan" href="javascript:;">[預覽]</a>&nbsp; &nbsp; <button class="btn btn-success" click="saveadd" type="button">確定導入</button>&nbsp; <span id="msgview_{rand}"></span></div>
<div class="tishi">請嚴格按照規定格式添加，否則數據將錯亂哦，導入的字段可到[流程模塊→表單元素管理]下設置，更多可查看<a href="<?=URLY?>view_daoru.html" target="_blank">[幫助]</a>。</div>
</div>