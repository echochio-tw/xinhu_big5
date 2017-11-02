<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	{params}
	var atype='dist';
	var a = $('#view_{rand}').bootstable({
		tablename:'customer',params:{'atype':atype+'_wfp'},fanye:true,modenum:'customer',celleditor:false,checked:true,
		columns:[{
			text:'',dataIndex:'caozuo'
		},{
			text:'類型',dataIndex:'type'
		},{
			text:'名稱',dataIndex:'name'
		},{
			text:'單位名稱',dataIndex:'unitname'
		},{
			text:'來源',dataIndex:'laiyuan'
		},{
			text:'擁有者',dataIndex:'optname'
		},{
			text:'電話',dataIndex:'tel'
		},{
			text:'狀態',dataIndex:'status',sortable:true
		},{
			text:'供應商',dataIndex:'isgys',type:'checkbox',editor:true,sortable:true
		},{
			text:'共享給',dataIndex:'shate'
		},{
			text:'創建人',dataIndex:'createname'
		}],
		itemclick:function(){
			btn(false);
		},
		beforeload:function(){
			btn(true);
		}
	});
	
	function btn(bo){
		get('xiang_{rand}').disabled = bo;
	}
	
	var c = {
		del:function(){
			a.del();
		},
		reload:function(){
			a.reload();
		},
		view:function(){
			var d=a.changedata;
			openxiangs('客戶','customer',d.id);
		},
		changlx:function(o1,lx){
			$("button[id^='state{rand}']").removeClass('active');
			$('#state{rand}_'+lx+'').addClass('active');
			var as = ['all','yfp','wfp'];
			a.setparams({'atype':atype+'_'+as[lx]},true);
		},
		daochu:function(){
			a.exceldown(nowtabs.name);
		},
		clickwin:function(o1,lx){
			var id=0;
			if(lx==1)id=a.changeid;
			openinput('客戶', 'customer',id);
		},
		distss:function(o1,lx){
			var s = a.getchecked();
			if(s==''){js.msg('msg','沒有選中行');return;}
			if(lx==0){
				js.confirm('確定要將選中標為未分配嗎？',function(jg){
					if(jg=='yes')c.distssok(s, '','', 0);
				});
				return;
			}
			var cans = {
				type:'user',
				title:'選中分配給...',
				callback:function(sna,sid){
					if(sna=='')return;
					setTimeout(function(){
						js.confirm('確定要將選中記錄分配給：['+sna+']嗎？',function(jg){
							if(jg=='yes')c.distssok(s, sna,sid,1);
						});
					},10);
				}
			};
			js.getuser(cans);
		},
		distssok:function(s, sna,sid, lx){
			js.ajax(js.getajaxurl('distcust','{mode}','{dir}'),{sid:s,sname:sna,snid:sid,lx:lx},function(s){
				a.reload();
			},'post','','處理中...,處理成功');
		}
	};
	js.initbtn(c);
	
	if(atype!='my')$('#btnbnts_{rand}').remove();
});
</script>
<div>
	<table width="100%">
	<tr>
	<td id="btnbnts_{rand}" style="padding-right:10px" >
		<button class="btn btn-primary" click="clickwin,0" type="button"><i class="icon-plus"></i> 新增</button>
	</td>
	<td>
		<input class="form-control" style="width:180px" id="key_{rand}"   placeholder="名稱/擁有者">
	</td>
	<td style="padding-left:10px">
		<button class="btn btn-default" click="search" type="button">搜索</button> 
	</td>
	<td  width="90%" style="padding-left:10px">
		
		<div id="stewwews{rand}" class="btn-group">
		<button class="btn btn-default" id="state{rand}_0" click="changlx,0" type="button">全部狀態</button>
		<button class="btn btn-default" id="state{rand}_1" click="changlx,1" type="button">已分配</button>
		<button class="btn btn-default active" id="state{rand}_2" click="changlx,2" type="button">未分配</button>
		</div>	
	</td>
	
	
	<td align="right" nowrap>
		<button class="btn btn-default" click="distss,1" type="button">選中分配給</button> &nbsp; 
		<button class="btn btn-default" click="distss,0" type="button">標為未分配</button> &nbsp; 
		<button class="btn btn-default" id="xiang_{rand}" click="view" disabled type="button">詳情</button> &nbsp; 
		<button class="btn btn-default" click="daochu,1" type="button">導出</button> 
	</td>
	</tr>
	</table>
	
</div>
<div class="blank10"></div>
<div id="view_{rand}"></div>
<div class="tishi">客戶分配：客戶負責人是我/我下屬創建/我下屬客戶/我創建/屬于我客戶，可重新分配對應人員。</div>
