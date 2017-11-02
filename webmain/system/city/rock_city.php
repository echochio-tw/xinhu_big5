<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	var type = 0,pid=0;
	var a = $('#veiw_{rand}').bootstable({
		tablename:'city',celleditor:true,sort:'sort',dir:'asc',url:js.getajaxurl('getdata','{mode}','{dir}'),
		columns:[{
			text:'名稱',dataIndex:'name',editor:true,align:'left'
		},{
			text:'拼音',dataIndex:'pinyin',editor:true,sortable:true
		},{
			text:'拼音簡稱',dataIndex:'pinyins',editor:true
		},{
			text:'排序號',dataIndex:'sort',editor:true,sortable:true
		},{
			text:'級別',dataIndex:'type'
		},{
			text:'ID',dataIndex:'id',sortable:true	
		},{
			text:'',dataIndex:'opt',renderer:function(v,d){
				return '<a href="javascript:;" onclick="opensho{rand}('+d.id+')">打開</a>';
			}
		}],
		itemclick:function(){
			btn(false);
		},
		load:function(ds){
			var darr = ds.path;
			var s = '<a href="javascript:;" onclick="opensho{rand}(0)">頂級</a>';
			for(var i=0;i<darr.length;i++){
				s+='/<a href="javascript:;" onclick="opensho{rand}('+darr[i].id+')">'+darr[i].name+'</a>';
			}
			$('#path_{rand}').html(s);
			type = ds.type;
			pid = ds.pid;
			btn(true);
		},
		beforeload:function(){
			btn(true);
		}
	});
	
	var c = {
		del:function(){
			a.del({url:js.getajaxurl('deldata','{mode}','{dir}')});
		},
		open:function(id){
			a.setparams({id:id}, true);
		},
		clickwin:function(o1,lx){
			var h = $.bootsform({
				title:'城市',height:300,width:400,
				tablename:'city',isedit:lx,
				submitfields:'name,pinyin,pinyins,type,pid',
				items:[{
					labelText:'名稱',name:'name',required:true
				},{
					labelText:'拼音',name:'pinyin'
				},{
					labelText:'拼音簡稱',name:'pinyins'
				},{
					labelText:'',name:'type',type:'hidden'
				},{
					labelText:'',name:'pid',type:'hidden'
				},{
					labelText:'序號',name:'sort',type:'number',value:'0'
				}],
				success:function(){
					a.reload();
				}
			});
			h.setValue('type', type);
			h.setValue('pid', pid);
			if(lx==1){
				h.setValues(a.changedata);
			}
			h.getField('name').focus();
		},
		refresh:function(){
			a.reload();
		},
		initdata:function(o1){
			js.msg('wait','處理中...');
			o1.disabled=true;
			js.ajax(js.getajaxurl('initdata','{mode}','{dir}'),false,function(ret){
				if(ret.success){
					js.msg('success', ret.data);
					a.reload();
				}else{
					o1.disabled=false;
					js.msg('msg', ret.msg);
				}
			},'get,json');
		}
	};
	
	function btn(bo){
		get('del_{rand}').disabled = bo;
		get('edit_{rand}').disabled = bo;
	}
	js.initbtn(c);
	opensho{rand}=function(id){
		c.open(id);
	}
});
</script>


<div>

<table width="100%"><tr>
	<td nowrap>
		<button class="btn btn-primary" click="clickwin,0" type="button"><i class="icon-plus"></i> 新增</button> &nbsp; 
		<button class="btn btn-default" click="refresh" type="button"><i class="icon-refresh"></i> 刷新</button> &nbsp;  
		<button class="btn btn-default" click="initdata" type="button">導入數據</button> 
	</td>
	
	<td width="80%">
		&nbsp; 當前路徑：<span id="path_{rand}"></span>
	</td>
	<td align="right" nowrap>

		<button class="btn btn-danger" id="del_{rand}" click="del" disabled type="button"><i class="icon-trash"></i> 刪除</button> &nbsp; 
		<button class="btn btn-info" id="edit_{rand}" click="clickwin,1" disabled type="button"><i class="icon-edit"></i> 編輯 </button>
	</td>
</tr>
</table>
</div>
<div class="blank10"></div>
<div id="veiw_{rand}"></div>
<div class="tishi"></div>