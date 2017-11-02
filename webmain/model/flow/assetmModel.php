<?php
class flow_assetmClassModel extends flowModel
{
	public function initModel()
	{
		$this->statearr = c('array')->strtoarray('blue|閒置,#ff6600|在用,red|維修,gray|報廢,gray|丟失');
	}
	
	public function flowrsreplace($rs)
	{
		if(isset($rs['typeid']))$rs['typeid'] 	= $this->db->getmou('[Q]option','name',"`id`='".$rs['typeid']."'");
		if(isset($rs['ckid']))$rs['ckid'] 	= $this->db->getmou('[Q]option','name',"`id`='".$rs['ckid']."'");
		if(isset($this->statearr[$rs['state']])){
			$b 			 = $this->statearr[$rs['state']];
			$rs['state'] = '<font color="'.$b[0].'">'.$b[1].'</font>';
		}
		if(isset($rs['fengmian']) && !isempt($rs['fengmian']))$rs['fengmian'] = '<img src="'.$rs['fengmian'].'" height="100">';
		return $rs;
	}

	protected function flowbillwhere($uid, $lx)
	{
		$where  = '';
		$typeid = $this->rock->post('typeid','0');
		$key 	= $this->rock->post('key');
		if($typeid!='0'){
			$alltpeid = m('option')->getalldownid($typeid);
			$where .= ' and `typeid` in('.$alltpeid.')';
		}
		if($key != '')$where.=" and (`title` like '%$key%' or `num` like '%$key%' or `usename` like '%$key%')";
		return array(
			'where' => $where,
			'order' => 'optdt desc',
			'fields'=> 'id,title,num,brand,optdt,usename,state,ckid'
		);
	}
	
	//導入數據的測試顯示
	public function flowdaorutestdata()
	{
		return array(
			'typeid' 		=> '電腦/台式電腦',
			'title' 		=> '這是一個電腦啊',
			'num' 		=> 'ZiCAN-001',
			'brand' 		=> '聯想',
			'laiyuan' 		=> '購買',
			'buydt' 		=> '2017-01-17',
			'explain' 		=> '簡單說明一下',
		);
	}
	
	//導入之前
	public function flowdaorubefore($rows)
	{
		foreach($rows as $k=>$rs){
			$rows[$k]['typeid'] 	= $this->option->gettypeid('assetstype',$rs['typeid']);
			$rows[$k]['adddt']		= $this->rock->now;
			$rows[$k]['optdt']		= $this->rock->now;
		}
		return $rows;
	}
}