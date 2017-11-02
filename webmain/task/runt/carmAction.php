<?php
class carmClassAction extends runtAction
{
	//車輛提醒，每天運行
	public function runAction()
	{
		echo m('flow')->initflow('carms')->todocarms($this->runrs['todoid']);
	}
	
}