<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	{params}
	var mid = params.mid,wherearr=[];
	var a = $('#menu_{rand}').bootstable({
		tablename:'im_menu',modenum:'yymenu',
		url:js.getajaxurl('menudata','{mode}','{dir}',{mid:mid}),
		tree:true,celleditor:true,
		columns:[{
			text:'名稱',dataIndex:'name',align:'left',renderer:function(v,a){
				return '<font color="'+a.color+'">'+v+'</font>';
			}
		},{
			text:'編號',dataIndex:'num',editor:true
		},{
			text:'URL/條件編號',dataIndex:'url',editor:true
		},{
			text:'類型',dataIndex:'type',renderer:function(v){
				var s='條件編號';
				if(v==1)s='URL';
				return s;
			}
		},{
			text:'排序號',dataIndex:'sort',editor:true
		},{
			text:'PID',dataIndex:'pid'
		},{
			text:'顏色',dataIndex:'color',editor:true
		},{
			text:'ID',dataIndex:'id'	
		}],
		itemclick:function(){
			btn(false);
		},
		load:function(d){
			wherearr=d.wherearr;
		}
	});
	
	function btn(bo){
		get('del_{rand}').disabled = bo;
		get('edit_{rand}').disabled = bo;
		get('down_{rand}').disabled = bo;
	}
	
	var c = {
		del:function(){
			a.del({check:function(lx){if(lx=='yes')btn(true)}});
		},
		reload:function(){
			a.reload();
		},
		clickwin:function(o1,lx){
			var h = $.bootsform({
				title:'應用菜單',height:300,width:400,
				tablename:'im_menu',isedit:lx,
				params:{int_filestype:'sort,type,mid,pid'},
				submitfields:'num,name,url,sort,type,mid,pid,color',
				items:[{
					labelText:'編號',name:'num'
				},{
					labelText:'菜單名稱',name:'name',required:true
				},{
					labelText:'類型',name:'type',type:'select',store:[{id:'0',name:'條件編號'},{id:'1',name:'URL'}],valuefields:'id',displayfields:'name'
				},{
					labelText:'條件編號',name:'typesele',type:'select',store:wherearr,valuefields:'num',displayfields:'name'
				},{
					labelText:'URL/條件編號',name:'url'
				},{
					labelText:'上級ＩＤ',name:'pid',required:true,value:'0',type:'number'
				},{
					labelText:'序號',name:'sort',type:'number',value:'0'
				},{
					labelText:'顏色',name:'color'
				},{
					labelText:'mid',name:'mid',type:'hidden',value:'0'
				}],
				success:function(){
					a.reload();
				}
			});
			if(lx==1)h.setValues(a.changedata);
			h.getField('name').focus();
			if(lx==2)h.setValue('pid', a.changedata.id);
			h.setValue('mid',mid);
			$(h.form.type).change(function(){
				h.form.typesele.disabled=(this.value!='0');
			});
			$(h.form.typesele).change(function(){
				h.form.url.value = this.value;
			});
		}
	};
	js.initbtn(c);
});

</script>

<div>
<ul class="floats">
	<li class="floats50">
		<button class="btn btn-primary" click="clickwin,0" type="button"><i class="icon-plus"></i> 新增頂級</button> &nbsp; 
		<button class="btn btn-success" click="clickwin,2" id="down_{rand}" disabled type="button"><i class="icon-plus"></i> 新增下級</button> &nbsp; 
		<button class="btn btn-default" click="reload" type="button">刷新</button>
	</li>
	<li class="floats50" style="text-align:right">
		<button class="btn btn-danger" id="del_{rand}" click="del" disabled type="button"><i class="icon-trash"></i> 刪除</button> &nbsp; 
		<button class="btn btn-info" id="edit_{rand}" click="clickwin,1" disabled type="button"><i class="icon-edit"></i> 編輯 </button>
	</li>
</ul>
</div>
<div class="blank10"></div>
<div id="menu_{rand}"></div>
<div style="padding:5px;color:#888888">頂級菜單最多只能3個，多建將不會顯示，條件編號是在[流程模塊條件]下設置的編號，用于讀取數據條件過濾的。</div>
