<?php defined('HOST') or die('not access');?>
<script >
$(document).ready(function(){
	var istongbu=false;
	var a = $('#view_{rand}').bootstable({
		tablename:'chargems',url:js.getajaxurl('data','{mode}','{dir}'),
		columns:[{
			text:'名稱',dataIndex:'name'
		},{
			text:'說明',dataIndex:'explain',align:'left',width:'45%'
		},{
			text:'更新時間',dataIndex:'updatedt'
		},{
			text:'價格',dataIndex:'price',renderer:function(v){
				var s='<font color=#ff6600>免費</font>';
				if(v>0)s=v+'元';
				return s;
			}
		},{
			text:'詳情',dataIndex:'view'
		},{
			text:'操作',dataIndex:'opt',align:'left',renderer:function(v,d){
				if(d.isaz=='0')return '<font color=#888888>無需安裝</font>';
				var s='';
				if(v==1)s='<font color=green>已安裝</font> ';
				if(v==2)s='<button onclick="upsho{rand}(2,'+d.id+',\''+d.key+'\')" class="btn btn-danger btn-sm" type="button">升級</button>';
				if(v==0)s='<button onclick="upsho{rand}(0,'+d.id+',\''+d.key+'\')" class="btn btn-info btn-sm"  type="button">安裝</button>';
				if(v==0||v==2){
					if(d.price=='0')s+='&nbsp;<a href="javascript:;" onclick="downup{rand}('+d.id+',\''+d.name+'\')">文件對比</a>';
					$('#shiw_{rand}').html('有系統模塊需要升級/安裝！');
				}
				if(d.id=='1'){
					istongbu=false;
					if(v==1){
						istongbu=true;
					}
				}
				return '<span id="msg'+d.id+'_{rand}">'+s+'</span>';
			}
		}],
		beforeload:function(){
			istongbu=false;
			$('#shiw_{rand}').html('');
			get('resede_{rand}').disabled=true;
		},
		itemclick:function(){
			get('resede_{rand}').disabled=false;
		}
	});
	
	var c={
		reloads:function(){
			a.reload();
		},
		bool:false,
		upsho:function(lx,id,key, slx){
			if(this.bool){js.msg('msg','其他模塊升級中,請稍後');return;}
			var msgid='msg'+id+'_{rand}',lxs='安裝';
			if(lx==2)lxs='升級';
			js.setmsg(''+lxs+'中...','', msgid);
			this.msgid  = msgid;
			this.lxsss  = lxs;
			this.upadd	= {id:id,key:key,slx:slx};
			this.bool	= true;
			js.ajax(js.getajaxurl('shengjian','{mode}','{dir}'),this.upadd,function(d){
				if(d.success){
					c.uparr = d.data;
					c.upstart(0);
				}else{
					c.bool=false;
					js.setmsg(d.msg,'red', c.msgid);
				}
			},'post,json');
		},
		upstart:function(oi){
			var len = this.uparr.length,lxs = this.lxsss;
			var ad  = this.upadd;
			if(oi>=len){
				js.setmsg(''+lxs+'完成','green', this.msgid);
				if(ad.id=='1'){
					js.confirm('系統核心文件升級完成需要重新進入系統哦！',function(jg){
						location.reload();
					});
				}else{
					a.reload();
				}
				c.bool=false;
				return;
			}
			var d = this.uparr[oi];
			js.setmsg(''+lxs+'中('+len+'/'+(oi+1)+')...','', this.msgid);
			ad.fileid = d.id;
			ad.updatedt = d.updatedt;
			ad.lens	  = len;
			ad.oii	  = oi;
			js.ajax(js.getajaxurl('shengjianss','{mode}','{dir}'),ad,function(s){
				if(s=='ok'){
					c.upstart(oi+1);
				}else{
					c.bool=false;
					js.setmsg(s,'red', c.msgid);
				}
			},'post');
		},
		upshos:function(lx,id,kes){
			if(kes=='null')kes='';
			js.prompt('模塊安裝','安裝key(免費模塊可不輸入,直接點確定)',function(lxbd,msg){
				if(lxbd=='yes'){
					if(lx==2&&msg)msg=jm.uncrypt(msg);
					c.upsho(lx,id,msg, 0);
				}
			},kes);
		},
		tontbudata:function(lx, o){
			o.innerHTML=js.getmsg('同步中...');
			js.ajax(js.getajaxurl('tontbudata','{mode}','{dir}'),{lx:lx},function(s){
				o.innerHTML=js.getmsg(s,'green');
			});
		},
		delreload:function(){
			a.del({
				url:js.getajaxurl('delmodel', '{mode}','{dir}'),
				msg:'確定要刪除選中模塊後可重新安裝的！'
			});
		}
	};
	upsho{rand}=function(lx,id,kes){
		if(ISDEMO){js.msg('msg','演示系統不要操作');return;}
		c.upshos(lx,id,kes);
	}
	downup{rand}=function(id,na){
		addtabs({num:'upgradefile'+id+'','url':'system,upgrade,file,id='+id+'','name':'['+na+']文件對比'});
	}
	js.initbtn(c);
	
	upfetwontbu=function(lx, o){
		if(ISDEMO){js.msg('msg','演示系統不要操作');return;}
		if(!istongbu && lx!=3){
			js.alert('請先升級系統到最新才能同步');
			return;
		}
		js.confirm('謹慎啊，確定要同步嘛？同步了將覆蓋你原先配置好的哦！',function(jg){
			if(jg=='yes')c.tontbudata(lx, o);
		});
	}
});
</script>
<div>
	<table width="100%"><tr>
	<td nowrap>
		<button class="btn btn-default" click="reloads"  type="button"><i class="icon-refresh"></i> 刷新</button> &nbsp;  
		<font color="red" id="shiw_{rand}"></font> 
	</td>
	<td align="right">
		<button class="btn btn-default" click="delreload" disabled id="resede_{rand}" type="button">刪除重新安裝</button>
	</td>
	</tr>
	</table>
</div>
<div class="blank10"></div>
<div id="view_{rand}"></div>
<div class="blank10"></div>
<div><h4><b>系統同步：</b></h4></div>
<div class="blank10"></div>
<div>1、同步菜單，系統上操作菜單會和官網同步，也可到【系統→菜單管理】下管理。<a onclick="upfetwontbu(0,this)" href="javascript:;">[同步]</a></div>
<div class="blank10"></div>
<div>2、同步流程模塊，流程模塊會和官網同步，也可到【流程模塊】下管理。<a onclick="upfetwontbu(1,this)" href="javascript:;">[1.同步]</a>，<a onclick="upfetwontbu(4,this)" href="javascript:;">[2.同步完全和官網一致]</a></div>
<div style="color:#888888"><font color=white>2、</font>[1.同步]：同步了不會覆蓋自己的配置信息，[2.同步完全和官網一致]：會完成和官網一致，同時會刪除自己配置和新建的模塊，謹慎。</div>
<!--<div><font color=white>2、</font>輸入要同步的模塊編號：<input style="width:250px" placeholder="模塊編號多個,分開，輸入all為全部" class="inputs"></div>-->
<div class="blank10"></div>
<div>3、同步桌面版/手機上應用，應用會和官網同步，也可到【系統→即時通信管理→應用管理】下管理。<a onclick="upfetwontbu(2,this)" href="javascript:;">[同步]</a></div>
<div class="blank10"></div>
<div>4、<font color=red>建議同步計劃任務</font>，讓系統更好運行，計劃任務會和官網同步，也可到【系統→系統工具→計劃任務】下管理。<a onclick="upfetwontbu(3,this)" href="javascript:;">[同步]</a></div>
<div class="blank10"></div>
<div><h4><b>更多升級方法：</b></h4></div>
<div style="line-height:35px">
1、使用svn地址升級(推薦)，地址：<a href="https://git.oschina.net/rainrock/xinhu" target="_blank">https://git.oschina.net/rainrock/xinhu</a><br>
2、去官網下載源碼全部覆蓋升級，如果您自己修改，請謹慎覆蓋。<br>
3、根據列表升級安裝。
</div>
