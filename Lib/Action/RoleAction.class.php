<?php
/*
*�ļ���RoleAction.class.php
*����ʱ�䣺2011-6-27
*ע�⣺
*/
class RoleAction extends CommonAction
{
	public function show()
	{
		$role = D('Role');
		$list = $role->field("id, name, pid, status, remark")->select();
		dump($list);
		
	}
	
	public function add()
	{
		
	}
	
	
	public function del()
	{
		
	}
	
	
	public function update()
	{
		
	}
	
	public function edit()
	{
		
	}
	
}

?>