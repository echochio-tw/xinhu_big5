<?php
/**
*	此文件是流程模塊【company.公司單位】對應接口文件。
*/ 
class mode_companyClassAction extends inputAction{
	
	
	protected function savebefore($table, $arr, $id, $addbo){
		if($id>0 && $arr['pid']==$id)return '上級不能選自己';
		$name = $arr['name'];
		if(m($table)->rows("`name`='$name' and `id`<>$id")>0)return '名稱['.$name.']已存在';
	}
	
	protected function saveafter($table, $arr, $id, $addbo){
		m('company')->updatecompany($id, $arr['name']);
	}
	
	
	public function companydata()
	{
		return m('company')->getselectdata();
	}
	
	public function storebefore($table)
	{
		
		return array(
			'order' => '`sort`'
		);
	}
	
	public function storeafter($table, $rows)
	{
		$barr = array();
		m('company')->gettreedata($rows, $barr);
		return array(
			'rows' => $barr
		);
	}
}	
			