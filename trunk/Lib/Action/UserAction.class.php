<?php
/*
*�ļ���LoginAction.class.php
*����ʱ�䣺2011-6-17
*ע�⣺
*/
class UserAction extends Action
{
	public function Login()
	{
		$this->display();
	}


	function LoginVerify()
	{
		if($_SESSION['verify']!= md5($_POST['verify']))
		{
			$this->error('验证码错误');
		}
		
		$user = new Model('User');
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