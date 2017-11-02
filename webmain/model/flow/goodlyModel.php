<?php
class flow_goodlyClassModel extends flowModel
{
	
	//審核完成處理
	protected function flowcheckfinsh($zt){
		m('goodss')->update('status='.$zt.'',"`mid`='$this->id'");
		$aid  = '0';
		$rows = m('goodss')->getall("`mid`='$this->id'",'aid');
		foreach($rows as $k=>$rs)$aid.=','.$rs['aid'].'';
		m('goods')->setstock($aid);
	}

	
	
	//子表數據替換處理
	protected function flowsubdata($rows, $lx=0){
		$db = m('goods');
		foreach($rows as $k=>$rs){
			$one = $db->getone($rs['aid']);
			if($one){
				$name 	= $one['name'];
				if(!isempt($one['xinghao']))$name.='('.$one['xinghao'].')';
				if($lx==1){
					$rows[$k]['aid'] 	= $name;
					$rows[$k]['count'] 	= 0-$rs['count']; //負數顯示為正數
				}
				$rows[$k]['unit'] 	= $one['unit'];
				$rows[$k]['temp_aid'] = $name;
			}
		}
		return $rows;
	}
}