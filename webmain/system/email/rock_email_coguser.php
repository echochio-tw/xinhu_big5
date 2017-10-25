<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	var a = $('#admin_{rand}').bootstable({
		tablename:'admin',modenum:'user',celleditor:true,sort:'sort',dir:'asc',fanye:true,
		storebeforeaction:'coguserbeforeshow',modedir:'{mode}:{dir}',params:{atype:'all'},
		columns:[{
			text:'頭像',dataIndex:'face',renderer:function(v,d){
				if(isempt(v))v='images/noface.png';
				return '<img src="'+v+'" height="24" width="24">';
			}
		},{
			text:'部門',dataIndex:'deptallname',align:'left'
		},{
			text:'姓名',dataIndex:'name',sortable:true
		},{
			text:'用戶名',dataIndex:'user'
		},{
			text:'職位',dataIndex:'ranking'
		},{
			text:'郵箱',dataIndex:'email',editor:true
		},{
			text:'郵箱密碼',dataIndex:'emailpass',editor:!ISDEMO
		},{
			text:'狀態',dataIndex:'status',type:'checkbox',editor:true,sortable:true
		},{
			text:'ID',dataIndex:'id'	
		}]
	});
	
	var c = {
		search:function(){
			var s=get('key_{rand}').value;
			a.setparams({key:s},true);
		}
	};
	
	js.initbtn(c);
});
</script>



<div>

<table width="100%"><tr>
	<td>
		<div class="input-group" style="width:250px">
			<input class="form-control" id="key_{rand}"   placeholder="姓名/部門/職位/用戶名">
			<span class="input-group-btn">
				<button class="btn btn-default" click="search" type="button"><i class="icon-search"></i></button>
			</span>
		</div>
	</td>
	
	<td width="80%"></td>
	<td align="right" nowrap>
		<a class="btn btn-default" href="<?=URLY?>view_email.html" target="_blank">?查看郵件幫助</a>
	</td>
</tr>
</table>
</div>
<div class="blank10"></div>
<div id="admin_{rand}"></div>
<div class="tishi">此功能設置每個用戶收發郵件的郵箱帳號密碼，添加用戶到用戶管理那添加。</div>
