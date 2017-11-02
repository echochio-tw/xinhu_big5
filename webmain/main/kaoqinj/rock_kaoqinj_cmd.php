<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	
	var lobdds=false;
	var a = $('#view_{rand}').bootstable({
		tablename:'kqjcmd',celleditor:true,fanye:true,sort:'optdt',dir:'desc',
		url:publicstore('{mode}','{dir}'),storeafteraction:'kqjcmdafter',storebeforeaction:'kqjcmdbefore',checked:true,
		columns:[{
			text:'設備名稱',dataIndex:'name'
		},{
			text:'設備號',dataIndex:'num'
		},{
			text:'設備ID',dataIndex:'snid'
		},{
			text:'顯示公司名稱',dataIndex:'company'
		},{
			text:'命令類型',dataIndex:'atype',sortable:true
		},{
			text:'狀態',dataIndex:'status',sortable:true
		},{
			text:'添加時間',dataIndex:'optdt',sortable:true
		},{
			text:'請求時間',dataIndex:'qjtime',sortable:true
		},{
			text:'設備回復時間',dataIndex:'cjtime',sortable:true
		},{
			text:'相關ID',dataIndex:'others'
		},{
			text:'ID',dataIndex:'id'
		}],
		load:function(d){
			if(!lobdds){
				js.setselectdata(get('snid_{rand}'),d.kqsnarr,'id');
			}
			lobdds=true;
		}
	});
	

	var c = {
		del:function(){
			a.del({checked:true,url:js.getajaxurl('kqjcmddel','{mode}','{dir}')});
		},
		search:function(){
			var s=get('key_{rand}').value;
			a.setparams({key:s,snid:get('snid_{rand}').value},true);
		}
	};
	

	js.initbtn(c);
	
});
</script>
<div>
<table width="100%"><tr>
	<td>
		<select class="form-control" style="width:300px" id="snid_{rand}" ><option value="0">-所有設備-</option></select>
	</td>
	<td  style="padding-left:10px">
		<input class="form-control" style="width:150px" id="key_{rand}"  placeholder="關鍵詞">
	</td>
	
	<td  style="padding-left:10px">
		<button class="btn btn-default" click="search" type="button">搜索</button>
	</td>
	<td width="100%"></td>
	<td align="right" nowrap>
		<button class="btn btn-danger" click="del" type="button"><i class="icon-trash"></i> 刪除</button>
		
	</td>
</tr></table>
</div>
<div class="blank10"></div>
<div id="view_{rand}"></div>