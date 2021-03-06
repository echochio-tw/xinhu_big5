<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	var a = $('#view_{rand}').bootstable({
		tablename:'flow_bill',celleditor:true,fanye:true,statuschange:false,
		url:publicstore('fwork','{dir}'),params:{atype:'error'},storebeforeaction:'flowbillbefore',storeafteraction:'flowbillafter',
		columns:[{
			text:'模塊',dataIndex:'modename'
		},{
			text:'部門',dataIndex:'deptname'
		},{
			text:'申請人',dataIndex:'name'
		},{
			text:'單號',dataIndex:'sericnum'
		},{
			text:'申請日期',dataIndex:'applydt',sortable:true
		},{
			text:'摘要',dataIndex:'summary',align:'left',width:300
		},{
			text:'狀態',dataIndex:'status',sortable:true
		},{
			text:'異常原因',dataIndex:'errorsm'
		},{
			text:'處理方法',dataIndex:'chuli',align:'left'
		},{
			text:'處理',dataIndex:'chulis',renderer:function(v,d,i){
				if(d.errtype==1)v='<button type="button" onclick="biaoshiyw{rand}('+i+')" class="btn btn-success btn-xs">標識已審核</button>';
				return v;
			}
		}],
		itemclick:function(d){
			btn(false, d);
		},
		beforeload:function(){
			btn(true);
		},
		celldblclick:function(){
			c.view();
		}
	});
	function btn(bo, d){
		get('edit_{rand}').disabled = bo;
	}
	biaoshiyw{rand}=function(i){
		c.biaowanc(i);
	}
	var c = {
		view:function(){
			var d=a.changedata;
			openxiangs(d.modename,d.modenum,d.id);
		},
		pipei:function(){
			js.ajax(js.getajaxurl('reloadpipei','{mode}','{dir}'),{},function(s){
				js.msg('success', s);
				a.reload();
			},'get',false,'匹配中...,匹配完成');
		},
		biaowanc:function(i){
			var d= a.getData(i);
			js.prompt('異常標識說明','確定要標識已完成/已審核的單據狀態嗎？請輸入說明：',function(jg, text){
				if(jg=='yes' && text){
					d.sm = text;
					c.biaowancss(d);
				}
			});
		},
		biaowancss:function(d){
			js.ajax(js.getajaxurl('oksuccess','flowopt','flow'),{modenum:d.modenum,mid:d.id,sm:d.sm},function(s){
				if(s=='ok'){
					a.reload();
				}else{
					js.msg('msg', s);
				}
			},'post',false,'標識中...,標識成功');
		}
	};
	js.initbtn(c);

});
</script>

<div>
	<table width="100%">
	<tr>
	<td nowrap align="left">
	<button class="btn btn-default" click="pipei" type="button">重新匹配流程</button>&nbsp; 	
	</td>
	<td align="left"  width="100%" style="padding:0px 10px;">
		<div class="tishi">如有異常的記錄請點擊[重新匹配流程]，如出現無法解決，查看<a target="_blank" href="<?=URLY?>view_danerror.html">幫助</a>。<div>
	</td>
	<td align="right">
		
		<button class="btn btn-default" id="edit_{rand}" click="view" disabled type="button">查看</button>
	</td>
	</tr>
	</table>
	
</div>
<div class="blank10"></div>
<div id="view_{rand}"></div>

