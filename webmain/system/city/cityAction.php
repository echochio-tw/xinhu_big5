<?php
class cityClassAction extends Action
{
	//數據源
	public function getdataAjax()
	{
		$id 	= $this->post('id');
		if(isempt($id))$id='1';
		$id 	= (int)$id;
		$dbs 	= m('city');
		$rows 	= $dbs->getrows('pid='.$id.'','*','`sort`,`id`');
		$patha	= $dbs->getpath($id);
		$type 	= $dbs->getmou('type', $id);
		if(isempt($type))$type=-1;
		
		return array(
			'type' => (int)$type+1,
			'pid'  => $id,
			'rows' => $rows,
			'path' => $patha,
		);
	}
	
	//刪除
	public function deldataAjax()
	{
		$id 	= (int)$this->post('id','0');
		$to 	= m('city')->rows("`pid`='$id'");
		if($to>0)return returnerror('有'.$to.'條下級不能刪除');
		m('city')->delete($id);
		return returnsuccess();
	}
	
	//從官網獲取城市數據
	public function initdataAjax()
	{
		return m('city')->daorudata();
	}
}