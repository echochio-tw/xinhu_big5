<?php
class inputAction extends Action
{
	public $mid = 0;
	public $flow;
	public $rs 	= array();
	
	public function initAction()
	{
		/*
		$aid 	= (int)$this->get('adminid');
		$token 	= $this->get('token');
		$uid 	= m('login')->autologin($aid, $token);
		$this->getlogin();
		$this->loginnot();*/
	}
	
	private $fieldarr = array();
	private $ismobile = 0;
	
	protected $moders = array();
	
	
	//保存前處理，主要用于判斷是否可以保存
	protected function savebefore($table,$arr, $id, $addbo){}
	
	//保存後處理，主要用于判斷是否可以保存
	protected function saveafter($table,$arr, $id, $addbo){}
	
	//生成列表頁，數據讀取前處理
	protected function storebefore($table){}
	
	//生成列表頁，數據讀取後處理
	protected function storeafter($table, $rows){}
	
	//過濾html代碼
	private function xxsstolt($uaarr)
	{
		foreach($uaarr as $k=>$v){
			$vss = strtolower($v);
			if(contain($vss, '<script')){
				$uaarr[$k] = str_replace(array('<','>'),array('&lt;','&gt;'), $v);
			}
		}
		return $uaarr;
	}
	
	/**
	*	錄入的保存
	*/
	public function saveAjax()
	{
		$id				= (int)$this->request('id');
		$modenum		= $this->request('sysmodenum');
		$uid			= $this->adminid;
		$this->flow		= m('flow')->initflow($modenum);
		$this->moders	= $this->flow->moders;
		$modeid			= $this->moders['id'];
		$isflow			= $this->moders['isflow'];
		$flownum		= $this->moders['num'];
		$table			= $this->moders['table'];
		$checkobj		= c('check');
		if($this->isempt($table))$this->backmsg('模塊未設置表名');
		$fieldsarr		= $this->flow->fieldsarr;
		if(!$fieldsarr)$this->backmsg('沒有錄入元素');
		$db	   = m($table);$subna = '提交';$addbo = false;$where = "`id`='$id'"; $oldrs = false;
		$this->mdb = $db;
		
		if($id==0){
			$where = '';
			$addbo = true;
		}else{
			$oldrs = $db->getone($id);
			if(!$oldrs)$this->backmsg('記錄不存在');
			if($isflow==1){
				$bos = false;
				if($oldrs['uid']==$uid||$oldrs['optid']==$uid)$bos=true;
				if($oldrs['status']==1)$bos=false;
				if(!$bos)$this->backmsg('不允許編輯,可能已審核通過/不是你的單據');
			}
			$subna = '編輯';
		}
		if($oldrs)$this->rs = $oldrs;
		$uaarr = $farrs 	= array();
		foreach($fieldsarr as $k=>$rs){
			$fid = $rs['fields'];
			if(substr($fid, 0, 5)=='temp_')continue;
			$val = $this->post($fid);
			if($rs['isbt']==1 && isempt($val))$this->backmsg(''.$rs['name'].'不能為空');
			if(!isempt($val) && $rs['fieldstype']=='email'){
				if(!$checkobj->isemail($val))$this->backmsg(''.$rs['name'].'格式不對');
			}
			$uaarr[$fid] = $val;
			$farrs[$fid] = array('name' => $rs['name']);
		}
		
		//人員選擇保存的
		foreach($fieldsarr as $k=>$rs){
			if(substr($rs['fieldstype'],0,6)=='change'){
				if(!$this->isempt($rs['data'])){
					$fid = $rs['data'];
					if(isset($uaarr[$fid]))continue;
					$val = $this->post($fid);
					if($rs['isbt']==1&&$this->isempt($val))$this->backmsg(''.$rs['name'].'id不能為空');
					$uaarr[$fid] = $val;
					$farrs[$fid] = array('name' => $rs['name'].'id');
				}
			}
			if($rs['fieldstype']=='num'){
				$fid = $rs['fields'];
				if($this->flow->rows("`$fid`='{$uaarr[$fid]}' and `id`<>$id")>0)$uaarr[$fid]=$this->flow->createbianhao($rs['data'], $fid);
			}
		}
		
		//默認字段保存
		$allfields = $this->db->getallfields('[Q]'.$table.'');
		if(in_array('optdt', $allfields))$uaarr['optdt'] = $this->now;
		if(in_array('optid', $allfields))$uaarr['optid'] = $this->adminid;
		if(in_array('optname', $allfields))$uaarr['optname'] = $this->adminname;
		if(in_array('uid', $allfields) && $addbo){
			$uaarr['uid'] = $this->post('uid', $this->adminid);
		}
		if(in_array('applydt', $allfields) && $id==0)$uaarr['applydt'] = $this->post('applydt', $this->date);
		if($addbo){
			if(in_array('createdt', $allfields))$uaarr['createdt'] = $this->now;
			if(in_array('adddt', $allfields))$uaarr['adddt'] = $this->now;
			if(in_array('createid', $allfields))$uaarr['createid'] = $this->adminid;
			if(in_array('createname', $allfields))$uaarr['createname'] = $this->adminname;
		}
		if($isflow==1){
			$uaarr['status']= '0';
		}else{
			if(in_array('status', $allfields))$uaarr['status'] = (int)$this->post('status', '1');
			if(in_array('isturn', $allfields))$uaarr['isturn'] = (int)$this->post('isturn', '1');
		}
		
		//保存條件的判斷
		foreach($fieldsarr as $k=>$rs){
			$ss  = '';
			if(isset($uaarr[$rs['fields']]))$ss = $this->flow->savedatastr($uaarr[$rs['fields']], $rs, $uaarr);
			if($ss!='')$this->backmsg($ss);
		}
		
		//判斷保存前的
		$ss 	= '';
		$befa 	= $this->savebefore($table, $this->getsavenarr($uaarr, $oldrs), $id, $addbo);
		$notsave= array();//不保存的字段
		if(is_string($befa)){
			$ss = $befa;
		}else{
			if(isset($befa['msg']))$ss=$befa['msg'];
			if(isset($befa['rows'])){
				if(is_array($befa['rows']))foreach($befa['rows'] as $bk=>$bv)$uaarr[$bk]=$bv;
			}
			if(isset($befa['notsave'])){
				$notsave=$befa['notsave'];
				if(is_string($notsave))$notsave = explode(',', $notsave);
			}
		}
		if(!$this->isempt($ss))$this->backmsg($ss);
		
		//不保存字段過濾掉
		if(is_array($notsave))foreach($notsave as $nofild)if(isset($uaarr[$nofild]))unset($uaarr[$nofild]);
		
		$uaarr	= $this->xxsstolt($uaarr);//過濾特殊文字
		
		foreach($uaarr as $kf=>$kv){
			if(!in_array($kf, $allfields)){
				$this->backmsg('模塊主表['.$this->flow->mtable.']上字段['.$kf.']不存在');
			}
		}
		
		//isonly唯一值的判斷
		foreach($fieldsarr as $k=>$rs){
			$fiesd  = $rs['fields'];
			if($rs['isonly']=='1' && isset($uaarr[$fiesd])){
				$dval = $uaarr[$fiesd];
				if(!isempt($dval)){
					if($db->rows("`id`<>'$id' and `$fiesd`='$dval'")>0)$this->backmsg(''.$rs['name'].'['.$dval.']已存在了');
				}
			}
		}
		
		
		$bo = $db->record($uaarr, $where);;
		if(!$bo)$this->backmsg($this->db->error());
		
		if($id==0)$id = $this->db->insert_id();
		m('file')->addfile($this->post('fileid'), $table, $id);
		
		//保存多行子表
		$tabless	 = $this->moders['tables'];
		if(!isempt($tabless)){
			$tablessa = explode(',', $tabless);
			foreach($tablessa as $zbx=>$tablessas){
				$this->savesubtable($tablessas, $id, $zbx, $addbo);
			}
		}
		
		//保存後處理
		$this->saveafter($table,$this->getsavenarr($uaarr, $oldrs), $id, $addbo);
		
		//保存修改記錄
		$editcont = '';
		if($oldrs){
			$newrs = $db->getone($id);
			$editcont = m('edit')->recordsave($farrs, $table, $id, $oldrs, $newrs);
		}
		$msg 	= '';
		$this->flow->editcont = $editcont;
		$this->flow->loaddata($id, false);
		$this->flow->submit($subna);
		
		$this->backmsg('', $msg, $id);
	}
	
	private function getsavenarr($nsrr, $bos=false)
	{
		if(!is_array($bos))$bos = array();
		if($nsrr)foreach($nsrr as $k=>$v)$bos[$k]=$v;
		return $bos;
	}
	
	public function getsubtabledata($xu)
	{
		$arr 	= array();
		$oi 	= (int)$this->post('sub_totals'.$xu.'');
		if($oi<=0)return $arr;
		$modeid		= $this->moders['id'];
		$iszb		= $xu+1;
		$farr		= m('flow_element')->getrows("`mid`='$modeid' and `islu`=1 and `iszb`=$iszb",'`name`,`fields`,`isbt`,`savewhere`,`dev`','`sort`');
		$sort 		= 0;
		for($i=0; $i<$oi; $i++){
			$sid  = (int)$this->post('sid'.$xu.'_'.$i.'');
			$bos  = true;
			$uaarr['id'] = $sid;
			foreach($farr as $k=>$rs){
				$fid= $rs['fields'];
				if(substr($fid,0,5)=='temp_')continue;
				$na = ''.$fid.''.$xu.'_'.$i.'';
				$val= $this->post($na);
				if($rs['isbt']==1&&$this->isempt($val))$bos=false;
				$uaarr[$fid] = $val;
			}
			if(!$bos)continue;
			$uaarr['sort'] 	= $sort;
			$sort++;
			$arr[] = $uaarr;
		}
		return $arr;
	}
	
	//多行子表的保存
	private function savesubtable($tables, $mid, $xu, $addbo)
	{
		$dbs 		= m($tables);
		$data 		= $this->getsubtabledata($xu);
		$len 		= count($data);
		$idss		= '0';
		$whes 		= '';

		$allfields 	= $this->db->getallfields('[Q]'.$tables.'');
		$oarray 	= array();
		if(in_array('optdt', $allfields))$oarray['optdt'] 		= $this->now;
		if(in_array('optid', $allfields))$oarray['optid'] 		= $this->adminid;
		if(in_array('optname', $allfields))$oarray['optname'] 	= $this->adminname;
		if(in_array('uid', $allfields) && $addbo)$oarray['uid'] = $this->post('uid', $this->adminid);
		if(in_array('applydt', $allfields) && $addbo)$oarray['applydt']	= $this->post('applydt', $this->date);
		if(in_array('status', $allfields))$oarray['status']		= 0;
		if(in_array('sslx', $allfields)){
			$oarray['sslx']	= $xu;
			$whes			= ' and `sslx`='.$xu.'';
		}
		
		if($data)foreach($data as $k=>$uaarr){
			$sid 			= $uaarr['id'];
			$where			= "`id`='$sid'";
			$uaarr['mid'] 	= $mid;
			if($sid==0)$where = '';
			foreach($oarray as $k1=>$v1)$uaarr[$k1]=$v1;
			
			$dbs->record($uaarr, $where);
			if($sid==0)$sid = $this->db->insert_id();
			$idss.=','.$sid.'';
		}
		$delwhere = "`mid`='$mid'".$whes." and `id` not in($idss)";
		$dbs->delete($delwhere);
	}
	
	//獲取數據
	public function getdataAjax()
	{
		$flownum = $this->request('flownum');
		$id		 = (int)$this->request('mid');
		$arr 	 = m('flow')->getdataedit($flownum, $id);
		$this->backmsg('', '', $arr);
	}
	
	
	public function lumAction()
	{
		$this->ismobile = 1;
		$isheader = 0;
		if($this->web != 'wxbro' && $this->web != 'xinhu' && $this->web != 'ding' && $this->get('show')=='we')$isheader=1;
		$this->assign('isheader', $isheader);
		$this->luactions();
	}
	
	public function luAction()
	{
		$this->ismobile = 0;
		$this->luactions();
	}

	public function lusAction()
	{
		$this->ismobile = 1;
		$menuid	= (int)$this->get('menuid');
		$fields 	= m('flow_menu')->getmou('fields', $menuid);
		if(isempt($fields))exit('sorry;');
		$fields	= str_replace(',',"','", $fields);
		$stwhe	= "and `fields` in('$fields')";
		$this->luactions(1, $stwhe);
	}

	//高級搜索顯示框
	public function highsouAction()
	{
		$this->displayfile = ''.P.'/flow/input/tpl_input_lus.html';
		$this->ismobile = 1;
		$this->luactions(0, '', 1);
	}
	
	//$lutype=1高級搜索用的
	private function luactions($slx=0, $stwhe='', $lutype=0)
	{
		$this->tpltype = 'html';
		$uid		= $this->adminid;
		$num		= $this->jm->gettoken('num');
		$mid		= (int)$this->jm->gettoken('mid');
		$this->mid  = $mid;
		$this->rs   = array();
		$this->flow = m('flow')->initflow($num);
		$moders		= $this->flow->moders;
		$modename 	= $moders['name'];
		if($moders['status']=='0')exit('模塊['.$modename.']已停用了;');
		$this->smartydata['moders']	= array(
			'num' 	=> $moders['num'],
			'id' 	=> $moders['id'],
			'name' 	=> $moders['name'],
			'names' => $moders['names'],
			'isflow'=> $moders['isflow'],
		);
		$modeid 	= $moders['id'];
		if($mid==0 && $lutype==0){
			$isadd = m('view')->isadd($modeid, $uid);
			if(!$isadd)exit('無權添加['.$modename.']的數據;');
		}
		
		$content 	= '';
		$oldrs 		= m($moders['table'])->getone($mid);
		$this->rs 	= $oldrs;
		$this->gongsiarr = array();
		
		$fieldarr 	= m('flow_element')->getrows("`mid`='$modeid' and `iszb`=0 $stwhe",'fields,fieldstype,name,dev,data,isbt,islu,attr,iszb,issou,gongsi,placeholder','`sort`');
		$modelu		= '';
		foreach($fieldarr as $k=>$rs){
			if($slx==1 && $oldrs){
				$rs['value'] = $oldrs[$rs['fields']];
			}
			if($lutype==1){
				$rs['isbt'] = 0;
				if($rs['issou']==1)$modelu.='{'.$rs['fields'].'}';
			}else{	
				if($rs['islu'] || $stwhe!='')$modelu.='{'.$rs['fields'].'}';
				if(!isempt($rs['gongsi']))$this->gongsiarr[] = array(
					'iszb' 	 => 0,
					'fields' => $rs['fields'],
					'gongsi' => $rs['gongsi'],
				);
			}
			$this->fieldarr[$rs['fields']] = $rs;
		}
		
		$this->smartydata['fieldsjson']	= json_encode($fieldarr);
		$this->moders	= $moders;
		$zbshu			= 0;
		$tableas		= false;
		if(!isempt($moders['tables'])){
			$tableas = explode(',', $moders['tables']);
			$zbshu	 = count($tableas);
		}
		$path 			= ''.P.'/flow/page/input_'.$num.'.html';
		$pclucont 		= '';
		if(file_exists($path))$pclucont 	= file_get_contents($path);
		$isupfile		= 0;
		$nameaas 		= explode(',', $moders['names']); //子表名
		
		//PC端
		if($this->ismobile==0){
			$content = $pclucont;
		}else{
			$content = $modelu;
			if($tableas){
				foreach($tableas as $k1=>$tableass){
					$zbstr 	 = m('input')->getsubtable($modeid,$k1+1,1,1);
					if($zbstr!=''){
						$content.='<tr><td style="padding:5px;" colspan="2"><div><b>'.arrvalue($nameaas, $k1).'</b></div>';
						if($this->flow->minwidth>300){
							$content.='<div tmp="mobilezbiao" style="width:280px;overflow:auto;"><div 
						style="min-width:'.$this->flow->minwidth.'px">'.$zbstr.'</div></div>';
						}else{
							$content.='<div>'.$zbstr.'</div>';
						}
						$content.= '</td></tr>';
					}
				}
			}
			$isupfile = contain($pclucont, '{file_content}') ? 1 : 0;
			
		}
		
		if($content=='')exit('未設置錄入頁面,請到[流程模塊→表單元素管理]下設置');
		
		
		$this->actclss	= $this;
		$pathss 		= ''.P.'/flow/input/mode_'.$num.'Action.php';
		if(file_exists($pathss)){
			include_once($pathss);
			$clsnam 				= 'mode_'.$num.'ClassAction';
			$this->actclss 			= new $clsnam();
			$this->actclss->flow 	= $this->flow;
			$this->actclss->mid 	= $this->mid;
			$this->actclss->rs 		= $this->rs;
			$this->actclss->ismobile= $this->ismobile;
		}
		
		//初始表單插件元素
		$this->inputobj	= c('input');
		$this->inputobj->ismobile 	= $this->ismobile;
		$this->inputobj->fieldarr 	= $this->fieldarr;
		$this->inputobj->flow 		= $this->flow;
		$this->inputobj->mid 		= $this->mid;
		$this->inputobj->initUser($this->adminid);
		
		preg_match_all('/\{(.*?)\}/', $content, $list);
		foreach($list[1] as $k=>$nrs){
			$str		= $this->inputobj->getfieldcont($nrs, $this->actclss);
			$content	= str_replace('{'.$nrs.'}', $str, $content);
		}
		$this->subfielsa = array();
		$content 	 	= $this->pisubduolie($content, $modeid, $nameaas);//多列子表匹配的是[]
		$content		= str_replace('*','<font color=red>*</font>', $content);
		
		$course			= array();
		$nowcourseid	= 0;
		if($moders['isflow']==1 && $lutype==0 && $moders['isbxs']==0){
			$course[]= array('name'=>'提交','id'=>0);
			$courses	= $this->flow->getflowpipei($this->adminid);
			if($mid>0){
				$nowcourseid = $this->flow->billmodel->getmou('nowcourseid',"`table`='".$this->flow->mtable."' and `mid`='$mid'");
			}
			foreach($courses as $k=>$rs1){
				$na = $rs1['name'];
				if(!$this->isempt($rs1['explain']))$na.= '<br><span style="font-size:12px">('.$rs1['explain'].')</span>';
				$rs1['name'] = $na;
				$rs1['k'] 	 = $k;
				$rs1['isnow']= $rs1['id']==$nowcourseid;
				$course[]=$rs1;
			}
			$course[]= array('name'=>'結束','id'=>-1);
		}
		$this->title  	= $moders['name'];
		$this->smartydata['content']	= $content;
		$this->smartydata['gongsiarr']	= $this->gongsiarr;
		$this->smartydata['subfielsa']	= $this->subfielsa;
		$this->smartydata['mid']		= $mid;
		$this->smartydata['course']		= $course;
		$this->smartydata['zbnamearr']	= $nameaas;
		$this->smartydata['zbshu']		= $zbshu;//子表數
		$this->smartydata['isupfile']	= $isupfile;//是否有上傳
	}
	
	//多行子表內替換
	private function pisubduolie($content, $modeid, $nameaas)
	{
		$fieldarr 	= m('flow_element')->getrows("`mid`='$modeid' and `iszb`>0",'fields,fieldstype,name,dev,data,isbt,islu,attr,iszb,gongsi','`sort`');
		if(!$fieldarr)return $content;
		$this->fieldarr = array();
		foreach($fieldarr as $k=>$rs){
			$oi = $rs['iszb']-1;
			$this->fieldarr['xuhao'.$oi.''] = array(
				'fields' 	=> 'xuhao'.$oi.'',
				'fieldstype'=> 'xuhao',
				'data' 		=> '',
				'attr' 		=> 'style="text-align:center" readonly temp="xuhao"',
				'dev'	 	=> '1',
				'isbt'		=> '0',
				'fieldss'	=> 'sid'.$oi.''
			);
			$this->fieldarr[$rs['fields'].''.$oi.''] = $rs;
			if(!isempt($rs['gongsi']))$this->gongsiarr[] = array(
				'iszb' 	 => $rs['iszb'],
				'fields' => $rs['fields'],
				'gongsi' => $rs['gongsi'],
			);
			if($rs['isbt']=='1'){
				$this->subfielsa[] = array(
					'name' 	 => $rs['name'],
					'fields' => $rs['fields'],
					'type'   => $rs['fieldstype'],
					'isbt' => $rs['isbt'],
					'iszb' => (int)$rs['iszb'],
					'zbname'=> arrvalue($nameaas, $oi)
				);
			}
		}
		$this->inputobj->fieldarr 	= $this->fieldarr;
		preg_match_all('/\[(.*?)\]/', $content, $list);
		foreach($list[1] as $k=>$nrs){
			if(!$this->isempt($nrs)){
				$fida= explode(',', $nrs);$xu0='0';
				if(isset($fida[1]))$xu0=$fida[1];
				
				$str		= $this->inputobj->getfieldcont($fida[0], $this->actclss,'_'.$xu0.'', 1);
				$content	= str_replace('['.$nrs.']', $str, $content);
			}
		}
		return $content;
	}
	
	public function getselectdataAjax()
	{
		$rows 	= array();
		$act	= $this->get('act');
		$modenum= $this->get('sysmodenum');
		
		//用:讀取model上的數據
		if(!isempt($act) && contain($act,':')){
			$acta = explode(':', $act);
			$objs = m($acta[0]);
			if(method_exists($objs, $acta[1])){
				$rows = $objs->$acta[1]();
			}
		}
		
		if(!$rows && !isempt($act) && method_exists($this, $act)){
			$rows = $this->$act();
		}
		//從Model上讀取
		if(!$rows && !isempt($modenum)){
			$this->flow = m('flow')->initflow($modenum);
			if(method_exists($this->flow, $act)){
				$rows = $this->flow->$act();
			}
		}
		
		return $rows;
	}
	
	
	
	
	
	/**
	*	公共讀取數據之前處理
	*/
	public function storebeforeshow($table)
	{
		$this->atypearr	= false;
		$this->modeid 	= (int)$this->get('modeid');
		if($this->post('atype')=='grant'){
			$this->atypearr = array();
			$this->atypearr[] = array(
				'id'	=> 0,
				'num'	=> 'grant',
				'name'  => ''.$this->flow->modename.'授權查看',
			);
		}else if($this->loadci==1 && $this->adminid>0){
			$this->atypearr = m('where')->getmywhere($this->modeid, $this->adminid, $this->get('pnum'));
		}
		return $this->storebefore($table);
	}
	
	/**
	*	公共讀取數據之後處理，展示列數
	*/
	public function storeaftershow($table, $rows)
	{
		$barr['rows'] 		= $rows;
		$barr['atypearr'] 	= $this->atypearr;
		if($this->loadci==1){
			$barr['isadd'] 		= m('view')->isadd($this->modeid, $this->adminid); //判斷是否可添加
			$barr['isdaoru'] 	= m('view')->isdaoru($this->modeid, $this->adminid); //判斷是否可導入
		}
		
		$scarr 				= $this->storeafter($table, $rows);
		if(is_array($scarr))foreach($scarr as $k=>$v)$barr[$k]=$v;
		return $barr;
	}
	
	//獲取可搜索列表
	public function getcolumnsAjax()
	{
		$modeid 	= (int)$this->get('modeid');
		$modenum 	= $this->get('modenum');
		$flow 		= m('flow')->initflow($modenum);

		$souarr 	= array();
		$this->input= c('input');
		foreach($flow->fieldsarra as $k=>$rs){
			
			if($rs['issou']==1){
				$rs['store'] = $this->input->getdatastore($rs['fieldstype'], $this, $rs['data']);
				$souarr[] = $rs;
			}
		}
		$this->returnjson($souarr);
	}
	
	//初始化導入
	public function initdaoruAjax()
	{
		$modenum 	= $this->get('modenum');
		$flow 		= m('flow')->initflow($modenum);
		$rows 		= m('flow_element')->getall('mid='.$flow->modeid.' and `isdr`=1','name,isbt,fields','`sort`,`id`');
		return $rows;
	}
	//確定導入數據
	public function daorudataAjax()
	{
		$modenum 	= $this->post('modenum');
		$flow 		= m('flow')->initflow($modenum);
		$rows 		= m('flow_element')->getall('mid='.$flow->modeid.' and `isdr`=1','name,isbt,fields,isonly','`sort`,`id`');
		$fields 	= $fieldss = '';
		if(!$rows)return returnerror('沒有導入的字段');
		$onlyfield	= array();
		foreach($rows as $k=>$rs){
			$fields.=','.$rs['fields'].'';
			if($rs['isbt']=='1')$fieldss.=','.$rs['fields'].'';
			if($rs['isonly']=='1')$onlyfield[] = $rs['fields']; //唯一字段
		}
		$fields = substr($fields, 1);
		if($fieldss!='')$fieldss = substr($fieldss,1);
		
		$data  	= c('html')->importdata($fields, $fieldss); //獲取提交過來要導入的數據庫
		if(!$data)return returnerror('沒有可導入的數據,注意*是必填的哦');
		
		
		
		//保存前判斷
		if(method_exists($flow,'flowdaorubefore')){
			$data = $flow->flowdaorubefore($data);
			if(is_string($data))return returnerror($data);
		}
		
		//判斷是否有重復
		$ldata 	= array();
		foreach($data as $k=>$rs){
			$bos 	= true;
			foreach($onlyfield as $onid){
				$val = arrvalue($rs, $onid);
				if(!isempt($val)){
					$tos = $flow->rows("`$onid`='$val'");
					if($tos>0){$bos = false;break;}
				}
			}
			if($bos)$ldata[] = $rs;
		}
		if(!$ldata)return returnerror('沒有可導入的數據,可能有存在重復數據');
		$allfields = $this->db->getallfields('[Q]'.$flow->mtable.'');
		
		$oi 	= 0;
		$dorudat= array();
		foreach($ldata as $k=>$rs){
			
			if(!isset($rs['uid']) && in_array('uid', $allfields))$rs['uid'] = $this->adminid;
			if(!isset($rs['optid']) && in_array('optid', $allfields))$rs['optid'] = $this->adminid;
			if(!isset($rs['createid']) && in_array('createid', $allfields))$rs['createid'] = $this->adminid;
			
			if(!isset($rs['optname']) && in_array('optname', $allfields))$rs['optname'] = $this->adminname;
			if(!isset($rs['createname']) && in_array('createname', $allfields))$rs['createname'] = $this->adminname;
			if(!isset($rs['optdt']) && in_array('optdt', $allfields))$rs['optdt'] = $this->now;
			if(!isset($rs['adddt']) && in_array('adddt', $allfields))$rs['adddt'] = $this->now;
			if(!isset($rs['createdt']) && in_array('createdt', $allfields))$rs['createdt'] = $this->now;
			
			if(!isset($rs['applydt']) && in_array('applydt', $allfields))$rs['applydt'] = $this->date;
			
			
			$bo = $flow->insert($rs);
			if($bo){
				$rs['id'] = $bo;
				$dorudat[]= $rs;
				$oi++;
			}
		}
		
		if($oi==0)return returnerror('導入數據為0條');
		
		//保存後判斷
		if(method_exists($flow,'flowdaoruafter')){
			$flow->flowdaoruafter($dorudat);
		}

		return returnsuccess('成功導入'.$oi.'條數據');
	}
	
	//下載導入的模版
	public function daoruexcelAction()
	{
		$this->display = false;
		$modenum 	= $this->get('modenum');
		$flow 		= m('flow')->initflow($modenum);
		$rows 		= m('flow_element')->getall('mid='.$flow->modeid.' and `isdr`=1','name,isbt,fields','`sort`,`id`');
		if(!$rows)return '對應模塊沒有設置導入字段';
		
		$testdata	= array();
		if(method_exists($flow,'flowdaorutestdata')){
			$testdata = $flow->flowdaorutestdata();
		}
		m('file')->fileheader(''.$modenum.'import.xls');
		$str1 	= '';
		$str2 	= '';
		$col 	= 0;
		foreach($rows as $k=>$rs){
			$col++;
			$xi 	= $rs['isbt']=='1'? '<font color=red>*</font>' : '';
			$str1.='<td style="border:.5pt #000000 solid; background:#cdf79e" height="30" align="center">'.$xi.'<b>'.$rs['name'].'('.$rs['fields'].')</b></td>';
		}
		if($testdata){
			$texdata = $testdata;
			if(!isset($testdata[0]))$texdata = array($testdata);
			foreach($texdata as $j=>$jrs){
				$str2.='<tr>';
				foreach($rows as $k=>$rs){
					$val  = arrvalue($jrs, $rs['fields']);
					$str2.='<td style="border:.5pt #000000 solid;" height="30" align="center">'.$val.'</td>';
				}
				$str2.='</tr>';
			}
		}

		$str = '<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<table style="border-spacing: 0;border-collapse: collapse;"><tr bgcolor="#f1f1f1">'.$str1.'</tr>'.$str2.'';
		for($i=1;$i<=100;$i++){
			$str.='<tr>';
			for($j=1;$j<=$col; $j++){
				$str.='<td style="border:.5pt #000000 solid" height="30" align="center"></td>';
			}
			$str.='</tr>';
		}
		$str.= '</table>';
		
		return $str;
	}
}

class inputClassAction extends inputAction{}