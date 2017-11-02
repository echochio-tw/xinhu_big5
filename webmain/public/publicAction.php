<?php 
class publicClassAction extends Action{
	
	//文檔預覽的
	public function fileviewerAction()
	{
		$id = (int)$this->get('id','0');
		$frs= m('file')->getone($id);
		if(!$frs)exit('文件的記錄不存在了1');
		$type 		= $frs['fileext'];
		$filepath 	= $frs['filepath'];
		if(!file_exists($filepath))exit('文件不存在了2');
		$types 		= ','.$type.',';
		//可讀取文件預覽的擴展名
		$vest 	= ',txt,log,html,htm,js,php,php3,cs,sql,java,json,css,asp,aspx,shtml,c,vbs,jsp,xml,bat,sh,';
		$docx	= ',doc,docx,xls,xlsx,';
		if(contain($docx, $types)){
			$filepath 	= $frs['pdfpath'];
			if(isempt($filepath)){
				$this->topdfshow($frs);
				return;
			}
			if(!file_exists($filepath)){
				$this->topdfshow($frs);
				return;
			}else{
				$exta = substr($filepath, -4);
				if($exta=='html')$this->rock->location($filepath);
			}
		}else if(contain($vest, $types)){
			$content  = file_get_contents($filepath);
			if(substr($filepath,-6)=='uptemp')$content = base64_decode($content);
			$bm =  c('check')->getencode($content);
			if(!contain($bm, 'utf')){
				$content = @iconv($bm,'utf-8', $content);
			}
			$this->smartydata['content'] = $content;
			$this->displayfile = ''.P.'/public/fileopen.html';
		}else if($type=='pdf'){
			
		}else{
			$this->topdfshow($frs);
			return;
			//exit('文件類型為['.$type.']，不支持在線預覽');
		}
		$str = 'mode/pdfjs/web/viewer.css';
		if(!file_exists($str))exit('未安裝預覽pdf插件，不能預覽該文件，可到信呼官網下查看安裝方法，<a target="_blank" href="'.URLY.'view_topdf.html">查看幫助?</a>。');
		$this->smartydata['filepath'] = $this->jm->base64encode($filepath);
	}
	
	private function topdfshow($frs)
	{
		$this->displayfile = ''.P.'/public/filetopdf.html';
		$this->smartydata['frs'] = $frs;
		$this->smartydata['ismobile'] = $this->rock->ismobile()?'1':'0';
	}
	
	public function changetopdfAjax()
	{
		if(!contain(PHP_OS,'WIN'))exit('只能在windows的服務器下轉化');
		$id = (int)$this->get('id','0');
		$frs= m('file')->getone($id);
		if(!$frs)exit('文件的記錄不存在了1');
		$type 		= $frs['fileext'];
		$types 		= ','.$type.',';
		$filepath 	= $frs['filepath'];
		if(!file_exists($filepath))exit('文件不存在了2');
		$docx		= ',doc,docx,xls,xlsx,';
		if(!contain($docx, $types))exit('只能doc,excel的文件類型才能轉化');
		$bo 		= c('socket')->topdf($frs['filepath'], $id, $type);
		if(!$bo || is_string($bo)){
			echo ''.$bo.'，<a target="_blank" class="zhu" href="'.URLY.'view_topdf.html">[查看幫助?]</a>';
		}else{
			echo 'ok';
		}
	}
}