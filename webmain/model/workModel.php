<?php
class workClassModel extends Model
{
	/**
	*	未完成統計的也可以用m('flow')->initflow('work')->getdaiban();
	*/
	public function getwwctotals($uid)
	{
		$s 	= $this->rock->dbinstr('distid', $uid);
		$to	= $this->rows('`status` in(3,4) and '.$s.'');
		
		return $to;
	}
}