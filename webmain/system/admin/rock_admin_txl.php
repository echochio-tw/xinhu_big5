<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	
	var at = $('#optionview_{rand}').bootstree({
		url:false,autoLoad:false,
		columns:[{
			text:'部門',dataIndex:'name',align:'left',xtype:'treecolumn'
		}],
		itemdblclick:function(d){
			a.setparams({'deptid':d.id}, true);
		}
	});
	
	
	var a = $('#admin_{rand}').bootstable({
		modenum:'user',sort:'sort',dir:'asc',fanye:true,params:{atype:'txlmy'},url:publicmodeurl('user'),
		storeafteraction:'storeafter',checked:false,
		columns:[{
			text:'頭像',dataIndex:'face',notexcel:true,renderer:function(v,d){
				if(isempt(v))v='images/noface.png';
				return '<img onclick="$.imgview({url:this.src})" src="'+v+'" height="24" width="24">';
			}
		},{
			text:'姓名',dataIndex:'name',sortable:true
		},{
			text:'部門',dataIndex:'deptname',align:'left'
		},{
			text:'職位',dataIndex:'ranking',sortable:true
		},{
			text:'辦公電話',dataIndex:'tel'
		},{
			text:'手機號',dataIndex:'mobile'
		},{
			text:'郵箱',dataIndex:'email'
		},{
			text:'排序號',dataIndex:'sort',sortable:true
		},{
			text:'在線狀態',dataIndex:'online',sortable:true,renderer:function(v){
				var s = '<span class="label label-default">離線</span>';
				if(v=='1')s = '<span class="label label-success">在線</span>';
				return s;
			}
		},{
			text:'',dataIndex:'optdt',renderer:function(s,d){
				return '<button onclick="openchat('+d.id+',0,\''+d.face+'\')" class="btn btn-primary btn-xs"><i class="icon-comment-alt"></i> 發消息</button>';
			}
		}],
		load:function(d){
			if(d.deptdata){
				at.loadData(d.deptdata);
			}
		}
	});
	
	var c = {
		search:function(){
			var s=get('key_{rand}').value;
			a.setparams({key:s},true);
		},
		daochu:function(){
			a.exceldown();
		},
		changlx:function(o1,lx){
			$("button[id^='state{rand}']").removeClass('active');
			$('#state{rand}_'+lx+'').addClass('active');
			var atype = 'txlmy';
			if(lx=='0')atype = 'txldown';
			if(lx=='1')atype = 'txldownall';
			get('key_{rand}').value='';
			a.setparams({atype:atype,deptid:'0',key:''},true);
		}
	};
	js.initbtn(c);
	
	$('#optionview_{rand}').css('height',''+(viewheight-25)+'px');
});
</script>



<div>

<table width="100%">
<tr valign="top">
<td>
	<div style="border:1px #cccccc solid;width:220px">
	<div id="optionview_{rand}" style="height:400px;overflow:auto;"></div>
	</div>  
</td>
<td width="10" nowrap><div style="width:10px">&nbsp;</div></td>
<td width="95%">	
	
	<table width="100%"><tr>
		<!--
		<td nowrap>
			<button class="btn btn-info" onclick="reim.creategroup()" type="button"><i class="icon-comments-alt"></i> 創建會話</button> 
		</td>-->
		<td>
			<div class="input-group" style="width:250px">
				<input class="form-control" id="key_{rand}"   placeholder="姓名/部門/職位">
				<span class="input-group-btn">
					<button class="btn btn-default" click="search" type="button"><i class="icon-search"></i></button>
				</span>
			</div>
		</td>
		<td  style="padding-left:10px">
		</td>
		<td width="80%">
			<div class="btn-group" id="btngroup{rand}">
			<button class="btn btn-default active" id="state{rand}_" click="changlx," type="button">全部</button>
			<button class="btn btn-default" id="state{rand}_0" click="changlx,0" type="button">我直屬下屬</button>
			<button class="btn btn-default" id="state{rand}_1" click="changlx,1" type="button">全部下屬</button>
			</div>	
		</td>
		<td align="right" nowrap>
			<button class="btn btn-default" click="daochu,1" type="button">導出</button>
		</td>
	</tr>
	</table>
	</div>
	<div class="blank10"></div>
	<div id="admin_{rand}"></div>
</td>
</tr>
</table>