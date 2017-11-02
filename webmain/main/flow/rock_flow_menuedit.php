<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	{params};
	var id = params.id,mid=params.setid;
	if(!id)id = 0;
	var h = $.bootsform({
		window:false,rand:'{rand}',tablename:'flow_menu',
		url:publicsave('{mode}','{dir}'),
		params:{otherfields:'setid='+mid+''},
		submitfields:'name,statusname,statuscolor,type,statusvalue,actname,wherestr,upgcont,explain,status,num,iszs,issm,islog,fields',
		requiredfields:'name',
		success:function(){
			closenowtabs();
			try{guanflowmenulist.reload();}catch(e){}
		},
		submitcheck:function(d){
			return {
				wherestr:jm.base64encode(d.wherestr),
				upgcont:jm.base64encode(d.upgcont),
			}
		}
	});
	h.forminit();


	if(id>0){
		var d=guanflowmenulist.changedata;
		
		h.setValues(d);
		if(!isempt(d.wherestr)){
			h.setValue('wherestr',jm.base64decode(d.wherestr));
		}
		if(!isempt(d.upgcont)){
			h.setValue('upgcont',jm.base64decode(d.upgcont));
		}
	}
});

</script>

<div align="center">
<div  style="padding:10px;width:600px">
	
	
	<form name="form_{rand}">
	
		<input name="id" value="0" type="hidden" />
		
		<table cellspacing="0" border="0" width="100%" align="center" cellpadding="0">
		
		<tr>
			<td  align="right" >編號：</td>
			<td class="tdinput"><input name="num" maxlength="20" onblur="this.value=strreplace(this.value)" class="form-control"></td>
			
			
			
		</tr>
		
		<tr>
			
			<td  align="right" >類型：</td>
			<td class="tdinput"><select name="type" class="form-control"><option value="1">彈出填寫說明</option><option value="0">直接操作</option><option value="2">人員選擇(單人)</option><option value="3">人員選擇(多人)</option><option value="4">更新字段</option></select></td>
			<td  align="right" >字段名稱：</td>
			<td class="tdinput"><input name="fields" class="form-control"></td>
		</tr>
		
		<tr>
			<td  align="right" ><font color=red>*</font> 顯示名稱：</td>
			<td class="tdinput"><input name="name" maxlength="20" onblur="this.value=strreplace(this.value)" class="form-control"></td>
			
			<td  align="right" >動作名稱：</td>
			<td class="tdinput"><input name="actname" maxlength="20" onblur="this.value=strreplace(this.value)" class="form-control"></td>
		</tr>
		
	
		<tr>
			<td  align="right" width="15%" nowrap >狀態名稱：</td>
			<td width="35%"  class="tdinput"><input maxlength="20" onblur="this.value=strreplace(this.value)" name="statusname" class="form-control"></td>
			
			<td  width="15%" align="right" nowrap>對應狀態值：</td>
			<td width="35%"  class="tdinput"><select name="statusvalue" class="form-control"><option value="0">0</option><option value="1">1</option><option value="2">2</option><option value="3">3</option><option value="4">4</option><option value="5">5</option><option value="6">6</option><option value="7">7</option><option value="8">8</option><option value="9">9</option></select></td>
		</tr>
		
		<tr>
			<td align="right">狀態名顏色：</td>
			<td class="tdinput">
			<select name="statuscolor" class="form-control"><option value="">-無-</option>
			<option style="background-color:red" value="red">red</option>
			<option style="background-color:green" value="green">green</option>
			<option style="background-color:blue" value="blue">blue</option>
			<option style="background-color:magenta" value="magenta">magenta</option>
			<option style="background-color:yellow" value="yellow">yellow</option>
			<option style="background-color:chocolate" value="chocolate">chocolate</option>
			<option style="background-color:gray" value="gray">gray</option>
			<option style="background-color:aquamarine" value="aquamarine">aquamarine</option>
			<option style="background-color:fuchsia" value="fuchsia">fuchsia</option>
			<option style="background-color:brass" value="brass">brass</option>
			<option style="background-color:brown" value="brown">brown</option>
			<option style="background-color:deeppink" value="deeppink">deeppink</option>
			<option style="background-color:copper" value="copper">copper</option>
			<option style="background-color:orange" value="orange">orange</option>
			</select>
			</td>
			<td align="right">排序號：</td>
			<td class="tdinput"><input name="sort" value="0" maxlength="3" type="number"  onfocus="js.focusval=this.value" onblur="js.number(this)" class="form-control"></td>
		</tr>
	
		<tr>
			<td align="right">條件：</td>
			<td class="tdinput" colspan="3"><textarea  name="wherestr" style="height:60px" class="form-control"></textarea><font color=#888888>為空或者條件滿足時顯示菜單</font></td>
		</tr>
		
		<tr>
			<td align="right">更新內容：</td>
			<td class="tdinput" colspan="3"><textarea  name="upgcont" style="height:60px" class="form-control"></textarea><font color=#888888>當觸發時同時更新對應記錄為這個內容</font></td>
		</tr>
	
		<tr>
			<td align="right">說明：</td>
			<td class="tdinput" colspan="3"><textarea  name="explain" style="height:60px" class="form-control"></textarea></td>
		</tr>
	
		
		<tr>
			<td  align="right" ></td>
			<td class="tdinput" colspan="3">
				<label><input name="status" value="1" checked type="checkbox"> 啟用</label>&nbsp; &nbsp; 
				<label><input name="islog" value="1" checked type="checkbox"> 寫入日志</label>&nbsp; &nbsp; 
				<label><input name="issm" value="1" checked type="checkbox"> 必須填寫說明</label>&nbsp; &nbsp; 
				<label><input name="iszs" value="1" type="checkbox"> 顯示在詳情頁</label>&nbsp; &nbsp; 
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
