<?php
$config = array(
//'配置项'=>'配置值'
	'USER_AUTH_KEY'		=>'authId', //配置认证SESSION标记,默认为authId
	
	'APP_FILE_CASE'		=> true,   // 是否检查文件的大小写 对Windows平台有效

	'APP_DEBUG'			=> true, // 开启调试模式  

	'DB_TYPE'			=> 'mysql',   // 数据库类型   

	'DB_HOST'			=> 'localhost', // 数据库服务器地址   

	'DB_NAME'			=>'jxcb',  // 数据库名称   

	'DB_USER'			=>'root', // 数据库用户名   

	'DB_PWD'			=>'', // 数据库密码   

	'DB_PORT'			=>'3306', // 数据库端口
    
	'DB_PREFIX'			=>'jxcb_', // 数据表前缀
);

$RbacCnf = include './Conf/rbacconfig.php';
return array_merge($config,$RbacCnf);
?>