<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	{params};
	var id = params.id;
	if(!id)id = 0;
	var h = $.bootsform({
		window:false,rand:'{rand}',tablename:'flow_where',url:publicsave('{mode}','{dir}'),
		submitfields:'setid,name,wheresstr,whereustr,wheredstr,pnum,explain,recename,status,islb,receid,nrecename,nreceid,num,sort',requiredfields:'name',
		success:function(){
			if(id>0){
				closenowtabs();
			}else{
				js.msg('success','新增成功，繼續保存可持續新增');
			}
			try{guanflowwherelist.reload();}catch(e){}
		},
		loadafter:function(a){
			if(a.data){
				h.form.wheresstr.value=jm.base64decode(a.data.wheresstr);
				h.form.whereustr.value=jm.base64decode(a.data.whereustr);
				h.form.wheredstr.value=jm.base64decode(a.data.wheredstr);
			}
		},
		submitcheck:function(d){
			if(d.islb==1&&d.num=='')return '請設置一個編號';
			return {
				wheresstr:jm.base64encode(d.wheresstr),
				whereustr:jm.base64encode(d.whereustr),
				wheredstr:jm.base64encode(d.wheredstr)
			};
		}
	});
	h.forminit();
	h.load(js.getajaxurl('loaddatawhere','{mode}','{dir}',{id:id}));
	var c = {
		setwhere:function(){
			js.setwhere(params.setid,'backsheowe{rand}');
		},
		clears:function(o1,lx){
			if(lx==1){
				h.setValue('recename','');
				h.setValue('receid','');
			}
			if(lx==2){
				h.setValue('nrecename','');
				h.setValue('nreceid','');
			}
		},
		getdist:function(o1, lx){
			var cans = {
				nameobj:h.form.recename,
				idobj:h.form.receid,
				type:'deptusercheck',
				title:'選擇包含人員'
			};
			if(lx==2){
				var cans = {
					nameobj:h.form.nrecename,
					idobj:h.form.nreceid,
					type:'deptusercheck',
					title:'選擇除外人員'
				};
			}
			cans.value=cans.idobj.value,
			js.getuser(cans);
		},
		setdab:function(ov,lx){
			var a = ['{read}','{unread}','{weekfirst}'];
			this.addwhewe(a[lx]);
		},
		addwhewe:function(ss){
			if(!ss)return;
			if(h.form.wheresstr.value!='')ss='and '+ss+'';
			h.form.wheresstr.value+=' '+ss;
		},
		changessvs:function(ss){
			if(!ss)return;
			var fid = get('weherecss{rand}').value;
			if(fid==''){js.msg('msg','沒有輸入字段');return;}
			ss = ss.replace('uid', fid);
			c.addwhewe(ss);
		}
	};
	js.initbtn(c);
	if(id==0)h.form.setid.value=params.setid;
	backsheowe{rand}=function(s1,s2){
		h.setValue('wheresstr',s1);
		h.setValue('explain',s2);
	}
	$('#weherecs{rand}').change(function(){
		c.changessvs(this.value);
	});
});

</script>

<div align="center">
<div  style="padding:10px;width:700px">
	
	
	<form name="form_{rand}">
	
		<input name="id" value="0" type="hidden" />
		<input name="setid" value="0" type="hidden" />
		
		<table cellspacing="0" border="0" width="100%" align="center" cellpadding="0">
		<tr>
			<td  align="right"  width="25%"><font color=red>*</font> 名稱：</td>
			<td class="tdinput"  width="25%"><input name="name" class="form-control"></td>
			<td  align="right"   width="15%">編號：</td>
			<td class="tdinput" width="30%"><input name="num"  maxlength="30" class="form-control"></td>
		</tr>
		
		<tr>
			<td  align="right" ></td>
			<td class="tdinput" ></td>
			<td  align="right" >分組編號：</td>
			<td class="tdinput"><input name="pnum"  maxlength="30" class="form-control"></td>
		</tr>
		

		<tr>
			<td  align="right" >主表字段條件：</td>
			<td class="tdinput" colspan="3"><textarea  name="wheresstr" style="height:60px" class="form-control"></textarea><div class="tishi" style="padding-top:0px">對應主表上字段條件，字段必須用``包含，如：`uid`={uid},<a click="setwhere" href="javascript:;">[設置條件]</a><br>字段:<input style="width:60px"  id="weherecss{rand}" class="input" value="uid">中<select class="input" id="weherecs{rand}"><option value="">-選擇條件-</option><option value="{uid,uidin}">包含當前用戶</option><option value="{uid,down}">直屬下級</option><option value="{uid,downall}">全部直屬下級</option><option value="{uid,dept}">同級部門人員</option><option value="{receid}">receid字段包含當前用戶</option><option value="{read}">已讀記錄</option><option value="{unread}">未讀記錄</option><option value="{uid,receall}">字段中用戶部門包含當前用戶(含為空時)</option><option value="{uid,recenot}">字段中用戶部門包含當前用戶</option></select><br>用{}的變量會在文件webmain/model/whereModel.php中的getstrwhere方法替換可自己查看。<a href="<?=URLY?>view_flowwhere.html" target="_blank">[看幫助介紹]</a></div></td>
		</tr>
		
		<tr>
			<td  align="right" >數據上人員包含條件：</td>
			<td class="tdinput" colspan="3">
			<div style="width:100%" class="input-group">
				<input readonly class="form-control"  name="recename" >
				<input type="hidden" name="receid" >
				<span class="input-group-btn">
					<button class="btn btn-default" click="clears,1" type="button"><i class="icon-remove"></i></button>
					<button class="btn btn-default" click="getdist,1" type="button"><i class="icon-search"></i></button>
				</span>
			</div>
			<textarea  name="whereustr" style="height:40px" class="form-control"></textarea><div class="tishi" style="padding-top:0px">不選默認全部人員</div>
			</td>
		</tr>
		
		<tr>
			<td  align="right" >除了這些人員外：</td>
			<td class="tdinput" colspan="3">
			<div style="width:100%" class="input-group">
				<input readonly class="form-control"  name="nrecename" >
				<input type="hidden" name="nreceid" >
				<span class="input-group-btn">
					<button class="btn btn-default" click="clears,2" type="button"><i class="icon-remove"></i></button>
					<button class="btn btn-default" click="getdist,2" type="button"><i class="icon-search"></i></button>
				</span>
			</div>
			<textarea  name="wheredstr" style="height:40px" class="form-control"></textarea></div>
			</td>
		</tr>
		
		
		
		<tr>
			<td  align="right" >說明：</td>
			<td class="tdinput" colspan="3"><textarea  name="explain" style="height:60px" class="form-control"></textarea></td>
		</tr>
		
		
		<tr>
			<td align="right">排序號：</td>
			<td class="tdinput"><input name="sort" value="0" maxlength="3" type="number"  onfocus="js.focusval=this.value" onblur="js.number(this)" class="form-control"></td>
	
			
		</tr>
		
		<tr>
			<td  align="right" ></td>
			<td class="tdinput" colspan="3">
				<label><input name="status" value="1" checked type="checkbox"> 啟用?</label>&nbsp; &nbsp; 
				<label><input name="islb" value="0" type="checkbox"> 列表頁顯示</label>&nbsp; &nbsp; 
			</td>
		</tr>

		
		<tr>
			<td  align="right"></td>
			<td style="padding:15px 0px" colspan="3" align="left"><button disabled class="btn btn-success" id="save_{rand}" type="button"><i class="icon-save"></i>&nbsp;保存</button>&nbsp; <span id="msgview_{rand}"></span>
		</td>
		</tr>
		
		</table>
		</form>
		<div align="left" class="tishi">也可根據編號從程序代碼上自定義返回條件，文件：webmain\model\flow下對應模塊編號文件</div>
</div>
</div>
