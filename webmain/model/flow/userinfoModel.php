<?php
class flow_userinfoClassModel extends flowModel
{
	public function initModel()
	{
		$this->statearr = explode(',','试用期,正式,实习生,兼职,临时工,离职');
	}
}