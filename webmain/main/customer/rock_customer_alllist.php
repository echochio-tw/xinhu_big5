<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	{params}
	var atype=params.atype;
	var a = $('#view_{rand}').bootstable({
		tablename:'customer',fanye:true,modenum:'customer',params:{'atype':atype},
		columns:[{
			text:'類型',dataIndex:'type'
		},{
			text:'名稱',dataIndex:'name'
		},{
			text:'單位名稱',dataIndex:'unitname'
		},{
			text:'擁有者',dataIndex:'optname'
		},{
			text:'合同數',dataIndex:'htshu',sortable:true
		},{
			text:'銷售總額',dataIndex:'moneyz',sortable:true
		},{
			text:'待收金額',dataIndex:'moneyd',sortable:true
		},{
			text:'創建時間',dataIndex:'adddt',sortable:true
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
		reload:function(){
			a.reload();
		},
		view:function(){
			var d=a.changedata;
			openxiangs('客戶','customer',d.id);
		},
		daochu:function(){
			a.exceldown();
		},
		search:function(){
			var s=get('key_{rand}').value;
			a.setparams({key:s},true);
		},
		retotal:function(){
			js.ajax(js.getajaxurl('retotal','{mode}','{dir}'),{},function(s){
				a.reload();
			},'get',false,'統計中...,統計完成')
		}
	};
	js.initbtn(c);
	

});
</script>
<div>
	<table width="100%">
	<tr>
	<td>
		<input class="form-control" style="width:180px" id="key_{rand}"   placeholder="名稱/擁有者">
	</td>
	<td style="padding-left:10px">
		<button class="btn btn-default" click="search" type="button">搜索</button> 
	</td>
	<td style="padding-left:10px">
		<button class="btn btn-default" click="retotal" type="button">重新統計</button> 
	</td>
	<td  width="90%" style="padding-left:10px">
		
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
<div class="tishi">統計並不是實時統計，數據有偏差?請點[重新統計]按鈕。銷售總額是從收款單上統計。</div>
