<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	var a = $('#view_{rand}').bootstable({
		tablename:'kqsjgz',celleditor:true,tree:true,
		url:js.getajaxurl('kqsjgzdata','{mode}','{dir}'),
		columns:[{
			text:'規則名稱',dataIndex:'name',align:'left',editor:true
		},{
			text:'開始時間',dataIndex:'stime',width:'150px',align:'left',renderer:function(v, d){
				var s=v;
				if(d.level>1 && d.iskt==2){
					s=''+v+'<font color=red>(-1天)</font>';
				}
				if(d.level>1 && d.iskt==1 && v<d.etime){
					s=''+v+'<font color=red>(+1天)</font>';
				}
				return s;
			}
		},{
			text:'結束時間',dataIndex:'etime',width:'150px',align:'left',renderer:function(v, d){
				var s=v;
				if(d.level>1 && d.iskt==1){
					s=''+v+'<font color=red>(+1天)</font>';
				}
				if(d.level>1 && d.iskt==2 && d.stime<v){
					s=''+v+'<font color=red>(-1天)</font>';
				}
				return s;
			}
		},{
			text:'取值類型',dataIndex:'qtype',renderer:function(v, d){
				var s='&nbsp;';
				if(d.level!=1){
					if(v==0)s='最小值';
					if(v==1)s='<font color="#ff6600">最大值</font>';
				}
				return s;
			}
		},{
			text:'排序號',dataIndex:'sort',editor:true
		},{
			text:'需考勤?',dataIndex:'iskq',renderer:function(v, d){
				var s='&nbsp;';
				if(d.level==2){
					if(v==0)s='<font color="#888888">否</font>';
					if(v==1)s='<font color="green">√</font>';
				}
				return s;
			}
		},{
			text:'工作時間段?',dataIndex:'isxx',renderer:function(v, d){
				var s='&nbsp;';
				if(d.level==2){
					if(v==1)s='<font color="#888888">否</font>';
					if(v==0)s='<font color="green">√</font>';
				}
				return s;
			}
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
		get('del_{rand}').disabled = bo;
		get('edit_{rand}').disabled = bo;
		get('down_{rand}').disabled = bo;
	}
	
	var c = {
		del:function(){
			a.del({url:js.getajaxurl('kqsjgzdatadel','{mode}','{dir}')});
		},
		reload:function(){
			a.reload();
		},
		clickwin:function(o1,lx){
			var h = $.bootsform({
				title:'考勤規則',height:380,width:400,
				tablename:'kqsjgz',isedit:lx,
				params:{int_filestype:'pid,sort,qtype,iskt,isxx'},
				submitfields:'name,pid,sort,qtype,stime,etime,iskt,iskq,isxx',
				items:[{
					labelText:'名稱',name:'name',required:true
				},{
					labelText:'上級ＩＤ',name:'pid',required:true,value:'0',type:'hidden'
				},{
					labelText:'開始時間',name:'stime',type:'date',view:'time'
				},{
					labelText:'結束時間',name:'etime',type:'date',view:'time'
				},{
					labelText:'跨天類型',name:'iskt',type:'select',valuefields:'id',displayfields:'name',store:[{id:'0',name:'不跨天'},{id:'2',name:'開始時間-1天'},{id:'1',name:'結束時間+1天'}]
				},{
					labelText:'取值類型',name:'qtype',type:'select',valuefields:'id',displayfields:'name',store:[{id:'0',name:'最小值'},{id:'1',name:'最大值'}]
				},{
					name:'iskq',labelBox:'需考勤?',type:'checkbox'
				},{
					name:'isxx',labelBox:'非工作時間段',type:'checkbox'
				},{
					labelText:'序號',name:'sort',type:'number',value:'0'
				}],
				success:function(){
					a.reload();
				}
			});
			if(lx==1)h.setValues(a.changedata);
			h.getField('name').focus();
			if(lx==2)h.setValue('pid', a.changedata.id);
		}
	};
	

	js.initbtn(c);
});
</script>
<div>
<table width="100%"><tr>
	<td nowrap>
		<button class="btn btn-primary" click="clickwin,0" type="button"><i class="icon-plus"></i> 新增規則</button>&nbsp;&nbsp;
		<button class="btn btn-default" click="reload" type="button">刷新</button>&nbsp;&nbsp;
		<font color="#888888">不會設置？可F2查看<a href="<?=URLY?>view_num53.html" target="_blank">[幫助]</a>。</font>
	</td>
	
	<td></td>
	<td align="right" nowrap>
		<button class="btn btn-warning" click="clickwin,2" id="down_{rand}" disabled type="button">新增下級</button> &nbsp; 
		<button class="btn btn-info" id="edit_{rand}" click="clickwin,1" disabled type="button"><i class="icon-edit"></i> 編輯 </button> &nbsp; 
		<button class="btn btn-danger" id="del_{rand}" click="del" disabled type="button"><i class="icon-trash"></i> 刪除</button>
		
	</td>
</tr></table>
</div>
<div class="blank10"></div>
<div id="view_{rand}"></div>
<div class="tishi">此結構為3級結構，頂級為考勤規則名稱，第2級此規則下每天考勤的名稱，第3級考勤名稱對應狀態值取值時間。</div>
