<?php 
/**
*	桌面首頁項(關于官網)
*/
defined('HOST') or die ('not access');

?>
<div class="panel panel-success">
  <div class="panel-heading">
	<h3  class="panel-title">關于信呼</h3>
  </div>
  <div class="panel-body">
	
	<div style="line-height:25px">
	軟件：信呼<br>
	官網：<a href="<?=URLY?>" target="_blank"><?=URLY?></a><br>
	版本：V<?=VERSION?><br>
	下載：服務端，PC客戶端，APP<a href="<?=URLY?>view_down.html" target="_blank">[去下載]</a><br>
	聲明：我們是開源的，請遵守我們的<a href="<?=URLY?>view_version.html" target="_blank">開源協議</a>，謝謝！<br>
	幫助：提供開發幫助使用文檔<a href="<?=URLY?>help.html" target="_blank">[查看]，<a href="<?=URLY?>view_bidu.html" target="_blank">[必讀]</a>
	</div>

  </div>
</div>