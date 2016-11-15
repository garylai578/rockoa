<?php 
class indexClassAction extends ActionNot{
	
	public function initAction()
	{
		$this->mweblogin();
	}
	
	public function defaultAction()
	{
		$this->title = getconfig('apptitle','信呼');
	}
	
	
}