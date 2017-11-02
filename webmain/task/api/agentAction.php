<?php 
class agentClassAction extends apiAction
{
	/**
	*	手機app讀取應用
	*/
	public function dataAction()
	{
		$agentarr			= m('reim')->getappagent($this->adminid);
		$arr['agentjson']	= json_encode($agentarr['rows']);
		$this->showreturn($arr);
	}
	
	/**
	*	app上讀取數組的
	*/
	public function dataappAction()
	{
		$agentarr			= m('reim')->getappagent($this->adminid);
		$arr['agentarr']	= $agentarr;
		$this->showreturn($arr);
	}
	
	public function getoptnumAction()
	{
		$num  	= $this->post('num');
		$mid  	= (int)$this->post('mid');
		
		$arr 	= m('flow')->opt('getoptmenu', $num, $mid);
		$this->showreturn($arr);
	}
}