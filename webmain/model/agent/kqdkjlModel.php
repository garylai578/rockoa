<?php
class agent_kqdkjlClassModel extends agentModel
{
	
	protected function agentrows($rows, $rowd, $uid){
		$bils = m('flowbill');
		foreach($rowd as $k=>$rs){
			if($this->moders){
				$rows[$k]['modename'] 	= $this->moders['name'];
				$rows[$k]['modenum'] 	= $this->moders['num'];
				if(isset($rs['status'])){
					$zts = $bils->getstatus($rs['status'], 1);
					$rows[$k]['statustext'] 	= $zts[0];
					$rows[$k]['statuscolor'] 	= $zts[1];
					if($rs['status']==5)$rows[$k]['ishui'] = 1;
				}
			}
		}
		return $rows;
	}
}