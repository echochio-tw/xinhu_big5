<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	var a = $('#view_{rand}').bootstable({
		tablename:'seal',celleditor:true,fanye:true,dir:'asc',sort:'sort',
		columns:[{
			text:'電子章圖片',dataIndex:'sealimg',renderer:function(v){
				var s='&nbsp;';
				if(!isempt(v))s='<img src="'+v+'" width="80">';
				return s;
			}
		},{
			text:'印章名稱',dataIndex:'name',align:'left'
		},{
			text:'印章類型',dataIndex:'type'
		},{
			text:'保管人',dataIndex:'bgname'
		},{
			text:'排序號',dataIndex:'sort',editor:true
		},{
			text:'說明',dataIndex:'explain'
		},{
			text:'',dataIndex:'caozuo'
		}]
	});
	var c = {
		clickwin:function(){
			openinput('印章','seal');
		}
	};

	js.initbtn(c);
});
</script>
<div>
<table width="100%"><tr>
	<td style="padding-right:10px">
		<button class="btn btn-primary" click="clickwin,0" type="button"><i class="icon-plus"></i> 新增</button>
	</td>
	<td  style="padding-left:10px">
		
	</td>

	
	<td width="80%"></td>
	<td align="right" nowrap>
		
	</td>
</tr></table>
</div>
<div class="blank10"></div>
<div id="view_{rand}"></div>
