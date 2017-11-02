<?php 
/**
*	win下將word轉html
*/
class officeChajian extends Chajian{


	public function tohtml($path)
	{
		if(!class_exists('COM'))return '沒有開啟COM組件';
		$word = new COM('Word.Application');
		$word->Visible = true; //可看見
		$word->Documents->Open($path);
		 
		$word->Documents[1]->SaveAs('upload/abc.html',8);
	}
}