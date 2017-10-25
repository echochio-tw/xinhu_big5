<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	var myChart = false;
	var a = $('#viewshow_{rand}').bootstable({
		tablename:'todo',modedir:'flowtotal:main',storebeforeaction:'flowtotalbefore',storeafteraction:'flowtotalafter',
		columns:[{
			text:'名稱',dataIndex:'name'
		},{
			text:'數值',dataIndex:'value'
		},{
			text:'比例',dataIndex:'bili'
		}],
		load:function(a){
			if(a.modearr){
				var s = '<option value="0">-選擇模塊-</option>',len=a.modearr.length,i,csd,types='';
				for(i=0;i<len;i++){
					csd = a.modearr[i];
					if(types!=csd.type){
						if(types!='')s+='</optgroup>';
						s+='<optgroup label="'+csd.type+'">';
					}
					s+='<option value="'+csd.id+'">'+csd.name+'</option>';
					types = csd.type;
				}
				$('#mode_{rand}').html(s);
			}else{
				c.loadcharts();
			}
			
		}
	});
	
	var c={
		search:function(){
			var d = {
				'modeid' : get('mode_{rand}').value,
				'total_fields' : get('fields_{rand}').value,
				'total_type' : get('type_{rand}').value,
				'atype'		 : get('where_{rand}').value
			};
			if(d.modeid=='0'){js.msg('msg','請選擇模塊');return;}
			if(d.total_fields==''){js.msg('msg','請選擇統計字段');return;}
			if(d.total_type==''){js.msg('msg','請選擇統計類型');return;}
			if(d.atype==''){js.msg('msg','請選擇統計條件,統計條件在[流程模塊條件]下添加');return;}
			a.setparams(d,true);
		},
		loadcharts:function(){
			var rows = a.getData('rows'),i,len=rows.length,v;
			var xAxis=[],data=[];
			for(i=0;i<len;i++){
				if(rows[i].name!='合計'){
					xAxis.push(rows[i].name);
					v = rows[i].value;if(v=='')v=0;
					data.push({value:parseFloat(v),name:rows[i].name});
				}
			}
			var o1 = get('fields_{rand}'),o2=get('type_{rand}');
			if(!myChart)myChart = echarts.init(get('main_show{rand}'));
			var ss = o1.options[o1.selectedIndex].text;
			var tlx= get('chattype_{rand}').value;
			var option = {
				title: {
					text: '按'+ss+'的'+o2.options[o2.selectedIndex].text+'',
					left: 'center'
				},
				tooltip : {
					trigger: 'item',
					formatter: "{b} : {c} ({d}%)"
				},
				series: [{
					name: '數值',
					type: tlx,
					data: data
				}]
			};
			if(tlx!='pie'){
				option.xAxis={data: xAxis};
				option.yAxis={type : 'value'};
			}
			myChart.setOption(option);
		},
		daochu:function(){
			var o1 = get('fields_{rand}'),o2=get('type_{rand}');
			var ss = o1.options[o1.selectedIndex].text;
			a.exceldown(''+ss+'的'+o2.options[o2.selectedIndex].text+'');
		},
		changemode:function(){
			var mid=this.value;
			get('fields_{rand}').length = 1;
			get('type_{rand}').length = 2;
			get('where_{rand}').length = 1;
			if(mid==0){
				
			}else{
				c.changefields(mid);
			}
		},
		changefields:function(mid){
			js.ajax(js.getajaxurl('changefields','{mode}','{dir}'),{modeid:mid},function(ret){
				c.changefieldss(ret);
			},'get,json');
		},
		changefieldss:function(ds){
			var ret = ds.farr;
			var d = [],d2=[],i,len=ret.length,lx,fid,fids;
			var fids = ',applydt,optdt,dt,adddt,createdt,startdt,enddt,';
			for(i=0;i<len;i++){
				lx = ret[i].fieldstype;
				fid= ret[i].fields;
				fids= ret[i].fieldss;
				if(lx=='number' || fids=='money'){
					d2.push({
						'name' : ret[i].names+'(合計)',
						'fields' : 'sum|'+fids
					});
					d2.push({
						'name' : ret[i].names+'(平均值)',
						'fields' : 'avg|'+fids
					});
				}else{
					d.push({
						'name' : ret[i].name,
						'fields' : fid,
					});
					if(lx=='date' || lx=='datetime' || fid.indexOf('dt`')>-1){
						d.push({
							'name' : ret[i].names+'('+fids+',按月)',
							'fields' : 'left('+fid+',7)'
						});
					}
				}
			}
			js.setselectdata(get('fields_{rand}'),d,'fields');
			js.setselectdata(get('type_{rand}'),d2,'fields');
			js.setselectdata(get('where_{rand}'),ds.fwhe,'num');
		}
	}
	$('#mode_{rand}').change(c.changemode);
	js.initbtn(c);
	$('#main_show{rand}').css('height',''+(viewheight-110)+'px');
});
</script>

<div>
	<table width="100%">
	<tr>
	<td align="left">
		<select style="width:180px" id="mode_{rand}" class="form-control" ><option value="0">-選擇模塊-</option></select>
	</td>
	<td nowrap style="padding-left:10px">
		根據&nbsp;
	</td>
	<td >
		<select style="width:150px" id="fields_{rand}" class="form-control" ><option value="">-統計字段-</option></select>
	</td>
	<td nowrap style="padding-left:10px">
		的&nbsp;
	</td>
	<td >
		<select style="width:130px" id="type_{rand}" class="form-control" ><option value="">-統計類型-</option><option selected value="jls">記錄數</option></select>
	</td>
	<td style="padding-left:10px">
		<select style="width:130px" id="where_{rand}" class="form-control" ><option value="">-統計條件-</option></select>
	</td>
	<td style="padding-left:10px">
		<select style="width:80px" id="chattype_{rand}" class="form-control" ><option value="pie">餅圖</option><option value="line">線圖</option><option value="bar">柱狀圖</option></select>
	</td>
	<td  style="padding-left:10px">
		<button class="btn btn-default" click="search" type="button">來統計</button>
	</td>
	<td width="90%">
		
	</td>
	<td align="right" nowrap>
		<button class="btn btn-default" click="daochu,1" type="button">導出</button> 
	</td>
	</tr>
	</table>
	
</div>
<div class="blank10"></div>
<table width="100%">
<tr valign="top">
	<td width="80%">
		<div id="main_show{rand}" style="width:100%;height:480px"></div>
	</td>
	<td>
		<div style="width:350px" id="viewshow_{rand}"></div>
	</td>
</tr>
</table>
<div class="tishi">此功能只其他基本的統計，更強大更多功能需要自己開發，模塊列表需要在表單元素管理下開啟有統計字段。</div>