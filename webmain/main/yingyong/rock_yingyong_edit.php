<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	{params};
	var id = params.id,pid=params.pid;
	if(!id)id = 0;
	if(!pid)pid = '0';
	var h = $.bootsform({
		window:false,rand:'{rand}',tablename:'im_group',
		url:publicsave('{mode}','{dir}'),beforesaveaction:'beforesave',
		params:{int_filestype:'sort,yylx',otherfields:'type=2'},
		submitfields:'sort,name,recename,types,iconcolor,receid,url,face,valid,num,pid,yylx,urlpc,urlm',
		requiredfields:'name,num,types',
		success:function(){
			closenowtabs();
			try{listyingyongobj.reload();}catch(e){}
		},
		load:function(a, o){
			if(a.data){
				get('yingyong{rand}').src=a.data.face;
			}
		},
		loadafter:function(){
			c.urlchange();
		}
	});
	h.forminit();
	
	h.load(js.getajaxurl('loaddata','{mode}','{dir}',{id:id}));


	var c = {
		getdist:function(o1, lx){
			var cans = {
				nameobj:h.form.recename,
				idobj:h.form.receid,
				type:'deptusercheck',
				title:'選擇人員'
			};
			js.getuser(cans);
		},
		allqt:function(){
			h.form.recename.value='全體人員';
			h.form.receid.value='all';
		},
		removes:function(){
			h.form.recename.value='';
			h.form.receid.value='';
		},
		changeface:function(){
			get('yingyong{rand}').src=this.value;
		},
		urlchange:function(){
			var v = h.form.url.value;
			if(v=='link'||v=='linko'){
				$('#tdurlpc_{rand}').show();
				$('#tdurlm_{rand}').show();
			}else{
				$('#tdurlpc_{rand}').hide();
				$('#tdurlm_{rand}').hide();
			}
		}
	};
	js.initbtn(c);	
	$(h.form.face).change(c.changeface);
	$(h.form.url).change(c.urlchange);
});
</script>

<div align="center">
<div  style="padding:10px;width:700px">
	
	
	<form name="form_{rand}">
	
		<input name="id" value="0" type="hidden" />
		<input name="setid" value="0" type="hidden" />
		<input name="pid" value="0" type="hidden">
		
		<table cellspacing="0" border="0" width="100%" align="center" cellpadding="0">
		
		<tr>
			
			<td class="tdinput"  colspan="4">
				<div align="center"><img id="yingyong{rand}" src="images/noface.png" height="60" width="60"></div>
			</td>
		</tr>
		
		<tr>
			<td width="15%" align="right"><font color=red>*</font> 編號：</td>
			<td width="35%"  class="tdinput"><input name="num" placeholder="一般跟模塊的編號一致" class="form-control"></td>

			<td  width="15%" align="right" nowrap><font color=red>*</font> 名稱：</td>
			<td   width="35%"class="tdinput"><input name="name" class="form-control"></td>
		</tr>
		
		<tr>
			
		
			<td  align="right" >鏈接地址：</td>
			<td class="tdinput"><select name="url" class="form-control"><option value="auto">自動</option><option value="buin">內部頁面</option><option value="link">鏈接頁面</option></select></td>
			
			<td  align="right" nowrap><font color=red>*</font> 分類：</td>
			<td class="tdinput"><input name="types" class="form-control"></td>
		</tr>
		
		<tr style="display:none" id="tdurlpc_{rand}">
			<td  align="right"  nowrap>PC端地址：</td>
			<td class="tdinput" colspan="3"><input name="urlpc" placeholder="可以寫對應[系統→菜單管理]對應菜單編號，也可以正規Url地址" class="form-control"></td>
		</tr>
		
		<tr style="display:none" id="tdurlm_{rand}">
			<td  align="right" nowrap>手機端地址：</td>
			<td class="tdinput" colspan="3"><input name="urlm" placeholder="格式：http://url/" class="form-control"></td>
		</tr>
		
		<tr>
			<td  align="right" >應用類型：</td>
			<td class="tdinput"><select name="yylx" class="form-control"><option value="0">全部</option><option value="1">僅桌面版顯示</option><option value="2">僅手機端顯示</option></select></td>
		
			<td  align="right" >圖標地址：</td>
			<td class="tdinput"><input name="face" placeholder="相對于系統目錄" class="form-control"></td>
		</tr>
		<tr>
			
		
			<td  align="right" >圖標顏色：</td>
			<td class="tdinput"><input name="iconcolor" maxlength="20" placeholder="沒有可不用填" class="form-control"></td>
			
			<td align="right">排序號：</td>
			<td class="tdinput"><input name="sort" value="0" maxlength="3" type="number"  onfocus="js.focusval=this.value" onblur="js.number(this)" class="form-control"></td>
			
		</tr>
		<tr>
			<td  align="right" >可用人員：</td>
			<td colspan="3" class="tdinput">
				<div  style="width:100%" class="input-group">
					<input readonly class="form-control"  placeholder="不選默認全部人員可用" name="recename" >
					<input type="hidden" name="receid" >
					<span class="input-group-btn">
						<button class="btn btn-default" click="removes" type="button"><i class="icon-remove"></i></button>
						<button class="btn btn-default" click="getdist,1" type="button"><i class="icon-search"></i></button>
					</span>
				</div>
			</td>
			
		</tr>

		
		<tr>
			<td align="right">說明：</td>
			<td class="tdinput" colspan="3"><textarea  name="explain" style="height:40px;" class="form-control"></textarea></td>
		</tr>
		

		
		<tr>
			<td align="right"></td>
			<td class="tdinput"><label><input type="checkbox" checked name="valid" value="1">啟用</label></td>
			
		
			
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
