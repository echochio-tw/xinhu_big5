<?php
class mode_bookborrowClassAction extends inputAction{
	

	protected function savebefore($table, $arr, $id, $addbo){
		$bookid = $arr['bookid'];
		$jydt 	= $arr['jydt'];
		if($id==0 && $jydt<$this->date)return '借閱日期不能是過去';
		$shul	= m('book')->getjieshu($bookid, $jydt, $id);
		if($shul<1)return '該書數量不夠了';
	}
	
		
	protected function saveafter($table, $arr, $id, $addbo){
		
	}
	
	public function getbookdata()
	{
		$rows 	= m('book')->getrows('shul>0','id,title,typeid','typeid');
		$arr 	= array();
		foreach($rows as $k=>$rs){
			$arr[] = array('value'=>$rs['id'],'name'=>$rs['title']);
		}
		return $arr;
	}
}	
			