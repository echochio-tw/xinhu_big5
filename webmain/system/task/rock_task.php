<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	var a = $('#veiw_{rand}').bootstable({
		tablename:'task',celleditor:true,modenum:'task',sort:'sort',dir:'asc',
		columns:[{
			text:'分類',dataIndex:'fenlei',editor:true,sortable:true
		},{
			text:'名稱',dataIndex:'name',editor:true,align:'left'
		},{
			text:'地址',dataIndex:'url',editor:true
		},{
			text:'頻率',dataIndex:'type',editor:true
		},{
			text:'運行時間',dataIndex:'time',editor:true
		},{
			text:'運行說明',dataIndex:'ratecont',editor:true
		},{
			text:'狀態',dataIndex:'status',editor:true,type:'checkbox',editor:true,sortable:true
		},{
			text:'排序號',dataIndex:'sort',editor:true,sortable:true
		},{
			text:'最後運行',dataIndex:'lastdt',sortable:true,renderer:function(v){
				return v.replace(' ','<br>');
			}
		},{
			text:'最後狀態',dataIndex:'state',renderer:function(v){
				var s='<font color=#888888>待運行</font>';
				if(v==1)s='<font color=green>成功</font>';
				if(v==2)s='<font color=red>失敗</font>';
				return s;
			}
		},{
			text:'最後內容',dataIndex:'lastcont'
		},{
			text:'說明',dataIndex:'explain',type:'textarea',editor:true,align:'left'
		},{
			text:'提醒給',dataIndex:'todoname'	
		},{
			text:'ID',dataIndex:'id'	
		}],
		itemclick:function(){
			btn(false);
		}
	});
	
	var c = {
		del:function(){
			a.del({check:function(lx){if(lx=='yes')btn(true)}});
		},
		clickwin:function(o1,lx){
			var h = $.bootsform({
				title:'計劃任務',height:400,width:500,
				tablename:'task',isedit:lx,
				params:{int_filestype:'sort,status'},
				submitfields:'fenlei,name,url,sort,status,type,time,ratecont,todoid,todoname',
				items:[{
					labelText:'分類',name:'fenlei',required:true
				},{
					labelText:'名稱',name:'name',required:true
				},{
					labelText:'運行地址',name:'url',required:true
				},{
					labelText:'頻率',name:'type',required:true
				},{
					labelText:'運行時間',name:'time',required:true
				},{
					labelText:'說明',name:'ratecont'
				},{
					name:'status',labelBox:'啟用',type:'checkbox',checked:true
				},{
					name:'todoid',type:'hidden'
				},{
					labelText:'通知給',type:'changeuser',changeuser:{
						type:'usercheck',idname:'todoid',title:'選擇人員'
					},name:'todoname',clearbool:true
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
		},
		creaefile:function(){
			js.msg('wait','創建中...');
			js.ajax(js.getajaxurl('creaefile','{mode}','{dir}'),{},function(s){
				js.msg('success','創建成功');
			});
		},
		yunx:function(){
			if(a.changedata.status!=1){
				js.msg('msg','沒有啟用不能運行');
				return;
			}
			js.msg('wait','運行中...');
			var url='task.php?m=runt&a=run&mid='+a.changeid+'';
			var ase = a.changedata.url.split(',');
			var url='task.php?m='+ase[0]+'|runt&a='+ase[1]+'&runid='+a.changeid+'';
			js.ajax(url,{},function(s){
				if(s.indexOf('success')>=0){
					if(s!='success'){
						js.msg();
						js.alert('運行成功，而你可能用記事本修改系統文件了，請到群裡《@信呼客服 記事本》查看幫助');
					}else{
						js.msg('success','運行成功');
					}
					a.reload();
				}else{
					js.msg('msg','運行失敗');
				}
			});
		},
		start:function(lx){
			js.msg('wait','處理中...');
			js.ajax(js.getajaxurl('starttask','{mode}','{dir}'),{lx:lx},function(ret){
				if(ret.success){
					js.msg('success', ret.data);
				}else{
					js.msg('msg', ret.msg);
				}
			},'get,json');
		},
		clearzt:function(){
			js.msg('wait','清空中...');
			js.ajax(js.getajaxurl('clearzt','{mode}','{dir}'),{},function(s){
				js.msg();
				a.reload();
			});
		},
		openanz:function(){
			js.open(js.getajaxurl('downbat','{mode}','{dir}'));
		},
		openqueue:function(){
			js.open('?a=queue&m=task&d=system');
		}
	};
	
	function btn(bo){
		get('del_{rand}').disabled = bo;
		get('edit_{rand}').disabled = bo;
		get('yun_{rand}').disabled = bo;
	}
	js.initbtn(c);
	
	$('#randkstrt_{rand}').rockmenu({
		width:220,top:35,donghua:false,
		data:[{
			name:'使用我自己REIM服務端<font color=green>啟動</font>',lx:'0'
		},{
			name:'使用官網服務<font color=green>啟動</font>(VIP專用)',lx:'1'
		},{
			name:'<font color=red>停止</font>用官網的計劃任務',lx:'2'
		}],
		itemsclick:function(d, i){
			c.start(d.lx);
		}
	});
});
</script>


<div>


<table width="100%"><tr>
	<td nowrap>
		<button class="btn btn-primary" click="clickwin,0" type="button"><i class="icon-plus"></i> 新增</button> &nbsp; 
		<button class="btn btn-default" click="refresh" type="button"><i class="icon-refresh"></i> 刷新</button> &nbsp; 
		<button class="btn btn-default" click="clearzt" type="button">清空狀態</button> &nbsp; 
		<button class="btn btn-success" id="randkstrt_{rand}" type="button"><i class="icon-stop"></i> 啟動計劃任務 <i class="icon-angle-down"></i></button>
	</td>
	
	
	
	<td width="80%">&nbsp;&nbsp;<a href="javascipt:;" click="openanz">[查看計劃任務安裝]</a>&nbsp;&nbsp;<a href="javascipt:;" click="openqueue">[計劃任務隊列]</a>&nbsp;&nbsp;<a href="<?=URLY?>view_taskrun.html"target="_blank">[幫助]</a></td>
	<td align="right" nowrap>
		
		<button class="btn btn-default" id="yun_{rand}" click="yunx" disabled type="button">運行</button> &nbsp; 
		
		<button class="btn btn-danger" id="del_{rand}" click="del" disabled type="button"><i class="icon-trash"></i> 刪除</button> &nbsp; 
		<button class="btn btn-info" id="edit_{rand}" click="clickwin,1" disabled type="button"><i class="icon-edit"></i> 編輯 </button>
	</td>
</tr>
</table>
</div>
<div class="blank10"></div>
<div id="veiw_{rand}"></div>
<div class="tishi">提示：執行地址如[sys,beifen]也就是運行webmain/task/runt/sysAction.php文件的beifenAction方法，以此類推。頻率d每天,i分鐘,w週,m月,y年,h小時</div>
