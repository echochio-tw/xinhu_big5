<?php

class flow_meetClassModel extends flowModel
{
	public function initModel()
	{
		$this->hyarra 	= array('正常','會議中','結束','取消');
		$this->hyarrb 	= array('green','blue','#ff6600','#888888');
		$this->dbobj	= c('date');
	}
	
	public function flowrsreplace($rs, $lx=0)
	{
		$rs['week']  = $this->dbobj->cnweek($rs['startdt']);
		$zt 		 = $rs['state'];
		$nzt 		 = $zt;
		$time 		 = time();
		
		$stime 	= strtotime($rs['startdt']);
		$etime 	= strtotime($rs['enddt']);
		if($zt < 2){
			if($etime<$time){
				$nzt = 2;
			}else if($stime>$time){
				$nzt = 0;
			}else{
				$nzt = 1;
			}
		}
		
		if($zt != $nzt){
			$this->update('state='.$nzt.'', $rs['id']);
			$zt = $nzt;
		}
		
		$rs['ishui'] = ($zt>=2) ? 1 : 0;
		if($lx==1){
			$content 	 = '';
			$inpurl 	 = $this->getinputurl('meetjy',0,'def_mid='.$this->id.'');
			$rows 		 = $this->getrows('`mid`='.$this->id.' and `type`=2','id,content,optname,optdt,optid','id');
			//是否可以加會議紀要
			$dtss   = c('date')->adddate($this->rock->date,'d',-10).' 00:00:00';
			$addbo 	= $rs['startdt']>$dtss && $zt>0;
			$fobj   = m('file');
			foreach($rows as $k=>$rs1){
				$content.= '<div style="border-bottom:1px #cccccc solid;padding:5px">['.$rs1['optname'].']紀要';
				$inpurl1 = $this->getinputurl('meetjy',$rs1['id']);
				if($addbo && $rs1['optid']==$this->adminid)$content.= '&nbsp;<a href="'.$inpurl1.'" class="blue">[編輯]</a>';
				$content.= '：<br>'.$rs1['content'].'';
				$fstr 	 = $fobj->getstr('meet', $rs1['id'],1);
				if($fstr!='')$content.= '<br>'.$fstr.'';
				$content.= '</div>';
			}
			
			if($addbo){
				 $content.='&nbsp;<a href="'.$inpurl.'" class="blue">＋新增紀要</a>';
			}
			$rs['content']= $content;
			$rs['content_style'] = 'padding:0px';
		}
		$rs['state'] = $this->getstatezt($zt);
		$rs['nzt']	 = $zt;
		return $rs;
	}
	
	public function getstatezt($zt)
	{
		return '<font color="'.$this->hyarrb[$zt].'">'.$this->hyarra[$zt].'</font>';
	}
	
	protected function flowsubmit($na, $sm)
	{
		if($this->rs['status']==1){
			$cont  = '{optname}發起會議預定從{startdt}→{enddt},在{hyname},主題:{title}';
			$this->push($this->rs['joinid'], '會議', $cont);
		}
	}
	
	protected function flowaddlog($a)
	{
		$actname = $a['name'];
		if($actname == '取消會議'){
			$this->push($this->rs['joinid'], '會議', ''.$this->adminname.'取消會議【{title}】{startdt}→{enddt}');
			$this->update('`state`=3', $this->id);
		}
		if($actname == '結束會議'){
			$this->update('`state`=2', $this->id);
		}
	}
	
	
	protected function flowbillwhere($uid, $lx)
	{
		$dt 	= $this->rock->post('dt');
		$where 	= '';
		if($dt!='')$where.=" and startdt like '$dt%'";
		$fields	= 'id,startdt,enddt,optname,state,title,hyname,joinname,`explain`,jyname';
		return array(
			'fields' => $fields,
			'where'	 => $where,
			'order' => 'startdt desc'
		);
	}
}