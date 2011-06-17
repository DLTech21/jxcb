<?php
/*
*�ļ���LoginAction.class.php
*����ʱ�䣺2011-6-17
*ע�⣺
*/
class LoginAction extends IndexAction
{
	public function Login()
	{
		$this->display();
	}
	//显示验证码  
    public function verifyTest() {  
      $this->display();  
    }  
      
    //检验验证码是否正确  
    public function verifyCheck() {  
      //防止页面乱码  
          header('Content-type:text/html;charset=utf-8'); 

       
      if (md5($_POST['verifyTest']) != Session::get('verify')) {  
       echo '验证码错误';  
      }  
      else {  
        echo '验证码正确';  
          }  
    }  
      
    // 生成验证码  
    public function verify() {  
            import("ORG.Util.Image");  
            Image::buildImageVerify();  
    }  

	

}


?>