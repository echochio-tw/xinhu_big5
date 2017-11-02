<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	var month,pid=0;
	var a = $('#view_{rand}').bootstable({
		tablename:'kqxxsj',celleditor:true,keywhere:'[A][K]pid=0',
		columns:[{
			text:'規則名稱',dataIndex:'name',sortable:true
		},{
			text:'ID',dataIndex:'id'
		}],
		itemclick:function(){
			btn(false);
		},
		beforeload:function(){
			btn(true);
		},
		itemdblclick:function(d){
			pid = d.id;
			get('set_{rand}').disabled=false;
			get('setadds_{rand}').disabled=false;
			b.setparams({pid:pid},true);
		}
	});
	
	var b = $('#viewa_{rand}').bootstable({
		tablename:'kqxxsj',autoLoad:false,url:publicstore('{mode}','{dir}'),storebeforeaction:'kqxxsjdtbefore',storeafteraction:'kqxxsjdtafter',fanye:true,
		columns:[{
			text:'休息日期',dataIndex:'dt',sortable:true
		},{
			text:'星期',dataIndex:'week'
		},{
			text:'操作',dataIndex:'id',renderer:function(s){
				return '<a href="javascript:;" onclick="renfw{rand}()">刪</a>';
			}
		}]
	});
	
	function btn(bo){
		get('del_{rand}').disabled = bo;
		get('edit_{rand}').disabled = bo;
	}
	
	var c = {
		del:function(){
			a.del({url:js.getajaxurl('kqsjgzdatadel','{mode}','{dir}',{type:2}),success:function(){
				b.reload();
			}});
		},
		dela:function(){
			b.del({url:js.getajaxurl('kqsjgzdatadel','{mode}','{dir}',{type:3})});
		},
		clickwin:function(o1,lx){
			var h = $.bootsform({
				title:'規則',height:180,width:400,
				tablename:'kqxxsj',isedit:lx,submitfields:'name',
				items:[{
					labelText:'名稱',name:'name',required:true
				}],
				success:function(){
					a.reload();
				}
			});
			if(lx==1)h.setValues(a.changedata);
		},
		change:function(o1, lx){
			
			mobj.fanmonth(lx);
		},
		nowchange:function(){
			mobj.nowmonth();
		},
		byuexiux:function(){
			var month = $('#dt1_{rand}').val();
			if(!month){
				js.msg('msg','請選擇月份');
				return;
			}
			js.msg('wait','設置中...');
			js.ajax(js.getajaxurl('setxiugdate','{mode}','{dir}'),{'month':month,'pid':pid},function(a){
				b.reload();
				js.msg('success','設置成功');
			});
		},
		clickwins:function(o1,lx){
			var h = $.bootsform({
				title:'['+a.changedata.name+']的休息日',height:180,width:400,
				tablename:'kqxxsj',isedit:lx,submitfields:'dt,pid',
				params:{otherfields:'pid='+pid+''},
				items:[{
					labelText:'名稱',name:'dt',type:'date',view:'date',required:true
				}],
				success:function(){
					b.reload();
				}
			});
			if(lx==1)h.setValues(a.changedata);
		},
		clickdt:function(o1, lx){
			$(o1).rockdatepicker({initshow:true,view:'month',inputid:'dt'+lx+'_{rand}'});
		},
		search:function(){
			var month = $('#dt1_{rand}').val();
			if(!month){
				//js.msg('msg','請選擇月份');
				//return;
			}
			b.setparams({'month':month},true);
		}
	};
	renfw{rand}=function(){
		setTimeout(function(){c.dela()},1);
	}

	js.initbtn(c);
	//$('#dt1_{rand}').val(js.now('Y-m'));
});
</script>
<table width="100%">
<tr valign="top">
	<td width="40%">
		
		
		<div>
		<table width="100%"><tr>
			<td nowrap>
				<button class="btn btn-primary" click="clickwin,0" type="button"><i class="icon-plus"></i> 新增</button>
			</td>
			
			<td></td>
			<td align="right" nowrap>
				<button class="btn btn-info" id="edit_{rand}" click="clickwin,1" disabled type="button"><i class="icon-edit"></i> 編輯 </button> &nbsp; 
				<button class="btn btn-danger" id="del_{rand}" click="del" disabled type="button"><i class="icon-trash"></i> 刪除</button>
				
			</td>
		</tr></table>
		</div>
		<div class="blank10"></div>
		<div id="view_{rand}"></div>
		<div class="tishi">先雙擊查看設置休息日的日期，在添加休息日</div>
	</td>
	<td width="10"><div style="width:20px;overflow:hidden"></div></td>
	<td width="60%">
		<div>
		<table width="100%"><tr>
			<td>
				<button class="btn btn-primary" id="setadds_{rand}" disabled click="clickwins,0" type="button"><i class="icon-plus"></i> 加休息日</button>
			</td>
			<td style="padding-left:10px">
				<button class="btn btn-info" id="set_{rand}" click="byuexiux" disabled type="button">設置本月週六日為休息日</button>
			</td>
			
			<td width="90%">
				
			</td>
			<td align="right" nowrap>
				<div style="width:160px"  class="input-group">
					<input placeholder="月份" readonly class="form-control" id="dt1_{rand}" >
					<span class="input-group-btn">
						<button class="btn btn-default" click="clickdt,1" type="button"><i class="icon-calendar"></i></button>
						<button class="btn btn-default" click="search" type="button"><i class="icon-search"></i></button>
					</span>
				</div>
				
			</td>
		</tr></table>
		</div>
		</div>
		<div class="blank10"></div>
		<div id="viewa_{rand}"></div>
		<div class="blank10"></div>
		<div id="viewab_{rand}"></div>
		<div class="blank10"></div>
	</td>
</tr>
</table>

