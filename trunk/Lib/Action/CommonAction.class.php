<?php
class CommonAction extends Action
{
	function verify()
	{
		import('ORG.Util.Image');
		Image::buildImageVerify(5,5);
	}
}

?>