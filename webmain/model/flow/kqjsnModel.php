<?php
//考勤機設備
class flow_kqjsnClassModel extends flowModel
{
	public function flowrsreplace($rs)
	{
		if(isempt($rs['lastdt'])){
			$rs['ishui'] = 1;
		}else{
			if(time()-strtotime($rs['lastdt'])>5*60)$rs['ishui'] = 1;//5分鐘沒請求
		}
		if($rs['space']>0)$rs['space'] = $this->rock->formatsize($rs['space']);
		if($rs['memory']>0)$rs['memory'] = $this->rock->formatsize($rs['memory']);
		return $rs;
	}
}