<?php
class mode_customerClassAction extends inputAction{
	

	protected function savebefore($table, $arr, $id, $addbo){
		$name 	= $arr['name'];
		$mobile = $arr['mobile'];
		$db 	= m($table);
		if($db->rows("`name`='$name' and `id`<>$id")>0)return '名称['.$name.']已存在';
		if(!isempt($mobile) && $db->rows("`mobile`='$mobile' and `id`<>$id")>0)return '手机号['.$mobile.']已存在';
	}
	
	
	protected function saveafter($table, $arr, $id, $addbo){
		$name = $arr['name'];
		m('custfina')->update("`custname`='$name'", "`custid`='$id'");
		m('custract')->update("`custname`='$name'", "`custid`='$id'");
		m('custsale')->update("`custname`='$name'", "`custid`='$id'");
	}
}