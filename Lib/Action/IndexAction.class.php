<?php
// 本文档自动生成，仅供测试运行
class IndexAction extends Action
{
    /**
    +----------------------------------------------------------
    *判断用户是否登录
    +----------------------------------------------------------
    */
    public function index()
    {
    	if (!Session::is_set(C('USER_AUTH_KEY')))
    	{
    		$this->redirect('User/Login');
    	}
    	else 
    	{
    		$msg=Session::get(C('USER_AUTH_KEY')).'欢迎你回来';
    	}
        
    }

    /**
    +----------------------------------------------------------
    * 探针模式
    +----------------------------------------------------------
    */
    public function checkEnv()
    {
        load('pointer',THINK_PATH.'/Tpl/Autoindex');//载入探针函数
        $env_table = check_env();//根据当前函数获取当前环境
        echo $env_table;
    }
    
//测试用    
//    public function Login()
//    {
//    	echo "你好！";
//    }

}
?>