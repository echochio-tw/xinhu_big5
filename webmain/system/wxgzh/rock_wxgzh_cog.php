<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	
	var c={
		init:function(){
			$.get(js.getajaxurl('getset','{mode}','{dir}'), function(s){
				var a=js.decode(s);
				get('wxgzhappid_{rand}').value=a.appid;
				get('wxgzhsecret_{rand}').value=a.secret;

			});
		},
		save:function(o){
			var d={};
			d.appid = get('wxgzhappid_{rand}').value;
			d.secret = get('wxgzhsecret_{rand}').value;
			js.msg('wait','保存中...');
			js.ajax(js.getajaxurl('setsave','{mode}','{dir}'), d, function(s){
				js.msg('success','保存成功');
			});
		}
		,
		testss:function(o1,lx){
			if(ISDEMO){js.msg('success','demo上就不要測試，我們都測試通過的');return;}
			js.msg('wait','測試中...');
			js.ajax(js.getajaxurl('testsend','{mode}','{dir}'),{lx:lx}, function(a){
				if(a.success){
					js.msg('success',a.msg);
				}else{
					js.msg('msg',a.msg);
				}
			},'get,json');
		}
	};
	js.initbtn(c);
	c.init();
});
</script>

<div align="left">
<div  style="padding:10px;">
	
	
		
		<table cellspacing="0" width="600" border="0" cellpadding="0">
		
		
		<tr>
			<td  align="right"><font color=red>*</font> AppID(應用ID)：</td>
			<td class="tdinput"><input id="wxgzhappid_{rand}" class="form-control"></td>
		</tr>
		
		<tr>
			<td  align="right" width="180"><font color=red>*</font>AppSecret(應用密鑰)：</td>
			<td class="tdinput">
			<textarea id="wxgzhsecret_{rand}" style="height:60px" class="form-control"></textarea>
			<font color="#888888">可以使用公眾號的訂閱號/服務號都可以，到公眾號後台【開發→基本配置】下獲取,<a href="http://xh829.com/view_wxgzh.html"  target="_blank">[幫助]</a></font>
			</td>
		</tr>
		
		<tr>
			<td  align="right"></td>
			<td  class="tdinput" align="left"><button click="testss,0" class="btn btn-default" type="button">測試是否有效</button>
		</td>
		</tr>
		
		
		<tr>
			<td  align="right"></td>
			<td style="padding:15px 0px" colspan="3" align="left"><button click="save" class="btn btn-success" type="button"><i class="icon-save"></i>&nbsp;保存</button>
			</span>
		</td>
		</tr>
		

	
</div>
</div>