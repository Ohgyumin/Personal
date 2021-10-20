<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<canvas id="canvas" width="500px" height="500px">
	</canvas>
</body>
<script type="text/javascript">
    window.onload = function(){
        var canvas = document.getElementById("canvas");
        if(canvas.getContext){
            var draw = canvas.getContext("2d");
            
            var img = new Image();
            img.src = "img/test.png";
            img.onload = function(){
                //이미지의 원하는 부분만 잘라서 그리기
                //drawImage(이미지객체, 
                //        이미지의 왼위 부분x, 이미지의 왼위 부분y, 이미지의 원하는 가로크기, 이미지의 원하는 세로크기,
                //        사각형 부분x, 사각형 부분y, 가로크기, 세로크기)
                //draw.drawImage(img, 100,100, 300,300, 50,50, 250,300);
                
                //전체 이미지 그리기
                //drawImage(이미지객체, 사각형 왼위 x, 사각형 왼위 y, 가로크기, 세로크기)
                draw.drawImage(img, 0,0, 500,500);
            }
        }
    }
    </script>
</html>