<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	{params}
	var atype=params.atype;
	var a = $('#view_{rand}').bootstable({
		tablename:'location',celleditor:true,fanye:true,sort:'id',dir:'desc',
		modedir:'{mode}:{dir}',params:{'atype':atype},modenum:'kqdw',
		columns:[{
			text:'部門',dataIndex:'deptname',align:'left'
		},{
			text:'姓名',dataIndex:'name'
		},{
			text:'打卡時間',dataIndex:'optdt',sortable:true
		},{
			text:'星期',dataIndex:'week'
		},{
			text:'定位類型',dataIndex:'type',sortable:true
		},{
			text:'地址',dataIndex:'label'
		},{
			text:'精確到',dataIndex:'precision'
		},{
			text:'說明',dataIndex:'explain',align:'left'
		},{
			text:'圖片',dataIndex:'imgpath',renderer:function(v){
				var s='&nbsp;';
				if(!isempt(v))s='<img height="60" onclick="$.imgview({url:this.src})" src="'+v+'">';
				return s;
			}
		},{
			text:'',dataIndex:'opt',renderer:function(v,d){
				var s='&nbsp;';
				if(!isempt(d.location_x))s='<a onclick="js.locationshow('+d.id+')" href="javascript:;">地圖上打開</a>';
				return s;
			}
		}]
	});
	var c = {
		search:function(){
			var s=get('key_{rand}').value;
			a.setparams({key:s,dt1:get('dt1_{rand}').value,dt2:get('dt2_{rand}').value},true);
		},
		clickdt:function(o1, lx){
			$(o1).rockdatepicker({initshow:true,view:'date',inputid:'dt'+lx+'_{rand}'});
		},
		daochu:function(){
			a.exceldown();
		}
	};
	js.initbtn(c);
});
</script>
<div>
<table width="100%"><tr>
	<td nowrap>日期&nbsp;</td>
	<td nowrap>
		<div style="width:140px"  class="input-group">
			<input placeholder="" readonly class="form-control" id="dt1_{rand}" >
			<span class="input-group-btn">
				<button class="btn btn-default" click="clickdt,1" type="button"><i class="icon-calendar"></i></button>
			</span>
		</div>
	</td>
	<td nowrap>&nbsp;至&nbsp;</td>
	<td nowrap>
		<div style="width:140px"  class="input-group">
			<input placeholder="" readonly class="form-control" id="dt2_{rand}" >
			<span class="input-group-btn">
				<button class="btn btn-default" click="clickdt,2" type="button"><i class="icon-calendar"></i></button>
			</span>
		</div>
	</td>
	<td  style="padding-left:10px">
		<input class="form-control" style="width:150px" id="key_{rand}"   placeholder="姓名/部門">
	</td>
	<td  style="padding-left:10px">
		<button class="btn btn-default" click="search" type="button">搜索</button>
	</td>
	<td  style="padding-left:5px">
		<button class="btn btn-default" click="daochu,1" type="button">導出</button>
	</td>
	<td width="80%"></td>
	<td align="right" nowrap>
		
	</td>
</tr></table>
</div>
<div class="blank10"></div>
<div id="view_{rand}"></div>
<div class="tishi">定位打卡並不能使用做考勤打卡，目前只是用于外勤定位打卡使用。</div>
