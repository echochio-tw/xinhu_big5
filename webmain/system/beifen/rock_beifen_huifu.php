<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	var folder='';
	var at = $('#viewss_{rand}').bootstable({
		tablename:'option',celleditor:false,url:js.getajaxurl('getdata', '{mode}', '{dir}'),
		columns:[{
			text:'備份時間',dataIndex:'filename'
		},{
			text:'操作',dataIndex:'opt',renderer:function(v,d,i){
				return '<a href="javascript:;" onclick="huifww{rand}('+i+')">恢復</a>';
			}
		}]
	});
	
	var a = $('#view_{rand}').bootstable({
		tablename:'option',celleditor:true,checked:true,url:js.getajaxurl('getdatssss', '{mode}', '{dir}'),
		autoLoad:false,params:{xu:0},
		columns:[{
			text:'表名',dataIndex:'fields'
		},{
			text:'字段數',dataIndex:'fieldshu'
		},{
			text:'記錄數',dataIndex:'total'
		},{
			text:'文件大小',dataIndex:'filesizecn'
		}],
		load:function(){
			get('btnss_{rand}').focus();
		}
	});
	
	huifww{rand}=function(i){
		c.huifu(i);
	}
	
	var c = {
		huifu:function(f){
			var d = at.getData(f);
			folder= d.filename;
			a.setparams({'folder':d.filename},true);//恢復的文件夾
		},
		clickwin:function(){
			var sid = a.getchecked();
			if(sid==''){
				js.msg('msg','沒有選中記錄');
				return;
			}
			js.confirm('確定要恢復選中的數據庫表嗎？恢復了現有的數據就沒有了!',function(jg){
				if(jg=='yes'){
					setTimeout(function(){
						c.huifusss(sid);
					}, 100);
				}
			});
		},
		huifusss:function(sid){
			js.wait('恢復中請不要關閉...');
			js.ajax(js.getajaxurl('huifdatanew', '{mode}', '{dir}'),{sid:sid,'folder':folder},function(s){
				setTimeout(function(){
					js.tanclose('confirm');
					js.msg('success','恢復'+s+'');
				}, 1000);	
			},'post');
		},
		reload:function(){
			at.reload();
		}
	};
	js.initbtn(c);
});
</script>


<table width="100%">
<tr valign="top">
<td width="30%">
	<div>
	<button class="btn btn-default" click="reload,0" type="button">刷新</button>
	</div>
	<div class="blank10"></div>
	<div id="viewss_{rand}"></div>
</td>
<td width="10"></td>
<td>	
	<div align="right"><font color="#888888">系統只會恢復數據並不會恢復字段，建議選擇單表恢復，以免超時。</font>&nbsp;
	<button class="btn btn-default" id="btnss_{rand}" click="clickwin,0" type="button">恢復選中表</button>
	</div>
	<div class="blank10"></div>
	<div id="view_{rand}"></div>
</td>
</tr>
</table>