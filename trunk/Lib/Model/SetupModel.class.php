<?php

class SetupModel extends CommonModel
{
	public $_validate	=	array(
		array('keyword','require','关键字必须填写'),
		array('title','require','标题必须填写'),
		array('keyword','/^[a-zA-Z]+$/i','关键字格式错误'),
		array('keyword','','关键字已存在','0','unique','1'),
		);




}
?>