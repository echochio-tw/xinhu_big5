<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	var modenum='sealapl';
	var a = $('#view_{rand}').bootstable({
		tablename:'sealapl',celleditor:true,fanye:true,modenum:modenum,statuschange:false,
		columns:[{
			text:'部門',dataIndex:'deptname'
		},{
			text:'姓名',dataIndex:'name'
		},{
			text:'申請印章',dataIndex:'sealname'
		},{
			text:'是否外帶',dataIndex:'isout'
		},{
			text:'說明',dataIndex:'explain',align:'left'
		},{
			text:'申請時間',dataIndex:'optdt'
		},{
			text:'狀態',dataIndex:'statustext'
		}],
		itemclick:function(){
			btn(false);
		},
		beforeload:function(){
			btn(true);
		}
	});
	
	function btn(bo){
		get('xiang_{rand}').disabled = bo;
	}

	var c = {
		search:function(){
			var s=get('key_{rand}').value;
			a.setparams({key:s},true);
		},
		daochu:function(){
			a.exceldown();
		},
		view:function(){
			var d=a.changedata;
			openxiangs('印章申請',modenum,d.id);
		}
	};
	js.initbtn(c);
});
</script>
<div>
<table width="100%">
<tr>
	<td>
		<input class="form-control" style="width:250px" id="key_{rand}"   placeholder="姓名/部門/申請印章">
	</td>
	<td  style="padding-left:10px">
		<button class="btn btn-default" click="search" type="button">搜索</button>
	</td>
	<td  style="padding-left:10px" width="90%">
	
	
	</td>
	<td align="right" nowrap>
		<button class="btn btn-default" id="xiang_{rand}" click="view" disabled type="button">詳情</button> &nbsp; 
		<button class="btn btn-default" click="daochu,1" type="button">導出</button> 
	</td>
</tr>
</table>
</div>
<div class="blank10"></div>
<div id="view_{rand}"></div>
