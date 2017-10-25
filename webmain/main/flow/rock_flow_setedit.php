<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	{params};
	var id = params.id,arrlist;
	if(!id)id = 0;
	var h = $.bootsform({
		window:false,rand:'{rand}',tablename:'flow_set',
		url:publicsave('{mode}','{dir}'),url:publicsave('{mode}','{dir}'),
		params:{otherfields:'optdt={now}'},aftersaveaction:'flowsetsaveafter',beforesaveaction:'flowsetsavebefore',
		submitfields:'name,tables,type,num,table,sort,isscl,status,where,summary,summarx,pctx,mctx,wxtx,emtx,ddtx,isflow,sericnum,receid,recename,names,statusstr,isgbjl,isup,isgbcy,isbxs,lbztxs',
		requiredfields:'name,type,num,table',
		success:function(){
			closenowtabs();
			try{guanflowsetlist.reload();}catch(e){}
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
				title:'選擇針對人員'
			};
			js.getuser(cans);
		},
		allqt:function(){
			h.form.recename.value='全體人員';
			h.form.receid.value='all';
		},
		setstatus:function(){
			var val = h.form.statusstr.value;
			var sha = [],vala;
			if(val)sha = val.split(',');
			var str = '<table width="100%"><tr><td align="center"  height="30" nowrap>狀態值</td><td>狀態名</td><td>狀態顏色</td></tr>';
			for(var i=0;i<=9;i++){
				var na='',col='',naa;
				if(sha[i]){
					naa = sha[i].split('|');
					na  = naa[0];if(naa[1])col=naa[1];
				}
				str+='<tr><td width="20%" align="center">'+i+'</td><td width="40%"><input maxlength="10" value="'+na+'" id="abc_xtname'+i+'" style="color:'+col+'" class="form-control"></td><td width="40%"><input class="form-control" maxlength="7" style="color:'+col+'" value="'+col+'"  id="abc_xtcol'+i+'"></td></tr>';
			}
			str+='</table>';
			
			js.tanbody('sttts','設置狀態值',400,300,{
				html:'<div style="height:400px;overflow:auto;padding:5px">'+str+'</div>',
				btn:[{text:'確定'}]
			});
			$('#sttts_btn0').click(function(){
				c.setstatusok();
			});
		},
		setstatusok:function(){
			var str = '';
			for(var i=0;i<=9;i++){
				var na=get('abc_xtname'+i+'').value,col=get('abc_xtcol'+i+'').value;
				if(na&&i==5)na='已作廢';
				if(na&&i==1&&(na!='已完成'||na!='已通過'||na!='已審核'))na='已完成';
				if(!na)break;
				str+=','+na+'';
				if(col)str+='|'+col+'';
			}
			if(str!='')str=str.substr(1);
			h.form.statusstr.value=str;
			js.tanclose('sttts');
		}
	};
	js.initbtn(c);
});

</script>

<div align="center">
<div  style="padding:10px;width:700px">
	
	
	<form name="form_{rand}">
	
		<input name="id" value="0" type="hidden" />
		
		<table cellspacing="0" border="0" width="100%" align="center" cellpadding="0">
		<tr>
			<td  align="right" ><font color=red>*</font> 模塊名稱：</td>
			<td class="tdinput"><input name="name" class="form-control"></td>
			<td  align="right"  ><font color=red>*</font> 類型：</td>
			<td class="tdinput"><input name="type" class="form-control"></td>
		</tr>
		
		<tr>
			<td  align="right" width="15%" nowrap ><font color=red>*</font> 編號：</td>
			<td width="35%"  class="tdinput"><input name="num" maxlength="20" class="form-control"></td>
			
			<td  width="15%" align="right" nowrap><font color=red>*</font> 對應表：</td>
			<td width="35%"  class="tdinput"><input name="table" maxlength="50" class="form-control"></td>
		</tr>
		
		<tr>
			<td align="right">單號規則：</td>
			<td class="tdinput"><input placeholder="如XA-Ymd-" name="sericnum" class="form-control"></td>
			<td align="right">多行子表：</td>
			<td class="tdinput"><input name="tables" placeholder="多個,分開" class="form-control"></td>
		</tr>
		<tr>
			<td align="right">排序號：</td>
			<td class="tdinput"><input name="sort" value="0" maxlength="3" type="number"  onfocus="js.focusval=this.value" onblur="js.number(this)" class="form-control"></td>
			<td align="right">多行子表名稱：</td>
			<td class="tdinput"><input name="names"  placeholder="跟多行子表個數一樣" class="form-control"></td>
		</tr>
		<tr>
			<td  align="right" >針對人員：</td>
			<td class="tdinput" colspan="3">
				<div class="input-group" style="width:100%">
					<input readonly class="form-control"  name="recename" >
					<input type="hidden" name="receid" >
					<span class="input-group-btn">
						<button class="btn btn-default" click="allqt" type="button">全體人員</button>
						<button class="btn btn-default" click="getdist,1" type="button"><i class="icon-search"></i></button>
					</span>
				</div>
			</td>
			
		</tr>
		
	
		
		<tr>
			<td  align="right" >相應條件：</td>
			<td class="tdinput" colspan="3"><textarea  name="where" style="height:60px" class="form-control"></textarea></td>
		</tr>
		
		<tr>
			<td  align="right" >摘要規則：</td>
			<td class="tdinput" colspan="3"><textarea  name="summary" style="height:60px" class="form-control"></textarea></td>
		</tr>
		
		<tr>
			<td  align="right" >應用上摘要顯示：</td>
			<td class="tdinput" colspan="3"><textarea  name="summarx"
placeholder="title:{title}
optdt:{optdt}
cont:
" 
			style="height:100px" class="form-control"></textarea>
			<font color=#888888>title:標題，optdt:顯示的時間，cont:內容信息</font>
			</td>
		</tr>
		
		<tr>
			<td  align="right" ></td>
			<td class="tdinput" colspan="3">
				<label><input name="isflow" value="1" type="checkbox"> 有流程?</label>&nbsp; &nbsp; 
				<label><input name="pctx" value="1" type="checkbox"> PC端提醒</label>&nbsp; &nbsp; 
				<label><input name="emtx" value="1" type="checkbox"> 郵件提醒</label>&nbsp; &nbsp; 
				<label><input name="mctx" value="1" type="checkbox"> APP提醒</label>&nbsp; &nbsp; 
				<label><input name="wxtx" value="1" type="checkbox"> 微信提醒</label>&nbsp; &nbsp; 
				<label><input name="ddtx" value="1" type="checkbox"> 釘釘提醒</label>&nbsp; &nbsp; 
				<label><input name="isup" value="1" type="checkbox"> 同步更新(同步流程模塊時一起更新)</label>&nbsp; &nbsp; 
				<label><input name="status" value="1" checked type="checkbox"> 啟用</label><br>
				<font color=#888888>微信提醒需要有微信企業號或企業微信，釘釘提醒需要安裝釘釘接口插件，否則將崩毀。</font>
			</td>
		</tr>
		
		
		<tr>
			<td  colspan="4"><div class="inputtitle">更多擴展選項</div></td>
		</tr>
		<tr>
			<td  align="right" >status字段狀態值設置：</td>
			<td class="tdinput" colspan="3"><input name="statusstr" class="form-control"><a href="javascript:;" click="setstatus">[設置]</a><font color=#888888>默認狀態值是：【待處理|blue,已審核|green,未通過|red】對應值從0開始，其中0,1,2,5固定的5是作廢,1必須是已完成,已審核狀態</font></td>
		</tr>
		
		<tr>
			<td  align="right" >單據詳情上：</td>
			<td class="tdinput" colspan="3">
				<label><input name="isgbjl" value="1" type="checkbox"> 不顯示操作記錄</label>&nbsp; &nbsp; 
				<label><input name="isgbcy" value="1" type="checkbox"> 不顯示查閱記錄</label>&nbsp; 
				<label><input name="isscl" value="1" type="checkbox"> 標識已生成列表頁</label>
			</td>
		</tr>
		
		<tr>
			<td  align="right" >錄入頁面上：</td>
			<td class="tdinput" colspan="3">
				<label><input name="isbxs" value="1" type="checkbox"> 不顯示流程圖</label>
			</td>
		</tr>
		
		<tr>
			<td  align="right" >列表頁面上：</td>
			<td class="tdinput" colspan="3">
				狀態搜索顯示:<select name="lbztxs"><option value="0">默認</option><option value="1">必須顯示</option><option value="2">不要顯示</option></select>
			</td>
		</tr>
		
		<tr>
			<td  align="right"></td>
			<td style="padding:15px 0px" colspan="3" align="left"><button disabled class="btn btn-success" id="save_{rand}" type="button"><i class="icon-save"></i>&nbsp;保存</button>&nbsp; <span id="msgview_{rand}"></span>&nbsp;<a href="<?=URLY?>view_flowset.html" target="_blank">[看幫助]</a>查看各個字段說明
		</td>
		</tr>
		
		</table>
		</form>
	
</div>
</div>
