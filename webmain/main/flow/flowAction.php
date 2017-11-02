<?php
class flowClassAction extends Action
{
	public function loaddataAjax()
	{
		$id		= (int)$this->get('id');
		$data	= m('flow_set')->getone($id);
		$arr 	= array(
			'data'		=> $data
		);
		echo json_encode($arr);
	}
	
	public function modeafter($table, $rows)
	{
		return array(
			'qian' => PREFIX
		);
	}
	
	public function modebefore($table)
	{
		$where 	= '';
		$key 	= $this->post('key');
		if(!isempt($key)){
			$where = "and (`type`='$key' or `name` like '%$key%' or `table` like '$key%' or `num` like '$key%' or `sericnum` like '$key%')";
		}
		return $where;
	}
	
	private function getwherelist($setid)
	{
		return m('flow_where')->getall('setid='.$setid.'','id,name','sort');
	}
	
	public function loaddatacourseAjax()
	{
		$id		= (int)$this->get('id');
		$setid	= (int)$this->get('setid');
		$data	= m('flow_course')->getone($id);
		$arr 	= array(
			'data'		=> $data,
			'wherelist' => $this->getwherelist($setid),
			'statusstr'	=> m('flow_set')->getmou('statusstr', $setid)
		);
		echo json_encode($arr);
	}
	
	public function loaddatawhereAjax()
	{
		$id		= (int)$this->get('id');
		$data	= m('flow_where')->getone($id);
		$arr 	= array(
			'data'		=> $data
		);
		echo json_encode($arr);
	}
	
	public function flowsetsavebefore($table, $cans)
	{
		$tab = $cans['table'];
		$name= $this->rock->xssrepstr($cans['name']);
		$num = strtolower($cans['num']);
		$cobj= c('check');
		if(!$cobj->iszgen($tab))return '表名格式不對';
		if($cobj->isnumber($num))return '編號不能為數字';
		if($cans['isflow']==1 && isempt($cans['sericnum'])) return '有流程必須有寫編號規則，請參考其他模塊填寫';
		$rows['num']= $this->rock->xssrepstr($num); 
		$rows['name']= $name; 
		return array(
			'rows' => $rows
		);
	}
	
	private function setsubtsta($tabs, $alltabls, $tab, $slxbo, $ssm)
	{
		if(isempt($tabs))return;
		if(!in_array(''.PREFIX.''.$tabs.'', $alltabls)){
			$sql = "CREATE TABLE `[Q]".$tabs."` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`mid` smallint(6) DEFAULT '0' COMMENT '對應主表".$tab.".id',
`sort` smallint(6) DEFAULT '0' COMMENT '排序號',
PRIMARY KEY (`id`),KEY `mid` (`mid`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;";
			$bo = $this->db->query($sql);
		}else{
			$fields = $this->db->getallfields(''.PREFIX.''.$tabs.'');
			$str 	= '';
			if(!in_array('mid', $fields))$str.=",add `mid` smallint(6) DEFAULT '0' COMMENT '對應主表".$tab.".id'";
			if(!in_array('sort', $fields))$str.=",add `sort` smallint(6) DEFAULT '0' COMMENT '排序號'";
			if($slxbo && !in_array('sslx', $fields)){
				$ssma = explode(',', $ssm);
				$ss1  = '';
				foreach($ssma as $k=>$ssmas)$ss1.=','.$k.''.$ssmas.'';
				if($ss1!='')$ss1 = substr($ss1, 1);
				$str.=",add `sslx` tinyint(1) DEFAULT '0' COMMENT '".$ss1."'";
			}
			if($str!=''){
				$sql = 'alter table `'.PREFIX.''.$tabs.'` '.substr($str,1).'';
				$this->db->query($sql);
			}
		}
	}
	
	public function flowsetsaveafter($table, $cans)
	{
		$isflow = $cans['isflow'];
		$tab  	= $cans['table'];
		$tabs  	= $cans['tables'];
		$alltabls = array();
		//創建保存多行子表
		if(!isempt($tabs)){
			$alltabls 	= $this->db->getalltable();
			$tabsa 		= explode(',', $tabs);
			$addsts 	= array();
			foreach($tabsa as $tabsas){
				$this->setsubtsta($tabsas, $alltabls, $tab, in_array($tabsas, $addsts), $cans['names']);
				$alltabls[] = ''.PREFIX.''.$tabsas.'';
				$addsts[]	= $tabsas;
			}
		}
		
		if(isempt($tab))return;
		if(!$alltabls)$alltabls 	= $this->db->getalltable();
		if($isflow==0){
			if(!in_array(''.PREFIX.''.$tab.'', $alltabls)){
				$sql = "CREATE TABLE `[Q]".$tab."` (`id` int(11) NOT NULL AUTO_INCREMENT,PRIMARY KEY (`id`))ENGINE=MyISAM  AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;";
				$bo = $this->db->query($sql);
			}
			return;
		}
		
		if(!in_array(''.PREFIX.''.$tab.'', $alltabls)){
			$sql = "CREATE TABLE `[Q]".$tab."` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` smallint(6) DEFAULT '0',
  `optdt` datetime DEFAULT NULL COMMENT '操作時間',
  `optid`  smallint(6) DEFAULT '0',
  `optname` varchar(20) DEFAULT NULL COMMENT '操作人',
  `applydt` date DEFAULT NULL COMMENT '申請日期',
  `explain` varchar(500) DEFAULT NULL COMMENT '說明',
  `status` tinyint(1) DEFAULT '1' COMMENT '狀態',
  `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交',
  PRIMARY KEY (`id`)
) ENGINE=".getconfig('db_engine','MyISAM')." AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;";
			$bo = $this->db->query($sql);
		}else{
			$fields = $this->db->getallfields(''.PREFIX.''.$tab.'');
			$str 	= '';
			if(!in_array('uid', $fields))$str.=",add `uid` smallint(6) DEFAULT '0'";
			if(!in_array('optdt', $fields))$str.=",add `optdt` datetime DEFAULT NULL COMMENT '操作時間'";
			if(!in_array('optid', $fields))$str.=",add `optid` smallint(6) DEFAULT '0'";
			if(!in_array('optname', $fields))$str.=",add `optname` varchar(20) DEFAULT NULL COMMENT '操作人'";
			if(!in_array('applydt', $fields))$str.=",add `applydt` date DEFAULT NULL COMMENT '申請日期'";
			if(!in_array('explain', $fields))$str.=",add `explain` varchar(500) DEFAULT NULL COMMENT '說明'";
			if(!in_array('status', $fields))$str.=",add `status` tinyint(1) DEFAULT '1' COMMENT '狀態'";
			if(!in_array('isturn', $fields))$str.=",add `isturn` tinyint(1) DEFAULT '1' COMMENT '是否提交'";
			if($str!=''){
				$sql = 'alter table `'.PREFIX.''.$tab.'` '.substr($str,1).'';
				$this->db->query($sql);
			}
		}
	}
	
	public function elementafter($table, $rows)
	{
		$moders = m('flow_set')->getone($this->mid);
		
		$tass 	= $moders['table'];
		$tasss 	= $moders['tables'];
		
		$farr	= $this->db->gettablefields('[Q]'.$tass.'');
		
		$farrs[]= array('id'=>'','name'=>'↓以下主表('.$tass.')的字段');
		foreach($farr as $k=>$rs){
			$farrs[]= array('id'=>$rs['name'],'name'=>'['.$rs['name'].']'.$rs['explain'].'');
		}
		if(!isempt($tasss)){
			$tasssa = explode(',', $tasss);
			foreach($tasssa as $k=>$tasss){
				$farr	= $this->db->gettablefields('[Q]'.$tasss.'');
				$farrs[]= array('id'=>'','name'=>'↓以下第'.($k+1).'個多行子表('.$tasss.')的字段');
				foreach($farr as $k=>$rs){
					$farrs[]= array('id'=>$rs['name'],'name'=>'['.$rs['name'].']'.$rs['explain'].'');
				}
			}
		}
		
		return array(
			'flowarr'=>$this->getmodearr(),
			'moders'=>$moders,
			'fieldsarr' => $farrs,
			'fieldstypearr'=> $this->option->getdata('flowinputtype')
		);
	}
	
	public function elementbefore($table)
	{
		$mid = (int)$this->post('mid');
		$this->mid = $mid;
		return array(
			'where' => 'and `mid`='.$mid.'',
			'order'	=> 'iszb,sort,id'
		);
	}
	
	
	//單據操作菜單
	public function flowmenubefore($table)
	{
		$mid = (int)$this->post('mid');
		$this->mid = $mid;
		return 'and `setid`='.$mid.'';
	}
	
	public function flowmenuafter($table, $rows)
	{
		
		return array(
			'flowarr'=>$this->getmodearr()
		);
	}
	
	//條件where
	public function flowwhereafter($table, $rows)
	{
		return array(
			'flowarr'=> $this->getmodearr()
		);
	}
	public function flowwherebefore($table)
	{
		return array(
			'table' => '`[Q]'.$table.'` a left join `[Q]flow_set` b on a.setid=b.id',
			'fields'=> 'a.*,b.num as modenum,b.name as modename'
		);
	}
	
	//單據通知設置
	public function flowtodobefore($table)
	{
		$mid = (int)$this->post('mid');
		$this->mid = $mid;
		$where = '';
		if($mid>0)$where = 'and `setid`='.$mid.'';
		return array(
			'where' => $where,
			'table' => '`[Q]'.$table.'` a left join `[Q]flow_set` b on a.setid=b.id',
			'fields'=> 'a.*,b.name as modename'
		);
	}
	
	public function flowtodoafter($table, $rows)
	{
		$fielslist = m('flow_element')->getrows("mid='$this->mid' and iszb=0 and islu=1",'fields,name','sort');
		foreach($fielslist as &$v){
			$v['name'] = ''.$v['fields'].'.'.$v['name'].'';
		}
		
		$courselist	= m('flow_course')->getrows("setid='$this->mid' and `status`=1",'id,name','pid,sort');
		foreach($courselist as &$v1){
			$v1['name'] = ''.$v1['id'].'.'.$v1['name'].'';
		}
		$dbss = m('remind');
		foreach($rows as $k=>$rs){
			$whereid = '';
			if($rs['whereid']>'0')$whereid = $this->db->getmou('[Q]flow_where','name', $rs['whereid']);
			
			$rows[$k]['whereidstr'] = $whereid;
			
			if($rs['botask']=='1'){
				$rows[$k]['remindrs'] = $dbss->getremindrs('flow_todo', $rs['id']);
			}
		}
		
		return array(
			'flowarr'	=> $this->getmodearr(),
			'wherelist' => $this->getwherelist($this->mid),
			'fielslist' => $fielslist,
			'courselist' => $courselist,
			'rows'		=> $rows
		);
	}
	
	
	private function getmodearr()
	{
		return m('mode')->getmodearr();
	}
	
	
	
	public function inputzsAction()
	{
		$setid	= $this->get('setid');
		$atype	= (int)$this->get('atype','0');
		$rs 	= m('flow_set')->getone("`id`='$setid'");
		if(!$rs)exit('sorry!');
		$this->smartydata['rs'] = $rs;
		$atypea = array('PC端','手機端');
		$this->title  = $rs['name'].'_'.$atypea[$atype].'展示頁面設置';
		$fleftarr 	= m('flow_element')->getrows("`mid`='$setid' and `iszb`=0",'`fields`,`name`','`iszb`,`sort`');
		$modenum	= $rs['num'];
		$fleft[]= array('base_name', '申請人',0);
		$fleft[]= array('base_deptname', '申請部門',0);
		$fleft[]= array('base_sericnum', '單號',0);
		$fleft[] = array('file_content', '相關文件',0);
		$iszb 	= 0;
		foreach($fleftarr as $k=>$brs){
			$fleft[]= array($brs['fields'], $brs['name'], $iszb);
		}
		if(!isempt($rs['tables'])){
			$tablea = explode(',', $rs['tables']);
			$namesa = explode(',', $rs['names']);
			$fleft[]= array('', '<font color=#ff6600>↓多行子表</font>', 0);
			foreach($tablea as $k=>$rs1){
				$fleft[]= array('subdata'.$k.'', $namesa[$k], 0);
			}
		}
		if($rs['isflow']==1){
			$fleft[]= array('', '<font color=#ff6600>↓流程審核步驟</font>', 0);
			$rows 	= m('flow_course')->getrows('setid='.$setid.' and `status`=1','id,name','pid,sort');
			foreach($rows as $k=>$rs){
				$fleft[]= array('course'.$rs['id'].'_name', ''.$rs['name'].'處理人', 0);
				$fleft[]= array('course'.$rs['id'].'_zt', ''.$rs['name'].'處理狀態', 0);
				$fleft[]= array('course'.$rs['id'].'_dt', ''.$rs['name'].'處理時間', 0);
				$fleft[]= array('course'.$rs['id'].'_sm', ''.$rs['name'].'處理說明', 0);
			}
		}

		
		$this->smartydata['fleft'] = $fleft;
		$this->smartydata['atype'] = $atype;

		$path 		= ''.P.'/flow/page/view_'.$modenum.'_'.$atype.'.html';
		$content 	= '';
		if(file_exists($path)){
			$content = file_get_contents($path);
		}
		$this->smartydata['content'] = $content;
	}
	
	
	
	
	public function inputAction()
	{
		$setid	= $this->get('setid');
		$atype	= $this->get('atype');
		$rs 	= m('flow_set')->getone("`id`='$setid'");
		if(!$rs)exit('sorry!');
		$this->smartydata['rs'] = $rs;
		$this->title  = $rs['name'].'_錄入頁面設置';
		$fleftarr 	= m('flow_element')->getrows("`mid`='$setid'",'*','`iszb`,`sort`');
		$modenum	= $rs['num'];
		$fleft[]= array('base_name', '申請人',0);
		$fleft[]= array('base_deptname', '申請部門',0);
		$fleft[]= array('base_sericnum', '單號',0);
		$fleft[] = array('file_content', '相關文件',0);
		$iszb 	= 0;
		foreach($fleftarr as $k=>$brs){
			$bt='';
			if($brs['isbt']==1)$bt='*';
			$iszbs = $brs['iszb'];
			if($iszbs>0&&$iszb != $iszbs){
				$fleft[]= array('', '<font color=#ff6600>第'.$iszbs.'個多行子表</font>', $iszbs);
				$fleft[]= array('xuhao', '序號', $iszbs);
			}
			$iszb	= $iszbs;
			$fleft[]= array($brs['fields'], $bt.$brs['name'], $iszb);
		}

		
		$this->smartydata['fleft'] = $fleft;
		
		$path 		= ''.P.'/flow/page/input_'.$modenum.'.html';
		$content 	= '';
		if(file_exists($path)){
			$content = file_get_contents($path);
		}
		$this->smartydata['content'] = $content;
		$apaths		= ''.P.'/flow/input/inputjs/mode_'.$modenum.'.js';
		if(!file_exists($apaths)){
			$stra='//流程模塊【'.$modenum.'.'.$rs['name'].'】下錄入頁面自定義js頁面,初始函數
function initbodys(){
	
}';
			$this->rock->createtxt($apaths, $stra);
		}
		
		$apaths		= ''.P.'/flow/input/mode_'.$modenum.'Action.php';
		$apath		= ''.ROOT_PATH.'/'.$apaths.'';
		if(!file_exists($apath)){
			$stra = '<?php
/**
*	此文件是流程模塊【'.$modenum.'.'.$rs['name'].'】對應控制器接口文件。
*/ 
class mode_'.$modenum.'ClassAction extends inputAction{
	
	/**
	*	重寫函數：保存前處理，主要用于判斷是否可以保存
	*	$table String 對應表名
	*	$arr Array 表單參數
	*	$id Int 對應表上記錄Id 0添加時，大于0修改時
	*	$addbo Boolean 是否添加時
	*	return array(\'msg\'=>\'錯誤提示內容\',\'rows\'=> array()) 可返回空字符串，或者數組 rows 是可同時保存到數據庫上數組
	*/
	protected function savebefore($table, $arr, $id, $addbo){
		
	}
	
	/**
	*	重寫函數：保存後處理，主要保存其他表數據
	*	$table String 對應表名
	*	$arr Array 表單參數
	*	$id Int 對應表上記錄Id
	*	$addbo Boolean 是否添加時
	*/	
	protected function saveafter($table, $arr, $id, $addbo){
		
	}
}	
			';
			$this->rock->createtxt($apaths, $stra);
		}
	}
	
	public function pagesaveAjax()
	{
		$content = $this->post('content');
		$num 	 = $this->post('num');
		$path 	 = ''.P.'/flow/page/input_'.$num.'.html';
		$bo 	 = $this->rock->createtxt($path, $content);
		if(!$bo){
			echo '無法寫入文件:'.$path.'';
		}else{
			echo 'success';
		}
	}
	
	public function viewsaveAjax()
	{
		$content = $this->post('content');
		$num 	 = $this->post('num');
		$atype 	 = $this->post('atype','0');
		$path 	 = ''.P.'/flow/page/view_'.$num.'_'.$atype.'.html';
		$bo 	 = $this->rock->createtxt($path, $content);
		if(!$bo){
			echo '無法寫入文件:'.$path.'';
		}else{
			echo 'success';
		}
	}
	
	public function getinputAjax()
	{
		$num 	 = $this->post('num');
		$path 	 = ''.P.'/flow/page/input_'.$num.'.html';
		$cont 	 = '';
		if(file_exists($path)){
			$cont = file_get_contents($path);
			$cont = str_replace('*','', $cont);
		}
		echo $cont;
	}
	
	
	
	public function getsubtableAjax()
	{
		$iszb 	= (int)$this->post('iszb');
		$hang 	= (int)$this->post('hang');
		$modeid = (int)$this->post('modeid');
		$str 	= m('input')->getsubtable($modeid, $iszb, $hang);
		if($str=='')$this->backmsg('沒有設置第'.$iszb.'個多行子表');
		$this->backmsg('','ok', $str);
	}
	
	
	
	
	
	
	
	public function getmodearrAjax()
	{
		$arr = $this->getmodearr();
		$this->backmsg('','ok', $arr);
	}
	
	
	
	
	public function viewshowbefore($table)
	{
		$this->modeid = (int)$this->post('modeid');
		$this->moders = m('flow_set')->getone($this->modeid);
		$this->isflow = $this->moders['isflow'];
		$table = $this->moders['table'];
		$where = $this->moders['where'];
		if(!isempt($where)){
			$where = $this->rock->covexec($where);
			$where = "and $where";
		}
		return array(
			'table' => '[Q]'.$table,
			'where' => $where
		);
	}
	
	public function viewshowafter($table, $rows)
	{
		$arr 	= array();
		$flow 	= m('flow')->initflow($this->moders['num']);
		foreach($rows as $k=>$rs){
			$zt 	= '';
			if(isset($rs['status']))$zt = $rs['status'];
			$narr['id'] 		= $rs['id'];
			$narr['ishui'] 		= ($zt=='5')?1:0;
			$narr['optname'] 	= arrvalue($rs,'optname');
			$narr['modenum'] 	= $this->moders['num'];
			$narr['modename'] 	= $this->moders['name'];
			$narr['table'] 		= $this->moders['table'];
			$narr['optdt'] 		= arrvalue($rs,'optdt');
			$narr['summary'] 	= $this->rock->reparr($this->moders['summary'], $rs);
			$narr['status']		= $flow->getstatus($rs,'','',1);
			$narr['chushu']		= $flow->flogmodel->rows("`table`='".$flow->mtable."' and `mid`='".$rs['id']."'");
			
			$arr[] = $narr;
		}
		return array('rows'=>$arr);
	}
	
	public function viewlogshowbefore($table)
	{
		$where = "and `table`='".$this->post('num')."' and `mid`='".$this->post('mid')."'";
		return array(
			'where' => $where
		);
	}
	
	public function delmodeshujuAjax()
	{
		$this->modeid 	= (int)$this->post('modeid');
		$mid 			= (int)$this->post('mid');
		$this->moders 	= m('flow_set')->getone($this->modeid);
		if(!$this->moders)backmsg('sorry!');
		$msg	= m('flow')->deletebill($this->moders['num'], $mid);
		if($msg=='ok')$msg='';
		backmsg($msg);
	}
	
	//元素保存之前判斷
	public function elemensavefieldsbefore($table, $cans, $id)
	{
		$iszb 	= (int)$cans['iszb'];
		$fields = $cans['fields'];
		$mid 	= $cans['mid'];
		$this->mmoders 	= m('flow_set')->getone($mid);
		$tablessa = explode(',', $this->mmoders['tables']);
		if($iszb>0){
			$tabsss = $this->rock->arrvalue($tablessa, $iszb-1);
			if(isempt($tabsss))return '模塊沒有設置第'.$iszb.'個多行子表';
		}
		if(m($table)->rows("`mid`='$mid' and `iszb`='$iszb' and `fields`='$fields' and `id`<>'$id'")>0){
			return '字段['.$fields.']已存在了';
		}
	}
	
	//保存字段判斷
	public function elemensavefields($table, $cans)
	{
		$fields = $cans['fields'];
		$name 	= $cans['name'];
		$mid 	= $cans['mid'];
		$type 	= $cans['fieldstype'];
		$lens 	= $cans['lens'];
		$iszb 	= (int)$cans['iszb'];
		
		$mrs 	= $this->mmoders;
		$tables 	= $mrs['table'];
		if($iszb>0){
			$tables = '';
			$tablessa = explode(',', $mrs['tables']);
			if(isset($tablessa[$iszb-1]))$tables = $tablessa[$iszb-1];
		}
		if(!isempt($tables) && substr($fields,0,5)!='temp_' && $cans['islu']==1){
			$allfields = $this->db->getallfields('[Q]'.$tables.'');
			if(!in_array($fields, $allfields)){
				$str = "ALTER TABLE `[Q]".$tables."` ADD `$fields` ";
				if($type=='date' || $type=='datetime' || $type=='time'){
					$str .= ' '.$type.'';
				}else if($type=='number'){
					$str .= ' smallint(6)';
				}else if($type=='checkbox'){
					$str .= ' tinyint(1)';	
				}else if($type=='textarea'){
					$str .= ' varchar(2000)';
				}else{
					if(isempt($lens))$lens='0';
					if($lens=='0')$lens='50';
					$str .= ' varchar('.$lens.')';
				}
				if(!isempt($cans['dev']))$str.= " DEFAULT '".$cans['dev']."'";
				$str.= " COMMENT '$name'";
				$this->db->query($str);
			}
		}
	}
	
	
	
	
	
	
	public function reloadpipeiAjax()
	{
		$mid 	= (int)$this->post('mid');
		$whe	= '';
		if($mid>0)$whe=' and id='.$mid.'';
		echo m('flow')->repipei($whe);
	}
	
	public function setwherelistafter($table, $rows)
	{
		$dbs = m('flow_where');
		foreach($rows as $k=>$rs){
			$shu = $dbs->rows("`setid`='".$rs['id']."'");
			if($shu>0)$rows[$k]['shu'] = $shu;
		}
		return array('rows'=>$rows);
	}
	
	public function setcourselistafter($table, $rows)
	{
		$dbs = m('flow_course');
		foreach($rows as $k=>$rs){
			$shu = $dbs->rows("`setid`='".$rs['id']."'");
			if($shu>0)$rows[$k]['shu'] = $shu;
		}
		return array('rows'=>$rows);
	}
	
	
	//刪除模塊
	public function delmodeAjax()
	{
		$id = (int)$this->post('id','0');
		return $this->delmode($id, true);
	}
	
	private function delmode($id, $dm=false)
	{
		if($this->getsession('isadmin')!='1')return '非管理員不能操作';
		$mrs = m('flow_set')->getone($id);
		if(!$mrs)return '模塊不存在';
		$num 	= $mrs['num'];
		if($mrs['type']=='系統')return '系統模塊不能刪除清空';
	
		$table 	= $mrs['table'];
		m('flow_bill')->delete("`modeid`='$id'");
		$where = $mrs['where'];
		if(!isempt($where)){
			$where = $this->rock->covexec($where);
			$where = "and $where";
		}else{
			$where = '';
		}
		$rows  = m($table)->getrows('1=1 '.$where.'');
		$allids= '0';
		foreach($rows as $k=>$rs){
			$ssid 	= $rs['id'];
			$allids.= ','.$ssid.'';
			$dwhere	= "`table`='$table' and `mid`='$ssid'";
			m('file')->delfiles($table, $ssid);
		}
		
		//刪除子表
		$tables = $mrs['tables'];
		if(!isempt($tables)){
			$tablesa = explode(',', $tables);
			foreach($tablesa as $tab1){
				m($tab1)->delete("mid in($allids)");
				$this->db->query("alter table `[Q]$tab1` AUTO_INCREMENT=1");
			}
		}
		m($table)->delete('1=1 '.$where.'');
		
		$dehwhe = "`table`='$table' and `mid` in($allids)";
		m('editrecord')->delete($dehwhe);
		m('todo')->delete($dehwhe);
		m('reads')->delete($dehwhe);
		m('flow_log')->delete($dehwhe);
		m('flow_checks')->delete($dehwhe);
		m('flow_remind')->delete($dehwhe);
		$name 	= $mrs['name'];
		if($dm){
			m('flow_set')->delete("`id`='$id'");
			m('flow_course')->delete("`setid`='$id'");
			m('flow_element')->delete("`mid`='$id'");
			m('flow_extent')->delete("`modeid`='$id'");
			m('flow_where')->delete("`setid`='$id'");
			m('flow_menu')->delete("`setid`='$id'");
			m('flow_todo')->delete("`setid`='$id'");
			m('flow_todos')->delete("`modenum`='$num'");
			
			m('log')->addlog('模塊','刪除模塊['.$name.']');
		}else{
			m('log')->addlog('模塊','清空模塊['.$name.']的數據');
		}
		
		$this->db->query("alter table `[Q]$table` AUTO_INCREMENT=1");
		return 'ok';
	}
	
	//清空模塊上數據
	public function clearallmodeAjax()
	{
		$id = (int)$this->post('id','0');
		return $this->delmode($id, false);
	}
	
	//刷新序號
	public function rexuhaoAjax()
	{
		$mid 	= (int)$this->get('modeid');
		$db 	= m('flow_element');
		
		$rows 	= $db->getall('mid='.$mid.' and iszb=0','id','sort asc,id asc');
		foreach($rows as $k=>$rs)$db->update('sort='.$k.'',$rs['id']);
		
		$rows 	= $db->getall('mid='.$mid.' and iszb=1','id','sort asc,id asc');
		foreach($rows as $k=>$rs)$db->update('sort='.$k.'',$rs['id']);
		
		$rows 	= $db->getall('mid='.$mid.' and iszb=2','id','sort asc,id asc');
		foreach($rows as $k=>$rs)$db->update('sort='.$k.'',$rs['id']);
		
		$rows 	= $db->getall('mid='.$mid.' and iszb=3','id','sort asc,id asc');
		foreach($rows as $k=>$rs)$db->update('sort='.$k.'',$rs['id']);
	}
	
	public function flowcourselistbefore($rows)
	{
		return array('order'=>'pid,sort');
	}
	
	//流程步驟顯示
	public function flowcourselistafter($table, $rows)
	{
		$arr = array();$pid = -1;$maxpid = -1;
		foreach($rows as $k=>$rs){
			if($rs['pid'] != $pid){
				$recename 	= $this->rock->arrvalue($rs, 'recename');
				if(isempt($recename))$recename = '全體人員';
				$arr[] 		= array(
					'name' 	=> '流程'.($rs['pid']+1).'，適用：'.$recename.'',
					'level'	=> 1,
					'stotal'=> 1,
					'status'=> 1,
					'iszf'	=> 0,
					'id'		=> $rs['id'],
					'pid'		=> $rs['pid'],
					'sort'		=> 0,
					'recename'	=> '',
				);
			}
			$rs['level'] 	= 2;
			$rs['stotal'] 	= 0;
			$arr[] 	= $rs;
			$pid 	= $rs['pid'];
			$maxpid = $pid;
		}
		return array(
			'rows' => $arr,
			'maxpid' => $maxpid+1,
		);
	}
	
	
	
	

	
	
	//生成列表頁面
	public function changeliebAjax()
	{
		$modeid = (int)$this->post('modeid');
		$path 	= m('mode')->createlistpage($modeid);
		if($path=='')$path	= '無法生成，可能沒權限寫入'.P.'/flow/page目錄';
		echo $path;
	}
	
	//生成所有
	public function allcreateAjax()
	{
		$dbs  = m('mode');
		$rows = $dbs->getall("`status`=1");
		$oi   = 0;
		$msg  = '';
		foreach($rows as $k=>$rs){
			$path 	= $dbs->createlistpage($rs,1);
			if($path=='none')continue;
			if($path==''){
				if($path=='')$msg	= '無法生成，可能沒權限寫入'.P.'/flow/page目錄';
				break;
			}else{
				$oi++;
			}
		}
		if($msg=='')$msg='已生成'.$oi.'個模塊，可到'.P.'/flow/page下查看';
		echo $msg;
	}
	
	public function savecolunmsAjax()
	{
		$num 	= $this->post('num');
		$modeid = (int)$this->post('modeid');
		$str 	= $this->post('str');
		$this->option->setval($num.'@'.(-1*$modeid-1000), $str,'模塊列定義');
		$path 	= m('mode')->createlistpage($modeid);
		$msg 	= 'ok';
		if($path=='')$msg='已保存,但無法從新生成列表頁,自定義列將不能生效';
		echo $msg;
	}
	
	
	//選擇人員組
	public function getcnameAjax()
	{
		$arr = array();
		$rows = m('flow_cname')->getall("`pid`=0 and `num` is not null",'num,name','`sort`');
		foreach($rows as $k=>$rs)$arr[] = array('name'=>$rs['name'],'value'=>$rs['num']);
		return $arr;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	//圖形的流程管理
	public function courseflowinitAjax()
	{
		$setid = (int)$this->get('setid','0');
		
		return m('flowcourse')->getCoursedata($setid);
	}
	
	public function courseflowdelAjax()
	{
		$id = (int)$this->get('id','0');
		
		m('flowcourse')->delete($id);
	}
	public function coursesavebefore($table, $arr)
	{
		$mid 	= (int)arrvalue($arr,'mid','0');
		$setid 	= (int)arrvalue($arr,'setid','0');
		$nid 	= (int)arrvalue($arr,'nid','0');
		if($mid>0 && m($table)->rows("`setid`='$setid' and `id`='$mid'")==0)return '上級步驟ID['.$mid.']不存在';
		if($nid>0 && m($table)->rows("`setid`='$setid' and `id`='$nid'")==0)return '下級步驟ID['.$nid.']不存在';
		
		
	}
	
	public function getfieldsAjax()
	{
		$setid 	= (int)$this->get('setid','0');
		$rows  	= m('flow_element')->getrows('`mid`='.$setid.' and `iszb`=0','name,fields,data,fieldstype','`sort`');
		$arr 	= array();
		foreach($rows as $k=>$rs){
			//$arr[] = array(
			//	'name' => $rs['name'].'('.$rs['fields'].')',
			//	'value' => $rs['fields'],
			//);
			$fieldstype	= $rs['fieldstype'];
			if(in_array($fieldstype, array('changeuser','changeusercheck')) && !isempt($rs['data'])){
				$arr[] = array(
					'name' => $rs['name'].'('.$rs['data'].')',
					'value' => $rs['data'],
				);
			}
		}
		return $arr;
	}
}