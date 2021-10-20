<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>그림판 그리기</title>
</head>
<body>
<div>
	<canvas id="canvas" width="500" height="500" style="border: 1px solid black;" >
	
	</canvas>
	<div>
		<button type="button" onclick="change()">red</button>
	</div>
</div>
<script>
var pos = {
    drawable: false,
    x: -1,
    y: -1
};
var canvas, ctx, omg, test;

function change(){
	var test="red";
	System.out.println(test);
}

window.onload = function(){
    canvas = document.getElementById("canvas");
    if(canvas.getContext){
        ctx = canvas.getContext("2d");
        
        img = new Image();
        img.src = "img/dolphin.png";
        img.onload = function(){
            //이미지의 원하는 부분만 잘라서 그리기
            //drawImage(이미지객체, 
            //        이미지의 왼위 부분x, 이미지의 왼위 부분y, 이미지의 원하는 가로크기, 이미지의 원하는 세로크기,
            //        사각형 부분x, 사각형 부분y, 가로크기, 세로크기)
            //draw.drawImage(img, 100,100, 300,300, 50,50, 250,300);
            
            //전체 이미지 그리기
            //drawImage(이미지객체, 사각형 왼위 x, 사각형 왼위 y, 가로크기, 세로크기)
            ctx.drawImage(img, 0,0, 500,500);
    		canvas.addEventListener("mousedown", listener);
    		canvas.addEventListener("mousemove", listener);
    		canvas.addEventListener("mouseup", listener);
    		canvas.addEventListener("mouseout", listener);
        }
    }
}
 
function listener(event){
    switch(event.type){
        case "mousedown":
            initDraw(event);
            break;
 
        case "mousemove":
            if(pos.drawable)
                draw(event);
            break;
 
        case "mouseout":
        case "mouseup":
            finishDraw();
            break;
    }
}
function initDraw(event){
	// 펜 색 변경가능
	ctx.strokeStyle = '"'+color+'"';
    ctx.beginPath();
    pos.drawable = true;
    var coors = getPosition(event);
    pos.X = coors.X;
    pos.Y = coors.Y;
    ctx.moveTo(pos.X, pos.Y);
}
 
function draw(event){
    var coors = getPosition(event);
    ctx.lineTo(coors.X, coors.Y);
    pos.X = coors.X;
    pos.Y = coors.Y;
    ctx.stroke();
}
 
function finishDraw(){
    pos.drawable = false;
    pos.X = -1;
    pos.Y = -1;
}
 
function getPosition(event){
    var x = event.pageX - canvas.offsetLeft;
    var y = event.pageY - canvas.offsetTop;
    return {X: x, Y: y};
}

</script>

</body>
</html>