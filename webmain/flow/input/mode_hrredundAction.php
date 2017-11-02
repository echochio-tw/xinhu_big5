<?php
//離職申請
class mode_hrredundClassAction extends inputAction{
	
	protected function savebefore($table, $arr, $id, $addbo)
	{
		$uid = $arr['uid'];
		if(m($table)->rows('id<>'.$id.' and `uid`='.$uid.' and `status`<>5')>0)return '您已申請過了';
	}
	
		
	protected function saveafter($table, $arr, $id, $addbo){
		
	}
	
	public function getuserinfoAjax()
	{
		$urs = m('admin')->getone($this->adminid,'ranking,workdate');
		$this->returnjson($urs);
	}
}	
			