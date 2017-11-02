<?php 
/**
*	文件下載相關接口
*/
class fileClassAction extends apiAction
{
	
	/**
	*	獲取文件信息
	*/
	public function getfileAction()
	{
		$id 	= (int)$this->post('id',0);
		$rs 	= m('file')->getone($id);
		if(!$rs)$this->showreturn('', '文件不存在1', 201);
		$path 	= $rs['filepath'];
		if(isempt($path) || !file_exists($path))$this->showreturn('', '文件['.$rs['filename'].']不存在', 202);
		$rs['filetype']	= m('file')->getmime($rs['fileext']);
		$this->showreturn($rs);
	}
	
	/**
	*	下載文件
	*/
	public function downAction()
	{
		$id  = (int)$this->jm->gettoken('id');
		m('file')->download($id);
	}
}