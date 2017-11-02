<?php
//城市
class cityClassModel extends Model
{
	//獲取城市路徑
	public function getpath($id)
	{
		$this->pathss = array();
		$this->getpaths($id);
		return $this->pathss;
	}
	private function getpaths($id)
	{
		$rs = $this->getone($id);
		if($rs){
			$this->getpaths($rs['pid']);
			$this->pathss[] = $rs;
		}
	}
	
	
	/**
	*	導入數據
	*/
	public function daorudata()
	{
		$barr = c('xinhuapi')->getdata('base','city');
		if(!$barr['success'])return returnerror($barr['msg']);
		$data = $barr['data'];
		$shul = 0;
		foreach($data as $k=>$rs){
			$id = $rs['id'];
			if($this->rows($id)==0){
				$shul++;
				$this->insert($rs);
			}
		}			
		return returnsuccess('成功導入'.$shul.'條數據');
	}
	
	/**
	*	籍貫/城市數據
	*/
	public function citydata()
	{
		$rows	= $this->db->getall('SELECT a.name,b.name as name1 FROM `[Q]city` a left join `[Q]city` b on a.`pid`=b.`id` where a.`type` in(2)');
		$barr 	= array();
		foreach($rows as $k=>$rs){
			$name = $rs['name'];
			if($name!=$rs['name1'])$name=$rs['name1'].$name;
			$barr[] = array(
				'name' => $name,
				'cityname' => $rs['name'],
				'shengname' => $rs['name1'],
			);
		}
		return $barr;
	}
	
	/**
	*	省份數據
	*/
	public function shengdata()
	{
		$rows	= $this->db->getall('SELECT `name` FROM `[Q]city` where `pid`=1 order by `sort`');
		$barr 	= array();
		foreach($rows as $k=>$rs){
			$name = $rs['name'];
			$barr[] = array(
				'name' => $name
			);
		}
		return $barr;
	}
}