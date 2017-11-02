<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	{params};
	var atype=params.atype;
	var a = $('#veiw_{rand}').bootstable({
		tablename:'file',celleditor:true,sort:'id',dir:'desc',modedir:'{mode}:{dir}',params:{'atype':atype},fanye:true,
		storebeforeaction:'filebefore',
		columns:[{
			text:'類型',dataIndex:'fileext',renderer:function(v){
				var lxs = js.filelxext(v);
				return '<img src="web/images/fileicons/'+lxs+'.gif">';
			}
		},{
			text:'名稱',dataIndex:'filename',align:'left'
		},{
			text:'大小',dataIndex:'filesizecn',sortable:true
		},{
			text:'上傳時間',dataIndex:'adddt',sortable:true
		},{
			text:'創建人',dataIndex:'optname',sortable:true
		},{
			text:'IP',dataIndex:'ip'
		},{
			text:'瀏覽器',dataIndex:'web'
		},{
			text:'下載次數',dataIndex:'downci',sortable:true
		},{
			text:'關聯表',dataIndex:'mtype'
		},{
			text:'關聯表ID',dataIndex:'mid'
		},{
			text:'ID',dataIndex:'id',sortable:true
		},{
			text:'',dataIndex:'opt',renderer:function(v,d,oi){
				return '<a href="javascript:;" onclick="showvies{rand}('+oi+')">查看</a>';
			}
		}],
		itemclick:function(){
			btn(false);
		}
	});
	
	showvies{rand}=function(oi){
		var d=a.getData(oi);
		if(js.isimg(d.fileext)){
			$.imgview({url:d.filepath});
		}else{
			js.downshow(d.id)
		}
	}
	
	var c = {
		del:function(){
			a.del({url:js.getajaxurl('delfile','{mode}','{dir}')});
		},
		search:function(){
			var s=get('key_{rand}').value;
			a.setparams({key:s},true);
		}
	};
	
	function btn(bo){
		get('del_{rand}').disabled = bo;
	}
	js.initbtn(c);
});
</script>


<div>


<table width="100%"><tr>
	<td>
		<input class="form-control" style="width:180px" id="key_{rand}"   placeholder="文件名/創建人/關聯表">
	</td>
	<td style="padding-left:10px">
		<button class="btn btn-default" click="search" type="button">搜索</button> 
	</td>
	
	
	
	<td width="80%"></td>
	<td align="right" nowrap>
	
		<button class="btn btn-danger" id="del_{rand}" click="del" disabled type="button"><i class="icon-trash"></i> 刪除</button>
	</td>
</tr>
</table>
</div>
<div class="blank10"></div>
<div id="veiw_{rand}"></div>
<div class="tishi">提示：上傳的文件可能會在某些單據上，刪除請謹慎。</div>
