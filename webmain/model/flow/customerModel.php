<?php
class flow_customerClassModel extends flowModel
{
	public function initModel()
	{
		$this->statearr		 = c('array')->strtoarray('停用|#888888,啟用|green');
		$this->statarr		 = c('array')->strtoarray('否|#888888,是|#ff6600');
	}
	

	
	public function flowrsreplace($rs, $lx=0)
	{
		if(isset($rs['status'])){
			if($rs['status']==0)$rs['ishui'] = 1;
			$zt 	= $this->statearr[$rs['status']];
			$rs['statuss']	= $rs['status'];
			$rs['status']	= '<font color="'.$zt[1].'">'.$zt[0].'</font>';
		}
		
		if(isset($rs['isstat'])){
			$stat 	= $this->statarr[$rs['isstat']];
			$rs['isstat']	= '<font color="'.$stat[1].'">'.$stat[0].'</font>';
		}
		
		if(isset($rs['isgys'])){
			$gys 	= $this->statarr[$rs['isgys']];
			$rs['isgys']	= '<font color="'.$gys[1].'">'.$gys[0].'</font>';
		}
		if($this->rock->arrvalue($rs,'htshu','0')==0)$rs['htshu']='';
		if($this->rock->arrvalue($rs,'moneyz','0')==0)$rs['moneyz']='';
		if($this->rock->arrvalue($rs,'moneyd','0')==0)$rs['moneyd']='';
		
		if($lx==1){
			$rs['suoname'] = $this->adminmodel->getmou('name','id='.$rs['uid'].'');
		}
		
		return $rs;
	}
	
	
	
	//是否有查看權限
	protected function flowisreadqx()
	{
		$bo = false;
		$shateid = ','.$this->rs['shateid'].',';
		if(contain($shateid,','.$this->adminid.','))$bo=true;
		return $bo;
	}
	
	protected function flowgetfields_qiyong($lx)
	{
		$arr = array();
		if($this->uid==$this->adminid){
			$arr['mobile'] 		= '手機號';
			$arr['tel'] 		= '電話';
			$arr['email'] 		= '郵箱';
			$arr['routeline'] 	= '交通路線';
		}
		return $arr;
	}

	
	protected function flowoptmenu($ors, $crs)
	{
		$zt  = $ors['statusvalue'];
		$num = $ors['num'];
		if($num=='ztqh'){
			$this->update('`status`='.$zt.'', $this->id);
		}
		
		//共享
		if($num=='shate'){
			$cname 	 = $crs['cname'];
			$cnameid = $crs['cnameid'];
			$this->update(array(
				'shateid' 	=> $cnameid,
				'shate' 	=> $cname,
			), $this->id);
			$this->push($cnameid, '客戶管理', ''.$this->adminname.'將一個客戶【{name}】共享給你');
		}
		
		//取消共享
		if($num=='unshate'){
			$this->update(array(
				'shateid' 	=> '',
				'shate' 	=> '',
			), $this->id);
		}	
	}
	
	protected function flowbillwhere($uid, $lx)
	{
		return array(
			'order' => 'a.status desc,a.optdt desc',
			'table'	=> '`[Q]'.$this->mtable.'` a left join `[Q]admin` b on a.`uid`=b.id',
			'asqom' => 'a.',
			'fields'=> 'a.*,b.name as suoname'
		);
	}
	
	
	//導入數據的測試顯示
	public function flowdaorutestdata()
	{
		$barr = array(
			'name' 		=> '信呼',
			'type' 		=> '軟件',
			'laiyuan' 		=> '網上開拓',
			'unitname' 		=> '廈門信呼科技有限公司',
			'tel' 		=> '0592-123456',
			'mobile' 		=> '15800000000',
			'email' 		=> 'admin@rockoa.com',
			'address' 		=> '福建廈門思明區軟件園',
			'linkname' 		=> '磐石',
		);
		$barr1 = array(
			'name' 		=> '百度',
			'type' 		=> '搜索計算',
			'laiyuan' 		=> '電話聯系',
			'unitname' 		=> '百度在線網絡技術(北京)有限公司',
			'tel' 		=> '010-123456',
			'mobile' 		=> '15800000001',
			'email' 		=> 'admin@baidu.com',
			'address' 		=> '北京軟件園百度大廈',
			'linkname' 		=> '李彥宏',
		);
		$barr2 = array(
			'name' 		=> '陳先生',
			'type' 		=> '個人',
			'laiyuan' 		=> '電話聯系',
			'unitname' 		=> '',
			'tel' 		=> '010-123456',
			'mobile' 		=> '15800000002',
			'email' 		=> '1111@qq.com',
			'address' 		=> '福建廈門火車站',
			'linkname' 		=> '',
		);
		return array($barr,$barr1,$barr2);
	}

}