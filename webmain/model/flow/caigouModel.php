<?php
class flow_caigouClassModel extends flowModel
{
	public $minwidth	= 600;//子表最小寬
	
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
				$name = $one['name'];
				if(!isempt($one['xinghao']))$name.='('.$one['xinghao'].')';
				if($lx==1)$rows[$k]['aid'] = $name; //1展示時
				$rows[$k]['temp_aid'] = $name;
			}
		}
		return $rows;
	}
}