<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	{params};
	var id = params.id,mid=params.setid;
	if(!id)id = 0;
	var h = $.bootsform({
		window:false,rand:'{rand}',tablename:'flow_todo',
		url:publicsave('{mode}','{dir}'),
		params:{otherfields:'setid='+mid+''},
		submitfields:'explain,status,num,name,whereid,changefields,changecourse,boturn,boedit,bochang,bodel,bozuofei,botong,bobutong,bozhui,receid,recename,setid,toturn,tocourse,bofinish,bozhuan,todofields,summary,botask',
		success:function(){
			closenowtabs();
			try{guanflowtodolist.reload();}catch(e){}
		},
		submitcheck:function(d){
			if(d.botask=='1' && d.whereid=='0')return '計劃任務的類型必須選擇觸發條件';
			return {
				changefields:c.getsleval('changefields'),
				changecourse:c.getsleval('changecourse')
			}
		}
	});
	h.forminit();
	js.setselectdata(h.form.whereid,guanflowtodowherelist[0],'id');
	js.setselectdata(h.form.changefields,guanflowtodowherelist[1],'fields');
	js.setselectdata(h.form.changecourse,guanflowtodowherelist[2],'id');
	if(id>0){
		var d=guanflowtodolist.changedata;	
		h.setValues(d);
		js.setselectval(h.form.changefields,d.changefields);
		js.setselectval(h.form.changecourse,d.changecourse);
	}
	
	var c = {
		changcourse:function(o1){
			var bo = o1.checked;
			setTimeout(function(){o1.checked = bo;c.changcourses();},10);

		},
		changcourses:function(){
			if(h.form.botong.checked || h.form.bobutong.checked){
				$('#changecourse{rand}').show();
			}else{
				$('#changecourse{rand}').hide();
			}
		},
		changfields:function(o1){
			var bo = o1.checked;
			setTimeout(function(){o1.checked = bo;},10);
			if(bo){
				$('#changefields{rand}').show();
			}else{
				$('#changefields{rand}').hide();
			}
		},
		getsleval:function(fv){
			return js.getselectval(h.form[fv]);
		},
		getdists:function(o1, lx){
			var cans = {
				nameobj:h.form.recename,
				idobj:h.form.receid,
				type:'deptusercheck',
				title:'通知給'
			};
			js.getuser(cans);
		},
		removes:function(){
			h.form.recename.value='';
			h.form.receid.value='';
		}
	};
	js.initbtn(c);
	c.changcourses();
	c.changfields(h.form.bochang);
});

</script>

<div align="center">
<div  style="padding:10px;width:650px">
	
	
	<form name="form_{rand}">
	
		<input name="id" value="0" type="hidden" />
		
		<table cellspacing="0" border="0" width="100%" align="center" cellpadding="0">
		
		<tr>
			<td  align="right"  width="15%">名稱：</td>
			<td class="tdinput"  width="35%"><input name="name" maxlength="30" onblur="this.value=strreplace(this.value)" class="form-control"></td>
			<td  align="right"  width="15%">編號：</td>
			<td class="tdinput"  width="35%"><input name="num" maxlength="20" onblur="this.value=strreplace(this.value)" class="form-control"></td>
			
			
			
		</tr>
		
		<tr>
			<td  align="right" >觸發條件：</td>
			<td class="tdinput"><select class="form-control" name="whereid"><option value="0">無條件</option></select></td>
			<td colspan="2">滿足時。</td>
		</tr>
		<tr>
			<td  align="right" ></td>
			<td colspan="3" style="padding-bottom:10px"><font color=#888888>在【流程模塊條件】上添加，滿足此條件才觸發通知</font></td>
		</tr>
		
	
		<tr>
			<td  align="right" nowrap >觸發類型：</td>
			<td colspan="3" class="tdinput">
			<label><input name="boturn" type="checkbox" value="1">提交時</label>&nbsp; 
			<label><input name="boedit" type="checkbox" value="1">編輯時</label>&nbsp; 
			<label><input name="bochang" click="changfields" disabled type="checkbox" value="1">字段改變時(未開發)</label>&nbsp; 
			<label><input name="bodel" type="checkbox" value="1">刪除時</label>&nbsp; 
			<label><input name="bozuofei" type="checkbox" value="1">作廢時</label>&nbsp; 
			<label><input  name="botong" click="changcourse" type="checkbox" value="1">步驟處理通過時</label>&nbsp; 
			<label><input  name="bobutong"  click="changcourse" type="checkbox" value="1">步驟處理不通過時</label>&nbsp; 
			<label><input  name="bofinish" type="checkbox" value="1">處理完成時</label>&nbsp; 
			<label><input  name="bozhuan" type="checkbox" value="1">轉辦時</label>&nbsp; 
			<label><input  name="bozhui" type="checkbox" value="1">追加說明時</label>&nbsp; 
			<label><input  name="botask" type="checkbox" value="1">計劃任務</label>&nbsp; 
			</td>
		</tr>
		
		
		
		<tr id="changefields{rand}" style="display:none">
			<td  align="right" nowrap >變化字段(可多選)：<br><font color="#888888">來自[表單元素管理]</font><font color=white>：</font></td>
			<td class="tdinput"><select multiple name="changefields" size="8" class="form-control"></select></td>
		</tr>
		<tr id="changecourse{rand}" style="display:none">
			<td  align="right" nowrap >處理的步驟(可多選)：<br><font color="#888888">來自[流程審核步驟]</font><font color=white>：</font></td>
			<td class="tdinput"><select multiple name="changecourse" size="5" class="form-control"></select></td>
		</tr>
		
		<tr>
			<td  colspan="4"><div class="inputtitle">通知給如下人員</div></td>
		</tr>
		
		<tr>
			<td  align="right" nowrap >通知給：</td>
			<td class="tdinput" colspan="3">
			<label><input name="toturn" type="checkbox" value="1">提交人</label>&nbsp; 
			<label><input name="tocourse" type="checkbox" value="1">流程所有參與人</label>&nbsp; 
			</td>
		</tr>
		<tr>
			<td  align="right" nowrap >通知給：</td>
			<td class="tdinput" colspan="3">
				<div style="width:100%" class="input-group">
					<input readonly class="form-control"  name="recename" >
					<input type="hidden" name="receid" >
					<span class="input-group-btn">
						<button class="btn btn-default" click="removes" type="button"><i class="icon-remove"></i></button>
						<button class="btn btn-default" click="getdists,1" type="button"><i class="icon-search"></i></button>
					</span>
				</div>
			</td>
		</tr>
		<tr>
			<td  align="right" nowrap >通知給單據字段上：</td>
			<td class="tdinput" colspan="3">
				<input name="todofields" placeholder="寫主表上的字段" class="form-control">
			</td>
		</tr>
	
		<tr>
			<td align="right">通知內容摘要：</td>
			<td class="tdinput" colspan="3"><textarea name="summary" style="height:60px" class="form-control"></textarea></td>
		</tr>
	<tr>
			<td align="right">說明：</td>
			<td class="tdinput" colspan="3"><textarea  name="explain" style="height:60px" class="form-control"></textarea></td>
		</tr>
		
		<tr>
			<td  align="right" ></td>
			<td class="tdinput" colspan="3">
				<label><input name="status" value="1" checked type="checkbox"> 啟用</label>
			</td>
		</tr>

		
		<tr>
			<td  align="right"></td>
			<td style="padding:15px 0px" colspan="3" align="left"><button  class="btn btn-success" id="save_{rand}" type="button"><i class="icon-save"></i>&nbsp;保存</button>&nbsp; <span id="msgview_{rand}"></span>
		</td>
		</tr>
		
		</table>
		</form>
	
</div>
</div>
