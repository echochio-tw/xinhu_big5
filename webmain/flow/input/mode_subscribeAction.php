<?php
/**
*	此文件是流程模塊【subscribe.訂閱】對應控制器接口文件。
*/ 
class mode_subscribeClassAction extends inputAction{
	
	
	
	protected function savebefore($table, $cans, $id, $addbo=true)
	{
		$suburlpost = $cans['suburlpost'];
		$optid		= $cans['optid'];
		$to  = m('subscribe')->rows("`id`<>'$id' and `optid`='$optid' and `suburlpost`='$suburlpost'");
		if($to>0)return '已訂閱過，請到我的訂閱管理下操作';
	}
	
	//運行訂閱
	public function yunsubscribeAjax()
	{
		$id = (int)$this->get('id');
		$this->flow = m('flow')->initflow('subscribeinfo');
		return $this->flow->subscribe($id);
	}
}	
			