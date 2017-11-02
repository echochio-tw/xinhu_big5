<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	
	var c={
		init:function(){
			$.get(js.getajaxurl('getset','{mode}','{dir}'), function(s){
				var a=js.decode(s);
				get('push_{rand}').value=a.reimpushurl;
				get('host_{rand}').value=a.reimhost;
				get('receid_{rand}').value=a.reimrecid;
				get('chehui_{rand}').value=a.reimchehui;
			});
		},
		save:function(o){
			var d={push:get('push_{rand}').value};
			d.host = get('host_{rand}').value;
			d.receid = get('receid_{rand}').value;
			d.chehui = get('chehui_{rand}').value;
			js.setmsg('保存中...','','msgview_{rand}');
			js.ajax(js.getajaxurl('setsave','{mode}','{dir}'), d, function(s){
				js.setmsg('保存成功','green','msgview_{rand}');
			});
		},
		testss:function(){
			js.msg('wait','推送地址測試發送中...');
			$.get(js.getajaxurl('testsend','{mode}','{dir}'), function(s){
				js.msg('success',s);
			});
		},
		testsss:function(){
			var url= get('host_{rand}').value.replace('ws','http');
			if(url=='')return;
			js.confirm('看這個：如出現《<b>400 Bad Request</b>》說明<font color=green>成功</font>，否則失敗，打不開地址也是失敗！',function(jg){
				if(jg=='yes')js.open(url,500,300);
			});
		},
		kuanshu1:function(){
			c.chengeread(true);
			js.prompt('快速設置','請輸入您服務器真實IP(本地測試用127.0.0.1)',function(jg,tet){
				if(jg=='yes' && tet)c.kusnsegeo(tet);
			});
		},
		kusnsegeo:function(ips){
			var asd= ips.split('.');
			var len=asd.length;
			if(len!=4){
				js.msg('msg','服務器真實IP格式不正確');
				return;
			}
			get('push_{rand}').value='http://127.0.0.1:6553/';
			get('host_{rand}').value='ws://'+ips+':6552/';
			get('receid_{rand}').value='rockxinhu';
			js.msg('success','設置完成，請點保存，並測試驗證一下地址');
		},
		kuanshu2:function(){
			c.chengeread(false);
			js.alert('請詳見說明在修改設置！');
		},
		chengeread:function(bo){
			get('push_{rand}').readOnly=bo;
			get('host_{rand}').readOnly=bo;
			get('receid_{rand}').readOnly=bo;
		}
	};
	
	js.initbtn(c);
	c.init();
});
</script>

<div align="left">
<div  style="padding:10px;">
	
	
		
		<table cellspacing="0" border="0" cellpadding="0">
		
		
		<tr>
			<td  align="right"></td>
			<td class="tdinput">
			<button click="kuanshu1" class="btn btn-info" type="button">快速設置(推薦)</button>&nbsp;&nbsp;
			<button click="kuanshu2" class="btn btn-default" type="button">自定義設置</button>
			</td>
		</tr>
	
		
		<tr>
			<td  align="right"><font color=red>*</font> 通信地址：</td>
			<td class="tdinput"><input id="host_{rand}" style="width:300px" readonly class="form-control"><br><font color=#888888>用于客戶端連接的通信地址,ws://開頭</font></td>
		</tr>
		
		<tr>
			<td  align="right" width="200"><font color=red>*</font> 服務端推送地址：</td>
			<td class="tdinput"><input id="push_{rand}"  style="width:300px" readonly class="form-control"><br><font color=#888888>用于推送到信呼客戶端,http://開頭</font></td>
		</tr>
		
		<tr>
			<td  align="right"><font color=red>*</font> recID號：</td>
			<td class="tdinput"><input id="receid_{rand}"  style="width:300px" readonly class="form-control"></td>
		</tr>
		
		<tr>
			<td  align="right">可撤回時間(分鐘)：</td>
			<td class="tdinput"><input id="chehui_{rand}"  style="width:300px" placeholder="0不可撤回" type="number" class="form-control"></td>
		</tr>
		
		<tr>
			<td></td>
			<td class="tdinput"><font color="#888888">不知道地址？請先安裝並運行服務端，</font><a href="<?=URLY?>view_server.html" target="_blank">[去下載安裝，看幫助]</a></td>
		</tr>
		
		<tr>
			<td  align="right"></td>
			<td style="padding:15px 0px" colspan="3" align="left"
			><button click="save" class="btn btn-success" type="button"><i class="icon-save"></i>&nbsp;保存</button>&nbsp; 
			<button click="testsss" class="btn btn-primary" type="button">測試通信地址</button>&nbsp; 
			<button click="testss" class="btn btn-primary" type="button">測試推送地址</button>&nbsp; 
			<span id="msgview_{rand}"><font color=red>測試地址前，請先保存！</font></span>
		</td>
		</tr>
		<tr>
			<td  align="left" colspan="2"><div style="margin-left:100px;max-width:600px" class="tishi">
			1、【快速設置(推薦)】請使用這個,用這個,用這個，設置完成點保存就可以了。<br>
			2、【自定義設置】用于系統和服務端不在同一個服務器，或者你修改了服務端的config.php的配置。<br>
			3、通信地址測試不成功，100%就是這個原因(服務端沒有安裝並啟動或者服務器防火牆阻止了6552的端口，需要把6552端口加入安全組讓可外部訪問)。<br>
			4、推送地址測試不成功，100%就是這個原因(服務端沒有安裝並啟動)。
			</div></td>
		</tr>
	</table>
	
</div>
	
</div>
