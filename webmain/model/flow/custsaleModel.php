<?php

class flow_custsaleClassModel extends flowModel
{
	public function initModel(){
		$this->statearr		 = c('array')->strtoarray('跟進中|blue,已成交|green,已丟失|#888888');
	}

	
	public function flowrsreplace($rs)
	{
		$zt = $this->statearr[$rs['state']];
		$rs['statess']	 = $rs['state'];
		$rs['state']	 = '<font color="'.$zt[1].'">'.$zt[0].'</font>';
		if($rs['htid']>0)$rs['state'].=',<font color=#888888>並建立合同</font>';
		return $rs;
	}
	
	protected function flowoptmenu($ors, $crs)
	{
		$zt  = $ors['statusvalue'];
		$num = $ors['num'];
		if($num=='ztqh'){
			$sarr['state'] = $zt;
			if($zt==1)$sarr['dealdt'] = $this->rock->now;	
			$this->update($sarr, $this->id);
		}
		
		if($num=='zhuan'){
			$cname 	 = $crs['cname'];
			$cnameid = $crs['cnameid'];
			$this->update(array(
				'uid' 		=> $cnameid,
				'optname' 	=> $cname
			), $this->id);
			$this->push($cnameid, '客戶銷售', ''.$this->adminname.'將一個客戶【{custname}】的一個銷售單轉移給你');
		}	
	}
	
	protected function flowbillwhere($uid, $lx)
	{
		return array(
			'order' => '`state`,`optdt` desc'
		);
	}
}