<?php
/**
*	模塊.印章申請
*/
class flow_sealaplClassModel extends flowModel
{
	//讀取印章保管人來審批
	protected function flowcheckname($num)
	{
		if($num=='bgque'){
			$sealrs = m('seal')->getone('`id`='.$this->rs['sealid'].'');
			if($sealrs)return array($sealrs['bgid'], $sealrs['bgname']);
		}
	}
	
	//展示是替換一下
	public function flowrsreplace($rs)
	{
		$str= '<font color=#888888>否</font>';
		if($rs['isout']==1)$str= '<font color=green>是</font>';
		$rs['isout'] = $str;
		return $rs;
	}
	
}