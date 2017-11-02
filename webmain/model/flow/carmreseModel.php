<?php
class flow_carmreseClassModel extends flowModel
{


	protected function flowbillwhere($uid, $lx)
	{
		$where  = '';
		$key 	= $this->rock->post('key');
		$dt 	= $this->rock->post('dt');
		if($key != '')$where.=" and (`carnum`='$key' or `usename` like '%$key%' or `optname` like '%$key%')";
		if($dt != '')$where.=" and (`applydt`='$dt' or `startdt` like '$dt%')";
		
		return array(
			'where' => $where,
			'order' => 'optdt desc'
		);
	}
	
	//自定義審核人讀取
	protected function flowcheckname($num){
		$sid = '';
		$sna = '';
		//駕駛員審核讀取
		if($num=='jias'){
			$sid = $this->rs['jiaid'];
			$sna = $this->rs['jianame'];
		}
		return array($sid, $sna);
	}
	
	//可預定的車輛
	public function getcardata()
	{
		$rows = m('carm')->getall("`ispublic`=1 and `state`=1",'carnum as name,id as value');
		$arrs = $this->db->getrows('[Q]carmrese','`status`=1 group by carid','max(kmend)kmend,carid');
		$arrsa= array();
		foreach($arrs as $k=>$rs)$arrsa[$rs['carid']]=$rs['kmend'];
		//讀取車輛最後公裡數
		foreach($rows as $k=>$rs){
			$rows[$k]['kmstart'] = $this->rock->arrvalue($arrsa, $rs['value']);
		}
		return $rows;
	}
}