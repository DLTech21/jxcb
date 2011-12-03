<?php
/*
 *�ļ���PublicAction.class.php
 *����ʱ�䣺2011-6-25
 *ע�⣺
 */
class PublicAction extends Action
{
	// 检查用户是否登录

	protected function checkUser()
	{
		if(!isset($_SESSION[C('USER_AUTH_KEY')]))
		{
			$this->assign('jumpUrl','Public/login');
			$this->error('没有登录');
		}
	}

	// 顶部页面
	public function top()
	{
		C('SHOW_RUN_TIME',false);			// 运行时间显示
		C('SHOW_PAGE_TRACE',false);
		$model	=	M("Group");
		$list	=	$model->where('status=1')->getField('id,title');
		$this->assign('nodeGroupList',$list);
		$this->display();
	}
	// 尾部页面
	public function footer()
	{
		C('SHOW_RUN_TIME',false);			// 运行时间显示
		C('SHOW_PAGE_TRACE',false);
		$this->display();
	}
	// 菜单页面
	public function menu()
	{
		$this->checkUser();
		if(isset($_SESSION[C('USER_AUTH_KEY')]))
		{
			//显示菜单项
			$menu  = array();
			if(isset($_SESSION['menu'.$_SESSION[C('USER_AUTH_KEY')]]))
			{

				//如果已经缓存，直接读取缓存
				$menu   =   $_SESSION['menu'.$_SESSION[C('USER_AUTH_KEY')]];
			}
			else
			{
				//读取数据库模块列表生成菜单项
				$node    =   M("Node");
				$id	=	$node->getField("id");
				$where['level']=2;
				$where['status']=1;
				$where['pid']=$id;
				$list	=	$node->where($where)->field('id,name,group_id,title')->order('sort asc')->select();
				$accessList = $_SESSION['_ACCESS_LIST'];
				foreach($list as $key=>$module)
				{
					if(isset($accessList[strtoupper(APP_NAME)][strtoupper($module['name'])]) || $_SESSION['administrator'])
					{
						//设置模块访问权限
						$module['access'] =   1;
						$menu[$key]  = $module;
					}
				}
				//缓存菜单访问
				$_SESSION['menu'.$_SESSION[C('USER_AUTH_KEY')]]	=	$menu;
			}
			if(!empty($_GET['tag']))
			{
				$this->assign('menuTag',$_GET['tag']);
			}
			//dump($menu);
			$this->assign('menu',$menu);
		}
		C('SHOW_RUN_TIME',false);			// 运行时间显示
		C('SHOW_PAGE_TRACE',false);
		$this->display();
	}

	// 后台首页 查看系统信息
	public function main()
	{
		$info = array(
            '操作系统'=>PHP_OS,
            '运行环境'=>$_SERVER["SERVER_SOFTWARE"],
            'PHP运行方式'=>php_sapi_name(),
            'ThinkPHP版本'=>THINK_VERSION.' [ <a href="http://thinkphp.cn" target="_blank">查看最新版本</a> ]',
            '上传附件限制'=>ini_get('upload_max_filesize'),
            '执行时间限制'=>ini_get('max_execution_time').'秒',
            '服务器时间'=>date("Y年n月j日 H:i:s"),
            '北京时间'=>gmdate("Y年n月j日 H:i:s",time()+8*3600),
            '服务器域名/IP'=>$_SERVER['SERVER_NAME'].' [ '.gethostbyname($_SERVER['SERVER_NAME']).' ]',
            '剩余空间'=>round((@disk_free_space(".")/(1024*1024)),2).'M',
            'register_globals'=>get_cfg_var("register_globals")=="1" ? "ON" : "OFF",
            'magic_quotes_gpc'=>(1===get_magic_quotes_gpc())?'YES':'NO',
            'magic_quotes_runtime'=>(1===get_magic_quotes_runtime())?'YES':'NO',
		);
		$this->assign('info',$info);
		$this->display();
	}

	public function index()
	{
		redirect(__APP__);
	}

	public function login()
	{
		if(!isset($_SESSION[C('USER_AUTH_KEY')]))
		{
			$this->display();
		}
		else
		{
			$this->redirect('Index/index');
		}
	}

	public function checkLogin()
	{
		if(empty($_POST['account']))
		{
			$this->error('帐号错误！');
		}
		elseif (empty($_POST['password']))
		{
			$this->error('密码必须！');
		}
		elseif (empty($_POST['verify']))
		{
			$this->error('验证码必须！');
		}

		//生成认证条件
		$map            =   array();
		// 支持使用绑定帐号登录
		$map['account']	= $_POST['account'];
		/*
		 $map["status"]	=	array('gt',0);
		 */
		if($_SESSION['verify'] != md5($_POST['verify']))
		{
			$this->error('验证码错误！');
		}

		import ( 'ORG.Util.RBAC' );

		$authInfo = RBAC::authenticate($map);
		//使用用户名、密码和状态的方式进行认证
		if(false === $authInfo) {
			$this->error('帐号不存在或已禁用！');
		}else {
			if($authInfo['password'] != pwdHash($_POST['password'])) {
				$this->error('密码错误！');
			}
			$_SESSION[C('USER_AUTH_KEY')]		=	$authInfo['id'];
			$_SESSION['email']					=	$authInfo['email'];
			$_SESSION['loginUserName']		=	$authInfo['account'];
			$_SESSION['loginNickName']		=	$authInfo['nickname'];
			$_SESSION['lastLoginTime']		=	$authInfo['last_login_time'];
			$_SESSION['login_count']			=	$authInfo['login_count'];

			if($authInfo['account']			=='admin')
			{
				$_SESSION['administrator']	=	true;
			}
			//保存登录信息
			$User	=	M('User');
			$ip		=	get_client_ip();
			$time	=	time();
			$data = array();
			$data['id']	=	$authInfo['id'];
			$data['last_login_time']	=	$time;
			$data['login_count']	=	array('exp','login_count+1');
			$data['last_login_ip']	=	$ip;
			$User->save($data);


			// 缓存访问权限
			RBAC::saveAccessList();
			$this->success('登录成功！');

		}
	}

	public function loginOut()
	{
		if(isset($_SESSION[C('USER_AUTH_KEY')]))
		{
			unset($_SESSION[C('USER_AUTH_KEY')]);
			unset($_SESSION);
			session_destroy();
			$this->assign("jumpUrl",__URL__.'/login/');
			$this->success('登出成功！');
		}
		else
		{
			$this->error('已经登出！');
		}
	}

/*验证码设置
 *      语法：buildImageVerify(length, mode, type, width, height, verifyName)
 *
 * 		length： 验证码字符个数，默认为 4 位。
 *      mode：   验证码字符类型，默认为数字。其他支持类型有：0字母 1数字 2大写字母 3小写字母 4中文 5混合（去掉了容易混淆的字符oOLl和数字01）。
 *  	type：   验证码的图片类型，默认为 png 。
 *    	width：	 验证码图片的宽度，默认根据验证码长度自动计算。
 * 		height： 验证码图片的高度，默认为 22px 。
 * 		verifyName： 验证码的 SESSION 注册名称，默认为 verify 。

 **/
	function verify()
	{
		import('ORG.Util.Image');
		Image::buildImageVerify(4,5,png,40,28);
	}
}

?>