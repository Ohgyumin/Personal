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
	
</div>
<script>
var pos = {
    drawable: false,
    x: -1,
    y: -1
};
var canvas, ctx;
 
window.onload = function(){
    canvas = document.getElementById("canvas");
    ctx = canvas.getContext("2d");
 
    canvas.addEventListener("mousedown", listener);
    canvas.addEventListener("mousemove", listener);
    canvas.addEventListener("mouseup", listener);
    canvas.addEventListener("mouseout", listener);
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
	
	// 선그리기 호출
    ctx.beginPath();
    
    pos.drawable = true;
    
    // 상대 좌표를 구하는 코드
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