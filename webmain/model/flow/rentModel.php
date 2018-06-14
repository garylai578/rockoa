<?php
/**
 * Created by PhpStorm.
 * User: laiguanhui
 * Date: 2018/6/6
 * Time: 16:03
 */
class flow_rentClassModel extends flowModel
{
    protected function flowbillwhere($uid, $lx)
    {
        return array(
            'order' => 'nextdt ',
            'table'	=> '`[Q]'.$this->mtable.'` a left join (select max(checkdt) as checkdt, mid  from `[Q]rentdetail`  group by `mid`) b on b.`mid`=a.id ',
            'asqom' => 'a.',
            'fields'=> 'a.*, b.checkdt as lastdt, date_add(b.checkdt, interval a.interval MONTH) as nextdt'   //这个就是rock_page_rent.php中text里的dataIndex名称，要一一对应
        );
    }
}