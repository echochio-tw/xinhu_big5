<?php
/**
*	模塊：knowtraim.考試培訓人員
*	來源：http://www.rockoa.com/
*/
defined('HOST') or die ('not access');
?>
<script>
$(document).ready(function(){
	{params}
	var atype = params.atype;
	if(!atype)atype='';
	var a = $('#viewpxuser_{rand}').bootstable({
		fanye:true,tablename:'knowtrais',
		url:publicmodeurl('knowtraim'),storebeforeaction:'knowtraimuserbefore',storeafteraction:'knowtraimuserafter',checked:atype=='all',
		params:{atype:atype},
		columns:[{
			text:"部門",dataIndex:"deptname"
		},{
			text:"姓名",dataIndex:"name"
		},{
			text:"題目",dataIndex:"title"
		},{
			text:"時間",dataIndex:"startdt",sortable:true
		},{
			text:"考試時間",dataIndex:"kssdt",sortable:true
		},{
			text:"考試狀態",dataIndex:"isks",sortable:true
		},{
			text:"分數",dataIndex:"fenshu",sortable:true
		},{
			text:'',dataIndex:'optsw',renderer:function(v,d, oi){
				var s = '&nbsp;';
				if(d.state=='1' && d.iskszt=='0' && d.uid==adminid)s='<a onclick="openks{rand}('+oi+')" href="javascript:;">去考試</font>';
				return s;
			}
		}],
		itemdblclick:function(){
			c.view();
		},
		load:function(d){
			
		}
	});
	openks{rand}=function(oi){
		var d = a.getData(oi);
		var url = '?m=hr&a=kaoshi&d=main&id='+d.mid+'';
		openxiangs(d.title, url);
	}
	var c = {
		chongkx:function(){
			var fid = a.getchecked();
			if(fid==''){js.msg('msg','沒有選中復選框');return;}
			js.confirm('確定要標識未可考試嘛，將會清空原來記錄', function(jg){
				if(jg=='yes')c.chongkxs(fid);
			});
		},
		chongkxs:function(fid){
			js.ajax(publicmodeurl('knowtraim','biaoshi'),{'fid':fid},function(s){
				a.reload();
			},'post',false, '處理中...,處理成功');
		},
		daochu:function(){
			a.exceldown();
		},
		search:function(){
			var s=get('key_{rand}').value;
			a.setparams({key:s},true);
		}
	};
	js.initbtn(c);
	if(atype!='all')$('#showbtn{rand}').remove();
});
</script>
<div>
	<table width="100%">
	<tr>
		<td>
			<input class="form-control" style="width:180px" id="key_{rand}" placeholder="題目/人員/部門">
		</td>
		
		<td style="padding-left:10px">
			<button class="btn btn-default" click="search" type="button">搜索</button>
		</td>
		<td  width="90%" style="padding-left:10px"></td>
	
		<td align="right"  nowrap>
			 <button id="showbtn{rand}" class="btn btn-default" click="chongkx" type="button">重新標識可培訓</button>&nbsp;&nbsp; 
			<button class="btn btn-default" click="daochu,1" type="button">導出</button> 
		</td>
	</tr>
	</table>
</div>
<div class="blank10"></div>
<div id="viewpxuser_{rand}"></div>