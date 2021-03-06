<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	
	var modenum='knowtiku';
	var a = $('#view_{rand}').bootstable({
		tablename:modenum,celleditor:true,autoLoad:false,modenum:modenum,fanye:true,params:{atype:'guan'},
		columns:[{
			text:'',dataIndex:'caozuo'
		},{
			text:'題名',dataIndex:'title',editor:false,align:'left'
		},{
			text:'分類',dataIndex:'typename'
		},{
			text:'類型',dataIndex:'type'
		},{
			text:'A',dataIndex:'ana'
		},{
			text:'B',dataIndex:'anb'
		},{
			text:'C',dataIndex:'anc'
		},{
			text:'D',dataIndex:'and'
		},{
			text:'答案',dataIndex:'answer',editor:true
		},{
			text:'排序',dataIndex:'sort',sortable:true,editor:true
		},{
			text:'狀態',dataIndex:'status',type:'checkbox',editor:true,sortable:true
		}]
	});

	var c = {
		del:function(){
			a.del();
		},
		daochu:function(){
			a.exceldown();
		},
		adds:function(){
			openinput('知識題庫',modenum);
		},
		search:function(){
			var s=get('key_{rand}').value;
			a.setparams({key:s},true);
		},
		daoru:function(){
			
			managelistknowtiku = a;
			addtabs({num:'daoruknowtiku',url:'flow,input,daoru,modenum=knowtiku',icons:'plus',name:'導入題庫'});
			
		},
		
		mobj:a,
		title:'題庫分類',
		stable:'knowtiku',
		optionview:'optionview_{rand}',
		optionnum:'knowtikutype',
		rand:'{rand}'
	};
	
	var c = new optionclass(c);
	
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
<td width="10" nowrap><div style="width:10px">&nbsp;</div></td>
<td width="95%">	
	<div>
	<table width="100%"><tr>
		<td align="left" nowrap>
			<button class="btn btn-primary" click="adds"  type="button"><i class="icon-plus"></i> 新增</button>&nbsp; 
			<button class="btn btn-default" click="allshow"  type="button">所有題庫</button>&nbsp; 
			
		</td>
		
		<td style="padding-left:10px">
		<input class="form-control" style="width:200px" id="key_{rand}"   placeholder="題名/分類">
		</td>
		<td style="padding-left:10px">
			<button class="btn btn-default" click="search" type="button">搜索</button> 
		</td>
		<td width="90%">
			&nbsp;&nbsp;<span id="megss{rand}"></span>
		</td>
		<td align="right" nowrap>
			<button class="btn btn-default"  click="daoru" type="button">導入題庫</button>&nbsp;
			<button class="btn btn-default"  click="daochu" type="button">導出</button>
		</td>
	</tr></table>
	</div>
	<div class="blank10"></div>
	<div id="view_{rand}"></div>
</td>
</tr>
</table>
