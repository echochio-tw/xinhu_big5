<?php
class modeClassAction extends ActionNot
{
	public function initAction()
	{
		$aid 	= (int)$this->get('adminid');
		$token 	= $this->get('token');
		$aid 	= m('login')->autologin($aid, $token);
		if($aid==0){
			$this->mweblogin(1);
		}
		$this->getlogin(1);
	}

	public function defaultAction()
	{
		$fn	 	= $this->get('fn');
		$title 	= $this->rock->jm->base64decode($this->get('title'));
		if($title!='')$this->title = $title;
		$path 	= P.'/task/mode/html/'.$fn.'.html';
		if(!file_exists($path))exit('not found '.$fn.'');
		$this->displayfile = $path;
	}
	
	//移動端頁面詳情
	public function xAction()
	{
		$num = $this->get('modenum');
		if($num=='')$num=$this->get('num');
		
		$mid 	 = (int)$this->get('mid');
		if($num=='' || $mid==0)exit('無效請求');
		
		
		$arr 	 = m('flow')->getdatalog($num, $mid, 1);
		$pagetitle 		= $arr['title'];
		$this->title 	= $arr['title'];
		if($pagetitle=='')$pagetitle = $arr['modename'];
		$this->smartydata['arr'] = $arr;
		
		$spagepath 	= P.'/flow/page/viewpage_'.$num.'_1.html';
		if(!file_exists($spagepath))$spagepath 	= P.'/flow/page/viewpage_'.$num.'.html';
		if(!file_exists($spagepath)){
			$spagepath = '';
		}
		$isheader = 0;
		if($this->web != 'wxbro' && $this->web != 'xinhu' && $this->web != 'ding' && $this->get('show')=='we')$isheader=1;
		$this->assign('isheader', $isheader);
		$this->smartydata['spagepath']		= $spagepath;
		$this->smartydata['pagetitle']		= $pagetitle;
		
		$inputjspath	= P.'/flow/input/inputjs/mode_'.$num.'.js';
		if(!file_exists($inputjspath)){
			$inputjspath = '';
		}
		$this->smartydata['inputjspath']	= $inputjspath;
	}
	
	//pc端頁面詳情
	public function pAction()
	{
		$num = $this->get('modenum');
		if($num=='')$num=$this->get('num');
		
		$mid 	 = (int)$this->get('mid');
		if($num=='' || $mid==0)exit('無效請求');
		$stype 			= $this->get('stype');
		
		$arr 	 		= m('flow')->getdatalog($num, $mid, 0);
		
		$pagetitle 		= $arr['title'];
		$this->title 	= $arr['title'];
		if($pagetitle=='')$pagetitle = $arr['modename'];
		$this->smartydata['arr'] = $arr;
		
		$spagepath 	= P.'/flow/page/viewpage_'.$num.'_0.html';
		if(!file_exists($spagepath))$spagepath 	= P.'/flow/page/viewpage_'.$num.'.html';
		if(!file_exists($spagepath)){
			$spagepath = '';
		}
		$this->smartydata['spagepath']		= $spagepath;
		$this->smartydata['pagetitle']		= $pagetitle;
		$this->assign('stype', $stype);
		if($stype=='word'){
			m('file')->fileheader($arr['modename'].'.doc');
		}
		$this->smartydata['bordercolor']	= getconfig('bcolorxiang', '#888888');
		
		$inputjspath	= P.'/flow/input/inputjs/mode_'.$num.'.js';
		if(!file_exists($inputjspath)){
			$inputjspath = '';
		}
		$this->smartydata['inputjspath']	= $inputjspath;
	}
	
	//下載
	public function downAction()
	{
		$this->display = false;
		$id  = (int)$this->jm->gettoken('id');
		m('file')->show($id);
	}
	
	
	
	
	
	
	
	
	
	//導出頁面
	public function eAction()
	{
		$num	= $this->get('num');
		$event	= $this->get('event');
		$stype	= $this->get('stype');
		
		$arr 	= m('flow')->printexecl($num, $event);
		$this->title = $arr['moders']['name'];
		$urlstr	= '?a=e&num='.$num.'&event='.$event.'';
		$this->assign('arr', $arr);
		$this->assign('urlstr', $urlstr);
		$this->assign('stype', $stype);
		if($stype!=''){
			$filename = $this->title;
			header('Content-type:application/vnd.ms-excel');
			header('Content-disposition:attachment;filename='.iconv("utf-8","gb2312",$filename).'.'.$stype.'');
		}
	}
	
	//郵件上打開詳情
	public function aAction()
	{
		$num = $this->get('num');
		$mid = $this->get('mid');
		$act = 'p';
		if($this->rock->ismobile())$act='x';
		$url = 'task.php?a='.$act.'&num='.$num.'&mid='.$mid.'';
		$this->rock->location($url);
	}
}