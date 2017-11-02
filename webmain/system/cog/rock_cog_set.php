<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	
	var barr = {};
	var c={
		init:function(){
			js.ajax(js.getajaxurl('getinfo','{mode}','{dir}'),{},function(a){
				barr = a;
				for(var i in a)$('#'+i+'_{rand}').val(a[i]);
			},'get,json');
		},
		save:function(o){
			var d={};
			for(var i in barr){
				d[i] = $('#'+i+'_{rand}').val();
			}
			if(d.title==''){
				js.msg('msg','系統標題不能為空');
				return;
			}
			js.ajax(js.getajaxurl('savecong','{mode}','{dir}'), d, function(s){
				if(s!='ok')js.msg('msg', s);
			},'post',false,'保存中...,保存成功');
		},
		blurls:function(o){
			var val = strreplace(o.value);
			if(val=='')return;
			var la  = val.substr(val.length-1);
			if(la!='/')val+='/';
			o.value=val;
		}
	};
	js.initbtn(c);
	c.init();
	
	$('#url_{rand}').blur(function(){
		c.blurls(this);
	});
	$('#localurl_{rand}').blur(function(){
		c.blurls(this);
	});
});
</script>

<div align="left">
<div  style="padding:10px;">

		
		<table cellspacing="0" width="550" border="0" cellpadding="0">
		
		<tr>
			<td  colspan="2"><div class="inputtitle">基本信息
			<div style="padding:5px;line-height:18px;font-size:12px;color:#888888">此保存在配置文件下，也可以自己打開配置文件(webmain/webmainConfig.php)來修改</div>
			</div></td>
		</tr>
	
		<tr>
			<td  align="right" width="180">系統標題：</td>
			<td class="tdinput"><input id="title_{rand}" class="form-control"></td>
		</tr>
		
		<tr>
			<td  align="right">APP移動端PC上標題：</td>
			<td class="tdinput"><input id="apptitle_{rand}" class="form-control"></td>
		</tr>
		
		<tr>
			<td  align="right">REIM即時通信標題：</td>
			<td class="tdinput"><input id="reimtitle_{rand}" class="form-control"></td>
		</tr>
		
		<tr>
			<td  align="right">系統URL地址：</td>
			<td class="tdinput"><input id="url_{rand}" class="form-control"></td>
		</tr>
		
		<tr>
			<td  align="right">系統本地地址：</td>
			<td class="tdinput"><input id="localurl_{rand}" class="form-control">
			<font color="#888888">用于計劃任務異步任務使用，沒有可跟系統URL一樣</font></td>
		</tr>
		
		<tr>
			<td  align="right"><a target="_blank" href="<?=URLY?>">信呼官網</a>key：</td>
			<td class="tdinput"><input id="xinhukey_{rand}" class="form-control">
			<font color="#888888">用于在線升級使用,看<a target="_blank" href="<?=URLY?>view_xhkey.html">[幫助]</a>獲取</font></td>
		</tr>
		
		<tr>
			<td  colspan="2"><div class="inputtitle">高級設置</div></td>
		</tr>
		
		<tr>
			<td  align="right">debug模式：</td>
			<td class="tdinput"><select id="debug_{rand}"  class="form-control"><option value="0">上線模式</option><option value="1">開發調試模式</option></select></td>
		</tr>
		
		<tr>
			<td  align="right">異步任務key：</td>
			<td class="tdinput"><input id="asynkey_{rand}" class="form-control"></td>
		</tr>
		
		<tr>
			<td  align="right">對外接口openkey：</td>
			<td class="tdinput"><input id="openkey_{rand}" class="form-control"></td>
		</tr>
		
		<tr>
			<td  align="right">操作數據庫驅動：</td>
			<td class="tdinput"><select id="db_drive_{rand}"  class="form-control"><option value="mysql">mysql(不推薦)</option><option value="mysqli">mysqli</option><option value="pdo">pdo</option></select></td>
		</tr>
		
		<tr>
			<td  align="right">提醒消息發送方式：</td>
			<td class="tdinput"><select id="asynsend_{rand}"  class="form-control"><option value="0">同步發送</option><option value="1">異步發送(自己服務端)</option><option value="2">異步發送(官網VIP專用)</option></select>
			<font color="#888888">提醒消息發送微信消息提示發送，郵件提醒發送等。選擇[異步發送]需安裝服務端，異步發送能大大提高效率。</font></td>
		</tr>
		
		<tr>
			<td  align="right">是否記錄訪問sql日志：</td>
			<td class="tdinput"><select id="sqllog_{rand}"  class="form-control"><option value="0">否</option><option value="1">是</option></select><font color="#888888">開啟了日志將記錄在目錄<?=UPDIR?>/sqllog下</font></td>
		</tr>
		
		<tr>
			<td  align="right">詳情上線條顏色：</td>
			<td class="tdinput"><input id="bcolorxiang_{rand}" placeholder="用于單據詳情默認顏色" maxlength="7" class="form-control"></td>
		</tr>
		
		<tr>
			<td  align="right">PC首頁顯示：</td>
			<td class="tdinput">REIM：<select id="reim_show_{rand}" ><option value="0">不顯示</option><option value="1">顯示</option></select>&nbsp;&nbsp;手機版：<select id="mobile_show_{rand}" ><option value="0">不顯示</option><option value="1">顯示</option></select></td>
		</tr>
		
		
		<tr>
			<td  align="right"></td>
			<td style="padding:15px 0px" colspan="3" align="left"><button click="save" class="btn btn-success" type="button"><i class="icon-save"></i>&nbsp;保存</button>
		</td>
		</tr>
		
		</table>
</div>
</div>