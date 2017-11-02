<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	var a = $('#veiw_{rand}').bootstable({
		tablename:'dept',modenum:'dept',celleditor:true,
		url:js.getajaxurl('data','dept','system'),tree:true,
		columns:[{
			text:'名稱',dataIndex:'name',align:'left'
		},{
			text:'編號',dataIndex:'num',editor:true
		},{
			text:'負責人',dataIndex:'headman'
		},{
			text:'上級ID',dataIndex:'pid'
		},{
			text:'排序號',dataIndex:'sort',editor:true
		},{
			text:'ID',dataIndex:'id'	
		}],
		itemclick:function(d){
			btn(false,d);
		}
	});
	
	var c = {
		del:function(){
			a.del();
		},
		clickwin:function(o1,lx){
			var h = $.bootsform({
				title:'組織結構',height:400,width:400,
				tablename:'dept',isedit:lx,
				url:js.getajaxurl('publicsave','dept','system'),
				params:{int_filestype:'sort'},
				submitfields:'name,sort,headman,headid,pid,num',
				items:[{
					labelText:'名稱',name:'name',required:true
				},{
					labelText:'編號',name:'num'
				},{
					name:'headid',type:'hidden'
				},{
					labelText:'負責人',type:'changeuser',changeuser:{
						type:'usercheck',idname:'headid',title:'選擇部門負責人'
					},name:'headman',clearbool:true
				},{
					labelText:'上級ID',name:'pid',value:0,type:'number'
				},{
					labelText:'序號',name:'sort',type:'number',value:'0'
				}],
				success:function(){
					a.reload();
				}
			});
			if(lx==1){
				h.setValues(a.changedata);
			}
			h.getField('name').focus();
			return h;
		},
		clickdown:function(){
			if(a.changeid==0)return;
			var a1 = this.clickwin(false,0);
			a1.setValue('pid', a.changeid);
		}
	};
	
	function btn(bo,d){
		get('edit_{rand}').disabled = bo;
		get('down_{rand}').disabled = bo;
		if(d.id==1)bo=true;
		get('del_{rand}').disabled = bo;
	}
	
	js.initbtn(c);
});
</script>

<div>
<ul class="floats">
	<li class="floats50">
		<!--<button class="btn btn-primary" click="clickwin,0" type="button"><i class="icon-plus"></i> 新增</button> &nbsp;--> 
		<button class="btn btn-success" click="clickdown" id="down_{rand}" disabled type="button"><i class="icon-plus"></i> 新增下級</button>
	</li>
	<li class="floats50" style="text-align:right">
		<button class="btn btn-danger" id="del_{rand}" click="del" disabled type="button"><i class="icon-trash"></i> 刪除</button> &nbsp; 
		<button class="btn btn-info" id="edit_{rand}" click="clickwin,1" disabled type="button"><i class="icon-edit"></i> 編輯 </button>
	</li>
</ul>
</div>
<div class="blank10"></div>
<div id="veiw_{rand}"></div>
<div class="tishi">組織結構必須只能有一個最頂級的，ID必須為1，且不允許刪除</div>