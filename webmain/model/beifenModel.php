<?php
class beifenClassModel extends Model
{
	public function start()
	{
		$alltabls 	= $this->db->getalltable();
		$data = array();
		foreach($alltabls as $tabs){
			$rows  	= $this->db->getall('select * from '.$tabs.'');
			$fields	= $this->db->gettablefields($tabs);
			$data[$tabs] = array(
				'fields' 	=> $fields,
				'data'		=> $rows
			);
		}
		$rnd  = str_shuffle('abcedfghijk').rand(1000,9999);
		$file = ''.date('Ymd').'_'.$rnd.'.json';
		$this->rock->createtxt('upload/data/'.$file.'', json_encode($data));
		return true;
	}
}