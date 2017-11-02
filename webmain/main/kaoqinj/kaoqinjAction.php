<?php
class kaoqinjClassAction extends Action
{
	
	public function kqjsndelAjax()
	{
		$id 	= (int)$this->post('id');
		m('kqjsn')->delete("`id`='$id'");
		showreturn();
	}
	
	
	public function kqjcmddelAjax()
	{
		$id 	= $this->post('id');
		m('kqjcmd')->delete("`id` in ($id)");
		showreturn();
	}
	//設備搜索
	public function kqjsnbefore($table)
	{
		$key = $this->post('key');
		$where = '';
		if(!isempt($key))$where = " and (`num`='$key' or `name` like '%$key%' or `company` like '%$key%')";
		
		return $where;
	}
	
	//設備搜索命令
	public function kqjcmdbefore($table)
	{
		$optdt= date('Y-m-d H:i:s', time()-10*60);
		m($table)->update('status=5',"`status`=0 and `optdt`<'$optdt'");
		$key = $this->post('key');
		$snid = (int)$this->post('snid','0');
		$where = '';
		if(!isempt($key))$where = " and (`num`='$key' or `name` like '%$key%' or `company` like '%$key%')";
		if($snid>0){
			$where.=" and a.`snid`='$snid'";
		}
		return array(
			'where' => $where,
			'table' => '`[Q]kqjcmd` a left join `[Q]kqjsn` b on a.`snid`=b.`id`',
			'fields'=> 'a.*,b.`name`,b.`num`,b.`company`'
		);
	}
	public function kqjcmdafter($table,$rows)
	{
		$cmds = m('kqjcmd');
		$time = time();
		foreach($rows as $k=>$rs){
			$zt = $rs['status'];
			if($zt=='0')$zt = '<font color="blue">待發送</font>';
			if($zt=='1')$zt = '<font color="green">處理成功</font>';
			if($zt=='2')$zt = '<font color="#ff6600">已請求</font>';
			if($zt=='3')$zt = '<font color="red">處理失敗</font>';
			if($zt=='5')$zt = '<font color="#888888">已過期</font>';
			
			$rows[$k]['atype']  = $cmds->cmdtype($rs['atype']);
			if($rs['status']=='5'){
				$rows[$k]['ishui'] = 1;
			}
			
			$rows[$k]['status'] = $zt;
		}
		$kqsnarr = array();
		if($this->loadci==1){
			$kqsnarr = m('kqjsn')->getall('status=1','id,name,num','sort');
			foreach($kqsnarr as $k=>$rs){
				$kqsnarr[$k]['name'] = ''.$rs['id'].'.'.$rs['name'].'('.$rs['num'].')';
			}
		}
		return array(
			'rows' => $rows,
			'kqsnarr' => $kqsnarr
		);
	}
	
	//發送設備命令
	public function sendcmdAjax()
	{
		$ids 	= $this->get('ids');
		$type 	= $this->get('type');
		$ida 	= explode(',', $ids);
		$oi 	= 0;
		foreach($ida as $id1){
			$barr = m('kqjcmd')->send($id1, $type);
			if($barr['success']){
				$oi++;
			}else{
				if(substr($type,0,6)=='advert')return $barr;
			}
		}
		return returnsuccess('成功發送'.$oi.'條命令，可到[考勤機命令查看]下查看結果');
	}
	
	
	//考勤機上人員管理
	public function kquserafter($table,$rows)
	{
		$snid  	= (int)$this->post('snid','0');
		$deptsdata = array();
		if($rows && $snid>0 && $snrs = m('kqjcmd')->getsninfo($snid)){
			$userids = $snrs['userids'];
			$deptids = $snrs['deptids'];
			$useridf = ','.$userids.','; //判斷是否在考勤機上
			$uids 	 = '';
			foreach($rows as $k=>$rs){
				if(contain($useridf,','.$rs['id'].',')){
					$kqjzt = '<font color=green>已上傳</font>';
				}else{
					$kqjzt = '';//'<font color=red>未上傳</font>';
				}
				
				$fingerprint1	= '';//'<font color=red>未採集</font>';
				$fingerprint2	= '';//'<font color=#888888>未採集</font>';
				$headpic		= '';//'<font color=#888888>無</font>';
				
				
				$rows[$k]['fingerprint1']  = $fingerprint1;
				$rows[$k]['fingerprint2']  = $fingerprint2;
				$rows[$k]['headpic']  		= $headpic;
				$rows[$k]['kqjzt']  = $kqjzt;
				$uids .= ','.$rs['id'].'';
			}
			$uids = substr($uids, 1);
			
			//顯示已存在部門
			if(!isempt($deptids)){
				$detpros = m('dept')->getdeptrows($deptids);
				$deptsdata = $this->depttreeshu($detpros,'0');
			}
	
			//判斷指紋是否存在
			$zwarr = $this->db->getarr('[Q]kqjuser','`snid`='.$snid.' and `uid` in('.$uids.')','fingerprint1,fingerprint2,headpic','uid');
			if($zwarr)foreach($rows as $k=>$rs){
				if(isset($zwarr[$rs['id']])){
					$ztrs = $zwarr[$rs['id']];
					if(!isempt($ztrs['fingerprint1'])){
						$rows[$k]['fingerprint1'] = '<font color=green>已採集</font>';
					}
					if(!isempt($ztrs['fingerprint2'])){
						$rows[$k]['fingerprint2'] = '<font color=green>已採集</font>';
					}
					if(!isempt($ztrs['headpic']) && file_exists($ztrs['headpic'])){
						$rows[$k]['headpic'] = '<img onclick="$.imgview({url:this.src})" src="'.$ztrs['headpic'].'" height="24">';
					}
				}
			}
			
			$barr['nocunid'] = m('kqjcmd')->getnosys($snid);
			$barr['nocunid'] = join(',', $barr['nocunid']);
		}
		
		$barr['rows'] = $rows;
		if($this->loadci==1){
			$drows = m('dept')->getdata('sd');
			$barr['deptdata'] = $this->depttreeshu($drows,'0');
			$kqsnarr = m('kqjsn')->getall('status=1','id,name,num','sort');
			foreach($kqsnarr as $k=>$rs){
				$kqsnarr[$k]['name'] = ''.$rs['id'].'.'.$rs['name'].'('.$rs['num'].')';
			}
			$barr['kqsnarr'] = $kqsnarr;
		}
		$barr['deptsdata']	 = $deptsdata;
		return $barr;
	}
	public function kquserbefore($table)
	{
		$key  	= $this->post('key');
		$snid  	= (int)$this->post('snid','0');
		$detpid = (int)$this->post('deptid','0');
		$where  = '';
		if(!isempt($key))$where = m('admin')->getkeywhere($key);
		
		if($detpid>1){
			$where.= " and instr(`deptpath`,'[$detpid]')>0";
		}
		return array(
			'fields'=>'id,name,deptname,ranking,status,face',
			'where'=>$where,
			'order'=> 'sort'
		);
	}
	
	//組織結構活動得到樹形數據
	private function depttreeshu($rows, $pid)
	{
		$barr = array();
		foreach($rows as $k=>$rs){
			if($rs['pid']==$pid){
				$rs['children'] = $this->depttreeshu($rows, $rs['id']);
				$rs['expanded'] = $pid=='0';
				$barr[] = $rs;
			}
		}
		return $barr;
	}
	
	//人員到設備上信息管理
	public function sendusercmdAjax()
	{
		$uids = $this->get('uids'); //人員ID
		$snid = $this->get('snid');
		$type = $this->get('type');
		
		$gtype 	 = (int)$this->post('gtype','0'); //0選中,1全部
		if($gtype==1)$uids = '0';
		
		$barr =  m('kqjcmd')->send($snid, $type, $uids);
		if($barr['success'])$barr['data'] = '命令已發送，可到[考勤機命令查看]下查看結果';
		
		return $barr;
	}
}