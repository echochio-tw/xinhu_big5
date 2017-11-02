<?php
/**
	下載文件類插件
*/

class downChajian extends Chajian{
	
	private $upobj;
	private $messign;
	
	protected function initChajian()
	{
		$this->messign = '';
		$this->upobj = c('upfile');
	}
	
	/**
	*	獲取隨機文件名
	*/
	public function getallfilename($ext)
	{
		$mkdir 	= ''.UPDIR.'/'.date('Y-m').'';
		if(!is_dir($mkdir))mkdir($mkdir);
		$allfilename			= ''.$mkdir.'/'.date('d_His').''.rand(10,99).'.'.$ext.'';
		return $allfilename;
	}
	
	/**
	*	根據擴展名保存文件(一般郵件附件下載)
	*/
	public function savefilecont($ext, $cont)
	{
		$bo  = $this->upobj->issavefile($ext);
		if(isempt($cont))return;
		$file= '';
		if(!$bo){
			$file	= $this->getallfilename('uptemp');
			$bo 	= @file_put_contents($file, base64_encode($cont));
		}else{
			$file 	= $this->getallfilename($ext);
			$bo 	= @file_put_contents($file, $cont);
		}
		if(!$bo){
			$file = '';
		}else{
			if($this->upobj->isimg($ext)){
				$bo = $this->upobj->isimgsave($ext, $file);
				if(!$bo)$file = '';
			}
		}
		return $file;
	}
	
	private function reutnmsg($msg)
	{
		$this->messign = $msg;
		return false;
	}
	
	//獲取提示內容
	public function gettishi($msg1='')
	{
		$msg = $this->messign;
		if(isempt($msg))$msg = $msg1;
		return $msg;
	}
	
	/**
	*	根據內容創建文件
	*/
	public function createimage($cont, $ext, $filename, $thumbnail='')
	{
		if(isempt($cont))return $this->reutnmsg('創建內容為空');
		$allfilename			= $this->getallfilename($ext);
		$upses['oldfilename'] 	= $filename.'.'.$ext;
		$upses['fileext'] 	  	= $ext;
		@file_put_contents($allfilename, $cont);
		if(!file_exists($allfilename))return $this->reutnmsg('無法寫入:'.$allfilename.'');
		
		$fileobj				= getimagesize($allfilename);
		$mime					= strtolower($fileobj['mime']);
		$next 					= 'jpg';
		if(contain($mime,'bmp'))$next = 'bmp';
		if($mime=='image/gif')$next = 'gif';
		if($mime=='image/png')$next = 'png';
		if($ext != $next){
			@unlink($allfilename);
			$ext = $next;
			$allfilename			= $this->getallfilename($ext);
			$upses['oldfilename'] 	= $filename.'.'.$ext;
			$upses['fileext'] 	  	= $ext;
			@file_put_contents($allfilename, $cont);
			if(!file_exists($allfilename))return $this->reutnmsg('無法寫入:'.$allfilename.'');
		}
		
		$filesize 			  	= filesize($allfilename);
		$filesizecn 		  	= $this->upobj->formatsize($filesize);
		$picw					= $fileobj[0];				
		$pich					= $fileobj[1];
		if($picw==0||$pich==0){
			@unlink($allfilename);
			return $this->reutnmsg('無效的圖片');;
		}
		$upses['filesize']	 	= $filesize;
		$upses['filesizecn']	= $filesizecn;
		$upses['allfilename']	= $allfilename;
		$upses['picw']	 		= $picw;
		$upses['pich']	 		= $pich;
		$arr 					= $this->uploadback($upses, $thumbnail);
		return $arr;
	}
	
	public function uploadback($upses, $thumbnail='')
	{
		if($thumbnail=='')$thumbnail='150x150';
		$msg 		= '';
		$data 		= array();
		if(is_array($upses)){
			$arrs	= array(
				'adddt'	=> $this->rock->now,
				'valid'	=> 1,
				'filename'	=> $this->replacefile($upses['oldfilename']),
				'web'		=> $this->rock->web,
				'ip'		=> $this->rock->ip,
				'fileext'	=> substr($upses['fileext'],0,10),
				'filesize'	=> $upses['filesize'],
				'filesizecn'=> $upses['filesizecn'],
				'filepath'	=> str_replace('../','',$upses['allfilename']),
				'optid'		=> $this->adminid,
				'optname'	=> $this->adminname
			);
			$arrs['filetype'] = m('file')->getmime($arrs['fileext']);
			$thumbpath	= $arrs['filepath'];
			$sttua		= explode('x', $thumbnail);
			$lw 		= (int)$sttua[0];
			$lh 		= (int)$sttua[1];
			if($upses['picw']>$lw || $upses['pich']>$lh){
				$imgaa	= c('image', true);
				$imgaa->createimg($thumbpath);
				$thumbpath 	= $imgaa->thumbnail($lw, $lh, 1);
			}
			if($upses['picw'] == 0 && $upses['pich']==0)$thumbpath = '';
			$arrs['thumbpath'] = $thumbpath;
			
			
			$bo = $this->db->record('[Q]file',$arrs);
			if(!$bo)$this->reutnmsg($this->db->error());
			
			$id	= $this->db->insert_id();
			$arrs['id'] = $id;
			$arrs['picw'] = $upses['picw'];
			$arrs['pich'] = $upses['pich'];
			$data= $arrs;
		}else{
			$data['msg'] = $upses;
		}
		return $data;
	}
	
	//過濾特殊文件名
	private function replacefile($str)
	{
		$s 			= strtolower($str);
		$lvlaraa  	= explode(',','user(),found_rows,(),select*from,select*,%20');
		$lvlarab	= array();
		foreach($lvlaraa as $_i)$lvlarab[]='';
		$s = str_replace($lvlaraa, $lvlarab, $s);
		if($s!=$str)$str = $s;
		return $str;
	}
	
	//獲取擴展名
	public function getext($file)
	{
		return strtolower(substr($file,strrpos($file,'.')+1));
	}
}
