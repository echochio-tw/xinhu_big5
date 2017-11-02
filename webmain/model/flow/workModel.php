<?php
class flow_workClassModel extends flowModel
{

	public function initModel()
	{
		$this->statearr		 = c('array')->strtoarray('待執行|blue,已完成|green,執行中|#ff6600,終止|#888888,驗證未通過|#9D4FF7');
	}
	
	//自定義審核人讀取
	protected function flowcheckname($num){
		$sid = '';
		$sna = '';
		if($num=='run'){
			$sid = $this->rs['distid'];
			$sna = $this->rs['dist'];
		}
		return array($sid, $sna);
	}
	
	//轉辦時要更新對應的執行人員
	protected function flowcheckbefore(){
		$up = array();
		if($this->checkiszhuanyi==1){
			$up['dist'] 	= $this->rs['zb_name'];
			$up['distid'] 	= $this->rs['zb_nameid'];
			$up['status'] 	= 3; //待執行狀態
		}
		if($up)$up['update'] = $up;
		return $up;
	}
	
	public function flowrsreplace($rs, $slx=0){
		
		$zts 		= $rs['status'];
		$str 		= $this->getstatus($rs,'','',1);
		if($slx>=1){
			$projectid 	= (int)$rs['projectid'];
			$rs['projectid'] = '';
			if($projectid>0){
				$prs 		= $this->db->getone('[Q]project', $projectid);
				if($prs){
					$rs['projectid']=''.$prs['title'].'('.$prs['progress'].'%)';
				}
			}
		}
		if(!isempt($rs['enddt']) && $zts!=1){
			if(strtotime($rs['enddt'])<time())$str.='<font color=red>(已超期)</font>';
		}
		$rs['status']= $str;
		if($rs['score']==0)$rs['score']='';
		if($rs['mark']==0)$rs['mark']='';
		return $rs;
	}
	
	protected function flowchangedata(){
		$this->rs['stateid'] = $this->rs['state'];
	}
	
	
	protected function flowdatalog($arr)
	{
		$isaddlog	= 0;
		$uid 		= $this->adminid;
		$ispingfen	= 0;
		$distid 	= ','.$this->rs['distid'].',';
		$zt 		= $this->rs['stateid'];
		if($this->contain($distid, ','.$this->adminid.',') && ($zt==0||$zt==2)){
			$isaddlog = 1;
		}
		
		$arr['isaddlog'] = $isaddlog; //是否可以添加日志記錄
		$arr['state'] 	 = $this->rs['stateid'];
		
		//判斷是否可以督導評分
		$where  = $this->ddwhere($uid);
		if($this->rows("`id`='$this->id' and `status`=1 and `mark`=0 $where")==1){
			$ispingfen		= 1;
		}
		$arr['ispingfen'] 	= $ispingfen; //是否可以評分
		$arr['score'] 		= $this->rs['score'];
		return $arr;
	}
	
	protected function flowsubmit($na, $sm)
	{
		//$this->push($this->rs['distid'], '', '[{type}]{title}');//提交給對應人提醒
		$this->push($this->rs['ddid'], '', '{optname}提交任務[{type}.{title}]分配給:{dist}，需要你督導','任務督導');//提醒給督導人員
		
		$zt  = 0;
		if(!isempt($this->rs['distid']))$zt = 3;//待執行的狀態值
		$this->updatestatus($zt);
		
	}
	
	protected function flowaddlog($a)
	{
		//提交報告時發送給創建人和督導人員
		if($a['name']=='進度報告'){
			$state 	= $a['status'];
			$arr['state'] = $state;
			$cont = ''.$this->adminname.'添加[{type}.{title}]的任務進度,說明:'.$a['explain'].'';
			if($state=='1')$cont='[{type}.{title}]任務'.$this->adminname.'已完成';
			$toid 	= $this->rs['optid'];
			$ddid	= $this->rs['ddid'];
			if(!isempt($ddid))$toid.=','.$ddid.'';
			$this->push($toid, '任務', $cont);
			$this->update($arr, $this->id);
		}
		if($a['name']=='指派給'){
			$cname 	 = $this->rock->post('changename');
			$cnameid = $this->rock->post('changenameid');
			$state = '0';
			$arr['state'] 	= $state;
			$arr['distid'] 	= $cnameid;
			$arr['dist'] 	= $cname;
			$this->update($arr, $this->id);
			$this->push($cnameid, '任務', ''.$this->adminname.'指派任務[{type}.{title}]給你');
		}
		if($a['name'] == '任務評分'){
			$fenshu	 = (int)$this->rock->post('fenshu','0');
			$this->push($this->rs['distid'], '任務', ''.$this->adminname.'評分[{type}.{title}],分數('.$fenshu.')','任務評分');
			$this->update(array(
				'mark' => $fenshu
			), $this->id);
		}
	}
	
	private function ddwhere($uid)
	{
		$downid = m('admin')->getdown($uid, 1);
		$where  = 'and `ddid`='.$uid.'';
		if($downid!='')$where  = 'and (('.$uid.' in(`ddid`)) or (ifnull(`ddid`,\'0\')=\'0\' and `distid` in('.$downid.')) or (ifnull(`ddid`,\'0\')=\'0\' and `optid`='.$uid.'))';
		return $where;
	}
	
	protected function flowbillwhere($uid, $lx)
	{
		$where		= '';
		$projcetid 	= (int)$this->rock->post('projcetid');
		if($projcetid>0)$where='and `projectid`='.$projcetid.'';
		
		return array(
			'keywhere' => $where,
			'order' => '`optdt` desc'
		);
	}
	
	/**
	*	提醒快過期的任務
	*	$txsj 提前幾天提醒
	*/
	public function tododay($txsj = 1)
	{
		$dtobj= c('date');
		$dt   = $this->rock->date;
		$rows = $this->getrows("`status`=1 and `state` in(0,2) and ifnull(`distid`,'')<>'' and `enddt`>='$dt'");
		$arr  = array();
		foreach($rows as $k=>$rs){
			$jg = $dtobj->datediff('d', $this->rock->date, $rs['enddt']);
			if($jg <= $txsj){
				$dista = explode(',', $rs['distid']);
				foreach($dista as $distid){
					if(!isset($arr[$distid]))$arr[$distid] = array();
					$tis = ''.$jg.'天後截止';
					if($jg == 0)$tis = '需今日完成';
					$arr[$distid][]= '['.$rs['type'].']'.$rs['title'].'('.$tis.');';
				}
			}
		}
		foreach($arr as $uid => $strarr){
			$this->flowweixinarr['url'] = $this->getwxurl();//設置微信提醒的詳情鏈接
			$str = '';
			foreach($strarr as $k=>$str1){
				if($k>0)$str.="\n";
				$str.="".($k+1).".$str1";
			}
			if($str != '')$this->push($uid, '', $str, '任務到期提醒');
		}
	}
}