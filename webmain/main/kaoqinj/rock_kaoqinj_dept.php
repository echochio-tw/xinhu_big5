<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	{params}
	var xusnid = params.snid;if(!xusnid)xusnid='0';
	var at = $('#optionview_{rand}').bootstree({
		url:false,autoLoad:false,
		columns:[{
			text:'系統上部門',dataIndex:'name',align:'left',xtype:'treecolumn'
		}],
		itemdblclick:function(d){
			a.setparams({'deptid':d.id}, true);
		}
	});
	
	var ats = $('#optionviews_{rand}').bootstree({
		url:false,autoLoad:false,
		columns:[{
			text:'選中考勤機設備上部門',dataIndex:'name',align:'left',xtype:'treecolumn'
		}],
		itemdblclick:function(d){
			a.setparams({'deptid':d.id}, true);
		}
	});
	
	
	var a = $('#admin_{rand}').bootstable({
		tablename:'admin',sort:'sort',dir:'asc',fanye:true,url:publicstore('{mode}','{dir}'),
		storeafteraction:'kquserafter',checked:true,storebeforeaction:'kquserbefore',autoLoad:false,
		columns:[{
			text:'頭像',dataIndex:'face',renderer:function(v,d){
				if(isempt(v))v='images/noface.png';
				return '<img onclick="$.imgview({url:this.src})" src="'+v+'" height="24" width="24">';
			}
		},{
			text:'姓名',dataIndex:'name',sortable:true
		},{
			text:'部門',dataIndex:'deptname',align:'left'
		},{
			text:'職位',dataIndex:'ranking',sortable:true
		},{
			text:'ID',dataIndex:'id',sortable:true
		},{
			text:'人員狀態',dataIndex:'status',sortable:true,type:'checkbox'
		},{
			text:'考勤機狀態',dataIndex:'kqjzt'
		},{
			text:'指紋1',dataIndex:'fingerprint1'
		},{
			text:'指紋2',dataIndex:'fingerprint2'
		},{
			text:'設備頭像',dataIndex:'headpic'
		}],
		load:function(d){
			if(d.deptdata){
				at.loadData(d.deptdata);
			}
			if(d.kqsnarr){
				js.setselectdata(get('snid_{rand}'),d.kqsnarr,'id');
				get('snid_{rand}').value = xusnid;
				if(xusnid>0)get('downbtn_{rand}').disabled = false;
			}
			if(d.deptsdata){
				ats.loadData(d.deptsdata);
			}
			var str = '';
			if(d.nocunid)str='該考勤機設備上人員<font color=red>['+d.nocunid+']</font>在系統上可能不存在。';
			$('#tishi_{rand}').html(str);
		}
	});
	
	var c = {
		search:function(){
			var s=get('key_{rand}').value;
			a.setparams({key:s,snid:get('snid_{rand}').value},true);
		},
		init:function(){
			a.setparams({snid:xusnid},true);
		},
		changesnid:function(o1,lx){
			var snid = get('snid_{rand}').value;
			get('downbtn_{rand}').disabled = (snid=='0');
			this.search();
		},
		sendcmd:function(lx, name){
			var snid = get('snid_{rand}').value;
			if(snid=='0'){js.msg('msg','沒有選中考勤機設備');return;}
			var ids = a.getchecked();
			
			var nopd = ',getuser,delsuser,';//不需要判斷
			if(nopd.indexOf(','+lx+',')<0){
				if(ids==''){js.msg('msg','沒用復選框選中記錄');return;}
				var len = ids.split(',').length;
				if(len>20){js.msg('msg','一次最多只能選擇20個人員');return;}
			}
			
			if(lx=='getclockin' || lx=='getpic' || lx=='delclockin' || lx=='delpic'){
				this.getdakjil(name, lx, ids, snid);
				return;
			}
			
			if(name.indexOf('刪除')>=0){
				js.confirm('確定要發送命令['+name+']嗎？命令運行成功就不能恢復了，謹慎操作！', function(jg){
					if(jg=='yes')c.sendcmds(ids, snid,lx);
				});
			}else{
				this.sendcmds(ids, snid,lx);
			}
		},
		sendcmds:function(ids,snid,lx){
			js.ajax(js.getajaxurl('sendusercmd','{mode}','{dir}'),{uids:ids,snid:snid,'type':lx},function(ret){
				if(!ret.success){
					js.msg('msg', ret.msg);
				}else{
					a.reload();
					js.msg('success', ret.data);
				}
			},'get,json',false,'發送中...,已發送');
		},
		getdakjil:function(name,lxs,uids, snid){
			var h = $.bootsform({
				title:name,height:400,width:400,
				tablename:'getclockin',isedit:2,
				url:js.getajaxurl('sendusercmd','{mode}','{dir}',{'uids':uids,'type':lxs,'snid':snid}),
				submitfields:'startdt,enddt',
				items:[{
					labelText:'要獲取人員',name:'gtype',type:'select',valuefields:'id',displayfields:'name',store:[{name:'選中人員',id:0},{name:'設備上所有人員',id:1}],required:true,value:'0'
				},{
					labelText:'日期從',name:'startdt',type:'date'
				},{
					labelText:'到',name:'endddt',type:'date'
				}],
				success:function(d){
					js.msg('success',d.data);
					a.reload();
				}
			});
			h.form.endddt.value = js.now();
			h.form.startdt.value = js.now();
			h.isValid();
		}
	};
	js.initbtn(c);
	
	$('#optionview_{rand}').css('height',''+(viewheight-25)+'px');
	$('#optionviews_{rand}').css('height',''+(viewheight-25)+'px');
	$('#snid_{rand}').change(function(){
		c.changesnid();
	});
	
	
	$('#downbtn_{rand}').rockmenu({
		width:230,top:35,donghua:false,
		data:[{
			name:'上傳人員到設備',lx:'user'
		},{
			name:'上傳人員指紋到設備',lx:'fingerprint'
		},{
			name:'從設備上獲取所有人員',lx:'getuser'
		},{
			name:'系統不存在人員在設備上刪除',lx:'delsuser'
		},{
			name:'設備上人員刪除...',lx:'deluser'
		},{
			name:'從設備上獲取指紋',lx:'getfingerprint'
		},{
			name:'從設備上獲取頭像',lx:'getheadpic'
		},{
			name:'系統頭像上傳到設備',lx:'headpic'
		},{
			name:'獲取打卡記錄...',lx:'getclockin'
		},{
			name:'獲取打卡記錄和現場照片...',lx:'getpic'
		},{
			name:'刪除打卡記錄...',lx:'delclockin'
		},{
			name:'刪除現場照片...',lx:'delpic'
		}],
		itemsclick:function(d, i){
			c.sendcmd(d.lx, d.name);
		}
	});
	c.init();
});
</script>



<div>

<table width="100%">
<tr valign="top">
<td>
	<div style="border:1px #cccccc solid;width:220px">
	<div id="optionview_{rand}" style="height:400px;overflow:auto;"></div>
	</div>  
</td>

<td width="10" nowrap><div style="width:10px">&nbsp;</div></td>
<td width="95%">	
	
	<table width="100%"><tr>
		<td>
			<select class="form-control" style="width:270px" id="snid_{rand}" ><option value="0">-選擇要操作的考勤機設備-</option></select>
		</td>
		<td  style="padding-left:10px">
			<button class="btn btn-default" disabled id="downbtn_{rand}" type="button">選中設備操作 <i class="icon-angle-down"></i></button>
		</td>
		<td style="padding-left:10px">
			<input class="form-control" style="width:160px" id="key_{rand}"   placeholder="姓名/部門/職位">
		</td>
		<td  style="padding-left:10px">
			<button class="btn btn-default" click="search" type="button">搜索</button>
		</td>
		<td width="80%">
			
		</td>
		<td align="right" nowrap>
			
		</td>
	</tr>
	</table>
	</div>
	<div class="blank10"></div>
	<div id="admin_{rand}"></div>
	<div id="tishi_{rand}" class="tishi"></div>
</td>
<td width="10" nowrap><div style="width:10px">&nbsp;</div></td>
<td>
	<div style="border:1px #cccccc solid;width:220px">
	<div id="optionviews_{rand}" style="height:400px;overflow:auto;"></div>
	</div>  
</td>
</tr>
</table>