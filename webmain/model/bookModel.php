<?php
class bookClassModel extends Model
{
	/**
	*	讀取當前時間借閱數量
	*/
	public function getborrowshu($bookid, $dt='', $sid=0)
	{
		if($dt=='')$dt=$this->rock->date;
		$where = '`bookid`='.$bookid.' and `status` in(0,1) and `isgh`=0 and `id`<>'.$sid.'';
		//$where.= " and `jydt`<='$dt'";
		$tos 	= $this->db->rows('[Q]bookborrow', $where);
		return floatval($tos);
	}
	
	/**
	*	讀取數可借閱數量
	*/
	public function getjieshu($bookid, $dt='', $sid=0)
	{
		$yij = $this->getborrowshu($bookid, $dt, $sid);
		$tos = floatval($this->getmou('shul', $bookid));
		
		return $tos-$yij;
	}
}