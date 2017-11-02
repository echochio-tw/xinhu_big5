<?php
class flow_kqdkjlClassModel extends flowModel
{
	public function initModel()
	{
		$this->dateobj = c('date');
		
		$this->typearr = explode(',','在線打卡,考勤機,手機定位,手動添加,異常添加,數據導入,接口導入,企業微信打卡,釘釘打卡');//0-8
	
	}
	
	/**
	*	顯示條件過濾
	*/
	protected function flowbillwhere($uid, $lx)
	{
		$atype	= $lx;
		$dt1	= $this->rock->post('dt1');
		$dt2	= $this->rock->post('dt2');
		$key	= $this->rock->post('key');
		$s 		= '';
		$s		= ' and b.id='.$this->adminid.'';
		
		//全部下屬打卡
		if($lx=='down' || $lx=='dwdown'){
			$s  = 'and '.m('admin')->getdownwheres('b.id', $uid, 0);
		}
		if($atype=='all')$s ='';
		if(!isempt($dt1))$s.=" and a.`dkdt`>='$dt1'";
		if(!isempt($dt2))$s.=" and a.`dkdt`<='$dt2 23:59:59'";
		if(!isempt($key))$s.=m('admin')->getkeywhere($key, 'b.');
		$fields = 'a.*,b.name,b.deptname';
		$tabls  = $this->mtable;
		
		$table  = '`[Q]'.$tabls.'` a left join `[Q]admin` b on a.uid=b.id';
		return array(
			'where' => $s,
			'table' => $table, 
			'order' => 'a.`id` desc',
			'fields'=> $fields
		);
	}
	
	//替換
	public function flowrsreplace($rs)
	{
		$week 		= $this->dateobj->cnweek($rs['dkdt']);
		$rs['week'] = $week;
		$rs['type'] = $this->typearr[$rs['type']];
		if($week=='六' || $week=='日')$rs['ishui']= 1;
		return $rs;
	}
	
	
	public function flowdaorutestdata()
	{
		$barr[] = array(
			'base_name' => '管理員',
			'dkdt' 		=> '2016-08-08 12:00:01',
		);
		$barr[] = array(
			'base_name' => '大喬',
			'dkdt' 		=> '2017-08-22 08:55:01',
		);
		return $barr;
	}
	
	//導入之前判斷
	public function flowdaorubefore($rows)
	{
		$inarr	= array();
		$uarr 	= array();
		$dtobj 	= c('date');
		foreach($rows as $k=>$rs){
			$name 	= $rs['base_name'];
			$dkdt 	= $rs['dkdt'];
			if(isempt($name) || isempt($dkdt))continue;
			
			$dkdt	 = str_replace('/','-', $dkdt);
			if(!$dtobj->isdate($dkdt))continue;
			
			if(isset($uarr[$name])){
				$uid = $uarr[$name];
			}else{
				$usar 	= $this->adminmodel->getrows("`name`='$name'",'id');
				if($this->db->count!=1)continue;
				$uid	= $usar[0]['id'];
				$uarr[$name] = $uid;
			}
			
			if($this->rows("`uid`='$uid' and `dkdt`='$dkdt'")>0)continue;
			$inarr[] = array(
				'uid' => $uid,
				'dkdt' => $dkdt,
				'type' => 5,
			);
		}
		
		return $inarr;
	}
}