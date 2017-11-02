<?php
class adminClassModel extends Model
{
	private $_getjoinstr = array();
	
	public function gjoin($joinid, $glx='', $blx='bxl')
	{
		$uid 	= $did = $gid = '0';
		if($glx=='')$glx = 'ud';
		if(isempt($joinid))return '';
		$joinid 	= strtolower($joinid);
		if(contain($joinid, 'all'))return 'all';
		$narr 	= explode(',', $joinid);
		$dwhe	= array();
		foreach($narr as $sid){
			$lx 	= substr($sid, 0, 1);
			$ssid 	= str_replace(array('u','d','g'), array('','',''), $sid);
			if($lx == 'd' || $glx=='d'){
				$did.=','.$ssid.'';
				$dwhe[] = "instr(`deptpath`, '[$ssid]')>0";
			}else if($lx=='g'){
				$gid.=','.$ssid.'';
			}else{
				$uid.=','.$ssid.'';
			}
		}
		$where = '';
		if($gid!='0'){
			$uids = $this->getgrouptouid($gid);
			if($uids!='')$uid.=','.$uids.'';
		}
		if($did != '0'){
			$where = join(' or ', $dwhe);
			if($uid!='0')$where.=" or `id` in($uid)";
		}else{
			if($uid!='0')$where ="`id` in($uid)";
		}
		if($blx == 'where')return $where;
		$guid = '';
		if($where!=''){
			$rows = $this->getall("`status`=1 and ($where)", '`id`');
			foreach($rows as $k=>$rs)$guid.=','.$rs['id'].'';
			if($guid !='')$guid = substr($guid, 1);
		}
		return $guid;
	}
	
	/**
	*	根據組部門id獲取底下人員ID
	*/
	public function gjoins($receid)
	{
		if(contain($receid,'u') || contain($receid, 'd') || contain($receid, 'g'))$receid = $this->gjoin($receid);
		return $receid;
	}
	
	/**
	*	根據組獲取底下人員Id
	*/
	public function getgrouptouid($gid)
	{
		if(isempt($gid))return '';
		$where 	= "1=1 and ((`type`='gu' and `mid` in($gid)) or (`type`='ug' and `sid` in($gid)))";
		$rows  	= $this->db->getall("select `type`,`mid`,`sid` from `[Q]sjoin` where $where");
		$uids 	= '';
		foreach($rows as $k=>$rs){
			if($rs['type']=='gu')$uids.=','.$rs['sid'].'';
			if($rs['type']=='ug')$uids.=','.$rs['mid'].'';
		}
		if($uids!='')$uids= substr($uids, 1);
		return $uids;
	}
	
	/**
		判斷某個id是不是在裡面
	*/
	public function containjoin($joinid, $myid=0, $glx='ud')
	{
		$bo 	= false;
		$wh 	= $this->gjoin($joinid, $glx, 'where');
		if($wh == 'all')$bo = true;
		if(!$bo && $wh != ''){
			if($this->rows("`id`='$myid' and ($wh)")>0)$bo = true;
		}
		return $bo;
	}
	
	public function getjoinstr($fids, $us, $lx=0, $slx=0)
	{
		$s 		= '';
		if(is_numeric($us)){
			$key= 'a'.$fids.''.$us.'_'.$lx.'_'.$slx.'';
			if(isset($this->_getjoinstr[$key]))return $this->_getjoinstr[$key];
			$us	= $this->getone($us,'id,`name`,`deptid`,`deptpath`');
		}
		if(!$us)return '';
		$uid	= $us['id'];
		$key 	= 'a'.$fids.''.$uid.'_'.$lx.'_'.$slx.'';
		if(isset($this->_getjoinstr[$key]))return $this->_getjoinstr[$key];
		if($slx==0)$tj[]	= "ifnull($fids,'')=''";
		$tj[]	= $this->rock->dbinstr($fids, 'all');
		$tj[]	= $this->rock->dbinstr($fids, 'u'.$uid);
		if($us){
			$dep = explode(',', $us['deptpath']);
			foreach($dep as $deps){
				$_deps 	= str_replace(array('[',']'), array('',''), $deps);
				$tj[]	= $this->rock->dbinstr($fids, 'd'.$_deps);
			}
		}
		$s	= join(' or ', $tj);
		if($s != '' && $lx==0)$s = ' and ('.$s.')';
		$this->_getjoinstr[$key] = $s;
		return $s;
	}
	
	/**
	*	獲取對應部門負責人
	*/
	public function getdeptheadman($id, $lx=0)
	{
		$drs 	= $this->db->getone('[Q]dept','id='.$id.'');
		if(!$drs)return false;
		$cuid 	= $drs['headid'];
		$name 	= $drs['headman'];
		if(isempt($cuid)){
			if($lx==0){
				$lbar = $this->getdeptheadman($drs['pid'], 1);
				if($lbar){
					$cuid 	= $lbar[0];
					$name 	= $lbar[1];
				}
			}
		}
		if(isempt($cuid))return false;
		return array($cuid, $name);
	}
	
	/**
	*	獲取某個人的上級主管或者領導
	*	返回 array(id,$name)
	*/
	public function getsuperman($uid)
	{
		$b 		= array();
		$urs 	= $this->getone($uid,'`superid`,`superman`,`deptid`');
		if(!$urs)return $b;
		$cuid 	= $urs['superid'];
		$name 	= $urs['superman'];
		if(isempt($cuid)){
			$deptid  = (int)$urs['deptid'];
			if($deptid > 0){
				$drs = $this->getdeptheadman($deptid);
				if($drs){
					$cuid = $drs[0];
					$name = $drs[1];
				}
			}
		}
		if(!isempt($cuid)){
			$b = array($cuid, $name);
		}
		return $b;
	}
	
	public function getjoinstrs($fids, $us, $slx=0, $lx=0)
	{
		return $this->getjoinstr($fids, $us, $lx, $slx);
	}
	
	/**
		獲取人員上級主管id
	*/
	public function getup($uid)
	{
		$one 	= $this->getone($uid, 'superid,deptid');
		$rows 	= $this->getpath($one['deptid'], $one['superid']);
		$s		= $rows['superpath'];
		$s		= str_replace('[', '', $s);
		$s		= str_replace(']', '', $s);
		return $s;
	}
	
	public function getpath($did, $sup,$dids='')
	{
		$deptpath 	= $this->db->getpval('[Q]dept', 'pid', 'id', $did, '],[');
		$deptallname= $this->db->getpval('[Q]dept', 'pid', 'name', $did, '/');
		$deptname	= $this->db->getmou('[Q]dept', 'name', "`id`='$did'");
		$supername	= '';
		
		$superpath	= '';
		if(!$this->rock->isempt($sup)){
			$sua = explode(',', $sup);
			foreach($sua as $suas){
				$sss1 	= $this->db->getpval('[Q]admin', 'superid', 'id' ,$suas, '],[');
				if($sss1 != '')$superpath.=',['.$sss1.']';
				$sss2	= $this->db->getmou('[Q]admin', 'name', "`id`='$suas'");
				if(!$this->rock->isempt($sss2))$supername.=','.$sss2;
			}
			if($superpath!='')$superpath=substr($superpath,1);
			if($supername!='')$supername=substr($supername,1);
		}
		//部門路徑
		if(!isempt($deptpath))$deptpath	= $this->rock->strformat('[?0]', $deptpath);
		//有多部門
		if(!isempt($dids)){
			$didsa = explode(',', $dids);
			foreach($didsa as $dids1){
				$desss 	= $this->db->getpval('[Q]dept', 'pid', 'id', $dids1, '],[');
				if(isempt($desss))continue;
				$desssa	= explode(',', $this->rock->strformat('[?0]', $desss));
				foreach($desssa as $desssa1){
					if(!contain($deptpath, $desssa1))$deptpath.=','.$desssa1.'';
				}
			}
		}
		if(!isempt($deptpath) && substr($deptpath,0,1)==',')$deptpath = substr($deptpath,1);
		
		$rows['deptpath'] 	= $deptpath; 
		$rows['superpath'] 	= $superpath;
		$rows['deptname'] 	= $deptname;
		$rows['superman'] 	= $supername;
		$rows['deptallname']= $deptallname;
		
		return $rows;
	}
	
	/**
	*	獲取下級人員id
	*	$lx 0 全部下級，1直屬下級
	*	return 所有人員ID
	*/
	public function getdown($uid, $lx=0)
	{
		$where = $this->getdowns($uid, $lx);
		$rows = $this->getall($where, 'id');
		$s	  = '';
		foreach($rows as $k=>$rs)$s.=','.$rs['id'];
		if($s != '')$s = substr($s, 1);
		return $s;
	}
	
	/**
	*	獲取下級人員id
	*	$lx 0 全部下級，1直屬下級
	*	return 字符串條件
	*/
	public function getdowns($uid, $lx=0)
	{
		$where = "instr(superpath,'[$uid]')>0";
		if($lx==1)$where=$this->rock->dbinstr('superid', $uid);
		return $where;
	}
	
	/**
	*	獲取下屬人員Id條件記錄,如我下屬任務
	*	返回如( distid in(1) or uid in(2) )
	*/
	public function getdownwhere($fid, $uid, $lx=0)
	{
		$bstr = $this->getdown($uid, $lx);
		$where= '1=2';
		if($bstr=='')return $where;
		$bas  = explode(',', $bstr);
		$barr = array();
		foreach($bas as $bid){
			$barr[] = ''.$fid.' in('.$bid.')';
		}
		$where = join(' or ', $barr);
		$where = '('.$where.')';
		return $where;
	}
	
	//返回我下屬字符串條件如： instr(',1,2,3,', 字段)>0;
	public function getdownwheres($fid, $uid, $lx=0)
	{
		$bstr = $this->getdown($uid, $lx);
		$where= '1=2';
		if($bstr=='')return $where;
		$bstr = ','.$bstr.',';
		$where= "instr('$bstr', concat(',',$fid,','))>0";
		return $where;
	}
	
	
	
	
	/**
	*	獲取用戶信息(部門，單位，職位等)
	*/
	public function getinfor($uid)
	{
		$unitname 	= $deptname = $ranking = '';
		$name	= '';
		$face	= '';
		$deptid	= '';
		$rs		= $this->getone($uid, 'name,deptname,deptid,ranking,face');
		if($rs){
			$deptname 	= $rs['deptname'];
			$ranking 	= $rs['ranking'];
			$name 		= $rs['name'];
			$deptid 	= $rs['deptid'];
			$face 		= $this->getface($rs['face']);
			if(!$this->isempt($deptid))$unitname = $this->db->getpval('[Q]dept','pid','name', $deptid);
		}
		return array(
			'unitname' => $unitname,
			'deptname' => $deptname,
			'name' 		=> $name,
			'ranking' 	=> $ranking,
			'face' 		=> $face,
			'deptid' 	=> $deptid
		);
	}
	
	/*
		獲取在線的人員Id
	*/
	public function getonline($receid, $lx=10)
	{
		$uarr 		= $this->getonlines('reim,pc', $receid, $lx);
		$jonus		= join(',', $uarr);
		return $jonus;
	}
	
	//獲取對應類型在線人員
	public function getonlines($type, $teuid='all', $lx=11, $where='')
	{
		$arrs 	= array();
		$dts 	= c('date')->adddate($this->rock->now, 'i', 0-$lx);
		$wheres		= '';
		if($teuid != 'all' && $teuid!=''){
			if($this->contain($teuid,'u') || $this->contain($teuid,'d')){
				$teuid = $this->gjoin($teuid);
				if($teuid=='')return $arrs;
			}
			$wheres=" and `uid` in($teuid)";
		}
		if($lx>0){
			$wheres .= " and `moddt`>'$dts'";
		}
		$sql 	= "select `uid` from `[Q]logintoken` where instr(',".$type.",', concat(',',`cfrom`, ','))>0 and `online`=1 $wheres $where group by `uid`";
		
		$rows   = $this->db->getall($sql);
		foreach($rows as $k=>$rs){
			$arrs[] = $rs['uid'];
		}
		return $arrs;
	}
	
	public function getface($face, $mr='')
	{
		if($mr=='')$mr 	= 'images/noface.png';
		if(substr($face,0,4)!='http' && !$this->isempt($face))$face = URL.''.$face.'';
		$face 			= $this->rock->repempt($face, $mr);
		return $face;
	}
	
	/**
	*	獲取人員信息
	*/
	public function getuserinfo($uids='0')
	{
		$uarr = $this->getall("`id` in(".$uids.") and `status`=1",'`id`,`name`,`face`','`sort`');
		foreach($uarr as $k=>$rs){
			$uarr[$k]['face'] = $this->getface($rs['face']);
		}
		return $uarr;
	}
	
	/**
	*	獲取人員數據
	*/
	public function getuser($lx=0)
	{
		$uid  	= $this->adminid;
		$where	= m('view')->viewwhere('user', $uid, 'id');
		$range 	= $this->rock->get('changerange'); //指定了人
		$where1 = '';
		if(!isempt($range)){
			$where1 = $this->gjoin($range, '', 'where');
			$where1 = 'and ('.$where1.')';
		}
		$fields = '`id`,`name`,`deptid`,`deptname`,`deptpath`,`deptallname`,`mobile`,`ranking`,`tel`,`face`,`sex`,`email`,`pingyin`';
		//讀取我可查看權限
		$rows = $this->getall("`status`=1 and ((1 $where) or (`id`='$uid')) $where1",$fields,'`sort`,`name`');
		$py   = c('pingyin');
		foreach($rows as $k=>$rs){
			$rows[$k]['face'] = $rs['face'] = $this->getface($rs['face']);
			if($lx==1){
				if(isempt($rs['pingyin'])){
					$rows[$k]['pingyin'] = $rs['pingyin'] = $py->get($rs['name'],1);
				}
			}
			foreach($rs as $k1=>$v1)if($v1==null)$rows[$k][$k1]='';
		}
		return $rows;
	}
	
	public function getadmininfor($rows, $suids, $fid='checkid')
	{
		$farr	= $this->db->getarr('[Q]admin', "`id` in($suids)",'`face`,`name`');
		foreach($rows as $k=>$rs){
			$face =  $name = '';
			if(isset($farr[$rs[$fid]])){
				$face = $farr[$rs[$fid]]['face'];
				$name = $farr[$rs[$fid]]['name'];
				$rows[$k]['name'] = $name;
			}	
			$rows[$k]['face'] = $this->getface($face);
		}
		return $rows;
	}
	
	public function getusinfo($uid, $fields='id')
	{
		$urs = $this->db->getone('[Q]userinfo', $uid, $fields);
		if(!$urs){
			$urs = array();
			$far = explode(',', str_replace('`','',$fields));
			foreach($far as $f)$urs[$f]='';
			$urs['id'] = $uid;
		}
		return $urs;
	}
	
	
	
	
	public function getidtouser($id)
	{
		return $this->getmou('user', "`id`='$id'");
	}
	
	
	
	
	/**
	*	更新信息
	*/
	public function updateinfo($where='')
	{
		$rows	= $this->db->getall("select id,name,deptid,superid,deptpath,superpath,deptname,deptallname,superman,deptids from `[Q]admin` a where id>0 $where order by `sort`");
		$total	= $this->db->count;
		$cl		= 0;
		foreach($rows as $k=>$rs){
			$nrs	= $this->getpath($rs['deptid'], $rs['superid'], $rs['deptids']);
			if($nrs['deptpath'] != $rs['deptpath'] || $nrs['deptname'] != $rs['deptname'] || $nrs['superpath'] != $rs['superpath'] || $nrs['superman'] != $rs['superman'] || $nrs['deptallname'] != $rs['deptallname']){
				$this->record($nrs, "`id`='".$rs['id']."'");
				$cl++;
			}
		}
		$this->updateuserinfo($where);
		
		//更新單據上flow_bill上的uname,udeptname
		m('flowbill')->updatebill();
		m('imgroup')->updategall(); //更新會話上
		
		return array($total, $cl);
	}
	public function updateuserinfo($whe='')
	{
		$db 	= m('userinfo');
		$rows	= $this->db->getall('select a.name,a.deptname,a.id,a.status,a.ranking,b.id as ids,a.sex,a.tel,a.mobile,a.email,a.workdate,a.quitdt,a.num,a.companyid,a.deptnames,a.rankings from `[Q]admin` a left join `[Q]userinfo` b on a.id=b.id where a.id>0 '.$whe.' ');
		foreach($rows as $k=>$rs){
			$uparr = array(
				'id' 		=> $rs['id'],
				'name' 		=> $rs['name'],
				'deptname' 	=> $rs['deptname'],
				'deptnames' => $rs['deptnames'],
				'ranking' 	=> $rs['ranking'],
				'rankings' 	=> $rs['rankings'],
				'sex' 		=> $rs['sex'],
				'tel' 		=> $rs['tel'],
				'mobile' 	=> $rs['mobile'],
				'email' 	=> $rs['email'],
				'workdate' 	=> $rs['workdate'],
				'quitdt' 	=> $rs['quitdt'],
				'num' 		=> $rs['num'],
				'companyid' => $rs['companyid'],
			);
			if(isempt($rs['ids'])){
				$db->insert($uparr);
			}else{
				unset($uparr['id']);
				$db->update($uparr, $rs['ids']);
			}
		}
	}
	
	//返回這個月份人員
	public function monthuwhere($month, $qz='')
	{
		$month	= substr($month, 0, 7);
		$start	= ''.$month.'-01';
		$enddt	= c('date')->getenddt($month);
		$s 		= $this->monthuwheres($start, $enddt, $qz);
		return $s;
	}
	public function monthuwheres($start, $enddt, $qz='')
	{
		$s 		= " and ($qz`quitdt` is null or $qz`quitdt`>='$start') and ($qz`workdate` is null or $qz`workdate`<='$enddt')";
		return $s;
	}
	
	public function changeface($uid, $fid)
	{
		$frs 	= m('file')->getone($fid);
		if(!$frs)return false;
		$path 	= $frs['thumbpath'];
		if(isempt($path))$path = $frs['filepath'];
		$face	= $path;
		if(file_exists($path)){
			$face = ''.UPDIR.'/face/'.$uid.'_'.rand(1000,9999).'.jpg';
			$this->rock->createdir($face);
			c('image')->conver($path, $face);
			$oface  = $this->getmou('face', $uid);
			if(!isempt($oface) && file_exists($oface))@unlink($oface);//刪除原來頭像
			$this->update("face='$face'", $uid);
		}
		m('file')->delfile($fid);
		if(!file_exists($face))$face='';
		return $face;
	}
	
	//根據郵箱獲取人員姓名
	private $emailtoursarr = array();
	public function emailtours($email)
	{
		$key  = 'rock'.$email.'';
		if(!isset($this->emailtoursarr[$key])){
			$urs 	= $this->getone("`email`='$email'",'`id`,`name`');
			$this->emailtoursarr[$key] = $urs;
		}else{
			$urs	= $this->emailtoursarr[$key];
		}
		return $urs;
	}
	
	/**
	*	關鍵詞搜索的
	*/
	public function getkeywhere($key, $qz='', $ots='')
	{
		$where = " and ($qz`name` like '%$key%' or $qz`user` like '%$key%' or $qz`deptallname` like '%$key%' or $qz`ranking` like '%$key%' or $qz`pingyin` like '$key%' $ots)";
		return $where;
	}
	
	/**
	*	根據receid獲取對應字段$fid聚合得到多個,分開的
	*/
	public function getjoinfields($receid, $fid)
	{
		if(!is_numeric($receid)){
			$receid = $this->gjoin($receid,'ud', 'where'); //讀取
			$where 	= '1=1';
			if($receid != 'all')$where = $receid;
			if(isempt($receid))$where = '1=2';
		}else{
			$where = 'id='.$receid.'';
		}
		$rows = $this->getall("`status`=1 and ($where)", '`id`,`'.$fid.'`');
		$strs = '';
		foreach($rows as $k=>$rs){
			if(!isempt($rs[$fid]))$strs.=','.$rs[$fid].'';
		}
		if($strs!='')$strs = substr($strs, 1);
		
		return $strs;
	}
}