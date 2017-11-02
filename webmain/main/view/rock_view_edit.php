<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	{params};
	var id = params.id,mid=params.mid;
	if(!id)id = 0;
	var h = $.bootsform({
		window:false,rand:'{rand}',tablename:'flow_extent',
		url:publicsave('{mode}','{dir}'),
		submitfields:'recename,receid,modeid,type,whereid,wherestr,explain,status',
		requiredfields:'recename,type,modeid',
		success:function(){
			closenowtabs();
			try{guanflowviewlist.reload();}catch(e){}
			
		},
		load:function(a){
			js.setselectdata(h.form.whereid,a.wherelist,'id');
		},
		loadafter:function(a){
			if(a.data){
				h.form.wherestr.value=jm.base64decode(a.data.wherestr);
			}
		},
		submitcheck:function(d){
			if(d.type!='1' && d.type!='4' && d.wherestr=='' && d.whereid=='0')return '必須設置輸入相應條件';
			return {wherestr:jm.base64encode(d.wherestr)}
		}
	});
	h.forminit();
	h.load(js.getajaxurl('loaddata','{mode}','{dir}',{id:id,mid:mid}));
	h.setValue('modeid',mid);
	var c = {
		getdist:function(o1, lx){
			var cans = {
				nameobj:h.form.recename,
				idobj:h.form.receid,
				type:'deptusercheck',
				title:'選擇針對人員'
			};
			js.getuser(cans);
		},
		allqt:function(){
			h.form.recename.value='全體人員';
			h.form.receid.value='all';
			h.form.recename.focus();
		},
		hanrenss:function(o,lx){
			if(lx==0)h.form.wherestr.value='{receid}';
			if(lx==1)h.form.wherestr.value='{allsuper}';
			if(lx==2)h.form.wherestr.value='{super}';
			if(lx==4)h.form.wherestr.value='{dept}';
			if(lx==3)h.form.wherestr.value='all';
		}
		,
		reloadhweil:function(){
			h.form.whereid.length = 1;
			h.load(js.getajaxurl('loaddata','{mode}','{dir}',{id:id,mid:mid}));
		}
	};
	js.initbtn(c);
});

</script>

<div align="center">
<div  style="padding:10px;width:700px">
	
	
	<form name="form_{rand}">
	
		<input name="id" value="0" type="hidden" />
		<input name="modeid" value="0" type="hidden" />
		
		<table cellspacing="0" border="0" width="100%" align="center" cellpadding="0">
		
		<tr>
			<td align="right" ><font color=red>*</font> 針對對象：</td>
			<td class="tdinput" colspan="3">
				<div class="input-group" style="width:100%">
					<input readonly  class="form-control"  name="recename" >
					<input type="hidden" name="receid" >
					<span class="input-group-btn">
						<button class="btn btn-default" click="allqt" type="button">全體人員</button>
						<button class="btn btn-default" click="getdist,1" type="button"><i class="icon-search"></i></button>
					</span>
				</div>
			</td>
			
		</tr>
		
		<tr>
			<td  align="right" width="15%" ><font color=red>*</font> 類型可：</td>
			<td class="tdinput" width="35%" ><select name="type" class="form-control"><option value="0">查看</option><option value="1">添加</option><option value="2">編輯</option><option value="3">刪除</option><option value="4">導入</option></select></td>
			<td  align="right"  width="15%"></td>
			<td class="tdinput" width="35%" ></td>
		</tr>
		
		<tr>
			<td  align="right" >選擇條件：</td>
			<td class="tdinput"><select class="form-control" name="whereid"><option value="0">無條件</option></select></td>
			<td colspan="2"><a click="reloadhweil" href="javascript:;">[刷新]</a></td>
		</tr>
		<tr>
			<td  align="right" ></td>
			<td colspan="3" style="padding-bottom:10px"><font color=#888888>在【流程模塊條件】上添加，滿足此條件才需要此步驟</font></td>
		</tr>
		
		<tr>
			<td  align="right" >相應條件：</td>
			<td class="tdinput" colspan="3"><textarea placeholder="由對應模塊上主表字段，如:optid={uid}，操作人是當前用戶" name="wherestr" style="height:60px" class="form-control"></textarea><br>如:<a click="hanrenss,0" href="javascript:;">[receid中包含我]</a>,<a click="hanrenss,1" href="javascript:;">[所有下屬人員]</a>,<a click="hanrenss,2" href="javascript:;">[直屬下屬人員]</a>,<a click="hanrenss,4" href="javascript:;">[同級本部門]</a>,<a click="hanrenss,3" href="javascript:;">[所有數據]</a></td>
		</tr>
		
		<tr>
			<td  align="right" >條件說明：</td>
			<td class="tdinput" colspan="3"><textarea  name="explain" style="height:60px" class="form-control"></textarea></td>
		</tr>
		
		<tr>
			<td  align="right" ></td>
			<td class="tdinput" colspan="3">
				<label><input name="status" value="1" checked type="checkbox"> 啟用?</label>&nbsp; &nbsp; 
			</td>
		</tr>

		
		<tr>
			<td  align="right"></td>
			<td style="padding:15px 0px" colspan="3" align="left"><button disabled class="btn btn-success" id="save_{rand}" type="button"><i class="icon-save"></i>&nbsp;保存</button>&nbsp; <span id="msgview_{rand}"></span>
		</td>
		</tr>
		
		</table>
		</form>
	
</div>
</div>
