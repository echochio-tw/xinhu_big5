<?php
/**
*	信呼團隊應用
*/
class agent_xinhuClassModel extends agentModel
{
	protected function agentdata($uid, $lx)
	{
		$rows[] = array(
			'title' => '歡迎使用信呼',
			'cont'	=> '官網：<a href="'.URLY.'" target="_blank">'.URLY.'</a><br>版本：'.VERSION.'',
			'statuscolor' => 'green',
			'statustext'  => '官網'
		);
		$rows[] = array(
			'title' => '信呼開源協議',
			'cont'	=> '我們是開源PHP系統，可以自己企業單位內部使用，禁止商業銷售，歡迎研究學習使用，好的設計你可以借鑑，不好的你可以吐槽，讓我們改善。',
			'statuscolor' => 'green',
			'statustext'  => '官網'
		);
		$rows[] = array(
			'title' => '信呼相關幫助',
			'cont'	=> '1、常見使用問題，<a href="'.URLY.'view_cjwt.html" target="_blank">[查看]</a><br>2、使用前必讀 ，<a href="'.URLY.'view_bidu.html" target="_blank">[查看]</a><br>3、二次開發前必讀 ，<a href="'.URLY.'view_devbd.html" target="_blank">[查看]</a><br>4、更多幫助問題列表 ，<a href="'.URLY.'infor.html" target="_blank">[查看]</a>',
			'statuscolor' => 'green',
			'statustext'  => '官網'
		);
		$arr['rows'] 	= $rows;
		return $arr;
	}
}