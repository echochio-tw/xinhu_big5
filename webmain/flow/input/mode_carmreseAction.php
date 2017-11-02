<?php

class mode_carmreseClassAction extends inputAction{
	
	
	protected function savebefore($table, $arr, $id, $addbo){
		$msg 	 	= '';
		$startdt 	= $arr['startdt'];
		$enddt 		= $arr['enddt'];
		$carid		= $arr['carid'];
		if($startdt>=$enddt)$msg='截止時間小于開始時間，不科學啊';
		if($msg==''){
			$where = "id <>'$id' and `carid` = '$carid' and `status` in(0,1) and ((`startdt`<='$startdt' and `enddt`>='$startdt') or (`startdt`<='$enddt' and `enddt`>='$enddt') or (`startdt`>='$startdt' and `enddt`<='$enddt'))";
			if(m($table)->rows($where)>0)$msg='車輛該時間段已被預定了';
		}
		return array('msg'=>$msg);
	}
	
	
	protected function saveafter($table, $arr, $id, $addbo){
		
	}
	
	
}	
			