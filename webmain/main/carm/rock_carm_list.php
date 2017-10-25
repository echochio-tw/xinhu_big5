<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	{params};
	var modenum='carm';
	var a = $('#view_{rand}').bootstable({
		tablename:modenum,celleditor:true,modenum:modenum,fanye:true,
		columns:[{
			text:'',dataIndex:'caozuo'
		},{
			text:'車牌號',dataIndex:'carnum'
		},{
			text:'車輛品牌',dataIndex:'carbrand'
		},{
			text:'型號',dataIndex:'carmode'
		},{
			text:'車輛類型',dataIndex:'cartype'
		},{
			text:'購買日期',dataIndex:'buydt',sortable:true
		},{
			text:'狀態',dataIndex:'state'
		},{
			text:'公開',dataIndex:'ispublic'
		},{
			text:'強險到期',dataIndex:'qxenddt',sortable:true
		},{
			text:'行駛證到期',dataIndex:'xszenddt',sortable:true
		},{
			text:'商業險到期',dataIndex:'syxenddt',sortable:true
		},{
			text:'年審截到期',dataIndex:'nsenddt',sortable:true
		}]
	});

	var c = {
		reload:function(){
			at.reload();
		},
		del:function(){
			a.del();
		},
		daochu:function(){
			a.exceldown();
		},
		adds:function(){
			openinput('車輛管理',modenum);
		},
		search:function(){
			var s=get('key_{rand}').value;
			a.setparams({key:s},true);
		}
	};
	js.initbtn(c);
});
</script>


<div>
<table width="100%"><tr>
	<td align="left" nowrap>
		<button class="btn btn-primary" click="adds"  type="button"><i class="icon-plus"></i> 新增</button>&nbsp; 
	</td>
	
	<td style="padding-left:10px">
		<input class="form-control" style="width:200px" id="key_{rand}"   placeholder="車牌號">
	</td>
	<td style="padding-left:10px">
		<button class="btn btn-default" click="search" type="button">搜索</button> 
	</td>
	<td width="90%">
		
	</td>
	<td align="right">
		<button class="btn btn-default"  click="daochu" type="button">導出</button>
	</td>
</tr></table>
</div>
<div class="blank10"></div>
<div id="view_{rand}"></div>
