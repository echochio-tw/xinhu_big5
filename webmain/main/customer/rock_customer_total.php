<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	{params}
	var atype=params.atype,month=js.now('Y-m');
	var a = $('#view_{rand}').bootstable({
		tablename:'admin',params:{'atype':atype,'month':month},fanye:atype=='all',
		modedir:'{mode}:{dir}',storeafteraction:'custtotalafter',storebeforeaction:'custtotalbefore',
		columns:[{
			text:'部門',dataIndex:'deptname'
		},{
			text:'姓名',dataIndex:'name'
		},{
			text:'月份',dataIndex:'month'
		},{
			text:'待收金額',dataIndex:'shou_moneyd'
		},{
			text:'已收金額',dataIndex:'shou_moneys'
		},{
			text:'應收金額',dataIndex:'shou_moneyz'
		},{
			text:'當月已收金額',dataIndex:'shou_moneyn'
		},{
			text:'收款單數',dataIndex:'shou_shu'
		},{
			text:'待付金額',dataIndex:'fu_moneyd'
		},{
			text:'已付金額',dataIndex:'fu_moneys'
		},{
			text:'應付金額',dataIndex:'fu_moneyz'
		},{
			text:'當月已付金額',dataIndex:'fu_moneyn'
		},{
			text:'付款單數',dataIndex:'fu_shu'
		}],
		load:function(a){
			c.loadcharts();
		},
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
	
	var myChart=false;
	var c = {
		reload:function(){
			a.reload();
		},
		daochu:function(){
			a.exceldown();
		},
		search:function(){
			var s=get('key_{rand}').value,mon = get('month_{rand}').value;
			a.setparams({key:s,month:mon},true);
		},
		view:function(){
			var d=a.changedata;
			addtabs({num:'custfintotal'+d.id+'',url:'main,customer,totalge,uid='+d.id+'',icons:'bar-chart',name:''+d.name+'的年度統計'});
		},
		loadcharts:function(){
			if(atype!='down')return;
			if(!myChart){
				$('#view_{rand}').after('<div class="blank20"></div><div id="main_show{rand}" style="width:98%;height:500px;"></div>');
				myChart = echarts.init(get('main_show{rand}'));
			}
			var rows = a.getData('rows'),i,len=rows.length,v;
			var xAxis=[],data=[];
			for(i=0;i<len;i++){
				xAxis.push(rows[i].name);
				v = rows[i].shou_moneyz;if(v=='')v=0;
				data.push(parseFloat(v));
			}
			
			var mon = get('month_{rand}').value;
			var option = {
				title: {
					text: ''+mon+'月份應收金額圖表',
					left: 'center'
				},
				tooltip: {},
				legend: {
					data:['應收金額']
				},
				xAxis: {
					data: xAxis
				},
				yAxis: {type : 'value'},
				series: [{
					name: '金額',
					type: 'bar',
					data: data
				}]
			};
			myChart.setOption(option);
			
		}
	};
	js.initbtn(c);
	$('#month_{rand}').val(month);
});
</script>
<div>
	<table width="100%">
	<tr>
	<td style="padding-right:10px">
		<button class="btn btn-default" click="reload" type="button"><i class="icon-refresh"></i></button> 
	</td>
	<td style="padding-right:10px">
		<div style="width:120px" class="input-group">
			<input readonly placeholder="月份" class="form-control" id="month_{rand}" >
			<span class="input-group-btn">
				<button onclick="return js.selectdate(this,'month_{rand}','month')" class="btn btn-default" type="button"><i class="icon-calendar"></i></button>
			</span>
		</div>
	</td>
	<td>
		<input class="form-control" style="width:200px" id="key_{rand}"   placeholder="部門/人員">
	</td>
	<td style="padding-left:10px">
		<button class="btn btn-default" click="search" type="button">搜索</button> 
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
<div class="tishi">系統是以收付款單上是所屬日期算對應月份統計的，當月已收金額是收款時間是當月的統計。</div>
