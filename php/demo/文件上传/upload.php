<?php 
//包含一个文件上传类中的上传类     
include "fileupload.class.php";
$up = new fileupload;
//设置属性(上传的位置，大小，类型，名是是否要随机生成)
$up -> set("path", "./images/");//上传文件保存的路径，相对路径，当前同级images目录下
$up -> set("maxsize", 2000000);//限制文件上传大小(字节)
$up -> set("allowtype", array("gif", "png", "jpg", "jpeg"));//设置限制上传文件的类型
$up -> set("israndname", true);//设置是否随机重命名文件
//使用对象中的upload方法，就可以上传文件，方法需要传一个上传表单的名子pic，如果成功返回true，失败返回false
if($up -> upload("pic")) {
	echo '<pre>';
	//获取上传后文件名子
	var_dump($up->getFileName());
	echo '</pre>';
} else {
	echo '<pre>';
	//获取上传失败以后的错误提示
	var_dump($up->getErrorMsg());
	echo '</pre>';
}


















/*
$DST_DIR = 'G:/trunk/Development/Source/data/upload/';
if ($_FILES['img']['name'] != '') {
    if ($_FILES['img']['error'] > 0) {
		//上传失败
		$array= array("errorCode"=>"6001");
		$array["errorMsg"] = "upload fail";
		echo $str=json_encode($array);//将数组进行json编码
    }
    else {
        if (move_uploaded_file($_FILES['img']['tmp_name'], $DST_DIR.$_FILES['img']['name'])) {
            //上传成功
			$array= array("errorCode"=>"0000");
			$array["errorMsg"] = "upload success";
			echo $str=json_encode($array);//将数组进行json编码
        }
        else {
            //上传失败
			$array= array("errorCode"=>"6001");
			$array["errorMsg"] = "upload fail";
			echo $str=json_encode($array);//将数组进行json编码
        }
    }
} else {
    //上传失败
	$array= array("errorCode"=>"6001");
	$array["errorMsg"] = "upload fail";
	echo $str=json_encode($array);//将数组进行json编码
}
*/