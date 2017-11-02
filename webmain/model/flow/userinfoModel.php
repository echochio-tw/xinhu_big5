<?php
class flow_userinfoClassModel extends flowModel
{
	public  $uidfields = 'id';
	
	public function initModel()
	{
		//讀取狀態
		$this->statearr 	= array();
		$this->statearrs 	= array();
		$ztarrs = m('option')->getmnum('userstate');
		if(!$ztarrs){
			$ztarrs[] = array('value'=>0,'name'=>'試用期');
			$ztarrs[] = array('value'=>1,'name'=>'正式');
			$ztarrs[] = array('value'=>2,'name'=>'實習生');
			$ztarrs[] = array('value'=>3,'name'=>'兼職');
			$ztarrs[] = array('value'=>4,'name'=>'臨時工');
			$ztarrs[] = array('value'=>5,'name'=>'離職');
		}
		foreach($ztarrs as $k=>$rs){
			$this->statearr[$rs['value']] = $rs['name'];
			$this->statearrs[] = array('id'=> $rs['value'], 'name'=>$rs['name']);
		}
		
		$this->birtypearr 	= explode(',','陽歷,農歷');
		$this->calendar		= c('calendar');
	}
	
	public function getstatusarr()
	{
		$barr	 = array();
		foreach($this->statearr as $k=>$v){
			$barr[$k] = array($v,'');
		}

		return $barr;
	}

	public function flowrsreplace($rs, $lx=0)
	{
		if($rs['state']==5)$rs['ishui']=1;
		$rs['stateval']		= $rs['state'];
		$rs['state']		= $this->getuserstate($rs['state']);
		
		$rs['shengri']		= '';
		if(!isempt($rs['birthday'])){
			if($rs['birtype']==0){
				$rs['shengri'] = $rs['birthday'];
			}else{
				$days			= $this->calendar->daytocal($rs['birthday']);
				$rs['shengri'] = ''.$days['year'].'年農歷'.$days['month'].'月'.$days['day'].'';
			}
		}
		
		$rs['birtype']		= $this->birtypearr[$rs['birtype']];
		
		if(isset($rs['companyid']) && $lx==1)$rs['companyid'] = m('company')->getmou('name',"`id`='".$rs['companyid']."'");
		
		if($this->rock->request('execldown')=='true' && isset($rs['idnum'])){
			$rs['mobile'] = '&nbsp;'.$rs['idnum'];
		}
	
		return $rs;
	}
	
	public function getuserstate($zt)
	{
		return $this->rock->arrvalue($this->statearr,$zt,'未知');
	}
	
	protected function flowbillwhere($uid, $lx)
	{
	
		return array(
			'ztfields'	=> 'state',
			'order'		=> 'a.id',
			'table'		=> '`[Q]userinfo` a left join `[Q]company` b on a.companyid=b.id',
			'fields'	=> 'a.id,a.name,a.deptname,a.ranking,a.state,a.tel,a.sex,a.mobile,a.workdate,a.jiguan,a.minzu,a.xueli,a.email,a.syenddt,a.quitdt,a.positivedt,a.birtype,a.birthday,a.num,b.name as companyid',
			'asqom'		=> 'a.',
			'orlikefields' => 'b.name'
		);
	}
	
	/**
	*	員工生日提醒
	*/
	public function birthdaytodo()
	{
		$dt 	= date('m-d');
		$cala   = $this->calendar->toCalday($this->rock->date);
		$nongli	= $cala['cal'];
		$rows 	= $this->db->getall("select a.`birthday`,b.`id`,a.`birtype`,b.`name` from `[Q]".$this->mtable."` a left join `[Q]admin` b on a.`id`=b.`id` where b.`status`=1 and a.`state`<>5 and ((a.`birthday` like '%".$dt."' and a.`birtype`=0) or (a.`birthday` like '%".$nongli."' and a.`birtype`=1) )");
		foreach($rows as $k=>$rs){
			$cont = '今天是'.date('Y年m月d日').',農歷'.$cala['month'].''.$cala['day'].'，是你的生日，我們在這裡祝你生日快樂。';
			$this->push($rs['id'],'', $cont, '生日祝福');
		}
	}
}