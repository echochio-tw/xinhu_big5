<?php
class sysClassAction extends runtAction
{
	//數據備份
	public function beifenAction()
	{
		m('beifen')->start();
		$this->todoarr	= array(
			'title' 	=> '數據庫備份',
			'cont' 		=> '數據庫在['.$this->now.']備份了。',
		);
		echo 'success';
	}
	public function upgtxAction()
	{
		$xinhu	= c('xinhu');
		$db 	= m('chargems');
		$lastdt	= strtotime($this->runrs['lastdt']);
		$barr	= $xinhu->getdata('modeupg', array('lastdt'=>$lastdt));
		if($barr['code']!=200)exit($barr['msg']);
		$str 	= '';
		foreach($barr['data'] as $k=>$rs){
			$id = $rs['id'];
			$na = $rs['name'];
			$state  = 0;
			$ors 	= $db->getone("`type`=0 and `mid`='$id'");
			if($ors){
				$state = 1;
				if($rs['updatedt']>$ors['updatedt'])$state=2;
			}
			if($state==0)$str.='模塊['.$na.']可安裝;';
			if($state==2)$str.='模塊['.$na.']可<font color=red>升級</font>;';
		}
		if($str!=''){
			$this->todoarr	= array(
				'title' 	=> '安裝升級',
				'cont' 		=> $str.'請到[系統→系統工具→系統升級]下處理',
			);
		}
		echo 'success';
	}
	
	
	//數據更新,更新用戶的
	public function dataupAction()
	{
		m('admin')->updateinfo();
		$reim 	= m('reim');
		if($reim->installwx(0))m('weixin:user')->getuserlist();
		if($reim->installwx(1))m('weixinqy:user')->getuserlist();
		echo 'success';
	}
}