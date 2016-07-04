<?php
class flow_gongClassModel extends flowModel
{
	protected function flowchangedata(){
		$this->rs['content'] = c('html')->replace($this->rs['content']);
	}
	
	protected function flowsubmit($na, $sm)
	{
		$this->push($this->rs['receid'], '通知公告', $this->rs['title'], $this->rs['typename'],1);
	}
}