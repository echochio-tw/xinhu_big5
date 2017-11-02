<?php
/**
*	此文件是流程模塊【userinfo.人員信息】對應接口文件。
*/ 
class mode_userinfoClassAction extends inputAction{
	
	public function companydata()
	{
		return m('company')->getselectdata(1);
	}

	protected function savebefore($table, $arr, $id, $addbo){
		$mobile = $arr['mobile'];
		$optlx	= $this->post('optlx');
		if(!c('check')->ismobile($mobile)){
			return '手機號格式有誤';
		}
		if(m('admin')->rows("`mobile`='$mobile' and `id`<>'$id'")>0){
			return '手機號['.$mobile.']已存在';
		}
		
		$notsave = 'name,deptname,ranking,email';//不保存字段
		if($id==1)$notsave.=',quitdt';
		if($optlx=='my')$notsave.=',state,workdate,syenddt,positivedt,quitdt,companyid'; //個人編輯不保存
		
		
		return array(
			'notsave' => $notsave
		);
	}
	

	protected function saveafter($table, $arr, $id, $addbo){
		
		$this->userstateafter($table, $arr, $id);
	}
	
	
	public function storeafter($table, $rows)
	{
		return array(
			'statearr' => $this->flow->statearrs,
			'isadd'    => false
		);
	}
	
	//人員狀態切換保存後處理
	public function userstateafter($table, $cans, $id)
	{
		$optlx		= $this->post('optlx');
		
		$quitdt 	= $cans['quitdt'];
		$state 		= array($cans,'state');
		$workdate 	= $cans['workdate'];
		$uarr		= array();
		
		if($optlx!='my'){
			$uarr['workdate'] 	= $workdate;
			$uarr['quitdt'] 	= $quitdt;
			if(!isempt($quitdt) || $state=='5')$uarr['status']='0';//離職狀態
		}
		if(isset($cans['tel']))$uarr['tel'] = $cans['tel'];
		if(isset($cans['mobile']))$uarr['mobile'] = $cans['mobile'];
		if($id==1){
			unset($uarr['status']);
			unset($uarr['quitdt']);
		}
		
		if($uarr)m('admin')->update($uarr, $id);
	}
}	
			