<?php
/*
*�ļ���LoginAction.class.php
*����ʱ�䣺2011-6-17
*ע�⣺
*/
class UserAction extends IndexAction
{
	public function Login()
	{
		$this->display();
	}


	function LoginVerify()
	{
		$user = new Model('user');
		if ($vo=$user->create())
		{
			dump($vo);
			$this->success('登录成功');
		}
		else
		{
			dump($vo);
			$this->error('登录失败');
		}
	}

}


?>