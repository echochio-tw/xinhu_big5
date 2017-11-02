<?php
class mode_emailmClassAction extends inputAction{
	

	protected function savebefore($table, $arr, $id, $addbo){
		$barr['sendid'] 	= $this->adminid;
		$barr['sendname'] 	= $this->adminname;
		$barr['senddt'] 	= $this->now;
		$isfile				= 0;
		if($this->post('fileid') != '')$isfile = '1';
		$barr['isfile']		= $isfile;
		$type 				= (int)$arr['type'];
		//外發
		if($type==1 && $arr['isturn']==1){
			$vsl = $this->option->getval('email_recexin_'.$this->adminid.'');
			if(isempt($vsl))return '未成功收信過，不能外發郵件';
		}
		if($type == 1){
			$urs = m('admin')->getone($this->adminid, 'id,name,email');
			$barr['sendname'] = ''.$urs['name'].'('.$urs['email'].')';
		}
		return array('rows'=>$barr);
	}
	
	
	protected function saveafter($table, $arr, $id, $addbo)
	{
		$isturn = (int)$arr['isturn'];
		$type 	= (int)$arr['type'];
		if($isturn==1){
			if($type==0){
				$this->flow->savesubmid($arr['receid'], $id, 0,0);
				$this->flow->savesubmid($arr['ccid'], $id, 1,0);
			}
			$this->flow->savesubmid($arr['sendid'], $id, 2,1);
			//外發發郵件的
			if($type == 1){
				$emsa = $this->getrecename($arr['receid']);
				if($emsa != ''){
					$ccsa 	= $this->getrecename($arr['ccid']);
					$fjar 	= m('file')->getfilepath('emailm', $id);
					m('email')->sendemailout($this->adminid, array(
						'title' 	=> $arr['title'],
						'body' 		=> $arr['content'],
						'receemail' => $emsa[0],
						'recename' 	=> $emsa[1],
						'ccemail' 	=> $ccsa[0],
						'ccname' 	=> $ccsa[1],
						'attachpath'=> $fjar[0],
						'attachname'=> $fjar[1],
					), 1);//自己發送，不異步
				}
			}
		}
	}
	
	private function getrecename($sid)
	{
		$sem 	= $scn = '';
		if(!isempt($sid)){
			$rows 	= m('vcard')->getall("`id` in($sid)");
			foreach($rows as $k=>$rs){
				$sem.=','.$rs['email'].'';
				$scn.=','.$rs['name'].'';
			}
		}
		if($sem!=''){
			$sem = substr($sem, 1);
			$scn = substr($scn, 1);
		}
		return array($sem, $scn);
	}
	
	
	//郵件回復的
	public function emailhuifuAjax()
	{
		$mid 	= (int)$this->post('mid');
		$cont 	= $this->post('cont');
		$flow 	= m('flow')->initflow('emailm', $mid);
		echo $flow->huifu($cont);
	}
	
	//獲取個人通訊錄上聯系人，外發發郵件的
	public function getvcardAjax()
	{
		$row = $this->getvcard();
		$this->returnjson($row);
	}
	
	public function getvcard()
	{
		$rows = m('vcard')->getall("uid='$this->adminid' and `email` is not null",'id,name,email','sort,optdt desc');
		$row  = array();
		foreach($rows as $k=>$rs){
			$row[] = array(
				'value' => $rs['id'],
				'name' => ''.$rs['name'].'('.$rs['email'].')',
			);
		}
		return $row;
	}
	
	public function getzfcontAjax()
	{
		$zfid 	= (int)$this->get('zfid');
		$rs 	= m('emailm')->getone($zfid,'title,content');
		$zffes	= m('file')->copyfile('emailm', $zfid); //轉發附件
		$rs['filers'] = $zffes;
		$this->returnjson($rs);
	}
}	
			