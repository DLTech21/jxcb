<?php
class CommonAction extends Action
{
	function verify()//验证码
	{
		import('ORG.Util.Image');
		Image::buildImageVerify();
	}
}

?>