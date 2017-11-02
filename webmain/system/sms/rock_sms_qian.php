<?php defined('HOST') or die('not access');?>
<script >
$(document).ready(function(){
	
	var a = $('#view_{rand}').bootstable({
		tablename:'chargems',url:js.getajaxurl('getqian','{mode}','{dir}'),statuschange:false,
		columns:[{
			text:'編號',dataIndex:'num'
		},{
			text:'簽名',dataIndex:'cont'
		},{
			text:'是否公開',dataIndex:'isgk',type:'checkbox'
		},{
			text:'狀態',dataIndex:'statustext'
		},{
			text:'來源',dataIndex:'fromstr'
		}],
		beforeload:function(){
			btn(true);
		},
		itemclick:function(d){
			var bo = (d.isedit==1)?false:true;
			btn(bo);
		}
	});
	
	function btn(bo){
		get('edit_{rand}').disabled = bo;
	}
	
	var c={
		reloads:function(){
			a.reload();
		},
		clickwin:function(o1,lx){
			var h = $.bootsform({
				title:'短信簽名',height:400,width:400,
				tablename:'sms',isedit:lx,
				url:js.getajaxurl('saveqian','{mode}','{dir}'),
				submitfields:'cont,isgk,num',
				items:[{
					labelText:'簽名名稱',name:'cont',required:true,blankText:'3-8個字符'
				},{
					labelText:'',name:'num',type:'hidden'
				},{
					name:'isgk',labelBox:'公開(讓其他用戶也可以使用)',type:'checkbox',checked:false
				}],
				success:function(){
					js.msg('success','保存成功');
					a.reload();
				},
				submitcheck:function(d){
					var len=d.cont.length;
					if(len<3)return '簽名必須3個字符以上';
					if(len>8)return '簽名不能超過8個字符';
				}
			});
			if(lx==1){
				h.setValues(a.changedata);
			}
			h.getField('cont').focus();
		},
		reloadszt:function(){
			js.msg('wait','刷新中...');
			js.ajax(js.getajaxurl('reloadsign','{mode}','{dir}'),false, function(ret){
				if(ret.success){
					js.msg('success','刷新成功');
					a.reload();
				}else{
					js.msg('msg',ret.msg);
				}
			},'get,json');
		}
	};

	js.initbtn(c);
	
	
});
</script>
<div>
	<table width="100%"><tr>
	<td nowrap>
		<button class="btn btn-primary" click="clickwin,0"  type="button"><i class="icon-plus"></i> 新增</button>
		 &nbsp; 
		<button class="btn btn-default" click="reloads"  type="button"><i class="icon-refresh"></i> 刷新</button>
	</td>
	<td align="right">
	<button class="btn btn-default" click="reloadszt"  type="button"><i class="icon-refresh"></i> 刷新狀態</button>&nbsp;
		<button class="btn btn-info" id="edit_{rand}" click="clickwin,1" disabled type="button"><i class="icon-edit"></i> 編輯 </button>
	</td>
	</tr>
	</table>
</div>
<div class="blank10"></div>
<div id="view_{rand}"></div>
<div class="tishi">如公開說明使用信呼系統的用戶都可以使用這個簽名，審核通過簽名不能修改。普通用戶不能添加簽名，VIP用戶可添加1個簽名，合作商沒限制，添加簽名是需要審核的，可[刷新狀態]查看審核狀態。</div>