<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	{params}
	var atype=params.atype,pnum=params.pnum;
	if(!pnum)pnum='';
	
	var col1 = [{
		text:'部門',dataIndex:'deptname',align:'left',sortable:true
	},{
		text:'姓名',dataIndex:'name',sortable:true
	},{
		text:'職位',dataIndex:'ranking'
	},{
		text:'人員狀態',dataIndex:'state'
	}];
	var col2 = [{
		text:'正常',dataIndex:'state0'
	},{
		text:'遲到',dataIndex:'state1'
	},{
		text:'早退',dataIndex:'state2'
	}];
	var col3 = [{
		text:'加班(時)',dataIndex:'jiaban'
	},{
		text:'外出(次)',dataIndex:'outci'
	},{
		text:'異常(次)',dataIndex:'errci'
	},{
		text:'應上班(天)',dataIndex:'sbday'
	},{
		text:'已上班(天)',dataIndex:'ysbday'
	},{
		text:'未打卡',dataIndex:'weidk'
	}];
	function getcolumns(a1,a2,a3,a4){
		var a4 = [].concat(a1,a2,a3,a4);
		return a4;
	}
	var colemsn = getcolumns(col1, col2, col3,[]);
	var a = $('#view_{rand}').bootstable({
		tablename:'userinfo',celleditor:true,fanye:true,params:{'atype':atype,'pnum':pnum},modedir:'{mode}:{dir}',storeafteraction:'kqtotalaftershow',storebeforeaction:'kqtotalbeforeshow',
		columns:colemsn,
		itemclick:function(){
			get('xqkaoqb_{rand}').disabled=false;
		},
		loadbefore:function(d){
			var cs = [],cs4=[],i;
			for(i in d.columns)cs.push({text:i,dataIndex:d.columns[i]});
			for(i=0;i<d.colalls.length;i++){
				cs4.push(d.colalls[i]);
			}
			if(cs.length>0){
				var cols = getcolumns(col1, cs, col3,cs4);
				a.setColumns(cols);
			}
		}
	});
	var c = {
		search:function(){
			var s=get('key_{rand}').value;
			var is1 = (get('iskq_{rand}').checked)?'1':'0';
			a.setparams({key:s,month:get('dt1_{rand}').value,iskq:is1},true);
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
			js.msg('wait','['+dt+']月份的考勤分析中...');
			js.ajax(js.getajaxurl('kqanayall','{mode}','{dir}'),{dt:dt,atype:atype},function(){
				js.msg('success','分析成功');
				a.reload();
			});
		},
		xqkaoqb:function(){
			var d=a.changedata;
			var dt = get('dt1_{rand}').value;
			addtabs({num:'adminkaoqin'+d.id+'',url:'main,kaoqin,geren,uid='+d.id+',month='+dt+'',icons:'time',name:''+d.name+''+dt+'的考勤'});
		},
		daochu:function(){
			a.exceldown(''+nowtabs.name+'('+get('dt1_{rand}').value+')');
		},
		//訂閱
		dingyue:function(){
			js.subscribe({
				title:''+nowtabs.name+'({month-1})',
				explain:'訂閱上月考勤統計表',
				cont:'{month-1}月份人員'+nowtabs.name+'',
				objtable:a,
				params:{'month':'{month-1}','key':get('key_{rand}').value}
			});
		}
	};
	
	$('#dt1_{rand}').val(js.now('Y-m'));
	js.initbtn(c);
});
</script>
<div>
<table width="100%"><tr>
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
		<label><input id="iskq_{rand}" checked type="checkbox">只看需考勤</label>
	</td>
	<td  style="padding-left:10px">
		<button class="btn btn-default" click="search" type="button">搜索</button>
	</td>
	<td  style="padding-left:10px">
		<button class="btn btn-default" click="dingyue" type="button">訂閱此統計表</button>
	</td>
	<td  style="padding-left:5px">
		
	</td>
	<td width="80%"></td>
	<td align="right" nowrap>
		<button class="btn btn-info" click="xqkaoqb" disabled id="xqkaoqb_{rand}" type="button">詳情考勤表</button>&nbsp;&nbsp;
		<button class="btn btn-default" click="anaynow" type="button">全部重新分析</button>&nbsp;&nbsp;
		<button class="btn btn-default" click="daochu" type="button">導出</button>
	</td>
</tr></table>
</div>
<div class="blank10"></div>
<div id="view_{rand}"></div>
<div class="tishi">人員是從檔案表裡讀取的，如考勤異常有申請請假外出視為正常，統計已審核完成的。</div>
