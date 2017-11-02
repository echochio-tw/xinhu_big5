<?php
/**
*	此文件是流程模塊【remind.單據提醒設置】對應接口文件。
*	可在頁面上創建更多方法如：public funciton testactAjax()，用js.getajaxurl('testact','mode_remind|input','flow')調用到對應方法
*/ 
class mode_remindClassAction extends inputAction{
	
	
	protected function savebefore($table, $arr, $id, $addbo){
		$modenum = $arr['modenum'];
		$rows	 = array();
		$rows['table'] = m('flow_set')->getmou('`table`', "`num`='$modenum'");
		
		$where 	 = "`uid`='$this->adminid' and `modenum`='$modenum' and `mid`='".$arr['mid']."' and `id`<>$id";
		if($this->flow->rows($where)>0)return '你已設置這單據提醒了';
		
		return array(
			'rows' => $rows
		);
	}
	
	
	protected function saveafter($table, $arr, $id, $addbo){
		
	}
	
	public function ratevalset()
	{
		$rate		= arrvalue($this->rs, 'rate');
		$rateval	= arrvalue($this->rs, 'rateval');;
		$str		= '<div id="pinlv">';
		
		$ratea		= explode(',', $rate);
		$rateb		= explode(',', $rateval);
		$len 		= count($ratea);
		$selarr['o'] = '僅一次';
		$selarr['h'] = '每小時';
		$selarr['d'] = '每天';
		$selarr['g'] = '每工作日';
		$selarr['x'] = '每休息日';
		$selarr['w1'] = '每週一';
		$selarr['w2'] = '每週二';
		$selarr['w3'] = '每週三';
		$selarr['w4'] = '每週四';
		$selarr['w5'] = '每週五';
		$selarr['w6'] = '每週六';
		$selarr['w7'] = '每週日';
		$selarr['m']  = '每月';
		$selarr['y']  = '每年';
		$isbr 		  = $this->rock->ismobile() ? '<br>' : '';
		for($i=0; $i<$len; $i++){
			$selstr	= '';
			$v1 	= $ratea[$i];
			$v2a 	= explode('|', $rateb[$i]);
			$v2 	= $v2a[0];
			$v3 	= arrvalue($v2a, 1);
			foreach($selarr as $k=>$v){
				$slde 	= ($k==$v1) ? 'selected' : '';
				$selstr.='<option value="'.$k.'" '.$slde.'>'.$v.'</option>';
			}
			
			$fontss = ($v1=='h')?'':'none';
			$stsnn  = ($i>0)? 'style="padding-top:10px;margin-top:10px;border-top:1px #cccccc solid"' : '';
			$str .= '<div '.$stsnn.'><select onchange="changerate(this)" style="width:auto" class="inputs" name="rave_pinlvs1">'.$selstr.'</select>';
			$str.= '<input onblur="changeblur(this)"  style="width:auto" class="inputs datesss" onclick="js.datechange(this,\'datetime\')" readonly value="'.$v2.'" name="rave_pinlvs2" type="text">'.$isbr.'<font style="display:'.$fontss.'">&nbsp;每天截止至&nbsp;<input onblur="changeblur2(this)"  style="width:80px" class="inputs datesss" onclick="js.datechange(this,\'time\')" readonly value="'.$v3.'" name="rave_pinlvs3" type="text"></font>'.$isbr.'<input type="button" onclick="changeadd(this)" value="＋" class="webbtn"><input onclick="changejian(this)" type="button" value="－" class="webbtn">&nbsp;<span></span>';
			$str.= '</div>';
		}
		
		$str .= '</div>';
		
		return $str;
	}
}	
			