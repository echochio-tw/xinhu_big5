<?php defined('HOST') or die('not access');?>
<script >
$(document).ready(function(){
	
	var a = $('#view_{rand}').bootstable({
		tablename:'chargems',url:js.getajaxurl('getrecord','{mode}','{dir}'),
		columns:[{
			text:'短信內容',dataIndex:'cont',align:'left'
		},{
			text:'發給手機號',dataIndex:'tomobile',align:'left',renderstyle:function(v,d){
				return 'word-wrap:break-word;word-break:break-all;white-space:normal;';
			}
		},{
			text:'發送條數',dataIndex:'count'
		},{
			text:'發送時間',dataIndex:'adddt'
		}]
	});
	

	
	var c={
		reloads:function(){
			a.reload();
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
		
		
	</td>
	</tr>
	</table>
</div>
<div class="blank10"></div>
<div id="view_{rand}"></div>
<div class="tishi">默認值顯示最近20條記錄。</div>