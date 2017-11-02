<?php
/**
*	添加方法日志，和IP限制判斷
*/
function ipwhiteshow($ip, $rock){
	$iplist = ''.ROOT_PATH.'/config/iplist.php';
	$bool 	= 0;
	if(file_exists($iplist)){
		$iparr 	= require($iplist);
	}else{
		$iparr 	= array(
			'blackip' 	=> '',
			'whiteip'	=> '' 
		);
	}

	//白名單判斷
	$whiteip = $iparr['whiteip'];
	if($whiteip!=''){
		$whiteipa = explode(',', $whiteip);
		foreach($whiteipa as $ips){
			$bo = strpos($ip, $ips);
			if($bo===0 || $ips=='*'){
				$bool = 1; //可以訪問
				break;
			}
		}
	}
	
	//黑名單判斷
	if($bool==0){
		$blackip = $iparr['blackip'];
		if($blackip!=''){
			$blackipa = explode(',', $blackip);
			foreach($blackipa as $ips){
				$bo = strpos($ip, $ips);
				if($bo===0 || $ips=='*'){
					$bool = 2;//不能訪問
					break;
				}
			}
		}
	}

	$str = '';
	foreach($_SERVER as $k=>$v)$str.='['.$k.']：'.$v.chr(10).'';
	
	$str1 = '';
	foreach($_GET as $k=>$v)$str1.='['.$k.']：'.$v.chr(10).'';
	
	$str2 = '';
	foreach($_POST as $k=>$v)$str2.='['.$k.']：'.$v.chr(10).'';
	$act  = arrvalue($_SERVER,'REQUEST_METHOD');
	if($act=='POST' && $str2==''){
		$str2 = arrvalue($GLOBALS,'HTTP_RAW_POST_DATA');
	}
	
	//創建訪問日志
	$logs = ''.UPDIR.'/logs/'.date('Y-m-d').'/'.date('H').'/'.date('H.i.s').'_'.$act.'_'.$ip.'_'.rand(100,999).'.log';
	$logstr = '【datetime】：'.$rock->now.'
【URL】：'.$rock->nowurl().'	
【ACTION】：'.$act.'
【IP】：'.$ip.'
【GET】
'.$str1.'
【POST】
'.$str2.'
【SERVER】
'.$str.'	
';
	if(DEBUG)$rock->createtxt($logs, $logstr);
	
	
	if($bool==2)exit('您IP['.$ip.']禁止訪問我們站點，可聯系我們admin@rockoa.com');
}

function ipwhiteshows($ips, $rock){
	$ipa = explode(',', $ips); 
	foreach($ipa as $ip)ipwhiteshow($ip, $rock);
}
ipwhiteshows($rock->ip, $rock);