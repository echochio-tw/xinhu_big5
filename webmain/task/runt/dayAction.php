<?php
class dayClassAction extends runtAction
{
	//每天運行一次
	public function runAction()
	{
		m('flow')->initflow('work')->tododay(); //任務到期提醒
		m('flow')->initflow('daiban')->tododay(); //流程待辦處理提醒
		echo 'success';
	}
	
}