<?php
/**
*	此文件是流程模塊【gong.通知公告】對應接口文件。
*	可在頁面上創建更多方法如：public funciton testactAjax()，用js.getajaxurl('testact','mode_gong|input','flow')調用到對應方法
*/ 
class mode_gongClassAction extends inputAction{
	
	
	protected function savebefore($table, $arr, $id, $addbo){
		//$uarr['receid'] = $this->flow->getreceids($arr['receid']);
		
		return array(
			//'rows' => $uarr
		);
	}
	
	
	protected function saveafter($table, $arr, $id, $addbo){
		
	}
	
	//提交投票
	public function submittoupiaoAjax()
	{
		$mid 		= $this->get('mid');
		$sid 		= $this->get('sid');
		$modenum 	= $this->get('modenum');
		
		$this->flow	= m('flow')->initflow($modenum);
		
		$towheer	= "`table`='infor' and `mid`='$mid' and `name`='投票' and `checkid`='$this->adminid'";
		if($this->flow->flogmodel->rows($towheer)>0)return '你已投票了';
		
		$this->flow->addlog(array(
			'name' => '投票',
			'mid'  => $mid,
			'explain' => '投票項ID('.$sid.')' 
		));
		m('infors')->update('`touci`=`touci`+1','`mid`='.$mid.' and `id` in('.$sid.')');
		
		echo 'ok';
	}
}	
			