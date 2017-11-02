<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	var gid = 0;
	var a = $('#veiw_{rand}').bootstable({
		tablename:'group',celleditor:true,url:publicstore('{mode}','{dir}'),storeafteraction:'groupafter',
		modenum:'group',
		columns:[{
			text:'組名',dataIndex:'name',editor:true
		},{
			text:'排序號',dataIndex:'sort',editor:true
		},{
			text:'人員數',dataIndex:'utotal'
		},{
			text:'ID',dataIndex:'id'	
		}],
		itemclick:function(){
			btn(false);
		},
		itemdblclick:function(ad,oi,e){
			$('#downshow_{rand}').html('組<b>['+ad.name+']</b>下的人員');
			gid=ad.id;
			at.setparams({gid:gid},true);
		}
	});
	
	var at = $('#veiwuser_{rand}').bootstable({
		tablename:'admin',sort:'sort',dir:'asc',
		url:publicstore('{mode}','{dir}'),
		autoLoad:false,storebeforeaction:'groupusershow',
		columns:[{
			text:'用戶名',dataIndex:'user',sortable:true
		},{
			text:'姓名',dataIndex:'name',sortable:true
		},{
			text:'部門',dataIndex:'deptname',sortable:true
		},{
			text:'操作',dataIndex:'opt',renderer:function(v,d){
				return '<a href="javascript:" onclick="return deluserr{rand}('+d.id+')"><i class="icon-trash"> 刪</a>';
			}
		}],
		load:function(){
			get('add_{rand}').disabled=false;
		}
	});
	
	var c = {
		del:function(){
			a.del({check:function(lx){if(lx=='yes')btn(true)}});
		},
		clickwin:function(o1,lx){
			var h = $.bootsform({
				title:'組',height:400,width:400,
				tablename:'group',isedit:lx,
				url:js.getajaxurl('publicsave','group','system'),
				params:{int_filestype:'sort',add_otherfields:'indate={now}'},
				submitfields:'name,sort',
				items:[{
					labelText:'組名',name:'name',required:true
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
			if(gid>0)at.reload();
		},
		addguser:function(){
			var cans = {
				type:'usercheck',
				title:'選擇人員',
				callback:function(sna,sid){
					c.savedist(sid);
				}
			};
			js.getuser(cans);
			return false;
		},
		savedist:function(sid){
			if(sid!=''){
				js.msg('wait','保存中...');
				js.ajax(js.getajaxurl('saveuser','{mode}','{dir}'),{sid:sid,gid:gid},function(){
					js.msg('success','保存成功');
					at.reload();
					a.reload();
				},'post');
			}
		},
		delusers:function(uid){
			js.msg('wait','刪除中...');
			js.ajax(js.getajaxurl('deluser','{mode}','{dir}'),{sid:uid,gid:gid},function(){
				js.msg('success','刪除成功');
				at.reload();
				a.reload();
			},'post');
		}
	};
	
	function btn(bo){
		get('del_{rand}').disabled = bo;
		get('edit_{rand}').disabled = bo;
	}
	
	js.initbtn(c);
	
	deluserr{rand}=function(uid){
		js.confirm('確定要刪除組下的人員嗎？',function(lx){
			if(lx=='yes'){
				c.delusers(uid);
			}
		});
	}
});
</script>

<table width="100%">
<tr valign="top">
<td width="40%">
	
	
	<div>
	<ul class="floats">
		<li class="floats50">
			<button class="btn btn-primary" click="clickwin,0" type="button"><i class="icon-plus"></i> 新增組</button>&nbsp; 
			<button class="btn btn-default" click="refresh,0" type="button">刷新</button>
		</li>
		<li class="floats50" style="text-align:right">
			<button class="btn btn-danger" id="del_{rand}" click="del" disabled type="button"><i class="icon-trash"></i> 刪除</button> &nbsp; 
			<button class="btn btn-info" id="edit_{rand}" click="clickwin,1" disabled type="button"><i class="icon-edit"></i> 編輯 </button>
		</li>
	</ul>
	</div>
	<div class="blank10"></div>
	<div id="veiw_{rand}"></div>
	<div class="tishi">先雙擊對應組查看人員，在添加組下人員</div>
</td>
<td width="10"></td>
<td>
	
	<div>
	<ul class="floats">
		<li class="floats50">
			<span id="downshow_{rand}">&nbsp;</span>
		</li>
		<li class="floats50" style="text-align:right">
			<button class="btn btn-primary" click="addguser,0" id="add_{rand}" disabled type="button"><i class="icon-plus"></i> 添加組下人員</button>
		</li>
	</ul>
	</div>
	<div class="blank10"></div>
	<div id="veiwuser_{rand}"></div>	
	
</td>
</tr>
</table>
