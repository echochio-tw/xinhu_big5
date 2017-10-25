<?php
/**
*	模塊：daily.工作日報統計
*/
defined('HOST') or die ('not access');
?>
<script>
$(document).ready(function(){
	{params}
	var atype=params.atype,columna=[];
	var column = [{
		text:'部門',dataIndex:'deptname',align:'left',sortable:true
	},{
		text:'姓名',dataIndex:'name',sortable:true
	},{
		text:'應寫',dataIndex:'totaly'
	},{
		text:'已寫',dataIndex:'totalx'
	},{
		text:'未寫',dataIndex:'totalw'
	}];
	for(var i=1;i<=28;i++){
		columna.push({
			text:''+i+'',
			dataIndex:'day'+i+'',
		});
	}
	var a = $('#view_{rand}').bootstable({
		tablename:'daily',fanye:true,params:{'atype':atype},url:publicmodeurl('daily'),storeafteraction:'anxyfxaftershow',storebeforeaction:'anxyfxbeforershow',
		columns:[].concat(column,columna),
		itemclick:function(){
			
		},
		loadbefore:function(d){
			var cs = [],i;
			for(i in column)cs.push(column[i]);
			var warr=['日','一','二','三','四','五','六'],w=parseFloat(d.week),tsa;
			for(i=1;i<=d.maxjg;i++){
				if(i>1)w++;
				if(w>6)w=0;
				tsa = ''+i+'';
				if(w==0||w==6)tsa='<font color="#ff6600">'+tsa+'</font>';
				cs.push({
					text:tsa,
					dataIndex:'day'+i+'',
				});
			}
			a.setColumns(cs);
		}
	});
	var c = {
		search:function(){
			var s=get('key_{rand}').value;
			var is = (get('isdaily_{rand}').checked)?'1':'0';
			a.setparams({key:s,dt1:get('dt1_{rand}').value,isdaily:is},true);
		},
		clickdt:function(o1, lx){
			$(o1).rockdatepicker({initshow:true,view:'month',inputid:'dt'+lx+'_{rand}'});
		},
		anaynow:function(){
			var dt = get('dt1_{rand}').value;
			if(dt==''){
				js.msg('msg','請選擇月份');
				return;
			}
			js.msg('wait','['+dt+']月份的日報統計中...');
			js.ajax(publicmodeurl('daily','dailyfx'),{dt:dt,atype:atype},function(){
				js.msg('success','統計成功');
				a.reload();
			});
		},
		daochu:function(){
			a.exceldown('日報統計('+get('dt1_{rand}').value+')');
		}
	};
	
	$('#dt1_{rand}').val(js.now('Y-m'));
	js.initbtn(c);
});
</script>
<div>
<table width="100%"><tr>
	<td nowrap>月份&nbsp;</td>
	<td nowrap>
		<div style="width:120px"  class="input-group">
			<input placeholder="月份" readonly class="form-control" id="dt1_{rand}" >
			<span class="input-group-btn">
				<button class="btn btn-default" click="clickdt,1" type="button"><i class="icon-calendar"></i></button>
			</span>
		</div>
	</td>
	<td  style="padding-left:10px">
		<input class="form-control" style="width:150px" id="key_{rand}"   placeholder="姓名/部門">
	</td>
	<td nowrap style="padding-left:10px">
		<label><input id="isdaily_{rand}" checked type="checkbox">只看需寫日報</label>
	</td>
	<td  style="padding-left:10px">
		<button class="btn btn-default" click="search" type="button">搜索</button>
	</td>
	<td  style="padding-left:10px">
		<button class="btn btn-default" click="daochu" type="button">導出</button>
	</td>
	<td  style="padding-left:5px">
		
	</td>
	<td width="80%"></td>
	<td align="right" nowrap>
		<button class="btn btn-default" click="anaynow" type="button">重新統計</button>
	</td>
</tr></table>
</div>
<div class="blank10"></div>
<div id="view_{rand}"></div>
<div class="tishi">如全天請假視為不需要寫日報，×未寫,√已寫,◇寫週報,假:全天請假,空白(休息日)</div>