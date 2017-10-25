<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){

	var modeid = 0;
	
	var a = $('#view_{rand}').bootstable({
		tablename:'flow_set',celleditor:true,fanye:true,params:{modeid:0},autoLoad:false,dir:'desc',sort:'id',statuschange:false,
		url:publicstore('{mode}','{dir}'),storebeforeaction:'viewshowbefore',storeafteraction:'viewshowafter',
		columns:[{
			text:'操作人',dataIndex:'optname',sortable:true
		},{
			text:'摘要',dataIndex:'summary',align:'left'
		},{
			text:'操作時間',dataIndex:'optdt',sortable:true
		},{
			text:'ID',dataIndex:'id',sortable:true
		},{
			text:'狀態',dataIndex:'status',sortable:true
		},{
			text:'處理記錄',dataIndex:'chushu',renderer:function(v,d,i){
				var s='&nbsp;';
				if(v>0)s=''+v+'<a href="javascript:;" onclick="openlogs{rand}('+i+')">查看</a>';
				return s;
			}
		}],
		itemclick:function(d){
			btn(false, d);
		},
		beforeload:function(){
			btn(true);
		},
		celldblclick:function(){
			c.view();
		}
	});
	function btn(bo, d){
		get('edit_{rand}').disabled = bo;
		get('del_{rand}').disabled = bo;
	}
	var c = {
		changemode:function(){
			var v=this.value;
			modeid=v;
			a.setparams({modeid:v},true);
		},
		del:function(){
			a.del({
				url:js.getajaxurl('delmodeshuju','{mode}','{dir}'),
				params:{modeid:modeid,mid:a.changeid}
			});
		},
		view:function(){
			var d=a.changedata;
			openxiangs(d.modename,d.modenum,d.id);
		},
		openviewlog:function(id){
			var d = a.getData(id);
			addtabs({name:'['+d.id+'.'+d.modename+']操作記錄','num':''+d.modenum+''+d.id+'',url:'main,flow,viewlog,modenum='+d.table+',mid='+d.id+''});
		}
	};
	$('#mode_{rand}').change(c.changemode);
	$.get(js.getajaxurl('getmodearr','{mode}','{dir}'),function(str){
		var d=js.decode(str);
		
		var s = '<option value="0">-選擇模塊-</option>',len=d.data.length,i,csd,types='';
		for(i=0;i<len;i++){
			csd = d.data[i];
			if(types!=csd.type){
				if(types!='')s+='</optgroup>';
				s+='<optgroup label="'+csd.type+'">';
			}
			s+='<option value="'+csd.id+'">'+csd.name+'</option>';
			types = csd.type;
		}
		$('#mode_{rand}').html(s);
	});
	js.initbtn(c);
	openlogs{rand}=function(id){
		c.openviewlog(id);
	}
});
</script>

<div>
	<table width="100%">
	<tr>
	<td align="left">
		<select style="width:180px" id="mode_{rand}" class="form-control" ><option value="0">-選擇模塊-</option></select>
	</td>
	<td align="left"  style="padding:0px 10px;">
		
	</td>
	<td align="right">
		
		<button class="btn btn-default" id="edit_{rand}" click="view" disabled type="button">查看</button>&nbsp; 
		<button class="btn btn-danger" click="del" disabled id="del_{rand}" type="button"><i class="icon-trash"></i> 刪除</button>
	</td>
	</tr>
	</table>
	
</div>
<div class="blank10"></div>
<div id="view_{rand}"></div>
<div class="tishi">提示：刪除將會是徹底刪除，不能恢復，請謹慎操作！如提示無刪除權限，請到[流程模塊→流程模塊權限]上添加權限。<div>
