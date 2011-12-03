<?php
/*---------------------------------------------------
 *设置信息
 *
 *
 *
 *
 *
 *
 *--------------------------------------------------
 **/
class SetupAction extends CommonAction{


	function index()
	{
		$setup = M("Setup");
		$this->assign('setup',$setup);

		$this->display();
	}


    function edit()
    {
		$this->display();
    }
}
?>