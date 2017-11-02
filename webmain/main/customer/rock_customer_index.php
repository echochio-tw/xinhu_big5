<?php defined('HOST') or die('not access');?>
<script >
$(document).ready(function(){
	var obj=[];
	obj[0] = $('#view0_{rand}').bootstable({
		tablename:'custsale',params:{'atype':'mygx'},fanye:false,modenum:'custsale',modename:'銷售機會',limit:5,moreurl:'flow,page,custsale,atype=mygx',morenum:'num110',
		columns:[{
			text:'客戶',dataIndex:'custname',align:'left'
		},{
			text:'來源',dataIndex:'laiyuan'
		},{
			text:'狀態',dataIndex:'state'
		},{
			text:'金額',dataIndex:'money'
		},{
			text:'說明',dataIndex:'explain',align:'left'
		}],
		itemdblclick:function(d){
			openxiangs(this.modename,this.modenum,d.id);
		}
	});
	
	obj[1] = $('#view1_{rand}').bootstable({
		tablename:'custract',params:{'atype':'my_all'},fanye:false,modenum:'custract',modename:'合同',limit:5,moreurl:'main,customer,ract,atype=my',morenum:'num108',
		columns:[{
			text:'合同編號',dataIndex:'num'
		},{
			text:'客戶',dataIndex:'custname',align:'left'
		},{
			text:'簽約日期',dataIndex:'signdt',sortable:true
		},{
			text:'合同金額',dataIndex:'money',sortable:true
		},{
			text:'待收付款',dataIndex:'moneys',sortable:true
		},{
			text:'狀態',dataIndex:'statetext'
		}],
		itemdblclick:function(d){
			openxiangs(this.modename,this.modenum,d.id);
		}
	});
	
	obj[2] = $('#view2_{rand}').bootstable({
		tablename:'custfina',params:{'atype':'myskd_wei'},modenum:'custfina',modename:'收款單',limit:5,moreurl:'main,customer,fina,atype=myskd',morenum:'num106',
		columns:[{
			text:'所屬日期',dataIndex:'dt'
		},{
			text:'合同編號',dataIndex:'htnum'
		},{
			text:'客戶',dataIndex:'custname',align:'left'
		},{
			text:'金額',dataIndex:'money',sortable:true
		},{
			text:'狀態',dataIndex:'ispay'
		}],
		itemdblclick:function(d){
			openxiangs(this.modename,this.modenum,d.id);
		}
	});
	
	obj[3] = $('#view3_{rand}').bootstable({
		tablename:'custfina',params:{'atype':'myfkd_wei'},modenum:'custfina',modename:'付款單',limit:5,moreurl:'main,customer,fina,atype=myfkd',morenum:'num107',
		columns:[{
			text:'所屬日期',dataIndex:'dt'
		},{
			text:'合同編號',dataIndex:'htnum'
		},{
			text:'客戶',dataIndex:'custname',align:'left'
		},{
			text:'金額',dataIndex:'money',sortable:true
		},{
			text:'狀態',dataIndex:'ispay'
		}],
		itemdblclick:function(d){
			openxiangs(this.modename,this.modenum,d.id);
		}
	});
	
	var c = {
		reload:function(o1,lx){
			obj[lx].reload();
		},
		more:function(o1,lx){
			var d = obj[lx].options;
			addtabs({num:d.morenum,name:'我的'+d.modename+'',url:d.moreurl});
		}
	}
	js.initbtn(c);
});
</script>

<div align="left" style="padding:10px">
	<table  border="0" width="100%" cellspacing="0" cellpadding="0">
	<tr valign="top">
		
		<td width="50%">
			<div align="left" style="min-width:300px" class="list-group">
			<div class="list-group-item  list-group-item-info">
				<i class="icon-flag"></i> 需跟蹤銷售機會
				<span style="float:right" ><a click="reload,0"><i class="icon-refresh"></i></a>&nbsp;<a click="more,0">更多&gt;&gt;</a></span>
			</div>
			<div id="view0_{rand}"></div>
			</div>
			
			<div align="left" class="list-group">
			<div class="list-group-item  list-group-item-success">
				<i class="icon-flag"></i> 合同
				<span style="float:right" ><a click="reload,1"><i class="icon-refresh"></i></a>&nbsp;<a click="more,1">更多&gt;&gt;</a></span>
			</div>
			<div id="view1_{rand}"></div>
			</div>
			
			
		
			
		</td>
		
		<td style="padding-left:20px;">
			<div align="left" class="list-group">
			<div class="list-group-item  list-group-item-success">
				<i class="icon-money"></i> 待收款單
				<span style="float:right" ><a click="reload,2"><i class="icon-refresh"></i></a>&nbsp;<a click="more,2">更多&gt;&gt;</a></span>
			</div>
			<div id="view2_{rand}"></div>
			</div>
			
			<div align="left" class="list-group">
			<div class="list-group-item  list-group-item-danger">
				<i class="icon-money"></i> 待付款單
				<span style="float:right" ><a click="reload,3"><i class="icon-refresh"></i></a>&nbsp;<a click="more,3">更多&gt;&gt;</a></span>
			</div>
			<div id="view3_{rand}"></div>
			</div>
			
		</td>
		
		
		
	</tr>
	</table>
	<div class="tishi">雙擊對應記錄可查看詳情！</div>
</div>
