<?php
class flow_tovoidClassModel extends flowModel
{
	
	//展示是替換一下
	public function flowrsreplace($rs)
	{
		$str= '作廢';
		if($rs['type']==1)$str= '刪除';
		$rs['type'] = $str;
		return $rs;
	}

	//審核完成了處理單據，刪除還是作廢
	protected function flowcheckfinsh($zt)
	{
		$type = $this->rs['type'];
		$bilrs= $this->billmodel->getone("`sericnum`='".$this->rs['tonum']."'");
		if(!$bilrs)return;
		$mors = $this->db->getone('[Q]flow_set',"`id`='".$bilrs['modeid']."'");
		if(!$mors)return;
		//作廢
		if($type==0){
			m('flow')->zuofeibill($mors['num'], $bilrs['mid'], $this->rs['explain']);
		}
		//刪除
		if($type==1){
			m('flow')->deletebill($mors['num'], $bilrs['mid'], $this->rs['explain'], false);
		}
	}
	
}