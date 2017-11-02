<?php if(!defined('HOST'))die('not access');?>
<script >
$(document).ready(function(){
	var c={
		chush:function(o1){
			js.confirm('確定要初始化系統數據嘛？<font color=red>慎重！</font>',function(bt){
				if(bt=='yes'){
					o1.disabled=true;
					c.chushss(o1);
				}
			});
		},
		chushss:function(o1){
			js.msg('wait','初始中...');
			js.ajax(js.getajaxurl('chushua','{mode}','{dir}'),{}, function(s){
				if(s=='ok'){
					js.confirm('初始化成功，請重新登錄',function(){
						js.location('?m=login&a=exit');
					});
				}else{
					js.msg('msg', s);
					o1.disabled=false;
				}
			});
		},
		beifen:function(o1,lx){
			js.msg('wait','備份中...');
			js.ajax(js.getajaxurl('beifen','{mode}','{dir}'),{lx:lx}, function(s){
				if(s=='ok'){
					js.msg('success', '備份成功請到目錄<?=UPDIR?>/data下查看');
				}else{
					js.msg('msg', s);
				}
			});
		},
		huifu:function(){
			js.confirm('建議：恢復數據前請先備份一下數據啊！是否去備份？',function(jg){
				if(jg=='yes'){
					c.beifen();
				}else{
					addtabs({name:'數據恢復',num:'huifu',url:'system,beifen,huifu'});
				}
			});
		},
		deluser:function(o1){
			js.confirm('確定要初始化部門和用戶數據嘛？<font color=red>慎重！</font>',function(bt){
				if(bt=='yes'){
					o1.disabled=true;
					c.delusers(o1);
				}
			});
		},
		delusers:function(o1){
			js.msg('wait','初始中...');
			js.ajax(js.getajaxurl('chushuser','{mode}','{dir}'),{}, function(s){
				js.msg();
				if(s=='ok'){
					js.alert('部門和用戶已初始，請到用戶管理導入用戶。');
				}else{
					js.msg('msg', s);
					o1.disabled=false;
				}
			});
		}
	}
	js.initbtn(c);
});
</script>

<div align="left">
	<div>
		<button click="beifen,0" class="btn btn-success" type="button">系統數據備份</button>
	</div>
	<div class="tishi">數據備份會備份到系統目錄<?=UPDIR?>/data文件下，建議每天備份一次！</div>
	
	<div class="blank10"></div>
	<div><button click="huifu" class="btn btn-info" type="button">系統數據恢復</button></div>
	<div class="tishi">恢復你備份過的數據！</div>
	
	
	<div class="blank20"></div>
	<div><button click="chush" class="btn btn-danger" type="button">系統數據初始化</button></div>
	<div class="tishi">初始化將會清空系統上所有數據(除了人員、組織結構、模塊配置權限)，請謹慎使用！</div>
	
	<div class="blank20"></div>
	<div><button click="deluser" class="btn btn-danger" type="button">初始化部門和用戶</button></div>
	<div class="tishi">初始化部門和用戶，將會刪除你創建的用戶和部門，為了防止誤刪只能使用一次，請備份好數據謹慎使用！</div>
	
</div>