<?php 
class userClassAction extends apiAction
{
	public function editpassAction()
	{
		if(getconfig('systype')=='demo')$this->showreturn('演示上不要修改');
		$id			= $this->adminid;
		$oldpass	= $this->post('passoldPost');
		$pasword	= $this->post('passwordPost');
		$msg		= '';
		if($this->isempt($pasword))$msg ='新密碼不能為空';
		if($msg == ''){
			$oldpassa	= $this->db->getmou($this->T('admin'),"`pass`","`id`='$id'");
			if($oldpassa != md5($oldpass))$msg ='舊密碼不正確';
			if($msg==''){
				if($oldpassa == md5($pasword))$msg ='新舊密碼不能相同';
			}
		}
		if($msg == ''){
			if(!$this->db->record($this->T('admin'), "`pass`='".md5($pasword)."'", "`id`='$id'"))$msg	= $this->db->error();
		}
		if($msg==''){
			$this->showreturn('success');
		}else{
			$this->showreturn('',$msg, 201);
		}
	}
}