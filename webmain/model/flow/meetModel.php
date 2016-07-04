<?php

class flow_meetClassModel extends flowModel
{
	protected function flowsubmit($na, $sm)
	{
		$cont  = '{optname}发起会议预定从{startdt}→{enddt},在{hyname},主题:{title}';
		$this->push($this->rs['joinid'], '会议', $cont);
	}
}