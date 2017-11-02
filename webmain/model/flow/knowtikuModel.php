<?php
class flow_knowtikuClassModel extends flowModel
{
	protected function flowchangedata(){
		$this->rs['content'] = c('html')->replace($this->rs['content']);
	}
	
	public function initModel()
	{
		$this->logobj = m('log');
	}
	
	public function flowrsreplace($rs,$isv=0)
	{
		if(isset($rs['typeid']))$rs['typeid'] 	= $this->db->getmou('[Q]option','name',"`id`='".$rs['typeid']."'");
		$rs['type'] = ($rs['type']==1)?'多選':'單選';
		if($isv==1){
			$ss = '<font color=#888888>停用</font>';
			if($rs['status']==1)$ss = '<font color=green>啟用</font>';
			$rs['status'] = $ss;
		}
		
		if($isv==2){
			$zt = $this->logobj->isread($this->mtable, $rs['id'], $this->adminid);
			if($zt>0)$rs['ishui']=1;
		}
		
		return $rs;
	}
	
	
	protected function flowbillwhere($uid, $lx)
	{
		$where  = '';
		$typeid = $this->rock->post('typeid','0');
		$key 	= $this->rock->post('key');
		if($lx=='xuexi')$where='and a.`status`=1';
		if($typeid!='0'){
			$alltpeid = m('option')->getalldownid($typeid);
			$where .= ' and a.`typeid` in('.$alltpeid.')';
		}
		if($key != ''){
			$where.=" and (a.`title` like '%$key%' or b.`name` like '%$key%')";
		}
		return array(
			'where' => $where,
			'order' => 'a.`sort`,a.`optdt` desc',
			'table'	=> '`[Q]'.$this->mtable.'` a left join `[Q]option` b on a.`typeid`=b.`id`',
			'fields'=> 'a.*,b.name as typename',
			'asqom'	=> 'a.'
		);
	}
	
	//導入數據的測試顯示
	public function flowdaorutestdata()
	{
		$barr = array(
			'title' 		=> '信呼要求PHP最低版本',
			'typeid' 		=> '官網知識',
			'type' 		=> '單選',
			'ana' 		=> '5.2',
			'anb' 		=> '5.3',
			'anc' 		=> '5.4',
			'and' 		=> '5.5',
			'answer' 		=> 'B',
			'explain' 		=> '詳見官網說明使用',
		);
		$barr1 = array(
			'title' 		=> '信呼要求MySql最低版本',
			'typeid' 		=> '官網知識',
			'type' 		=> '單選',
			'ana' 		=> '5.0',
			'anb' 		=> '5.3',
			'anc' 		=> '5.4',
			'and' 		=> '5.5',
			'answer' 		=> 'D',
			'explain' 		=> '詳見官網說明使用',
		);
		$barr2 = array(
			'title' 	=> 'PHP如何連接數據庫方式',
			'typeid' 	=> '技術姿勢/PHP知識',
			'type' 		=> '多選',
			'ana' 		=> 'mysql',
			'anb' 		=> 'mysqli',
			'anc' 		=> 'pdo',
			'and' 		=> 'mssql',
			'answer' 	=> 'ABC',
			'explain' 	=> 'D選項為別的數據庫',
		);
		return array($barr,$barr1,$barr2);
	}
	
	//導入之前
	public function flowdaorubefore($rows)
	{
		$inarr = array();
		foreach($rows as $k=>$rs){
			$rs['typeid'] 	= $this->option->gettypeid('knowtikutype',$rs['typeid']);
			$inarr[] = $rs;
		}
		
		return $inarr;
	}
}