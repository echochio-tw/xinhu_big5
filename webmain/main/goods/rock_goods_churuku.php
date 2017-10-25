<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	{params}
	var bools = false;
	var type = params.type,typename='入庫';
	if(type==1)typename='出庫';
	var a = $('#view_{rand}').bootstable({
		tablename:'goods',celleditor:true,fanye:true,params:{'type':type},
		url:publicstore('{mode}','{dir}'),storebeforeaction:'beforeshow',storeafteraction:'aftershow',
		columns:[{
			text:'<font color=red>*</font>'+typename+'數量',dataIndex:'shu',renderer:function(v,d){
				return '<input name="shu_{rand}" valid="'+d.id+'" style="width:80px;text-align:center" onfocus="js.focusval=this.value" onblur="js.number(this)" type="number" value="" class="form-control">';
			}
		},{
			text:'庫存',dataIndex:'stock',sortable:true
		},{
			text:'名稱',dataIndex:'name'
		},{
			text:'分類',dataIndex:'typeid'
		},{
			text:'單價',dataIndex:'price',sortable:true
		},{
			text:'單位',dataIndex:'unit'
		},{
			text:'規格',dataIndex:'guige'
		},{
			text:'型號',dataIndex:'xinghao'
		},{
			text:'庫存',dataIndex:'stock',sortable:true
		},{
			text:'ID',dataIndex:'id'	
		}],
		itemdblclick:function(d){
			openxiang('goods',d.id);
		},
		load:function(d){
			if(!bools){
				js.setselectdata(get('type_{rand}'),d.typearr,'value');
			}
			bools=true;
		}
	});
	var c = {
		save:function(o1){
			var d={dt:$('#dt1_{rand}').val(),type:type,kind:get('type_{rand}').value,sm:get('explain_{rand}').value};
			var msgid='msgview_{rand}';
			d.cont = c.getshul();
			if(d.cont==''){
				js.setmsg('沒有輸入'+typename+'數量','', msgid);
				return;
			}
			if(d.dt==''){
				js.setmsg('請選擇日期','', msgid);
				return;
			}
			if(d.kind==''){
				js.setmsg('請選擇'+typename+'類型','', msgid);
				return;
			}
			js.setmsg(''+typename+'中...','', msgid);
			o1.disabled=true;
			js.ajax(js.getajaxurl('chukuopt','{mode}','{dir}'),d,function(s){
				if(s=='success'){
					js.setmsg(''+typename+'成功','green', msgid);
					a.reload();
				}else{
					js.setmsg(s,'', msgid);
					o1.disabled=false;
				}
			},'post');
		},
		getshul:function(){
			var o = $("input[name='shu_{rand}']"),i,s='',o1,val;
			for(i=0;i<o.length;i++){
				o1=$(o[i]);
				val=o1.val();
				if(!isempt(val)){
					val=parseInt(val);
					if(val>0)s+=','+o1.attr('valid')+'|'+val+'';
				}
			}
			if(s!='')s=s.substr(1);
			return s;
		},
		search:function(){
			var s=get('key_{rand}').value;
			a.setparams({key:s},true);
		},
		clickdt:function(o1, lx){
			$(o1).rockdatepicker({initshow:true,view:'date',inputid:'dt'+lx+'_{rand}'});
		}
	};
	

	js.initbtn(c);
	
	$('#showte{rand}').html('<b>'+typename+'</b>操作');
	$('#dt1_{rand}').val(js.now());
});
</script>
<div>
<table width="100%"><tr>
	<td nowrap>
		<h4 id="showte{rand}">入庫操作</h4>
	</td>
	<td  style="padding-left:10px">
		<div class="input-group" style="width:250px">
			<input class="form-control" id="key_{rand}"   placeholder="名稱">
			<span class="input-group-btn">
				<button class="btn btn-default" click="search" type="button"><i class="icon-search"></i></button>
			</span>
		</div>
	</td>
	
	<td width="80%"></td>
	<td align="right" nowrap>
		
	</td>
</tr></table>
</div>
<div class="blank10"></div>
<div id="view_{rand}"></div>
<div class="blank20"></div>
<table width="500">
	<tr>
	<td width="120" align="right" ><font color=red>*</font>日期：</td>
	<td class="tdinput">
		<div style="width:200px"  class="input-group">
			<input readonly class="form-control" id="dt1_{rand}" >
			<span class="input-group-btn">
				<button class="btn btn-default" click="clickdt,1" type="button"><i class="icon-calendar"></i></button>
			</span>
		</div>
	</td>
	</tr>
	<tr>
	<td align="right" ><font color=red>*</font>類型：</td>
	<td class="tdinput">
		<select  id="type_{rand}" style="width:200px" class="form-control"><option value="">-請選擇-</option></select>
	</td>
	</tr>
	<tr>
	<td align="right" >說明：</td>
	<td class="tdinput">
		<textarea id="explain_{rand}" class="form-control" style="height:60px"></textarea>
	</td>
	</tr>
	
	<tr>
		<td  align="right"></td>
		<td style="padding:15px 0px" colspan="3" align="left"><button click="save" class="btn btn-success" id="save_{rand}" type="button"><i class="icon-save"></i>&nbsp;確認提交</button>&nbsp; <span id="msgview_{rand}"></span>
	</td>
	</tr>
</table>
<div class="blank10"></div>
