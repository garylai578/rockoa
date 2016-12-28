<?php 
class testClassAction extends ActionNot{
	
	public function defaultAction()
	{
		$this->display = false;
		//m('flow')->initflow('daiban')->tododay();
		//echo c('zip')->unzip('abc.zip','./');
		//$rows 	= m('emailm')->receemail(1);
		
		//print_r($rows);
		
		
		echo ''.$this->now.'<br>';
	}
	
}