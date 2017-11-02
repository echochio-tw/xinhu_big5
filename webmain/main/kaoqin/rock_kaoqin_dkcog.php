<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	var a = $('#view_{rand}').bootstable({
		tablename:'userinfo',celleditor:true,fanye:true,
		url:publicstore('{mode}','{dir}'),storeafteraction:'kqtotalaftershow',storebeforeaction:'kqtotalbeforeshow',
		columns:[{
			text:'部門',dataIndex:'deptname',align:'left',sortable:true
		},{
			text:'姓名',dataIndex:'name',sortable:true
		},{
			text:'職位',dataIndex:'ranking'
		},{
			text:'在線打卡IP',dataIndex:'dkip'
		},{
			text:'在線打卡MAC地址',dataIndex:'dkmac'
		},{
			text:'ID',dataIndex:'id'
		}],
		itemclick:function(){
			get('xqkaoqb_{rand}').disabled=false;
		}
	});
	var c = {
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
	<td nowrap>
		<input class="form-control" style="width:150px" id="key_{rand}"   placeholder="姓名/部門">
	</td>
	<td  style="padding-left:10px">
		<button class="btn btn-default" click="search" type="button">搜索</button>
	</td>

	<td width="90%"></td>
	<td align="right" nowrap>
		
	</td>
</tr></table>
</div>
<div class="blank10"></div>
<div id="view_{rand}"></div>
