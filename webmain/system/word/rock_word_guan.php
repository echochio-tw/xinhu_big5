<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	{params};
	var num = params.num,pid,optlx=0,movefid='',showlx=params.showlx;
	var typeid=0,sspid=0;
	if(!showlx)showlx = '0';
	var sname = '個人';
	if(showlx=='1'){
		sname = '部門';
	}
	var at = $('#optionview_{rand}').bootstree({
		url:js.getajaxurl('getmywordtype','word','system'),params:{showlx:showlx},
		columns:[{
			text:''+sname+'文檔類型',dataIndex:'name',align:'left',xtype:'treecolumn',width:'79%',renderer:function(v,d){
				var s1 = v;
				if(!isempt(d.recename))s1+='&nbsp;<span style="font-size:10px;color:#888888"><i  title="共享給：'+d.recename+'" class="icon-share-alt"></i></span>';
				return s1;
			}
		},{
			text:'序號',dataIndex:'sort',width:'20%'
		}],
		load:function(d){
			if(sspid==0){
				typeid = d.pid;
				sspid = d.pid;
				c.loadfile('0','所有文檔');
			}
		},
		itemdblclick:function(d){
			typeid = d.id;
			c.loadfile(d.id,d.name);
		},
		itemclick:function(d){
			c.typeclidks(d);
			c.ismoveok(d);
		}
	});
	
	var a = $('#view_{rand}').bootstable({
		tablename:'file',celleditor:true,autoLoad:false,checked:true,modedir:'{mode}:{dir}',storebeforeaction:'wordbeforeaction',fanye:true,params:{showlx:showlx},
		columns:[{
			text:'',dataIndex:'fileext',renderer:function(v){
				var lxs = js.filelxext(v);
				return '<img src="web/images/fileicons/'+lxs+'.gif">';
			}
		},{
			text:'名稱',dataIndex:'filename',editor:true,align:'left'
		},{
			text:'大小',dataIndex:'filesizecn',sortable:true
		},{
			text:'添加時間',dataIndex:'optdt',sortable:true
		},{
			text:'分類',dataIndex:'typename'
		},{
			text:'上傳者',dataIndex:'optname'
		},{
			text:'共享給',dataIndex:'shate'
		},{
			text:'文件ID',dataIndex:'id'
		},{
			text:'下載次數',dataIndex:'downci',sortable:true
		},{
			text:'',dataIndex:'opt',renderer:function(v,d,oi){
				return '<a href="javascript:;" onclick="showvies{rand}('+oi+',0)">預覽</a>&nbsp;<a href="javascript:;" onclick="showvies{rand}('+oi+',1)"><i class="icon-arrow-down"></i></a>';
			}
		}],
		itemclick:function(){
			get('del_{rand}').disabled=false;
		},
		beforeload:function(){
			get('del_{rand}').disabled=true;
		}
	});
	_editfacech{rand}angback=function(a,typeid,pars2,sid){
		c.savefile(typeid, sid);
	};
	showvies{rand}=function(oi,lx){
		var d=a.getData(oi);
		if(lx==1){
			js.downshow(d.id)
		}else{
			if(js.isimg(d.fileext)){
				$.imgview({url:d.filepath,downbool:false});
			}else{
				openxiangs(d.filename,'?m=public&a=fileviewer&id='+d.id+'&wintype=max');
			}
		}
	}
	var c = {
		reload:function(){
			at.reload();
		},
		uploadfile:function(){
			var na = at.changedata.name;
			if(!na)na='文件';
			js.upload('_editfacech{rand}angback',{'title':'上傳'+na+'','params1':typeid});	
		},
		loadfile:function(spd,nsd){
			$('#megss{rand}').html(nsd);
			a.setparams({'typeid':spd}, true);
		},
		genmu:function(){
			typeid = sspid;
			at.changedata={};
			this.loadfile('0','所有文檔');
		},
		savefile:function(tps, sid){
			if(sid=='')return;
			js.ajax(js.getajaxurl('savefile','{mode}','{dir}'),{'typeid':tps,'sid':sid},function(s){
				a.reload();
			},'get',false, '保存中...,保存成功');
		},
		sharefile:function(){
			var fid = a.getchecked();
			if(fid==''){js.msg('msg','沒有選中');return;}
			var cans = {
				type:'deptusercheck',
				title:'共享給...',
				callback:function(sna,sid){
					if(sid)c.sharefiles(sna,sid, fid);
				}
			}
			js.getuser(cans);
		},
		sharefiles:function(sna,sid, fid){
			if(sid==''||fid=='')return;
			js.ajax(js.getajaxurl('sharefile','{mode}','{dir}'),{'sid':sid,'sna':sna,'fid':fid},function(s){
				a.reload();
			},'post',false, '共享中...,共享成功');
		},
		qxsharefile:function(){
			var fid = a.getchecked();
			if(fid==''){js.msg('msg','沒有選中');return;}
			js.ajax(js.getajaxurl('sharefile','{mode}','{dir}'),{'fid':fid},function(s){
				a.reload();
			},'post',false, '取消共享中...,取消成功');
		},
		movefile:function(){
			var fid = a.getchecked();
			if(fid==''){js.msg('msg','沒有選中');return;}
			movefid=fid;
			js.msg('success','已選中，請在5秒內選擇左邊類型確認移動');
			clearTimeout(this.cmoeefese);
			this.cmoeefese=setTimeout(function(){movefid='';},5000);
		},
		typeclidks:function(d){
			if(movefid=='')return;
			js.confirm('確定將選中的文件移動到【'+d.name+'】下嗎？',function(jg){
				if(jg=='yes'){
					c.movefiles(d.id, movefid);
				}
			});
		},
		movefiles:function(tid, moid){
			if(moid=='')return;
			movefid='';
			js.ajax(js.getajaxurl('movefile','{mode}','{dir}'),{'fid':moid,'tid':tid},function(s){
				a.reload();
			},'post',false, '移動中...,移動成功');
		},
		clicktypeeidt:function(){
			var d = at.changedata;
			if(d.id)c.clicktypewin(false, 1, d);
		},
		clicktypewin:function(o1, lx, da){
			var h = $.bootsform({
				title:'文檔類型',height:250,width:300,
				tablename:'option',labelWidth:50,
				isedit:lx,submitfields:'name,sort,pid',cancelbtn:false,
				items:[{
					labelText:'名稱',name:'name',required:true
				},{
					labelText:'上級id',name:'pid',value:0,type:'hidden'
				},{
					labelText:'排序號',name:'sort',type:'number',value:0
				}],
				success:function(){
					if(optlx==0)at.reload();
					if(optlx==1)a.reload();
				}
			});
			if(lx==1)h.setValues(da);
			if(lx==0)h.setValue('pid', typeid);
			optlx = 0;
			return h;
		},
		typedel:function(o1){
			at.del({
				url:js.getajaxurl('deloption','option','system'),params:{'stable':'word'}
			});
		},
		del:function(){
			a.del({url:js.getajaxurl('delword','{mode}','{dir}')});
		},
		movedata:false,
		move:function(){
			var d = at.changedata;
			if(!d){js.msg('msg','沒有選中行');return;}
			this.movedata = d;
			js.msg('success','請在5秒內選擇其他類型確認移動');
			clearTimeout(this.cmoeefese);
			this.cmoeefese=setTimeout(function(){c.movedata=false;},5000);
		},
		ismoveok:function(d){
			var md = this.movedata;
			if(md && md.id!=d.id){
				js.confirm('確定要將['+md.name+']移動到['+d.name+']下嗎？',function(jg){
					if(jg=='yes'){
						c.movetoss(md.id,d.id,0);
					}
				});
			}
		},
		moveto:function(){
			var d = at.changedata;if(!d)return;
			js.confirm('確定要將['+d.name+']移動到頂級嗎？',function(jg){
				if(jg=='yes'){
					c.movetoss(d.id,sspid,1);
				}
			});
		},
		movetoss:function(id,toid,lx){
			js.ajax(js.getajaxurl('movetype','option','system'),{'id':id,'toid':toid,'lx':lx},function(s){
				if(s!='ok'){
					js.msg('msg', s);
				}else{
					at.reload();
				}
			},'get',false, '移動中...,移動成功');
			c.movedata=false;
		},
		floadshate:function(){
			var d = at.changedata;
			if(!d){js.msg('msg','沒有選中行');return;}
			if(isempt(d.receid)){
				var cans = {
					type:'deptusercheck',
					title:'文檔['+d.name+']共享給...',
					callback:function(sna,sid){
						if(sid)c.floadshates(sna,sid, d.id);
					}
				}
				js.getuser(cans);
			}else{
				js.confirm('確定要將['+d.name+']取消共享嗎？',function(jg){
					if(jg=='yes'){
						c.floadshatess(d.id);
					}
				});
			}
		},
		floadshates:function(sna,sid,fid){
			if(sid==''||fid=='')return;
			js.ajax(js.getajaxurl('sharefileer','{mode}','{dir}'),{'sid':sid,'sna':sna,'fid':fid},function(s){
				at.reload();
			},'post',false, '共享中...,共享成功');
		},
		floadshatess:function(fid){
			if(fid=='')return;
			js.ajax(js.getajaxurl('sharefileer','{mode}','{dir}'),{'sid':'','sna':'','fid':fid},function(s){
				at.reload();
			},'get',false, '取消中...,取消成功');
		}
	};
	js.initbtn(c);
	$('#optionview_{rand}').css('height',''+(viewheight-70)+'px');
});
</script>


<table width="100%">
<tr valign="top">
<td width="220">
	<div style="border:1px #cccccc solid">
	  <div id="optionview_{rand}" style="height:400px;overflow:auto;"></div>
	  <div  class="panel-footer">
		<a href="javascript:" title="新增" click="clicktypewin,0" onclick="return false"><i class="icon-plus"></i></a>&nbsp; &nbsp;
		<a href="javascript:" title="編輯" click="clicktypeeidt" onclick="return false"><i class="icon-edit"></i></a>&nbsp; &nbsp;
		<a href="javascript:" title="刪除" click="typedel" onclick="return false"><i class="icon-trash"></i></a>&nbsp; &nbsp;
		<a href="javascript:" title="刷新" click="reload" onclick="return false"><i class="icon-refresh"></i></a>&nbsp; &nbsp;
		<a href="javascript:" title="移動" click="move" onclick="return false"><i class="icon-move"></i></a>&nbsp; &nbsp;
		<a href="javascript:" title="移動到頂級" click="moveto" onclick="return false"><i class="icon-arrow-up"></i></a>
		&nbsp; 
		<a href="javascript:" title="共享/取消共享" click="floadshate" onclick="return false"><i class="icon-share-alt"></i></a>
	  </div>
	</div>  
</td>
<td width="10"></td>
<td>	
	<div>
	<table width="100%"><tr>
		<td align="left">
			<button class="btn btn-primary" click="uploadfile"  type="button"><i class="icon-upload-alt"></i> 上傳文件</button>&nbsp; 
			<button class="btn btn-default" click="genmu"  type="button">所有文檔</button>&nbsp; 
			<span id="megss{rand}"></span>
		</td>
		
		<td align="right">
			<button class="btn btn-default" click="sharefile" type="button"><i class="icon-share-alt"></i> 共享</button>&nbsp; 
			<button class="btn btn-default" click="qxsharefile" type="button">取消共享</button>&nbsp; 
			<button class="btn btn-default" click="movefile" type="button">移動</button>&nbsp; 
			<button class="btn btn-danger" id="del_{rand}" disabled click="del" type="button"><i class="icon-trash"></i> 刪除</button>
		</td>
	</tr></table>
	</div>
	<div class="blank10"></div>
	<div id="view_{rand}"></div>
</td>
</tr>
</table>
