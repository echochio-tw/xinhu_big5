<?php
class mode_meetjyClassAction extends inputAction{
	
	
	protected function savebefore($table, $arr, $id, $addbo){
		
		$mid = $arr['mid'];
		$ors = m('meet')->getone($mid);
		if(!$ors)return '會議不存在';
		$darr['type'] 	= 2;
		$darr['title'] 	= $ors['title'];
		$darr['joinid'] = $ors['joinid'];
		return array(
			'rows' => $darr
		);
	}
	
		
	protected function saveafter($table, $arr, $id, $addbo){
		
	}
	
	//讀取會議列表(只能是10天內的)
	public function meetdata()
	{
		$dt   = c('date')->adddate($this->rock->date,'d',-10);
		$rows = m('meet')->getrows("`type`=0 and `state`>0 and `startdt`>='$dt'",'id as value,title as name','startdt desc');
		return $rows;
	}
}	
			