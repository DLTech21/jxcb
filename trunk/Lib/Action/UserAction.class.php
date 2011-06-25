<?php

class UserAction extends CommonAction
{
	public function userAdd()
	{
	$userdb = new Model('User');
	
	$db = $userdb->select();
	
	dump($db);
	
	}
}


?>