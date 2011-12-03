<?php

/*
 * Created on 2011-7-25
 *
 * To change the template for this generated file go to
 * Window - Preferences - PHPeclipse - PHP - Code Templates
 */

class UploadfileAction extends CommonAction {

	function _filter(& $map) {
		$map['id'] = array (
			'egt',
			2
		);
		$map['filename'] = array (
			'like',
			"%" . $_POST['filename'] . "%"
		);
	}

	public function index() {
		$Photo = M('Photo');
		$list = $Photo->order('create_time desc')->limit(2)->findAll();
		$this->assign('list', $list);
		$this->display();
	}

	public function upload() {
		if (!empty ($_FILES)) {
			//如果有文件上传 上传附件
			$this->_upload();
			//$this->forward();
		}
	}

	// 文件上传
	protected function _upload() {
		import("ORG.Net.UploadFile");
		$upload = new UploadFile();
		//设置上传文件大小
		$upload->maxSize = 3292200;
		//设置上传文件类型
		$upload->allowExts = explode(',', 'jpg,gif,png,jpeg');
		//设置附件上传目录
		$upload->savePath = __TMPL__.'Attachment/';
		//设置需要生成缩略图，仅对图像文件有效
		$upload->thumb = true;
		// 设置引用图片类库包路径
		$upload->imageClassPath = 'ORG.Util.Image';
		//设置需要生成缩略图的文件后缀
		$upload->thumbPrefix = 'm_,s_'; //生产2张缩略图
		//设置缩略图最大宽度
		$upload->thumbMaxWidth = '400,100';
		//设置缩略图最大高度
		$upload->thumbMaxHeight = '400,100';
		//设置上传文件规则
		$upload->saveRule = uniqid;
		//删除原图
		$upload->thumbRemoveOrigin = true;
		if (!$upload->upload()) {
			//捕获上传异常
			$this->error($upload->getErrorMsg());
		} else {
			//取得成功上传的文件信息
			$uploadList = $upload->getUploadFileInfo();
			import("ORG.Util.Image");
			//给m_缩略图添加水印, Image::water('原文件名','水印图片地址')
			Image :: water($uploadList[0]['savepath'] . 'm_' . $uploadList[0]['savename'], '../Public/Images/logo2.png');
			$_POST['image'] = $uploadList[0]['savename'];
		}
		$model = M('Uploadfile');
		//保存当前数据对象
		$data['image'] = $_POST['image'];
		$data['create_time'] = time();
		$list = $model->add($data);
		if ($list !== false) {
			$this->success('上传图片成功！');
		} else {
			$this->error('上传图片失败!');
		}
	}

}
?>
