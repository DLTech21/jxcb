<?php

class UserAction extends CommonAction
{
	public function show()
	{
	$userdb = M('User');
	
	import('ORG.Util.Page');//导入分页
	
	$sum = $userdb->count();//计算记录总数
	
	$page = new Page($sum, 5);//实例化分页
	
	$list = $userdb->limit($page->firstRow.','.$page->listRows)->order('id desc')->findAll();
	
	$fenye = $page->show();
	
	$this->assign('page', $fenye);
	
	$this->assign('list', $list);
	
	$this->display();
	
	//dump($db);
	
	}
	
	
	public function insert()
	{
		$node = M('Node');
		$no = $node->select();
		dump($no);
	}
	
	public function del()
	{
		
	}
	
	public function edit()
	{
		
	}
	
	public function update()
	{
		
	}
	
	
}


?>