<?php 
/**
*	緩存，目前是使用磁盤文件存儲
*/
class cacheChajian extends Chajian{
	
	private $dirvie = 'file'; //redis,file
	
	/**
	*	設置緩存
	* 	$time 緩存時間(秒)
	*/
	public function set($key, $data, $time=0)
	{
		if(isempt($data))return $this->del($key);
		$sarr['key']  = $this->getkey($key);
		$sarr['data'] = $data;
		if($time>0){
			$time = time()+$time;
		}else{
			$time = 0;
		}
		$sarr['time'] = $time;
		$sarr['url']  = $this->rock->nowurl();
		return $this->rock->createtxt($this->getpath($key), json_encode($sarr));
	}
	
	private function getkey($key)
	{
		return ''.QOM.''.$key.'';
	}
	
	private function getpath($key)
	{
		$key = $this->getkey($key);
		return ''.UPDIR.'/cache/'.md5($key).'.cache';
	}
	
	/**
	*	獲取緩存
	*/
	public function get($key, $dev='')
	{
		$file= $this->getpath($key);
		$data= $dev;
		if(file_exists($file)){
			$cont = file_get_contents($file);
			if(!isempt($cont)){
				$sarr = json_decode($cont, true);
				$time = (int)arrvalue($sarr, 'time',0);
				if($time==0 || $time>=time()){
					$data = arrvalue($sarr, 'data');
				}else{
					$this->del($key); //已經過期了
				}
			}
		}
		return $data;
	}
	
	/**
	*	刪除緩存
	*/
	public function del($key)
	{
		$file= $this->getpath($key);
		if(file_exists($file))@unlink($file);
		return true;
	}
}                               