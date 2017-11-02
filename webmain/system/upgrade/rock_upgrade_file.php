<?php defined('HOST') or die('not access');?>
<script >
$(document).ready(function(){
	{params}
	var id = params.id;
	var a = $('#view_{rand}').bootstable({
		tablename:'chargems',url:js.getajaxurl('datadubi','{mode}','{dir}',{id:id}),
		checked:true,
		columns:[{
			text:'類型',dataIndex:'type',renderer:function(v){
				var s='文件';
				if(v==1)s='數據庫';
				return s;
			}
		},{
			text:'文件路徑',dataIndex:'filepath',align:'left'
		},{
			text:'文件大小',dataIndex:'filesize'
		},{
			text:'文件說明',dataIndex:'explain'
		},{
			text:'',dataIndex:'ishui',renderer:function(v, d){
				var s='<font color="green">可更新</font>';
				if(v==1)s='已忽略';
				if(d.ting=='1')s='停用/不更新的模塊';
				return s;
			}
		},{
			text:'狀態',dataIndex:'zt'
		}]
	});
	
	var c={
		reloads:function(){
			a.reload();
		},
		huliesss:function(o1,lx){
			var sid = a.getchecked();
			if(sid==''){js.msg('msg','沒有選中行');return;}
			
			js.ajax(js.getajaxurl('hullue','{mode}','{dir}'),{sid:sid,id:id,lx:lx},function(s){
				a.reload();
			},'post','','處理中...,處理完成');
		}
	};

	js.initbtn(c);
	
	
});
</script>
<div>
	<table width="100%"><tr>
	<td nowrap>
		<button class="btn btn-default" click="reloads"  type="button"><i class="icon-refresh"></i> 刷新</button>
	</td>
	<td align="right">
		<button class="btn btn-default" click="huliesss,0"  type="button">忽略選中文件更新</button>&nbsp;
		<button class="btn btn-default" click="huliesss,1"  type="button">取消忽略選中文件更新</button>
	</td>
	</tr>
	</table>
</div>
<div class="blank10"></div>
<div id="view_{rand}"></div>
<div class="tishi">沒有記錄表示沒有可更新文件。</div>
