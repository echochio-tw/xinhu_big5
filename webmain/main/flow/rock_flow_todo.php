<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	{params};
	var num = params.num,mid,modeid=0,bools=false;
	
	function btn(bo){
		get('edit_{rand}').disabled = bo;
		get('del_{rand}').disabled = bo;
	}
	
	var changearr={'boturn':'提交時','boedit':'編輯時','bochang':'字段改變時','bodel':'刪除時','bozuofei':'作廢時','botong':'步驟處理通過時','bobutong':'步驟處理不通過時','bofinish':'處理完成時','bozhui':'追加說明時','bozhuan':'轉辦時','botask':'計劃任務'};
	
	var a = $('#view_{rand}').bootstable({
		tablename:'flow_todo',celleditor:true,modedir:'{mode}:{dir}',
		storeafteraction:'flowtodoafter',storebeforeaction:'flowtodobefore',
		columns:[{
			text:'模塊',dataIndex:'modename'
		},{
			text:'名稱',dataIndex:'name',editor:true
		},{
			text:'觸發條件',dataIndex:'whereidstr'
		},{
			text:'觸發類型',dataIndex:'changeopt',align:'left',renderer:function(v,d, oi){
				var s='&nbsp;',f;
				for(f in changearr)if(d[f]=='1'){
					s+=''+changearr[f]+'';
					if(f=='botask'){
						if(d.remindrs)s+='('+d.remindrs.ratecont+')';
						s+='<a onclick="setpnvlsls{rand}('+oi+')" href="javascript:;">[提醒時間]</a>';
					}
					s+=';';
				}
				return s;
			}
		},{
			text:'編號',dataIndex:'num',editor:true
		},{
			text:'變化字段',dataIndex:'changefields'
		},{
			text:'處理步驟Id',dataIndex:'changecourse'
		},{
			text:'說明',dataIndex:'explain',editor:true
		},{
			text:'狀態',dataIndex:'status',type:'checkbox',editor:true,sortable:true
		},{
			text:'通知給',dataIndex:'recename',renderer:function(v,d){
				var s='&nbsp;';
				if(d.toturn=='1')s+='提交人;';
				if(d.tocourse=='1')s+='流程所有參與人;';
				if(!isempt(v))s+=''+v+';';
				return s;
			}
		},{
			text:'通知給字段',dataIndex:'todofields'
		},{
			text:'通知內容摘要',dataIndex:'summary'
		},{
			text:'ID',dataIndex:'id'
		}],
		load:function(a){
			if(!bools){
				var s = '<option value="0">-選擇模塊-</option>',len=a.flowarr.length,i,csd,types='';
				for(i=0;i<len;i++){
					csd = a.flowarr[i];
					if(types!=csd.type){
						if(types!='')s+='</optgroup>';
						s+='<optgroup label="'+csd.type+'">';
					}
					s+='<option value="'+csd.id+'">'+csd.name+'</option>';
					types = csd.type;
				}
				$('#mode_{rand}').html(s);
			}
			guanflowtodowherelist = [a.wherelist,a.fielslist,a.courselist];
			bools=true;
		},
		itemclick:function(){
			btn(false);
		},
		beforeload:function(){
			btn(true);
		}
	});
	var c = {
		reload:function(){
			a.reload();
		},
		del:function(){
			a.del();
		},
		clickwin:function(o1,lx){
			if(modeid==0){
				js.msg('msg','請先選擇模塊');
				return;
			}
			var moen= get('mode_{rand}');
			var nd  = moen.options[moen.selectedIndex].text;
			var icon='plus',name='新增['+nd+']單據通知',id=0;
			if(lx==1){
				id = a.changeid;
				icon='edit';
				name='編輯['+nd+']單據通知';
			};
			guanflowtodolist = a;
			addtabs({num:'flowtodo'+id+'',url:'main,flow,todoedit,id='+id+',setid='+modeid+',',icons:icon,name:name});
		},
		changemode:function(){
			modeid=this.value;
			a.setparams({mid:modeid},true);
			var bo = (modeid==0);
			get('add_{rand}').disabled = bo;
		},
		setpinlv:function(oi){
			var d = a.getData(oi);
			var mid = d.remindrs ? d.remindrs.id : '0';
			openinput('提醒設置','remind',''+mid+'&def_modenum=flowtodo&def_mid='+d.id+'&def_explain=basejm_'+jm.base64encode(d.summary)+'', 'reslsds{rand}');
		}
	};
	js.initbtn(c);
	$('#mode_{rand}').change(c.changemode);
	
	setpnvlsls{rand}=function(oi){
		c.setpinlv(oi);
	}
	reslsds{rand}=function(){
		c.reload();
	}
});
</script>

<table width="100%">
<tr>
<td align="left">
	<button class="btn btn-primary" click="clickwin,0" disabled id="add_{rand}" type="button"><i class="icon-plus"></i> 新增單據通知</button>
</td>
<td  style="padding-left:10px;">
	<button class="btn btn-default" click="reload" type="button">刷新</button>
</td>
<td style="padding-left:10px;">
	<select style="width:200px" id="mode_{rand}" class="form-control" ><option value="0">-選擇模塊-</option></select>
</td>
<td width="80%"></td>
<td align="right" nowrap>
	<button class="btn btn-info" id="edit_{rand}" click="clickwin,1" disabled type="button"><i class="icon-edit"></i> 編輯 </button> &nbsp; 
			<button class="btn btn-danger" id="del_{rand}" disabled click="del" type="button"><i class="icon-trash"></i> 刪除</button>
</td>
</tr>
</table>

<div class="blank10"></div>
<div id="view_{rand}"></div>
<div class="tishi">此功能設置的當流程單據操作時觸發通知給人員，當觸發類型是計劃任務時，該記錄需要設置提醒頻率。</div>
