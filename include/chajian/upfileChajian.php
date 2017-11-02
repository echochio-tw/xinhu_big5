<?php
/**
	上傳文件類upfileChajian
	create：chenxihu
	createdt：2013-11-15
	explain：上傳文件類，可上傳任何文件類型
*/

class upfileChajian extends Chajian{
	
	public $ext;     //上傳類型
	public $maxsize; //上傳大小(MB)
	public $path;    //文件夾
	
	private $jpgallext		= '|jpg|png|gif|bmp|jpeg|';	//圖片格式
	
	//可上傳文件類型，也就是不保存為uptemp的文件
	private $upallfile		= '|doc|docx|xls|xlsx|ppt|pptx|pdf|swf|rar|zip|txt|gz|wav|mp3|mp4|flv|wma|chm|apk|amr|log|json|';
	
	/**
		初始化
		@param	$ext string 上傳類型
		@param	$path string 上傳目錄 如：upload|e|ee
		@param	$maxsize ing 上傳大小(MB)
	*/
	public function initupfile($ext,$path,$maxsize=1)
	{
		if($ext=='image')$ext = $this->jpgallext;
		$this->ext		= $ext;
		$this->maxsize	= $maxsize;
		$this->path		= $path;
	}
	
	private function _getmaxupsize($lx)
	{
		$iniMax = strtolower(ini_get($lx));
        if ('' === $iniMax) {
            return PHP_INT_MAX;
        }
        $max = ltrim($iniMax, '+');
        if (0 === strpos($max, '0x')) {
            $max = intval($max, 16);
        } elseif (0 === strpos($max, '0')) {
            $max = intval($max, 8);
        } else {
            $max = (int) $max;
        }
        switch (substr($iniMax, -1)) {
            case 't': $max *= 1024;
            case 'g': $max *= 1024;
            case 'm': $max *= 1024;
            case 'k': $max *= 1024;
        }
        return $max;
	}
	
	public function getmaxupsize()
	{
		$post = $this->_getmaxupsize('post_max_size');
		$upmx = $this->_getmaxupsize('upload_max_filesize');
		if($post < $upmx)$upmx = $post;
		return $upmx;
	}
	
	public function getmaxzhao()
	{
		$size = $this->getmaxupsize();
		$size = $size / 1024 / 1024;
		return (int)$size;
	}
	
	/**
	*	是否在可保存範圍內容
	*/
	public function issavefile($ext)
	{
		$bo 		= false;
		$upallfile	= $this->jpgallext.$this->upallfile;
		if($this->contain($upallfile, '|'.$ext.'|'))$bo = true;
		return $bo;
	}
	
	public function isimg($ext)
	{
		return $this->contain($this->jpgallext, '|'.$ext.'|');
	}
	
	/**
	*	判斷是不是圖片
	*/
	public function isimgsave($ext, $file)
	{
		$arr = array();
		if(!file_exists($file))return $arr;
		if($this->isimg($ext)){
			list($picw,$pich)	= getimagesize($file);
			if($picw==0||$pich==0){
				@unlink($file);
			}
			$arr[0] = $picw;
			$arr[1] = $pich;
		}
		return $arr;
	}
	
	/**
		上傳
		@param	$name	string	對應文本框名稱
		@param	$cfile	string	文件名心的文件名，不帶擴展名的
		@return	string/array
	*/
	public function up($name,$cfile='')
	{
		if(!$_FILES)return 'sorry!';
		$file_name		= $_FILES[$name]['name'];
		$file_size		= $_FILES[$name]['size'];//字節
		$file_type		= $_FILES[$name]['type'];
		$file_error		= $_FILES[$name]['error'];
		$file_tmp_name	= $_FILES[$name]['tmp_name'];
		$zongmax		= $this->getmaxupsize();	
		if($file_size<=0 || $file_size > $zongmax){
			return '文件為0字節/超過'.$this->formatsize($zongmax).'，不能上傳';
		}
		$file_sizecn	= $this->formatsize($file_size);
		$file_ext		= $this->getext($file_name);//文件擴展名
		
		
		$file_img		= $this->isimg($file_ext);
		$file_kup		= $this->issavefile($file_ext);
		
		
		if($file_error>0){
			$rrs = $this->geterrmsg($file_error);
			return $rrs;
		}
			
		if(!$this->contain('|'.$this->ext.'|', '|'.$file_ext.'|') && $this->ext != '*'){
			return '禁止上傳文件類型['.$file_ext.']';
		}
		
		if($file_size>$this->maxsize*1024*1024){
			return '上傳文件過大，限制在：'.$this->formatsize($this->maxsize*1024*1024).'內，當前文件大小是：'.$file_sizecn.'';
		}
		
		//創建目錄
		$zpath=explode('|',$this->path);
		$mkdir='';
		for($i=0;$i<count($zpath);$i++){
			$mkdir.=''.$zpath[$i].'/';
			if(!is_dir($mkdir))mkdir($mkdir);
		}
		
		//新的文件名
		$file_newname	= $file_name;
		$randname		= $file_name;
		if(!$cfile==''){
			$file_newname=''.$cfile.'.'.$file_ext.'';
		}else{
			$randname	= ''.date('d_His').''.rand(10,99).'';
			$file_newname=''.$randname.'.'.$file_ext.'';
		}
		
		$save_path	= ''.str_replace('|','/',$this->path);
		$allfilename= $save_path.'/'.$file_newname.'';
		$uptempname	= $save_path.'/'.$randname.'.uptemp';

		$upbool	 	= true;
		if(!$file_kup){
			$allfilename= $this->filesave($file_tmp_name, $file_newname, $save_path, $file_ext);
			if(isempt($allfilename))return '無法保存到'.$save_path.'';
		}else{
			$upbool		= @move_uploaded_file($file_tmp_name,$allfilename);
		}
		
		if($upbool){
			$picw=0;$pich=0;
			if($file_img){
				$fobj = $this->isimgsave($file_ext, $allfilename);
				if(!$fobj){
					return 'error:非法圖片文件';
				}else{
					$picw = $fobj[0];
					$pich = $fobj[1];	
				}
			}
			return array(
				'newfilename' => $file_newname,
				'oldfilename' => $file_name,
				'filesize'    => $file_size,
				'filesizecn'  => $file_sizecn,
				'filetype'    => $file_type,
				'filepath'    => $save_path,
				'fileext'     => $file_ext,
				'allfilename' => $allfilename,
				'picw'        => $picw,
				'pich'        => $pich
			);
		}else{
			return '上傳失敗：'.$this->geterrmsg($file_error).'';
		}
	}
	
	private function geterrmsg($code)
	{
		$arrs[1] = '上傳文件大小超過服務器允許上傳的最大值';
		$arrs[2] = '上傳文件大小超過HTML表單中隱藏域MAX_FILE_SIZE選項指定的值';
		$arrs[6] = '沒有找不到臨時文件夾';
		$arrs[7] = '文件寫入失敗';
		$arrs[8] = 'php文件上傳擴展沒有打開';
		$arrs[3] = '文件只有部分被上傳';
		$rrs 	 = '上傳失敗，可能是服務器內部出錯，請重試';
		if(isset($arrs[$code]))$rrs=$arrs[$code];
		return $rrs;
	}
	
	//返回文件大小
	public function formatsize($size)
	{
		$arr 	= array('Byte', 'KB', 'MB', 'GB', 'TB', 'PB');
		$e 		= floor(log($size)/log(1024));
		return number_format(($size/pow(1024,floor($e))),2,'.','').' '.$arr[$e];
	}
	
	//獲取擴展名
	public function getext($file)
	{
		return strtolower(substr($file,strrpos($file,'.')+1));
	}
	
	/**
	*	非法文件保存為臨時uptemp的形式
	*/
	public function filesave($oldfile, $filename, $savepath, $ext)
	{
		$file_kup	= $this->issavefile($ext);
		$ldisn 		= strrpos($filename, '.');
		if($ldisn>0)$filename = substr($filename, 0, $ldisn);
		$filepath 	= ''.$savepath.'/'.$filename.'.'.$ext.'';
		if(!$file_kup){
			$filebase64	= base64_encode(file_get_contents($oldfile));
			$filepath 	= ''.$savepath.'/'.$filename.'.uptemp';
			$bo 		= $this->rock->createtxt($filepath, $filebase64);
			@unlink($oldfile);
			if(!$bo)$filepath = '';
		}else{
		}
		return $filepath;
	}
}
