<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	
	var modenum = 'book';
	var a = $('#view_{rand}').bootstable({
		tablename:modenum,celleditor:true,autoLoad:false,modenum:modenum,
		columns:[{
			text:'書名',dataIndex:'title',editor:false,align:'left'
		},{
			text:'編號',dataIndex:'num'
		},{
			text:'作者',dataIndex:'author'
		},{
			text:'出版社',dataIndex:'chuban'
		},{
			text:'出版日期',dataIndex:'cbdt'
		},{
			text:'數量',dataIndex:'shul'
		},{
			text:'存放位置',dataIndex:'weizhi'
		},{
			text:'操作時間',dataIndex:'optdt'
		},{
			text:'',notexcel:true,dataIndex:'opt',renderer:function(v,d,oi){
				return '<a href="javascript:;" onclick="openxiangs(\'圖書\',\''+modenum+'\','+d.id+')">查看</a>';
			}
		}],
		itemclick:function(){
			get('del_{rand}').disabled=false;
		},
		beforeload:function(){
			get('del_{rand}').disabled=true;
		}
	});


	var c = {

		del:function(){
			a.del();
		},
		adds:function(){
			openinput('圖書',modenum);
		},
		search:function(){
			var s=get('key_{rand}').value;
			a.setparams({key:s},true);
		},
		daochu:function(){
			a.exceldown();
		},
		daoru:function(){
			managelistbook = a;
			addtabs({num:'daorubook',url:'flow,input,daoru,modenum=book',icons:'plus',name:'導入圖書'});
		},
		
		mobj:a,
		title:'圖書分類',
		stable:'book',
		optionview:'optionview_{rand}',
		optionnum:'booktype',
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
<td width="10" nowrap>&nbsp;</td>
<td width="95%">
	<div>
	<table width="100%"><tr>
		<td align="left" nowrap>
			<button class="btn btn-primary" click="adds"  type="button"><i class="icon-plus"></i> 新增</button>&nbsp; 
			<button class="btn btn-default" click="allshow"  type="button">所有圖書</button>&nbsp; 
			
		</td>
		
		<td style="padding-left:10px">
		<input class="form-control" style="width:180px" id="key_{rand}"   placeholder="書名/作者">
		</td>
		<td style="padding-left:10px">
			<button class="btn btn-default" click="search" type="button">搜索</button> 
		</td>
		<td width="90%">
			&nbsp;&nbsp;<span id="megss{rand}"></span>
		</td>
		<td nowrap align="right">
			<button class="btn btn-default"  click="daoru" type="button">導入圖書</button>&nbsp;
			<button class="btn btn-default"  click="daochu" type="button">導出</button>&nbsp;
			<button class="btn btn-danger" id="del_{rand}" disabled click="del" type="button"><i class="icon-trash"></i> 刪除</button>
		</td>
	</tr></table>
	</div>
	<div class="blank10"></div>
	<div id="view_{rand}"></div>
</td>
</tr>
</table>
