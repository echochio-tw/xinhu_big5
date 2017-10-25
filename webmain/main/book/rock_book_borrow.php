<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){

	var modenum='bookborrow';
	var a = $('#view_{rand}').bootstable({
		tablename:modenum,celleditor:true,fanye:true,modenum:modenum,statuschange:false,
		columns:[{
			text:'借閱',dataIndex:'bookname'
		},{
			text:'借閱日期',dataIndex:'jydt',sortable:true
		},{
			text:'預計歸還',dataIndex:'yjdt'
		},{
			text:'是否歸返',dataIndex:'isgh',sortable:true
		},{
			text:'歸還時間',dataIndex:'ghtime'
		},{
			text:'借閱人',dataIndex:'optname'
		},{
			text:'操作時間',dataIndex:'optdt'
		},{
			text:'申請日期',dataIndex:'applydt',sortable:true
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
			a.setparams({
				'key':s,
				'dt':get('dt1_{rand}').value
			},true);
		},
		daochu:function(){
			a.exceldown();
		},
		view:function(){
			var d=a.changedata;
			openxiangs('圖書借閱',modenum,d.id);
		},
		clickwin:function(){
			openinput('圖書借閱',modenum);
		}
	};
	js.initbtn(c);
});
</script>
<div>
<table width="100%">
<tr>
	<td style="padding-right:10px">
		<button class="btn btn-primary" click="clickwin,0" type="button"><i class="icon-plus"></i> 新增</button>
	</td>
	
	<td nowrap>
		<div style="width:150px"  class="input-group">
			<input placeholder="借閱日期" readonly class="form-control" id="dt1_{rand}" >
			<span class="input-group-btn">
				<button class="btn btn-default" onclick="return js.selectdate(this,'dt1_{rand}')" type="button"><i class="icon-calendar"></i></button>
			</span>
		</div>
	</td>
	
	<td style="padding-left:10px">
		<input class="form-control" style="width:200px" id="key_{rand}"   placeholder="借閱/書名">
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
