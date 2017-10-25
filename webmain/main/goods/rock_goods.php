<?php if(!defined('HOST'))die('not access');?>

<script >
$(document).ready(function(){

	var a = $('#view_{rand}').bootstable({
		tablename:'goods',celleditor:true,fanye:true,modenum:'goods',autoLoad:false,
		url:publicstore('{mode}','{dir}'),storebeforeaction:'beforeshow',storeafteraction:'aftershow',
		columns:[{
			text:'名稱',dataIndex:'name',align:'left'
		},{
			text:'分類',dataIndex:'typeid',align:'left'
		},{
			text:'單價',dataIndex:'price',sortable:true
		},{
			text:'單位',dataIndex:'unit'
		},{
			text:'規格',dataIndex:'guige'
		},{
			text:'型號',dataIndex:'xinghao'
		},{
			text:'庫存',dataIndex:'stock',sortable:true
		},{
			text:'ID',dataIndex:'id'	
		}],
		itemclick:function(){
			btn(false);
		},
		itemdblclick:function(d){
			openxiang('goods',d.id);
		}
	});
	
	goodsrocks{rand} = function(s){
		a.reload();
	}
	var c = {
		del:function(){
			a.del({check:function(lx){if(lx=='yes')btn(true)}});
		},
		search:function(){
			var s=get('key_{rand}').value;
			a.setparams({key:s},true);
		},
		clickwin:function(o1,lx){
			var icon='plus',name='新增',id=0;
			if(lx==1){
				id = a.changeid;
			};
			openinput('物品產品','goods', id, 'goodsrocks{rand}');
		},
		piliang:function(){
			managelistgoods = a;
			addtabs({num:'daorugoods',url:'flow,input,daoru,modenum=goods',icons:'plus',name:'導入物品'});
		},
		rukuchu:function(o1, lx){
			var s='物品入庫';
			if(lx==1)s='物品出庫';
			addtabs({num:'rukuchugood'+lx+'',url:'main,goods,churuku,type='+lx+'',icons:'plus',name:s});
		},
		relaodkc:function(){
			js.ajax(js.getajaxurl('reloadkc','{mode}','{dir}'),{},function(){
				a.reload();
			},'get','','刷新中...,刷新完成');
		},
		daochu:function(){
			a.exceldown();
		},
		
		
		
		mobj:a,
		title:'物品分類',
		stable:'goods',
		optionview:'optionview_{rand}',
		optionnum:'goodstype',
		rand:'{rand}'
	};
	
	var c = new optionclass(c);
	
	function btn(bo){
		get('del_{rand}').disabled = bo;
		get('edit_{rand}').disabled = bo;
	}
	
	js.initbtn(c);
	
});
</script>
<table width="100%">
<tr valign="top">
<td>
	<div style="border:1px #cccccc solid;width:220px">
	<div id="optionview_{rand}" style="height:400px;overflow:auto;"></div>
	</div>  
</td>
<td width="10" nowrap>&nbsp;</td>
<td width="95%">


<div>
<table width="100%"><tr>
	<td nowrap>
		<button class="btn btn-primary" click="clickwin,0" type="button"><i class="icon-plus"></i> 新增</button>
	</td>
	<td  style="padding-left:10px">
		<button class="btn btn-default" click="piliang" type="button">導入</button>
	</td>
	<td style="padding-left:10px">
	<input class="form-control" style="width:150px" id="key_{rand}"   placeholder="物品名">
	</td>
	<td style="padding-left:10px">
		<button class="btn btn-default" click="search" type="button">搜索</button> 
	</td>
	<td  width="80%" style="padding-left:10px">
		<div class="btn-group">
		<button class="btn btn-default" click="rukuchu,0" type="button">入庫</button>
		<button class="btn btn-default" click="rukuchu,1" type="button">出庫</button>
		</div>
	</td>
	<td  style="padding-right:10px">
		<button class="btn btn-default" click="daochu" type="button">導出</button>
	</td>
	<td align="right" nowrap>
		<button class="btn btn-default" click="relaodkc" type="button">刷新庫存</button> &nbsp; 
		<button class="btn btn-danger" id="del_{rand}" click="del" disabled type="button"><i class="icon-trash"></i> 刪除</button> &nbsp; 
		<button class="btn btn-info" id="edit_{rand}" click="clickwin,1" disabled type="button"><i class="icon-edit"></i> 編輯 </button>
	</td>
</tr></table>
</div>
<div class="blank10"></div>
<div id="view_{rand}"></div>
<div class="tishi">在出入庫詳情需要已審核才會計算庫存的，表goodss上字段status=1時。</div>

</td>
</tr>
</table>