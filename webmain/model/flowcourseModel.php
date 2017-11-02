<?php
/**
*	流程步驟的
*/
class flowcourseClassModel extends Model
{
	private $courserows = array();
	
	public function initModel()
	{
		$this->settable('flow_course');
	}
	
	public function initCourse($setid, $fields='')
	{
		$this->courserows = array();
		if($fields=='')$fields = '`id`,`name`,`checktype`,`checktypename`,`whereid`,`status`,`mid`,`pid`,`recename`,`explain`,`optdt`,`nid`';
		$rows 	= $this->getall("`setid`='$setid'",$fields,'`pid`,`sort`');
		$isinit = false;
		$time 	= '2017-08-10 00:00:00';
		foreach($rows as $k=>$rs){
			if($rs['mid']>0)$isinit=true;
			if($rs['optdt']>$time)$isinit=true;
		}
		//沒有初始化
		if(!$isinit){
			$pid = '-1';
			foreach($rows as $k=>$rs){
				if($pid==$rs['pid']){
					$mid = $rows[$k-1]['id'];
				}else{
					$mid = '0';
				}
				$pid = $rs['pid'];
				
				if($mid!=$rs['mid']){
					$this->update('mid='.$mid.'', $rs['id']);
					$rs['mid'] = $mid;
				}
				$this->courserows[] = $rs;
			}
			$this->update('pid=0', "`setid`='$setid'");
		}else{
			foreach($rows as $k=>$rs){
				$this->courserows[] = $rs;
			}
		}
		//分支說明
		foreach($this->courserows as $k=>$rs){
			$fzsm = '';
			if(!isempt($rs['recename']))$fzsm='適用('.$rs['recename'].')';
			$whereid = (int)$rs['whereid'];
			if($whereid>0){
				$wherena = $this->db->getmou('[Q]flow_where','name', 'id='.$whereid.'');
				if(!isempt($wherena)){
					if(!isempt($fzsm))$fzsm.=',';
					$fzsm.= $wherena;
				}
			}
			$this->courserows[$k]['fzsm'] = $fzsm;
		}
		
		return $this->courserows;
	}
	
	public function getCoursedata($setid, $fields='')
	{
		$drows  = $this->initCourse($setid, $fields);
		$this->getCoursedatasarr = array();
		$children= $this->getCoursedatas($drows, '0', 1);
		
		$rows[]	= array(
			'name'  	=> '提交',
			'num'		=> 'turn',
			'id'		=> 0,
			'mid'		=> 0,
			'level'		=> 0,
			'children' 	=> $children,
			'childshu' 	=> count($children),
		);
		if($fields==''){
			$barr['rows'] 	= $rows;
			$barr['treedata'] 	= $this->getTreedata($setid);
		}else{
			$barr['rows']	= $children;
		}
		return $barr;
	}
	private function getCoursedatas($drows,$mid,$level)
	{
		$rows = array();
		foreach($drows as $k=>$rs){
			if($rs['mid']==$mid){
				$rs['level']	= $level;
				$children		= $this->getCoursedatas($drows, $rs['id'], $level+1);
				$rs['children']	= $children;
				$rs['childshu']	= count($children);
				$this->getCoursedatasarr[$rs['id']] = $rs;
				$rows[] = $rs;
			}
		}
		return $rows;
	}
	
	//獲取顯示數據
	public function getTreedata($setid)
	{
		$drows = $this->db->getall("select *,(select count(1) from `[Q]flow_course` where `mid`=a.id)as stotal from `[Q]flow_course` a where a.`setid`='$setid' order by a.`sort`");
		$this->getTreedatada = array();
		$this->getTreedatada[] = array(
			'name'  	=> '提交',
			'num'		=> '',
			'id'		=> 0,
			'stotal'	=> 1,
			'mid'		=> 0,
			'status'	=> 1,
			'iszf'		=> 0,
			'level'		=> 1
		);
		$this->getTreedatas($drows,'0',2);
		return $this->getTreedatada;
	}
	private function getTreedatas($drows,$mid,$level)
	{
		foreach($drows as $k=>$rs){
			if($rs['mid']==$mid){
				$rs['level']	= $level;
				if($rs['whereid']=='0'){
					$rs['whereid']='';
				}else{
					$rs['whereid']=$this->db->getmou('[Q]flow_where','name', 'id='.$rs['whereid'].'');
				}
				$this->getTreedatada[] = $rs;
				$this->getTreedatas($drows, $rs['id'], $level+1);
			}
		}
	}
	
	/**
	*	流程匹配的
	*/
	public function pipeiCourse($setid)
	{
		$barr = $this->getCoursedata($setid, '*' );
		$rows = $barr['rows'];
		return array(
			'rows' => $rows,
			'rowd' => $this->getCoursedatasarr,
		);
	}
	
}