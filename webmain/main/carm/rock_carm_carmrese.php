<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	var modenum='carmrese';
	var a = $('#view_{rand}').bootstable({
		tablename:'carmrese',celleditor:true,fanye:true,modenum:modenum,statuschange:false,
		columns:[{
			text:'使用車輛',dataIndex:'carnum'
		},{
			text:'申請日期',dataIndex:'applydt',sortable:true
		},{
			text:'使用者',dataIndex:'usename'
		},{
			text:'使用時間',dataIndex:'startdt',sortable:true
		},{
			text:'截止時間',dataIndex:'enddt'
		},{
			text:'目的地',dataIndex:'address'
		},{
			text:'駕駛員',dataIndex:'jianame'
		},{
			text:'起始公裡',dataIndex:'kmstart'
		},{
			text:'起始公裡',dataIndex:'kmend'
		},{
			text:'歸還時間',dataIndex:'returndt'
		},{
			text:'申請人',dataIndex:'optname'
		},{
			text:'操作時間',dataIndex:'optdt'
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
			openxiangs('車輛預定',modenum,d.id);
		},
		clickwin:function(){
			openinput('車輛預定',modenum);
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
			<input placeholder="使用/申請日期" readonly class="form-control" id="dt1_{rand}" >
			<span class="input-group-btn">
				<button class="btn btn-default" onclick="return js.selectdate(this,'dt1_{rand}')" type="button"><i class="icon-calendar"></i></button>
			</span>
		</div>
	</td>
	
	<td style="padding-left:10px">
		<input class="form-control" style="width:200px" id="key_{rand}"   placeholder="車牌/使用者/申請人">
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
