<?php
/**
*	考試培訓
*/
class agent_kaoshiClassModel extends agentModel
{
	protected function agentdata($uid, $lx)
	{
		$rows 			= array();
		$table 			= '`[Q]knowtrais` a left join `[Q]knowtraim` b on a.mid=b.id left join `[Q]admin` c on c.id=a.`uid`';
		$where 			= '1=1';
		$where.=' and a.`uid`='.$uid.'';
		if($lx=='weiks')$where.=' and a.`isks`=0 and b.`state`=1';
		$arr 			=  m('knowtrais')->getlimit($where, $this->page, 'a.*,b.title,b.state,b.startdt,b.enddt,c.`name`,c.deptname', 'a.id desc', $this->limit, $table); //讀取記錄
		
		//格式化數據
		//$this->statearr = explode(',','<font color=#ff6600>還未開始</font>,<font color=green>進行中</font>,<font color=#888888>已結束</font>');
		foreach($arr['rows'] as $k=>$rs){
			$cont	= '';
			if($rs['isks']=='1'){
				$cont = '分數：'.$rs['fenshu'].'<br>考試時間：'.substr($rs['kssdt'],5,11).'';
				if(!isempt($rs['ksedt']))$cont.='至'.substr($rs['ksedt'],5,11).'';
			}
			
			$sarr	= array(
				'title' => $rs['title'],
				'optdt' => ''.substr($rs['startdt'],5,11).'至'.substr($rs['enddt'],5,11).'',
				'id'	=> $rs['mid'],
				'modenum' => 'knowtraim',
				'cont'	=> $cont
			);
			if($rs['isks']=='1'){
				$sarr['statustext']='已考試';
				$sarr['statuscolor']='green';
				$sarr['ishui']='1';
			}else{
				$zt = $rs['state'];
				if($zt=='0'){
					$sarr['statustext']='未開始';
					$sarr['statuscolor']='#ff6600';
				}elseif($zt=='2'){
					$sarr['statustext']='已結束';
					$sarr['statuscolor']='#888888';
					$sarr['ishui']='1';
				}else{
					$sarr['statustext']='未考試';
					$sarr['statuscolor']='red';
				}
			}
			$rows[] = $sarr;
		}
		$arr['rows'] 	= $rows;
		return $arr;
	}
	
	//統計我為考試記錄數
	public function gettotal()
	{
		$stotal	= $this->getwdtotal($this->adminid);
		$titles	= '';
		return array('stotal'=>$stotal,'titles'=> $titles);
	}
	
	private function getwdtotal($uid)
	{
		$table 	= '`[Q]knowtrais` a left join `[Q]knowtraim` b on a.mid=b.id';
		$stotal = $this->db->rows($table,'a.uid='.$uid.' and a.`isks`=0 and b.`state`=1');
		return $stotal;
	}
	
	//底部菜單顯示未考試數
	protected function agenttotals($uid)
	{
		$a = array(
			'weiks' => $this->getwdtotal($uid)
		);
		return $a;
	}
}