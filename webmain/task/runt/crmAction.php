<?php
class crmClassAction extends runtAction
{
	//客戶合同到期，每天運行
	public function runAction()
	{
		m('flow')->initflow('custract')->custractdaoqi();
		echo 'success';
	}
	
}