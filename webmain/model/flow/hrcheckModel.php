<?php
//模塊 hrcheck.考核評分
class flow_hrcheckClassModel extends flowModel
{
	//審核完成處理
	protected function flowcheckfinsh($zt){
		//最後得分計算，
		if($zt==1){
			$fenzp = floatval($this->rs['fenzp']);
			$fensj = floatval($this->rs['fensj']);
			$fenrs = floatval($this->rs['fenrs']);
			
			//默認分數=自己評分*50% + 上級評分*25% + 人事評分*25%
			$fen   = $fenzp*0.5 + $fensj*0.25 + $fenrs*0.25; 
			
			//3個平均分
			//$fen 	= ($fenzp+$fensj+$fenrs)/3;

			
			$this->update(array('fen' => $fen), $this->id);		
		}
	}

}