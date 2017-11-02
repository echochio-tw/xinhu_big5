<?php
/**
*	客戶.銷售機會
*/
class mode_custsaleClassAction extends inputAction{
	
	public function selectcust()
	{
		$rows = m('crm')->getmycust($this->adminid, $this->rock->arrvalue($this->rs, 'custid'));
		return $rows;
	}
}	
			