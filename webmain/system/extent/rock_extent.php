<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	{params};
	var type = params.type;
	
	
	var ucans= {
		tablename:'admin',sort:'sort',dir:'asc',modedir:'{mode}:{dir}',storebeforeaction:'beforeextentuser',
		title:'人員',bodyStyle:'height:'+(viewheight-135)+'px;overflow:auto',
		columns:[{
			text:'姓名',dataIndex:'name',sortable:true
		},{
			text:'部門',dataIndex:'deptname',sortable:true
		},{
			text:'用戶名',dataIndex:'user',sortable:true
		},{
			text:'ID',dataIndex:'id',sortable:true
		}]
	};
	
	var mcans = {
		tablename:'menu',selectcls:'info',
		url:js.getajaxurl('data','menu','system',{'type':type}),
		tree:true,title:'菜單',bodyStyle:'height:'+(viewheight-135)+'px;overflow:auto',
		columns:[{
			text:'菜單名稱',dataIndex:'name',align:'left'
		},{
			text:'編號',dataIndex:'num'
		},{
			text:'ID',dataIndex:'id'
		}]
	};
	
	var gcans = {
		tablename:'group',sort:'sort',dir:'asc',title:'組',
		columns:[{
			text:'組名',dataIndex:'name',sortable:true
		},{
			text:'排序號',dataIndex:'sort',sortable:true
		},{
			text:'ID',dataIndex:'id',sortable:true
		}]
	};
	
	var viewcan1,viewcan2;
	
	if(type=='um' || type=='view'){
		viewcan1 = ucans;
		viewcan2 = mcans;
		viewcan1.fanye=true;
		viewcan1.bodyStyle='height:'+(viewheight-225)+'px;overflow:auto';
	}
	if(type=='mu'){
		viewcan1 = mcans;
		viewcan2 = ucans;
	}
	if(type=='gm'){
		viewcan1 = gcans;
		viewcan2 = mcans;
	}
	if(type=='mg'){
		viewcan1 = mcans;
		viewcan2 = gcans;
	}

	
	
	if(type=='view'){
		$('#viessban_{rand}').html('人員菜單權限有如下得來：1、根據[人員→菜單,菜單→人員]；2、如所在的組有權限，組下人員也有權限；3、在[菜單管理]沒有開啟驗證的菜單任何人是都有權限。');
	}
	
	var bool = false,changeid=0;
	
	var a = $('#view1_{rand}').bootstable(js.apply(viewcan1,{
		itemclick:function(d){
			
			getextent(d)
		}
	}));	
	var b = $('#view2_{rand}').bootstable(js.apply(viewcan2,{
		checked:true
	}));
	$('#title1_{rand}').html(viewcan1.title);
	$('#title2_{rand}').html(viewcan2.title);
	
	function getextent(d){
		setmsg('讀取中...');
		if(bool)return;
		$('#title2_{rand}').html(viewcan1.title+'['+d.name+']對應'+viewcan2.title+'');
		btn(false);
		var mid		= d.id;
		changeid 	= mid;
		$.post(js.getajaxurl('getextent','extent','system'),{mid:mid,type:type}, function(da){
			bool= false;
			setmsg('');
			var o = b.getcheckobj();
			for(var i=0;i<o.length;i++){
				o[i].checked=false;
				if(da.indexOf('['+o[i].value+']')>=0)o[i].checked=true;
			}
		});
	}
	
	function setmsg(txt,col){
		js.setmsg(txt,col, 'msgview_{rand}');
	}
	
	function btn(bo){
		if(get('save_{rand}'))get('save_{rand}').disabled = bo;
	}
	
	var c = {
		save:function(o1){
			if(type=='view' || bool || changeid==0)return false;
			var data={type:type,mid:changeid};
			data.checkaid	= b.getchecked();
			var url	= js.getajaxurl('save','extent','system');
			bool	= true;
			setmsg('保存中...');
			btn(true);
			$.post(url,data,function(da){
				if(da!='success'){
					setmsg(da, 'red');
				}else{
					setmsg('保存成功', 'green');
				}
				bool	= false;
			});
		},
		search:function(){
			a.setparams({key:$('#key_{rand}').val()}, true);
		}
	}
	js.initbtn(c);
	
	if(type=='um' || type=='view')$('#soukey_{rand}').show();
});
</script>

<div id="viessban_{rand}" style="margin-bottom:10px">
	<button class="btn btn-primary" disabled id="save_{rand}" click="save" type="button"><i class="icon-save"></i> 保存設置</button>&nbsp; <span id="msgview_{rand}">用戶類型為管理員具有全部菜單權限，權限管理中不會在人員列表上顯示。</span>
</div>
<table width="100%">
<tr valign="top">
	<td width="50%">
		<div class="input-group" style="width:250px;margin-bottom:10px;display:none" id="soukey_{rand}">
			<input class="form-control" id="key_{rand}"   placeholder="人員關鍵詞搜索">
			<span class="input-group-btn">
				<button class="btn btn-default" click="search" type="button"><i class="icon-search"></i></button>
			</span>
		</div>
		
		<div class="panel panel-info">
			<div class="panel-heading"><h3 class="panel-title" id="title1_{rand}">人員</h3></div>
			<div id="view1_{rand}"></div>
		</div>
	</td>
	<td width="10"><div style="width:10px;overflow:hidden"></div></td>
	<td width="50%">
		<div class="panel panel-success">
			<div class="panel-heading"><h3 class="panel-title" id="title2_{rand}">菜單</h3></div>
			<div id="view2_{rand}"></div>
		</div>
	</td>
</tr>
</table>
<div class="blank10"></div>
