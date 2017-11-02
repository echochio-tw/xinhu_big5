<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	var modenum='userinfo';
	var a = $('#view_{rand}').bootstable({
		tablename:'userinfo',modenum:modenum,params:{atype:'my'},
		columns:[{
			text:'部門',dataIndex:'deptname',align:'left',sortable:true
		},{
			text:'姓名',dataIndex:'name',sortable:true
		},{
			text:'性別',dataIndex:'sex'
		},{
			text:'職位',dataIndex:'ranking'
		},{
			text:'狀態',dataIndex:'state',sortable:true
		},{
			text:'入職日期',dataIndex:'workdate',sortable:true
		},{
			text:'轉正日期',dataIndex:'positivedt',sortable:true
		},{
			text:'電話',dataIndex:'tel'
		},{
			text:'手機號',dataIndex:'mobile'
		},{
			text:'ID',dataIndex:'id'
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
		get('edit_{rand}').disabled = bo;
	}
	
	var c = {
		view:function(){
			var d=a.changedata;
			openxiangs('個人資料',modenum,d.id);
		},
		edit:function(){
			openinput('個人資料',modenum,a.changeid+'&optlx=my');
		}
	};
	js.initbtn(c);
});
</script>
<div>
<table width="100%">
<tr>
	<td nowrap>
		
	</td>
	<td  style="padding-left:10px">
		
	</td>

	<td width="90%"></td>
	<td align="right" nowrap>
		<button class="btn btn-default" id="xiang_{rand}" click="view" disabled type="button">詳情</button> &nbsp;  
		<button class="btn btn-default" id="edit_{rand}" click="edit" disabled type="button">編輯</button>
	</td>
</tr>
</table>
</div>
<div class="blank10"></div>
<div id="view_{rand}"></div>
<div class="tishi">個人資料請認真填寫！</div>
