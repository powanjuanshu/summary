<?php 
//����һ���ļ��ϴ����е��ϴ���     
include "fileupload.class.php";
$up = new fileupload;
//��������(�ϴ���λ�ã���С�����ͣ������Ƿ�Ҫ�������)
$up -> set("path", "./images/");//�ϴ��ļ������·�������·������ǰͬ��imagesĿ¼��
$up -> set("maxsize", 2000000);//�����ļ��ϴ���С(�ֽ�)
$up -> set("allowtype", array("gif", "png", "jpg", "jpeg"));//���������ϴ��ļ�������
$up -> set("israndname", true);//�����Ƿ�����������ļ�
//ʹ�ö����е�upload�������Ϳ����ϴ��ļ���������Ҫ��һ���ϴ���������pic������ɹ�����true��ʧ�ܷ���false
if($up -> upload("pic")) {
	echo '<pre>';
	//��ȡ�ϴ����ļ�����
	var_dump($up->getFileName());
	echo '</pre>';
} else {
	echo '<pre>';
	//��ȡ�ϴ�ʧ���Ժ�Ĵ�����ʾ
	var_dump($up->getErrorMsg());
	echo '</pre>';
}


















/*
$DST_DIR = 'G:/trunk/Development/Source/data/upload/';
if ($_FILES['img']['name'] != '') {
    if ($_FILES['img']['error'] > 0) {
		//�ϴ�ʧ��
		$array= array("errorCode"=>"6001");
		$array["errorMsg"] = "upload fail";
		echo $str=json_encode($array);//���������json����
    }
    else {
        if (move_uploaded_file($_FILES['img']['tmp_name'], $DST_DIR.$_FILES['img']['name'])) {
            //�ϴ��ɹ�
			$array= array("errorCode"=>"0000");
			$array["errorMsg"] = "upload success";
			echo $str=json_encode($array);//���������json����
        }
        else {
            //�ϴ�ʧ��
			$array= array("errorCode"=>"6001");
			$array["errorMsg"] = "upload fail";
			echo $str=json_encode($array);//���������json����
        }
    }
} else {
    //�ϴ�ʧ��
	$array= array("errorCode"=>"6001");
	$array["errorMsg"] = "upload fail";
	echo $str=json_encode($array);//���������json����
}
*/