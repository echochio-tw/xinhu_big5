<?php

class flow_goodsClassModel extends flowModel
{
	
	protected function flowchangedata(){
		$this->rs['typeid']	 = $this->db->getpval('[Q]option','pid','name', $this->rs['typeid'],'/','id',2);;
	}

	//導入數據的測試顯示
	public function flowdaorutestdata()
	{
		return array(
			'typeid' 		=> '辦公耗材/筆',
			'name' 			=> '紅色粉筆',
			'guige' 		=> '紅色',
			'xinghao' 		=> '5釐米',
			'price' 		=> '0.1',
			'unit' 			=> '盒',
			'stockcs' 		=> '20',
		);
	}
	
	//導入之前
	public function flowdaorubefore($rows)
	{
		$inarr = array();
		$db 	= m('goods');
		foreach($rows as $k=>$rs){
			$rs['typeid'] 	= $this->option->gettypeid('goodstype',$rs['typeid']);
			
			//判斷是否存在
			$odi 			= $db->existsgoods($rs);
			if($odi)continue;
			
			$rs['price']	= floatval($this->rock->repempt($rs['price'],'0')); //金額
			$rs['stockcs']	= (int)$this->rock->repempt($rs['stockcs'],'0'); //初始庫存

			$inarr[] = $rs;
		}
		
		return $inarr;
	}
	
	//導入後處理（刷新庫存）
	public function flowdaoruafter()
	{
		m('goods')->setstock();
	}
}