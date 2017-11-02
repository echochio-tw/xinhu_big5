<?php
class viewClassModel extends Model
{
	private $modeid = 0;
	private $isflow = 0;
	
	private $ursarr	= array();
	
	public function initModel()
	{
		$this->settable('flow_extent');
		$this->addb 	= m('admin');
		$this->whereobj = m('where');
	}
	
	private function getursss($mid, $uid=0)
	{
		if($uid==0)$uid = $this->adminid;
		if(isset($this->ursarr[$uid])){
			$this->urs	= $this->ursarr[$uid];
		}else{
			$this->urs 	= $this->db->getone('[Q]admin',$uid, 'id,name,deptpath,deptid,`type`');
			$this->ursarr[$uid] = $this->urs;
		}
		if(is_array($mid)){
			$this->modrs = $mid;
		}else{
			$this->modrs = $this->db->getone('[Q]flow_set'," (`id`='$mid' or `num`='$mid')");
		}
		if($this->modrs){
			$this->modeid = $this->modrs['id'];
			$this->isflow = $this->modrs['isflow'];
		}
	}
	
	//返回可查看條件
	public function viewwhere($mid, $uid=0, $ufid='')
	{
		$this->getursss($mid, $uid);
		return $this->getsswhere(0, $ufid);
	}
	
	//是否有新增權限
	public function isadd($mid, $uid=0)
	{
		$this->getursss($mid, $uid);
		$bo  = false;
		$type = $this->urs['type'];
		if($type==1)return true; //管理員有添加
		$bo  = $this->getsswhere(1);
		return $bo;
	}
	
	//是否有導入權限
	public function isdaoru($mid, $uid=0)
	{
		$this->getursss($mid, $uid);
		$bo  = $this->getsswhere(4);
		return $bo;
	}
	
	
	//是否有編輯數據權限
	public function editwhere($mid, $uid=0)
	{
		$this->getursss($mid, $uid);
		return $this->getsswhere(2);
	}
	
	//是否有刪除數據權限
	public function deletewhere($mid, $uid=0)
	{
		$this->getursss($mid, $uid);
		return $this->getsswhere(3);
	}
	
	private function getsswhere($type, $ufid='')
	{
		$mid	= $this->modeid;
		$where 	= $this->addb->getjoinstr('receid', $this->urs);
		if($ufid=='')$ufid = 'uid';
		$uid	= $this->urs['id'];
		$rows 	= $this->getall('`type`='.$type.' and `modeid`='.$mid.' and `status`=1 '.$where.'','wherestr,whereid');
		$wehs	= array();
		$count  = $this->db->count;
		if($type==1 || $type==4){
			return $count>0;
		}
		if($type== 0 && $count==0 && $this->isflow==1){
			$rows[] = array('wherestr'=>$this->rock->jm->base64encode('uid={uid}'),'whereid'=>0);
		}
		foreach($rows as $k=>$rs){
			$sw = $this->rock->jm->base64decode($rs['wherestr']);
			if($sw=='{receid}'){
				$sw = $this->addb->getjoinstr('receid', $this->urs, 1);
			}
			//我所有下屬的下屬
			if($sw=='{allsuper}'){
				$sw = "`$ufid` in(select `id` from `[Q]admin` where instr(`superpath`,'[$uid]')>0)";
			}
			//我的直屬下屬
			if($sw=='{super}'){
				$sw1= $this->rock->dbinstr('superid',$uid);
				$sw = "`$ufid` in(select `id` from `[Q]admin` where $sw1)";
			}
			//同一個部門下人員
			if($sw=='{dept}' && !isempt($this->urs['deptid'])){
				$sw = "`$ufid` in(select `id` from `[Q]admin` where `deptid`=".$this->urs['deptid'].")";
			}
			//所有數據
			if($sw=='all'){
				return ' and 1=1';
			}
			if(!isempt($sw)){
				$sw 	= $this->whereobj->getstrwhere($sw, $uid, $ufid);
				$sw 	= str_replace('{asqom}','', $sw);
				$sw 	= '('.$sw.')';
				$wehs[] = $sw;
			}
			$whereid = (int)$rs['whereid'];
			if($whereid>0){
				$sww = $this->whereobj->getwherestr($whereid, $uid, $ufid, 1);
				if($sww!='')$wehs[] = '('.$sww.')';
			}
		}
		$s = join(' or ', $wehs);
		if($s!=''){
			$s = ' and ('.$s.')';
		}else{
			$s = ' and 1=2';
		}
		return $s;
	}
}