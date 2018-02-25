// JavaScript Document
function changeVerifyCode(){
	var img = document.getElementById('imgVcode'); //在拿到id=imgVcode的<img/>对象
	var time = new Date().getTime();//拿到当前时间
	img.src = img.src +'?' + time;//拼接img中src的地址，目的和第一种方法一样
}
				