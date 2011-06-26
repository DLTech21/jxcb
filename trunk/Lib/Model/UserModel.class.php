<?php
class UserModel extends Model{
	
	protected $_validate = array(
	array('username','require','用户名必须填写'),
	array('username','','用户已存在',1,'uniqen'),
	
	);
	
}

?>