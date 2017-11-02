<?php
class hrClassAction extends Action
{
	//培訓考試
	public function kaoshiAction()
	{
		$id 	= (int)$this->get('id');
		m('flow:knowtraim')->reloadstate($id);//更新狀態
		
		$mrs 	= m('knowtraim')->getone($id);
		if(!$mrs)return '主題不存在';
		
		if($mrs['state']!='1')return '培訓考試題目可能還未開始或已結束了';
		
		$uid 	= $this->adminid;
		$ors 	= m('knowtrais')->getone('`mid`='.$id.' and `uid`='.$uid.'');
		if(!$ors)return '當前主題你不需要培訓考試';
		
		
		
		if($ors['isks']=='1')return '你已經考試過了分數:'.$ors['fenshu'].'';
		
		$tkids	= $ors['tkids'];
		$tkrows= array();
		if(!isempt($tkids)){
			$tkarr = m('knowtiku')->getall('id in('.$tkids.')','`id`,`title`,`typeid`,`type`,`ana`,`anb`,`anc`,`and`');
			$tkidsa= explode(',', $tkids);
			foreach($tkidsa as $ids){
				foreach($tkarr as $k=>$rs){
					$id = $rs['id'];
					if($ids==$id){
						$tkrows[] = $rs;
						break;
					}
				}
			}
		}
		
		$this->assign('tkrows', json_encode($tkrows));
		$this->assign('mrs', $mrs);
		$this->assign('ors', $ors);
	}
	
}