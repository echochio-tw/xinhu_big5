<?php
/**
*	此文件是流程模塊【knowtraim.考試培訓】對應接口文件。
*	可在頁面上創建更多方法如：public funciton testactAjax()，用js.getajaxurl('testact','mode_knowtraim|input','flow')調用到對應方法
*/ 
class mode_knowtraimClassAction extends inputAction{
	

	protected function savebefore($table, $arr, $id, $addbo){
		$dsshu	= abs((int)$arr['dsshu']);
		$dxshu	= abs((int)$arr['dxshu']);
		$state	= 0;
		if($arr['startdt']>=$arr['enddt'])return '開始時間不能大于截止時間';
		
		$where  = $this->flow->gettikuwhere($arr['tikuid']);
		$darr 	= $this->db->getall('SELECT `type`,count(1)stotal FROM `[Q]knowtiku` where `status`=1 '.$where.' group by `type`');
		$darrs 	= array(0,0);
		foreach($darr as $k=>$rs)$darrs[$rs['type']] = (int)$rs['stotal'];
		if($dsshu>$darrs[0])return '單選數量太多，題庫裡只有'.$darrs[0].'題';
		if($dxshu>$darrs[1])return '多選數量太多，題庫裡只有'.$darrs[1].'題';
		$now 	= $this->rock->now;
		if($arr['enddt']<$now){
			$state = 2;
		}else if($arr['startdt']<$now){
			$state = 1;
		}
		$rows['dsshu']	= $dsshu;
		$rows['dxshu']	= $dxshu;
		$rows['state']	= $state;
		
		return array(
			'rows' => $rows
		);
	}
	
		
	protected function saveafter($table, $arr, $id, $addbo){
		$receid	= $arr['receid'];
		$ustrs 	= m('admin')->gjoin($arr['receid'],'ud');
		$ustrsa	= explode(',', $ustrs);
		$dbs 	= m('knowtrais');
		$ids 	= '0';
		$reshu	= 0;
		foreach($ustrsa as $uid){
			$where 	= '`mid`='.$id.' and `uid`='.$uid.'';
			$sid 	= (int)$dbs->getmou('id', $where);
			if($sid==0){
				$where = '';
			}
			$uarr	= array(
				'mid' 	=> $id,
				'uid'	=> $uid
			);
			$sids	= $dbs->record($uarr, $where);
			if($sid==0)$sid = $this->db->insert_id();
			$ids .= ','.$sid.'';
			$reshu++;
		}
		$dbs->delete('`mid`='.$id.' and `id` not in('.$ids.')');
		m($table)->update('`reshu`='.$reshu.'', $id);
	}
	
	public function kstimelist()
	{
		$arrs = explode(',','10,20,30,45,60,70,80,90,100,110,120,130,140,150,160,170,180');
		$rows = array();
		foreach($arrs as $sj){
			$rows[] = array(
				'value' => $sj,
				'name' => $sj.'分鐘',
			);
		}
		return $rows;
	}
	
	public function knowtraimuserbefore($table)
	{
		$atype = $this->post('atype');
		$key   = $this->post('key');
		$mid   = $this->post('mid','0');
		$where = '';
		if($atype=='my')$where=' and a.`uid`='.$this->adminid.' ';
		if($mid!='0')$where.=' and a.`mid`='.$mid.'';
		if($key!='')$where.=m('admin')->getkeywhere($key,'c.',"or b.`title` like '%$key%'");
		m('flow:knowtraim')->reloadstate();
		return array(
			'table' => '`[Q]'.$table.'` a left join `[Q]knowtraim` b on a.mid=b.id left join `[Q]admin` c on c.id=a.`uid`',
			'where'	=> $where,
			'order'	=> 'a.id desc',
			'fields'=> 'a.*,b.title,b.state,b.startdt,b.enddt,c.`name`,c.deptname'
		);
	}
	public function knowtraimuserafter($table, $rows)
	{
		$mdos = m('flow:knowtraim');
		foreach($rows as $k=>$rs){
			$zt = $mdos->getstatestr($rs['state']);
			$rows[$k]['startdt'] = ''.substr($rs['startdt'],5,11).'至'.substr($rs['enddt'],5,11).'('.$zt.')';
			if($rs['fenshu']=='0' && $rs['isks']==0)$rows[$k]['fenshu']='';
			if(!isempt($rs['ksedt']))$rows[$k]['ksedt'] = ''.substr($rs['kssdt'],5,11).'至'.substr($rs['ksedt'],5,11).'';
			$strs 				= ($rs['isks']=='1') ? '<font color=green>已考試</font>' : '<font color=red>未考試</font>';
			if($rs['state']=='0')$strs='<font color="#888888">未開始</font>';
			$rows[$k]['isks']   = $strs;
			$rows[$k]['iskszt'] = $rs['isks'];
		}
		
		return array(
			'rows' => $rows
		);
	}
	
	//初始化考試
	public function initkaoshiAjax()
	{
		$sid = (int)$this->get('sid');
		$uid = $this->adminid;
		$dbs = m('knowtrais');
		$ors = $dbs->getone("`id`='$sid' and `uid`='$uid'");
		if(!$ors)return '記錄不存在';
		if($ors['isks']=='1')return '你已經考試過了';
		
		$dbss	= m('flow:knowtraim');
		$dbss->reloadstate($ors['mid']);//更新狀態
		
		$mrs = m('knowtraim')->getone($ors['mid']);
		if(!$mrs)return '記錄不存在';
		if($mrs['state']!='1')return '培訓考試題目可能還未開始或已結束了';
		
		$dxshu	= (int)$mrs['dxshu'];//多選
		$dsshu	= (int)$mrs['dsshu']; //單選
		$ids 	= '';
		
		$wheress= $dbss->gettikuwhere($mrs['tikuid']);
		$itros	= m('knowtiku')->getall('`status`=1 '.$wheress.'','id,`type`','`type`,`id`');
		$dxarr	= $dsarr = array();
		foreach($itros as $k=>$rs){
			if($rs['type']=='0')$dsarr[] = $rs;
			if($rs['type']=='1')$dxarr[] = $rs;
		}
		
		for($i=1;$i<=$dsshu; $i++){
			$idarr = $this->getrandts($dsarr);
			$dsarr = $idarr['rows'];
			$idss  = $idarr['id'];
			if($idss=='0')return '單選的題庫不夠';
			$ids  .= ','.$idss.'';
		}
		
		for($i=1;$i<=$dxshu; $i++){
			$idarr = $this->getrandts($dxarr);
			$dxarr = $idarr['rows'];
			$idss  = $idarr['id'];
			if($idss=='0')return '多選的題庫不夠';
			$ids  .= ','.$idss.'';
		}
		
		if($ids!='')$ids = substr($ids,1);
		
		$uarr['tkids'] = $ids;
		$uarr['kssdt'] = $this->rock->now;
		
		$dbs->update($uarr, $sid);
		
		
		return 'ok';
	}
	//隨機獲取題目
	private function getrandts($arr)
	{
		$id 	= '0';
		$nearr = array();
		if($arr){
			$len= count($arr);
			$rnd= rand(0, $len-1);
			$id = arrvalue($arr[$rnd],'id');
			for($i=0;$i<$len;$i++)if($i!=$rnd)$nearr[]=$arr[$i];
		}
		return array(
			'rows' => $nearr,
			'id'	=> $id
		);
	}
	
	//提交答案
	public function datitijAjax()
	{
		$oi 	= (int)$this->get('oi');
		$sid 	= (int)$this->get('sid');
		$tid 	= (int)$this->get('tid');
		$dy 	= $this->get('dy');
		$uid = $this->adminid;
		$dbs = m('knowtrais');
		$ors = $dbs->getone("`id`='$sid' and `uid`='$uid'");
		if(!$ors)return '記錄不存在';
		
		$trs = m('knowtiku')->getone($tid);
		$answer	= strtoupper($trs['answer']);
		$mid 	= $ors['mid'];
		$mrs = m('knowtraim')->getone($mid);
		
		$tkids = $ors['tkids'];
		$dyids = $ors['dyids'];
		$dyidsa= explode(',', $dyids);
		$tkidsa= explode(',', $tkids);
		$dyjgsa= explode(',', $ors['dyjgs']);
		$danva =  $jgarr = array();
		
		$zfenshu = floatval($mrs['zfenshu']); //總分
		$hgfen   = floatval($mrs['hgfen']); //合格的分數
		
		$tmshu	= count($tkidsa);//題目數
		$dfen 	= 0;
		$meifen = $zfenshu/$tmshu;
		$jg		= '0';
		foreach($tkidsa as $k=>$xu){
			if($k!=$oi){
				$danva[$k]  = arrvalue($dyidsa, $k);
				$jgarr[$k]  = arrvalue($dyjgsa, $k,'0');
			}else{
				$danva[$k]  = $dy;
				$jg = '2';
				if($answer == $dy)$jg='1';
				$jgarr[$k]	= $jg;
			}
		}
		
		$days = $jgs = '';
		foreach($danva as $k=>$v)$days.=','.$v.'';
		$days = substr($days, 1);
		
		foreach($jgarr as $k=>$v){
			$jgs.=','.$v.'';
			if($v=='1')$dfen+=$meifen;
		}
		$jgs = substr($jgs, 1);
		$barr= array(
			'dyids' => $days,
			'dyjgs' => $jgs,
			'ksedt' => $this->rock->now,
			'kstime'=> $this->get('sj'),
			'isks'  => 1,
 			'fenshu'=> $dfen
		);
		$dbs->update($barr, $sid);
		
		if($oi==0)m('flow:knowtraim')->reloadstate($mid);
		
		if($jg=='2')return '錯了，正確是：'.$answer.'';
		
		return 'ok';
	}
	
	public function finfishAjax()
	{
		$sid 	= (int)$this->get('sid');
		$dbs 	= m('knowtrais');
		$barr= array(
			'ksedt' => $this->rock->now,
			'kstime'=> $this->get('sj'),
			'isks'  => 1
		);
		$dbs->update($barr, $sid); //更新
		m('flow:knowtraim')->reloadstate();
		return $dbs->getmou('fenshu', $sid);
	}
	
	//標識可重新考試
	public function biaoshiAjax()
	{
		$fid = $this->post('fid','0');
		m('knowtrais')->update(array(
			'kssdt' => '',
			'ksedt' => '',
			'fenshu' => '0',
			'kstime' => '0',
			'isks' => '0',
			'tkids' => '',
			'dyids' => '',
			'dyjgs' => '',
		),"`id` in($fid) and `mid` in(select `id` from `[Q]knowtraim` where `state`<>2)");
	}
	
	
	public function tongjiAjax()
	{
		$mid 	= (int)$this->post('mid');
		$arows 	= m('knowtrais')->getall('`mid`='.$mid.'');
		$mrs 	= m('knowtraim')->getone($mid);
		$hgfen  = floatval($mrs['hgfen']); //合格的分數
		$hgshu 	= $wks = $bhg =0;
		$zshu 	= 0;
		foreach($arows as $k=>$rs){
			if($rs['isks']=='0'){
				$wks++;
			}else{
				$fs = floatval($rs['fenshu']);
				if($fs>=$hgfen){
					$hgshu++;
				}else{
					$bhg++;
				}
			}
			$zshu++;
		}
		
		$rows[]	= array(
			'name' => '合格',
			'value'=> $hgshu
		);
		$rows[]	= array(
			'name' => '不合格',
			'value'=> $bhg
		);
		$rows[]	= array(
			'name' => '未考試',
			'value'=> $wks
		);
		foreach($rows as $k=>$rs){
			$bili  = $this->rock->number($rs['value']/$zshu*100);
			$rows[$k]['bili'] = ''.$bili.'%';
		}
		$rows[]	= array(
			'name' => '合計',
			'value'=> $zshu
		);
		return array(
			'rows' => $rows
		);
	}
	
	
	//讀取對應題庫
	public function tikunamedata()
	{
		$rows = $this->option->getselectdata('knowtikutype', true);
		$arr  = array();
		foreach($rows as $k=>$rs){
			$rows[$k]['value'] = $rs['id'];
			$rows[$k]['name'] = $rs['nameo'];
			$arr[] = array(
				'value' => $rs['id'],
				'name'  => $rs['nameo'],
				'padding'  => $rs['padding'],
			);
		}
		return $rows;
	}
}	
			