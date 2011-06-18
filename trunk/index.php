<?php
/*
*�ļ���index.php
*����ʱ�䣺2011-6-14
*ע�⣺
*/

// 定义ThinkPHP框架路径   
define('THINK_PATH', './ThinkPHP/');   

//定义项目名称   
define('APP_NAME', 'jxc');

// 定义项目路径
define('APP_PATH', '.'); 

//关闭核心缓存
//define('NO_CACHE_RUNTIME',True); 

//编译缓存癿内容是否迕行去空白和注释
define('STRIP_RUNTIME_SPACE',false);

// 加载框架入口文件    
require(THINK_PATH."/ThinkPHP.php");   

//实例化一个网站应用实例   
App::run();   




?>