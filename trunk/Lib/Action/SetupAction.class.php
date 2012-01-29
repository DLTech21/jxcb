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


    /**
     +----------------------------------------------------------
     * 默认排序操作等同于index
     +----------------------------------------------------------
     * @access public
     +----------------------------------------------------------
     * @return void
     +----------------------------------------------------------
     * @throws FcsException
     +----------------------------------------------------------
     */
    public function sort()
    {
		$node = M('setup');
        if(!empty($_GET['setupId'])) {
            $map = array();
            $map['id'] = 1;
            $map['id']   = array('in',$_GET['setupId']);
            $sortList   =   $node->where($map)->order('sort asc')->select();
        }else{
            $sortList   =   $node->where('status=1')->order('sort asc')->select();
        }
        $this->assign("sortList",$sortList);
        $this->display();
        return ;
    }



}
?>