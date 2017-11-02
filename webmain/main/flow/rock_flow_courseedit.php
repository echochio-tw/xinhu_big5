<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	{params};
	var id = params.id;
	if(!id)id = 0;var setid=params.setid,statusstr='';
	var h = $.bootsform({
		window:false,rand:'{rand}',tablename:'flow_course',
		url:publicsave('{mode}','{dir}'),beforesaveaction:'coursesavebefore',
		params:{otherfields:'optdt={now}'},
		submitfields:'setid,name,num,checktype,checktypeid,checktypename,checkfields,sort,where,whereid,explain,status,courseact,checkshu,recename,receid,mid,iszf,isqm,nid,coursetype',
		requiredfields:'name',
		success:function(){
			closenowtabs();
			try{guanflowcourselist.reload();}catch(e){}
		},
		load:function(a){
			js.setselectdata(h.form.whereid,a.wherelist,'id');
			statusstr=a.statusstr;
		},
		loadafter:function(a){
			c.changetype(0);
			if(a.data){
				h.form.where.value=jm.base64decode(a.data.where);
			}
		},
		submitcheck:function(d){
			if(d.checktype=='user'&&d.checktypeid=='')return '請選擇人員';
			if(d.checktype=='rank'&&d.checktypename=='')return '請輸入職位';
			if(d.checktype=='cname'&&d.checktypeid=='')return '請選擇審核人員組';
			if(d.checktype=='field'&&d.checktypeid=='')return '請選擇主表元素';
			return {
				where:jm.base64encode(d.where)
			};
		}
	});
	h.forminit();
	h.load(js.getajaxurl('loaddatacourse','{mode}','{dir}',{id:id,setid:setid}));
	var c = {
		getdist:function(o1, lx){
			var val = h.form.checktype.value;
			if(val=='rank'){
				$.selectdata({
					title:'選擇職位',
					url:js.getajaxurl('getrank','admin','system'),
					checked:false,
					nameobj:h.form.checktypename
				});
				return;
			}
			if(val=='cname'){
				$.selectdata({
					title:'選審核人員組',
					url:js.getajaxurl('getcname','{mode}','{dir}'),
					checked:false,
					nameobj:h.form.checktypename,
					idobj:h.form.checktypeid,
				});
				return;
			}
			if(val=='field'){
				$.selectdata({
					title:'選擇主表元素',
					url:js.getajaxurl('getfields','{mode}','{dir}',{'setid':setid}),
					checked:true,
					nameobj:h.form.checktypename,
					idobj:h.form.checktypeid,
				});
				return;
			}
			if(val=='change'){
				var cans = {
					nameobj:h.form.checktypename,
					idobj:h.form.checktypeid,
					value:h.form.checktypeid.value,
					type:'deptusercheck',
					title:'選擇指定人範圍'
				};
				js.getuser(cans);
				return;
			}
			var cans = {
				nameobj:h.form.checktypename,
				idobj:h.form.checktypeid,
				value:h.form.checktypeid.value,
				type:'usercheck',
				title:'選擇人員'
			};
			js.getuser(cans);
		},
		clears:function(){
			h.form.checktypename.value='';
			h.form.checktypeid.value='';
		},
		changetype:function(lx){
			var v=h.form.checktype.value;
			$('#checktext_{rand}').html('');
			$('#checkname_{rand}').hide();
			if(lx==1){
				h.form.checktypename.value='';
				h.form.checktypeid.value='';
			}
			if(v=='rank'){
				$('#checktext_{rand}').html('請輸入職位：');
				$('#checkname_{rand}').show();
			}
			if(v=='user'){
				$('#checktext_{rand}').html('請選擇人員：');
				$('#checkname_{rand}').show();
			}
			if(v=='cname'){
				$('#checktext_{rand}').html('審核人員組：');
				$('#checkname_{rand}').show();
			}
			if(v=='field'){
				$('#checktext_{rand}').html('選擇主表上元素：');
				$('#checkname_{rand}').show();
			}
			if(v=='change'){
				$('#checktext_{rand}').html('指定人範圍：');
				$('#checkname_{rand}').show();
			}
		},
		reloadhweil:function(){
			h.form.whereid.length = 1;
			h.load(js.getajaxurl('loaddatacourse','{mode}','{dir}',{id:id,setid:setid}));
		},
		getdists:function(o1, lx){
			var cans = {
				nameobj:h.form.recename,
				idobj:h.form.receid,
				type:'deptusercheck',
				title:'選擇適用對象'
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
		setstatus:function(){
			var val = h.form.courseact.value;
			var sha = [],vala;
			if(val)sha = val.split(',');
			var str = '<table width="100%"><tr><td align="center"  height="30" nowrap>動作值</td><td>動作名</td><td>動作顏色</td><td>處理後狀態</td></tr>';
			if(isempt(statusstr))statusstr='待處理,已完成,不通過';
			var ztarr = statusstr.replace(/\?/g,'').split(',');
			for(var i=0;i<=6;i++){
				var na='',col='',naa,sel='',ove='';
				if(sha[i]){
					naa = sha[i].split('|');
					na  = naa[0];
					if(naa[1])col=naa[1];
					if(naa[2])ove=naa[2];
				}
				str+='<tr><td width="20%" align="center">'+(i+1)+'</td><td width="25%"><input maxlength="10" value="'+na+'" id="abc_xtname'+i+'" style="color:'+col+'" class="form-control"></td><td width="25%"><input class="form-control" maxlength="7" style="color:'+col+'" value="'+col+'"  id="abc_xtcol'+i+'"></td><td width="30%">';
				str+='<select class="form-control" id="abc_xscol'+i+'" value="'+col+'">';
				str+='<option value=""></option>';
				for(var j=0;j<ztarr.length;j++){
					sel=(ove!='' && ove==j)?'selected':'';
					str+='<option '+sel+' value="'+j+'">'+ztarr[j]+'</option>';
				}
				str+='</select></td></tr>';
			}
			str+='</table>';
			
			js.tanbody('sttts','['+h.form.name.value+']的狀態設置',400,300,{
				html:'<div style="height:300px;overflow:auto;padding:5px">'+str+'</div>',
				btn:[{text:'確定'}]
			});
			$('#sttts_btn0').click(function(){
				c.setstatusok();
			});
		},
		setstatusok:function(){
			var str = '';
			for(var i=0;i<=6;i++){
				var na=get('abc_xtname'+i+'').value,col=get('abc_xtcol'+i+'').value,zts=get('abc_xscol'+i+'').value;
				if(!na)break;
				str+=','+na+'';
				if(col){
					str+='|'+col+'';
					if(zts)str+='|'+zts+'';
				}else{
					if(zts)str+='||'+zts+'';
				}
			}
			if(str!='')str=str.substr(1);
			h.form.courseact.value=str;
			js.tanclose('sttts');
		}
	};
	js.initbtn(c);
	
	if(id==0){
		h.form.setid.value=setid;
		h.form.mid.value=params.mid;	
	}
	
	$(h.form.checktype).change(function(){
		c.changetype(1);
	});
	
	//替換的返回
	backsheowe{rand}=function(s1,s2){
		h.setValue('where',s1);
		h.setValue('explain',s2);
	}
});

</script>

<div align="center">
<div  style="padding:10px;width:700px">
	
	
	<form name="form_{rand}">
	
		<input name="id" value="0" type="hidden" />
		<input name="setid" value="0" type="hidden" />
		
		
		<table cellspacing="0" border="0" width="100%" align="center" cellpadding="0">
		<tr>
			<td  align="right"  width="15%"><font color=red>*</font> 步驟名稱：</td>
			<td class="tdinput"  width="35%"><input name="name" onblur="this.value=strreplace(this.value)" class="form-control"></td>
			<td  align="right"   width="15%">編號：</td>
			<td class="tdinput" width="35%"><input onblur="this.value=strreplace(this.value)" name="num" class="form-control"></td>
		</tr>
		
		<tr>
			<td  align="right" nowrap >步驟適用對象：</td>
		
			<td class="tdinput" colspan="3">
				<div style="width:100%" class="input-group">
					<input readonly class="form-control" placeholder="不選就適用全體人員" name="recename" >
					<input type="hidden" name="receid" >
					<span class="input-group-btn">
						<button class="btn btn-default" click="removes" type="button"><i class="icon-remove"></i></button>
						<button class="btn btn-default" click="getdists,1" type="button"><i class="icon-search"></i></button>
					</span>
				</div>
			</td>
		</tr>
		
		<tr>
			<td  align="right" nowrap ><a href="<?=URLY?>view_checklx.html" target="_blank">?審核人員類型</a>：</td>
			<td class="tdinput"><select class="form-control" name="checktype"><option value="">-類型-</option><option value="super">直屬上級</option><option value="rank">職位</option><option value="user">指定人員</option><option value="dept">部門負責人</option><option value="auto">自定義(寫代碼上)</option><option value="apply">申請人</option><option value="opt">操作人</option><option value="change">由上步指定</option><option value="cname">審核人員組</option><option value="field">主表上元素</option></select></td>
			
			<td align="right" id="checktext_{rand}" nowrap></td>
			<td class="tdinput" id="checkname_{rand}" style="display:none">
				<div class="input-group" style="width:100%">
					<input class="form-control"  name="checktypename" >
					<input type="hidden" name="checktypeid" >
					<span class="input-group-btn">
						<button class="btn btn-default" click="clears" type="button">×</button>
						<button class="btn btn-default" click="getdist,1" type="button"><i class="icon-search"></i></button>
					</span>
				</div>
				
			</td>
		</tr>
		
		
		
		<tr>
			<td  align="right" >手寫簽名設置：</td>
			<td class="tdinput"><select class="form-control" name="isqm"><option value="0">不需要手寫簽名</option><option value="1">需要手寫簽名</option><option value="2">通過才需要手寫簽名</option><option value="3">不通過才需要手寫簽名</option></select></td>
			<td  align="right" >上級步驟ID：</td>
			<td class="tdinput">
				<table>
				<tr>
					<td><input name="mid" class="form-control" value="0" type="number" /></td>
					<td nowrap>&nbsp;下級步驟ID：</td>
					<td><input name="nid" style="width:70px" class="form-control" value="0" type="number" /></td>
				</tr>
				</table>
			</td>
		</tr>
		
		<tr>
			<td  align="right" >審核條件：</td>
			<td class="tdinput"><select class="form-control" name="whereid"><option value="0">無條件</option></select></td>
			<td colspan="2"><font color=#888888>在【流程模塊條件】上添加，滿足此條件才需要此步驟</font><a click="reloadhweil" href="javascript:;">[刷新]</a></td>
		</tr>
		
		<tr>
			<td  align="right" >審核條件：</td>
			<td colspan="3"  class="tdinput"><textarea placeholder="寫SQL條件，條件成立才需要此步驟" name="where" style="height:50px" class="form-control"></textarea></td>
		</tr>
		

		<tr>
			<td  align="right" >審核動作：</td>
			<td class="tdinput" colspan="3"><input name="courseact" class="form-control"><div style="padding-top:0px" class="tishi"><a href="javascript:;" click="setstatus">[設置]</a>默認是：同意,不同意。多個,分開</div></td>
		</tr>
		
		<tr>
			<td  align="right" >審核處理表單：</td>
			<td class="tdinput" colspan="3"><input name="checkfields" class="form-control"><div style="padding-top:0px" class="tishi">需要處理表單元素必須在【表單元素管理】上，輸入字段名，多個用, 分開</div></td>
		</tr>
		
		
		<tr>
			<td  align="right" >說明：</td>
			<td class="tdinput" colspan="3"><textarea  name="explain" style="height:50px" class="form-control"></textarea></td>
		</tr>
		
		<tr>
			
			<td  align="right" nowrap >審核人數：</td>
			<td class="tdinput"><select class="form-control" name="checkshu"><option value="0">需全部審核</option><option value="1" selected>至少一人</option><option value="2">至少2人</option></select></td>
			
			<td  align="right" nowrap >審批方式：</td>
			<td class="tdinput"><select class="form-control" name="coursetype"><option value="0">順序審批</option><option value="1">前置審批(前面有審批後面出現就跳過)</option><option value="2">後置審批(如後面步驟有出現就跳過)</option></select></td>
		</tr>
		
		<tr>
			<td align="right">排序號：</td>
			<td class="tdinput"><input name="sort" value="0" maxlength="3" type="number"  onfocus="js.focusval=this.value" onblur="js.number(this)" class="form-control"></td>
			
			
			
			
		</tr>
		
		<tr>
			<td  align="right" ></td>
			<td class="tdinput" colspan="3">
				<label><input name="status" value="1" checked type="checkbox"> 啟用</label>&nbsp; &nbsp; 
				<label><input name="iszf" value="1" type="checkbox">是否可轉給他人辦理</label>
			</td>
		</tr>
		
		
		<tr>
			<td  align="right"></td>
			<td style="padding:15px 0px" colspan="3" align="left"><button disabled class="btn btn-success" id="save_{rand}" type="button"><i class="icon-save"></i>&nbsp;保存</button>&nbsp; <span id="msgview_{rand}"></span>&nbsp;<a href="<?=URLY?>view_course.html" target="_blank">[看幫助]</a>
		</td>
		</tr>
		
		</table>
		</form>
</div>
</div>
