<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	
	var c={
		init:function(){
			$.get(js.getajaxurl('getset','{mode}','{dir}'), function(a){
				for(var i in a)get(''+i+'_{rand}').value = a[i];
			},'json');
		},
		save:function(o){
			var d={};
			d.sendhost = get('sendhost_{rand}').value;
			d.sendport = get('sendport_{rand}').value;
			d.recehost = get('recehost_{rand}').value;
			d.sendsecure = get('sendsecure_{rand}').value;
			d.sysname 	= get('sysname_{rand}').value;
			d.sysuser 	= get('sysuser_{rand}').value;
			d.syspass 	= get('syspass_{rand}').value;
			d.receyumi 	= get('receyumi_{rand}').value;
			js.msg('wait','保存中...');
			js.ajax(js.getajaxurl('setsave','{mode}','{dir}'), d, function(s){
				js.msg('success','保存成功');
			});
		},
		test:function(){
			if(ISDEMO){js.msg('success','demo上就不要測試，我們都測試通過的');return;}
			var url = js.getajaxurl('testsend','{mode}','{dir}');
			js.ajax(url,false,function(s){
				js.msg('success', s);
			},'get',false,'測試發送中...');
		}
	};
	js.initbtn(c);
	c.init();
});
</script>

<div align="left">
<div  style="padding:10px;">
	
	
		
		<table cellspacing="0" width="500" border="0" cellpadding="0">
		
		<tr>
			<td  colspan="2"><div class="inputtitle">發郵件設置</div></td>
		</tr>
		
		<tr>
			<td width="150" align="right">SMTP服務器：</td>
			<td class="tdinput"><input id="sendhost_{rand}" class="form-control"></td>
		</tr>
		
		<tr>
			<td  align="right">SMTP服務器端口：</td>
			<td class="tdinput"><input id="sendport_{rand}" onfocus="js.focusval=this.value" onblur="js.number(this)" type="number" class="form-control"></td>
		</tr>
		<tr>
			<td align="right">發送方式：</td>
			<td class="tdinput"><select id="sendsecure_{rand}" class="form-control"><option value="ssl">ssl</option><option value="">默認</option></select></td>
		</tr>
		
		<tr>
			<td  colspan="2"><div class="inputtitle">系統發郵件帳號</div></td>
		</tr>
		<tr>
			<td  align="right">名稱：</td>
			<td class="tdinput"><input id="sysname_{rand}" class="form-control"><font color="#888888">用于發送系統郵件的名稱</font></td>
		</tr>
		<tr>
			<td  align="right">發郵件郵箱帳號：</td>
			<td class="tdinput"><input id="sysuser_{rand}" class="form-control"></td>
		</tr>
		<tr>
			<td  align="right">發郵件郵箱密碼：</td>
			<td class="tdinput"><input id="syspass_{rand}" class="form-control">
			</td>
		</tr>
		
		<tr>
			<td  align="right"></td>
			<td class="tdinput"><button click="test" class="btn btn-default" type="button">測試發郵件</button>
			</td>
		</tr>
		
		<tr>
			<td  colspan="2"><div class="inputtitle">IMAP收郵件設置</div></td>
		</tr>
		
		
		<tr>
			<td  align="right">IMAP連接主機：</td>
			<td class="tdinput"><input id="recehost_{rand}" class="form-control"><font color="#888888">收郵件我們使用的IMAP協議，如是其他的，本系統上沒有。</font></td>
		</tr>
		<tr>
			<td  align="right">收信郵箱域名：</td>
			<td class="tdinput"><input id="receyumi_{rand}" class="form-control">
			</td>
		</tr>
		

		
		
		
		<tr>
			<td  align="right"></td>
			<td style="padding:15px 0px" colspan="3" align="left"><button click="save" class="btn btn-success" type="button"><i class="icon-save"></i>&nbsp;保存</button>&nbsp;<a href="<?=URLY?>view_email.html" target="_blank">[?查看郵件幫助]</a>
			</span>
		</td>
		</tr>
		

	
</div>
</div>
