<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	var a = $('#veiw_{rand}').bootstable({
		tablename:'email_cog',celleditor:true,sort:'sort',dir:'asc',
		columns:[{
			text:'編號',dataIndex:'num'
		},{
			text:'發送名稱',dataIndex:'name'
		},{
			text:'SMTP服務器',dataIndex:'serversmtp'
		},{
			text:'SMTP服務器端口',dataIndex:'serverport'
		},{
			text:'郵箱帳號',dataIndex:'emailname'
		},{
			text:'連接方式',dataIndex:'secure'
		},{
			text:'排序號',dataIndex:'sort',editor:true,sortable:true
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
	
	var c = {
		del:function(){
			a.del();
		},
		clickwin:function(o1,lx){
			var h = $.bootsform({
				title:'系統郵件帳號',height:400,width:500,
				tablename:'email_cog',isedit:lx,params:{int_filestype:'sort,serverport'},
				submitfields:'serversmtp,name,serverport,emailname,num,secure,sort',url:js.getajaxurl('publicsave','email','system'),beforesaveaction:'savebeforecog',
				items:[{
					labelText:'編號',name:'num',required:true
				},{
					labelText:'名稱',name:'name',required:true
				},{
					labelText:'SMTP服務器',name:'serversmtp',required:true
				},{
					labelText:'SMTP服務器端口',name:'serverport',required:true,type:'number'
				},{
					labelText:'郵箱帳號',name:'emailname',required:true
				},{
					labelText:'郵箱密碼',name:'emailpass'
				},{
					labelText:'連接方式',name:'secure',store:[['','默認'],['ssl','ssl']],type:'select',displayfields:1,valuefields:0
				},{
					labelText:'序號',name:'sort',type:'number',value:'0'
				}],
				success:function(){
					a.reload();
				}
			});
			if(lx==1){
				h.setValues(a.changedata);
			}
			h.getField('name').focus();
		},
		refresh:function(){
			a.reload();
		},
		yunx:function(){
			if(ISDEMO){js.msg('success','demo上就不要測試，我們都測試通過的');return;}
			var url = js.getajaxurl('testsend','{mode}','{dir}');
			js.ajax(url,{id:a.changeid},function(s){
				js.msg('success', s);
			},'get',false,'測試發送中...');
		}
	};
	
	function btn(bo){
		get('del_{rand}').disabled = bo;
		get('edit_{rand}').disabled = bo;
		get('yun_{rand}').disabled = bo;
	}
	js.initbtn(c);
});
</script>


<div>


<table width="100%"><tr>
	<td nowrap>
		<button class="btn btn-primary" click="clickwin,0" type="button"><i class="icon-plus"></i> 新增</button> &nbsp; 
		<button class="btn btn-default" click="refresh" type="button"><i class="icon-refresh"></i> 刷新</button> &nbsp;
	</td>
	
	
	
	<td width="80%"></td>
	<td align="right" nowrap>
		
		<button class="btn btn-default" id="yun_{rand}" click="yunx" disabled type="button">測試發送</button> &nbsp; 
		
		<button class="btn btn-danger" id="del_{rand}" click="del" disabled type="button"><i class="icon-trash"></i> 刪除</button> &nbsp; 
		<button class="btn btn-info" id="edit_{rand}" click="clickwin,1" disabled type="button"><i class="icon-edit"></i> 編輯 </button>
	</td>
</tr>
</table>
</div>
<div class="blank10"></div>
<div id="veiw_{rand}"></div>
<div class="tishi">提示：此功能是設置系統郵件發送的帳號，如一些郵件的提醒功能！測試發送是發送到當前登錄用戶的郵箱上！</div>
