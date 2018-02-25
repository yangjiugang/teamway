
// 说明：用 JavaScript 实现网页图片等比例缩放 
// 整理：http://www.CodeBit.cn 
function DrawImage(ImgD,FitWidth,FitHeight) 
{ 
var image=new Image(); 
image.src=ImgD.src; 
if(image.width>0 && image.height>0) 
{ 
if(image.width/image.height>= FitWidth/FitHeight) 
{ 
if(image.width>FitWidth) 
{ 
ImgD.width=FitWidth; 
ImgD.height=(image.height*FitWidth)/image.width; 
} else 
{ 
ImgD.width=image.width; 
ImgD.height=image.height; 
} ;
} else 
{ 
if(image.height>FitHeight) 
{ 
ImgD.height=FitHeight; 
ImgD.width=(image.width*FitHeight)/image.height; 
} else 
{ 
ImgD.width=image.width; 
ImgD.height=image.height; 
} ;
} ;
} ;
} ;