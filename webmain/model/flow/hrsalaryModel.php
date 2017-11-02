<?php
class flow_hrsalaryClassModel extends flowModel
{
	protected $flowviewufieds	= 'xuid';
	
	//薪資是個嚴格的模塊，只能設置權限後才可以查看，不管是不是管理員
	protected function flowbillwhere($uid, $lx)
	{
		$key  	= $this->rock->post('key');
		$dt  	= $this->rock->post('dt');
		$ispay  = $this->rock->post('ispay');
		$isturn  = $this->rock->post('isturn');
		$where 	= '';
		$where 	= $this->viewmodel->viewwhere($this->moders, $this->adminid, $this->flowviewufieds);
		if($lx=='faf'){
			$where.=' and `status`=1';
		}
		if($ispay!='')$where.=' and `ispay`='.$ispay.'';
		if($isturn!='')$where.=' and `isturn`='.$isturn.'';
	//echo $where;
		
		if($key!='')$where.=" and (udeptname like '%$key%' or uname like '%$key%' or ranking like '%$key%' )";
		if($dt!='')$where.=" and `month`='$dt'";
		return array(
			'where' => $where,
			'table'	=> '`[Q]'.$this->mtable.'` a',
			'fields'=> 'id,status,xuid,udeptname,status,uname,ranking,optdt,month,optname,base,money,isturn,ispay',
			'order' => '`optdt` desc'
		);
	}
	
	public function flowrsreplace($rs){
		$s = '<font color=red>待發放</font>';
		$rs['ispays']	= $rs['ispay'];
		if($rs['ispay']==1)$s = '<font color=green>已發放</font>';
		$rs['ispay'] = $s;
		
		$s = '<font color=red>待核算</font>';
		if($rs['isturn']==1)$s = '<font color=green>已核算</font>';
		$rs['isturnss'] = $s;
		return $rs;
	}
	
	private function fafang()
	{
		$this->addlog(array(
			'name' => '發放'
		));
		$this->update('ispay=1', $this->id);
		m('reim')->asynurl('asynrun','salaryff', array(
			'id' => $this->id
		));//異步通知給人員
	}
	
	public function todouser()
	{
		$this->push($this->rs['xuid'],'','您['.$this->rs['month'].']月份薪資已發放，請注意查看對賬。','薪資發放通知');
	}
	
	public function gongzifafang($sid)
	{
		$sarrid = explode(',',$sid);
		foreach($sarrid as $id){
			$this->loaddata($id, false);
			if($this->rs['status']==1 && $this->rs['ispay']==0)$this->fafang();
		}
	}
	
	//一鍵生成薪資
	public function createdata($month)
	{
		$lmonth = c('date')->adddate($month.'-01','m',-1, 'Y-m');
		$swer 	= m('admin')->monthuwhere($month);
		$where 	= "`month`='$lmonth' and `optid`='$this->adminid' and xuid in(select id from `[Q]admin` where 1=1 $swer) and `xuid` not in(select xuid from `[Q]".$this->mtable."` where `month`='$month')";
		$addfes = 'base,postjt,skilljt,travelbt,telbt';
		$adees	= explode(',', $addfes);
		$rows 	= $this->getall($where, 'xuid,uname,udeptname,ranking,'.$addfes.',socials');
		$count  = $this->db->count;
		foreach($rows as $k=>$rs){
			$money 	= 0;
			$xuid	= $rs['xuid'];
			$arr 	= array(
				'xuid' 		=> $xuid,
				'uname' 	=> $rs['uname'],
				'ranking' 	=> $rs['ranking'],
				'udeptname' => $rs['udeptname'],
				'uid' 		=> $this->adminid,
				'optid' 	=> $this->adminid,
				'optname' 	=> $this->adminname,
				'optdt' 	=> $this->rock->now,
				'applydt' 	=> $this->rock->date,
				'status' 	=> 0,
				'isturn' 	=> 0,
				'month' 	=> $month,
			);
			foreach($adees as $fid){
				$arr[$fid] = $rs[$fid];
				$money += floatval($rs[$fid]);
			}
			$money -= floatval($rs['socials']);
			$arr['money']	= $money;
			$this->insert($arr);
		}
		return '成功成功'.$count.'條';
	}
	
	//導入數據的測試顯示
	public function flowdaorutestdata()
	{
		$barr = array(
			'uname' 		=> '貂蟬',
			'month' 		=> '[2017-08]',
			'base' 			=> '1700',
			'skilljt' 		=> '3500',
			'telbt' 		=> '0',
			'travelbt' 		=> '0',
			'postjt' 		=> '500',
			'reward' 		=> '0',
			'jiabans' 		=> '0',
			
			'punish' 		=> '0', //處罰
			'socials' 		=> '0', 
			'taxes' 		=> '0', 
			'money' 		=> '5700', 
			'explain' 		=> '本月薪資', 
			'isturn' 		=> '是', 
			'status' 		=> '是',
			
		);
		$barr1 = array(
			'uname' 		=> '大喬',
			'month' 		=> '[2017-08]',
			'base' 			=> '1700',
			'skilljt' 		=> '3000',
			'telbt' 		=> '0',
			'travelbt' 		=> '0',
			'postjt' 		=> '500',
			'reward' 		=> '0',
			'jiabans' 		=> '0',
			
			'explain' 		=> '本月薪資',
			
			'punish' 		=> '0', //處罰
			'socials' 		=> '0', 
			'taxes' 		=> '0', 
			'money' 		=> '5200', 
			'isturn' 		=> '是', 
			'status' 		=> '是', 
			
		);
		$barr2 = array(
			'uname' 		=> '小喬',
			'month' 		=> '[2017-08]',
			'base' 			=> '1700',
			'skilljt' 		=> '2500',
			'telbt' 		=> '0',
			'travelbt' 		=> '0',
			'postjt' 		=> '500',
			'reward' 		=> '0',
			'jiabans' 		=> '0',
			
			'explain' 		=> '導入',
			
			'punish' 		=> '5', //處罰
			'socials' 		=> '0', 
			'taxes' 		=> '0', 
			'money' 		=> '4695', 
			'isturn' 		=> '是', 
			'status' 		=> '是', 
			
		);
		return array($barr,$barr1,$barr2);
	}
	
	//導入之前判斷
	public function flowdaorubefore($rows)
	{
		$inarr	= array();
		$uarra	= array();
		foreach($rows as $k=>$rs){
			$name 	= $rs['uname'];
			
			$month 	= str_replace('[','', $rs['month']);
			$month 	= substr(str_replace(']','', $month),0,7);
			
			$arr 	= $rs;
			$urs 	= $this->adminmodel->getone("`name`='$name'");
			if(!$urs)continue;
			
			$to 	= $this->rows("`xuid`='".$urs['id']."' and `month`='$month'");
			if($to>0)continue;//已經存在了
			
			$arr['month'] = $month;
			$arr['xuid'] = $urs['id'];
			$arr['udeptname'] = $urs['deptname'];
			$arr['ranking'] = $urs['ranking'];
			
			$arr['isturn']  = (arrvalue($arr,'isturn')=='是') ? 1 : 0;
			$arr['status']  = (arrvalue($arr,'status')=='是') ? 1 : 0;
			
			if($arr['status']==1)$arr['isturn'] = 1;
			
			$inarr[] = $arr;
		}
		
		return $inarr;
	}
	
	//導入後處理,未審核需要提交審核
	public function flowdaoruafter($drdata=array())
	{
		foreach($drdata as $k=>$rs){
			//
			if($rs['status']==0 && $rs['isturn']==1){
				$id = $rs['id'];
				$this->loaddata($id, false);
				$this->submit('提交');
			}
		}
	}
}