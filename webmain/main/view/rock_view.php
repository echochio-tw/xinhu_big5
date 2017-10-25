<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	var bools=false,mid=0;
	var a = $('#view_{rand}').bootstable({
		tablename:'flow_extent',celleditor:true,fanye:true,sort:'id',dir:'desc',
		url:publicstore('{mode}','{dir}'),storeafteraction:'afterstroesss',
		columns:[{
			text:'針對對象',dataIndex:'recename'
		},{
			text:'模塊',dataIndex:'modename',sortable:true
		},{
			text:'類型',dataIndex:'type',sortable:true,renderer:function(oi){
				var as=['查看','添加','編輯','刪除','導入'];
				return '可'+as[oi]+'';
			}
		},{
			text:'條件',dataIndex:'whereid'
		},{
			text:'並條件',dataIndex:'wherestr',renderer:function(v){
				return jm.base64decode(v);
			}
		},{
			text:'說明',dataIndex:'explain'
		},{
			text:'狀態',dataIndex:'status',type:'checkbox',editor:true,sortable:true
		},{
			text:'ID',dataIndex:'id'
		}],
		itemclick:function(d){
			mid=d.modeid;
			btn(false, d);
		},
		beforeload:function(){
			btn(true);
		},
		load:function(a){
			if(!bools){
				var s = '<option value="0">-選擇模塊-</option>',len=a.modearr.length,i,csd,types='';
				for(i=0;i<len;i++){
					csd = a.modearr[i];
					if(types!=csd.type){
						if(types!='')s+='</optgroup>';
						s+='<optgroup label="'+csd.type+'">';
					}
					s+='<option value="'+csd.id+'">'+csd.name+'</option>';
					types = csd.type;
				}
				$('#mode_{rand}').html(s);
			}
			bools=true;
		}
	});
	function btn(bo, d){
		get('edit_{rand}').disabled = bo;
		get('del_{rand}').disabled = bo;
	}
	var c = {
		del:function(){
			a.del();
		},
		reload:function(){
			a.reload();
		},
		clickwin:function(o1,lx){
			if(mid==0){
				js.msg('msg','請先選擇模塊');
				return;
			}
			var icon='plus',name='新增流程模塊權限',id=0;
			if(lx==1){
				id = a.changeid;
				icon='edit';
				name='編輯流程模塊權限';
			};
			guanflowviewlist = a;
			addtabs({num:'flowview'+id+'',url:'main,view,edit,id='+id+',mid='+mid+'',icons:icon,name:name});
		},
		changemode:function(){
			var v=this.value;
			mid=v;
			a.search('and modeid='+v+'');
		}
	};
	js.initbtn(c);
	$('#mode_{rand}').change(c.changemode);
});
</script>

<div>
	<table width="100%">
	<tr>
	<td align="left">
		<button class="btn btn-warning" click="clickwin,0" type="button"><i class="icon-plus"></i> 新增</button>
	</td>
	<td style="padding-left:10px">
		<select style="width:230px" id="mode_{rand}" class="form-control" ><option value="0">-選擇模塊-</option></select>
	</td>
	<td width="90%">
		
	</td>
	<td nowrap>
		
		<button class="btn btn-info" id="edit_{rand}" click="clickwin,1" disabled type="button"><i class="icon-edit"></i> 編輯 </button>&nbsp; 
		<button class="btn btn-danger" click="del" disabled id="del_{rand}" type="button"><i class="icon-trash"></i> 刪除</button>
	</td>
	</tr>
	</table>
	
</div>
<div class="blank10"></div>
<div id="view_{rand}"></div>
<div class="tishi">提示：多條將是或者的關系<div>
