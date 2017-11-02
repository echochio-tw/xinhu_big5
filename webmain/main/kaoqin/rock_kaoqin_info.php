<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	var a = $('#view_{rand}').bootstable({
		tablename:'kqinfo',params:{'atype':'all'},celleditor:true,fanye:true,modedir:'{mode}:{dir}',
		storeafteraction:'kqinfoaftershow',storebeforeaction:'kqinfobeforeshow',
		columns:[{
			text:'部門',dataIndex:'deptname',align:'left'
		},{
			text:'姓名',dataIndex:'name'
		},{
			text:'類型',dataIndex:'kind',sortable:true
		},{
			text:'請假類型',dataIndex:'qjkind'
		},{
			text:'開始時間',dataIndex:'stime',sortable:true
		},{
			text:'截止時間',dataIndex:'etime',sortable:true
		},{
			text:'時間(小時)',dataIndex:'totals',sortable:true
		},{
			text:'加班兌換',dataIndex:'jiatype'
		},{
			text:'說明',dataIndex:'explain',align:'left'
		},{
			text:'狀態',dataIndex:'status'
		},{
			text:'操作人',dataIndex:'optname'
		},{
			text:'操作時間',dataIndex:'optdt',sortable:true
		},{
			text:'',dataIndex:'caozuo'
		}],
		itemdblclick:function(d){
			openxiangs(d.modename,d.modenum,d.id);
		}
	});
	var c = {
		search:function(){
			var s=get('key_{rand}').value;
			a.setparams({key:s,dt1:get('dt1_{rand}').value,dt2:get('dt2_{rand}').value,keys:get('keys_{rand}').value},true);
		},
		clickdt:function(o1, lx){
			$(o1).rockdatepicker({initshow:true,view:'month',inputid:'dt'+lx+'_{rand}'});
		},
		daochu:function(){
			a.exceldown();
		},
		clickwin:function(){
			openinput('考勤信息','leavehr');
		},
		addnianjia:function(){
			var dt = get('dt1_{rand}').value;
			if(isempt(dt)){js.msg('msg','請先選擇日期從');return;}
			js.msg('wait','處理中...');
			js.ajax(js.getajaxurl('addnianjia','{mode}','{dir}'),{dt:dt},function(s){
				js.msg('success', s);
				a.reload();
			});
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
	<td nowrap>日期從&nbsp;</td>
	<td nowrap>
		<input style="width:110px" onclick="js.changedate(this)" readonly class="form-control datesss" id="dt1_{rand}" >
	</td>
	<td nowrap>&nbsp;至&nbsp;</td>
	<td nowrap>
		<input style="width:110px" onclick="js.changedate(this)" readonly class="form-control datesss" id="dt2_{rand}" >
	</td>
	<td  style="padding-left:10px">
		<input class="form-control" style="width:150px" id="key_{rand}"   placeholder="姓名/部門">
	</td>
	<td  style="padding-left:10px">
		<input class="form-control" style="width:100px" id="keys_{rand}"   placeholder="類型">
	</td>
	<td  style="padding-left:10px">
		<button class="btn btn-default" click="search" type="button">搜索</button>
	</td>
	<td  style="padding-left:10px">
		<button class="btn btn-default" click="addnianjia" type="button">添加年假</button>
	</td>
	
	<td width="80%"></td>
	<td align="right" nowrap>
		<button class="btn btn-default" click="daochu,1" type="button">導出</button>
	</td>
</tr></table>
</div>
<div class="blank10"></div>
<div id="view_{rand}"></div>
