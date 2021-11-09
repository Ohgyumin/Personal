<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- Basic -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- Mobile Metas -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<!-- Site Metas -->
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />

<title>Canvas</title>
<link rel="Canvas icon" href="images/59.ico">
<script src="js/jquery-3.4.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/circles.min.js"></script>
	<script src="js/custom.js"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery.minicolors.min.js"></script>
<!-- slider stylesheet -->
<link rel="stylesheet" href="js/jquery.minicolors.css">
<link rel="stylesheet" type="text/css"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css" />

<!-- bootstrap core css -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

<!-- fonts style -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:400,700|Poppins:400,700|Roboto:400,700&display=swap"
	rel="stylesheet" />

<!-- Custom styles for this template -->
<link href="css/style.css" rel="stylesheet" />
<!-- responsive style -->
<link href="css/responsive.css" rel="stylesheet" />
</head>

<body class="sub_page">
	<div class="hero_area">
		<header class="header_section">
			<div class="container-fluid">
				<nav class="navbar navbar-expand-lg custom_nav-container pt-3">
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ml-auto mr-2">
							<li class="nav-item active"><a class="nav-link"
								href="index.jsp">Home <span class="sr-only">(current)</span></a>
							</li>
							<li class="nav-item"><a class="nav-link" href="board.do">Board</a>
							</li>
							<li class="nav-item"><a class="nav-link" href="select.do">Coloring</a>
							</li>
							<li class="nav-item"><a class="nav-link" href="canvas.do">Canvas</a>
							</li>
						</ul>
						<c:choose>
							<c:when test="${empty id}">
								<div class="user_option">
									<div class="login_btn-container">
										<a href="signIn.jsp"> Sign In </a>
									</div>
									<form class="form-inline my-2 my-lg-0" action="board.do" method="post">
										<input type="text" name="keyword" placeholder="제목" style="margin-top: -15px; margin-right: 10px;">
										<button class="btn  my-2 my-sm-0 nav_search-btn" type="submit"></button>
									</form>
								</div>
							</c:when>
							<c:otherwise>
								<div class="user_option">
									<div class="login_btn-container">
										<a href="signout.do"> Sign Out </a> <a href="mypage.do">
											Mypage </a>
									</div>
									<form class="form-inline my-2 my-lg-0" action="board.do" method="post">
										<input type="text" name="keyword" placeholder="제목" style="margin-top: -15px; margin-right: 10px;">
										<button class="btn  my-2 my-sm-0 nav_search-btn" type="submit"></button>
									</form>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</nav>
			</div>
		</header>
		<!-- end header section -->
		<div class="custom_menu-container">
			<div class="container">
				<div class="custom_menu">
					<ul class="navbar-nav ">
						<li class="nav-item active"><a class="nav-link pl-0"
							href="index.jsp">Home <span class="sr-only">(current)</span></a>
						</li>
						<li class="nav-item"><a class="nav-link" href="board.do">Board</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="select.do">Coloring</a>
						</li>
						<li class="nav-item"><a class="nav-link" href="canvas.do">Canvas</a>
						</li>
					</ul>
					<c:choose>
						<c:when test="${empty id}">
							<div class="user_option">
								<div class="login_btn-container">
									<a href="signIn.jsp"> Sign In </a>
								</div>
								<form class="form-inline my-2 my-lg-0" action="board.do" method="post">
										<input type="text" name="keyword" placeholder="제목" style="margin-top: -15px; margin-right: 10px;">
										<button class="btn  my-2 my-sm-0 nav_search-btn" type="submit"></button>
									</form>
							</div>
						</c:when>
						<c:otherwise>
							<div class="user_option">
								<div class="login_btn-container">
									<a href="signout.do"> Sign Out </a> <a href="mypage.do">
										Mypage </a>
								</div>
								<form class="form-inline my-2 my-lg-0" action="board.do" method="post">
									<input type="text" name="keyword" placeholder="제목" style="margin-top: -15px; margin-right: 10px;">
										<button class="btn  my-2 my-sm-0 nav_search-btn" type="submit"></button>
									</form>
							</div>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	<!-- about section -->
</div>
	<section class="about_section layout_padding mt-5">
		<div class="container">
			<div class="row">
				<div class="col-md-7">
					<canvas id="canvas" width="500" height="500"
						style="border: 1px solid black;">
				</canvas>
				</div>
				<div style="width: 40%; float: right;">
					<div class="custom_heading-container">
						<c:if test="${empty filename}">
						<h2>Palette</h2>
						</c:if>
						<c:if test="${!empty filename}">
						<h2>Palette(${filename})</h2>
						</c:if>
					</div>
					<div>
						<input type="text" id="rgb" class="form-control demo minicolors-input" data-format="rgb" value="rgb(0, 0, 0)" size="20" data-opacity="1.00"/>
						<input type="range" id="Range" min="0.1" max="10.0" value="2.5" step="0.1" style="margin-top: 8px;">
						<br>
						<button type="button" class="button" onclick="undo_last()" style="background: #FFFFFF; margin: 8px;">되돌아가기</button>
						<button type="button" class="button" onclick="redo_last()" style="background: #FFFFFF; margin: 8px;">앞으로가기</button>
						<button  type="button" class="button" onclick="clear_canvas()" style="background: #FFFFFF; margin: 8px;">지우기</button>
						<br>
					</div>
					<div>
					<c:if test="${!empty id}">
						Title <input id="title" size="15">
						<br>
						<a id="saveImage" download="image.png">
						<input type="button" value="Save" onclick="saveImage()" style="background: #FFFFFF; margin: 8px;">
						</a>
					</c:if>
					</div>
				</div>
			</div>
			<!--  -->
		</div>
	</section>

	<!-- end about section -->



	<!-- info section -->
	<section class="info_section layout_padding-top layout_padding2-bottom">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-3">
					<div class="info_links pl-lg-5">
						<h4>Menu</h4>
						<ul>
							<li><a href="index.jsp"> Home </a></li>
							<li><a href="board.do">Board</a></li>
							<li><a class="" href="select.jsp">Coloring</a></li>
							<li class="active"><a href="canvas.jsp">Canvas</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- end info_section -->

	<!-- footer section -->
	<footer class="container-fluid footer_section">
		<p>
			&copy; 2019 All Rights Reserved By <a href="https://html.design/">Free
				Html Templates</a>
		</p>
	</footer>
	<!-- footer section -->

	<script>
		var pos = {
			drawable : false,
			x : -1,
			y : -1
		};
		let restore_array =[];
		let restore_array1 =[];
		let index = -1;
		let max;
		const range = document.getElementById("Range");
		
		if(range){
		    range.addEventListener("input", handleRangeChange);
		}
		function handleRangeChange(event){
			// 굵기 조정 코드
		    const size = event.target.value;
		    ctx.lineWidth = size;
		}
		var canvas, ctx;
		$(document).ready( function(){
			$('.demo').each( function(){
				$(this).minicolors({
					control: $(this).attr('data-control') || 'hua',
					defaultValue: $(this).attr('data-defaultValue') || '',
					format: $(this).attr('data-format') || 'rgb',
					keywords: $(this).attr('data-keywords') || '',
					inline: $(this).attr('data-inline') === 'true',
					letterCase:$(this).attr('data-letterCase') || 'lowercase',
					opacity: $(this).attr('data-opacity'),
					position: $(this).attr('data-position') || 'bottom',
					swatches: $(this).attr('data-swatches') ? $(this).attr('data-swatches').split('|') : [],
					change: function(hex, opacity){
						var log;
						try{
							log = hex ? hex : 'transparent';
							// rgb값 + 투명도 지정
							if(opacity) log +=', ' + opacity;
							console.log(log);
							console.log(hex+"헥스");
							pos.color=hex;
							console.log(pos.color+"컬러");
						} catch(e) {}
					},
					//theme: 'default'
					theme:'bootstrap'
				});
			});
		});
		window.onload = function(){
		    canvas = document.getElementById("canvas");
		    if(canvas.getContext){
		        ctx = canvas.getContext("2d");
		        var file=null;
		        file="${filename}";
		        img = new Image();
	 		    img.src = "select/${filename}";
		        if(file == ""){
		        	console.log("캔버스")
		        	canvas.addEventListener("mousedown", listener);
		    		canvas.addEventListener("mousemove", listener);
		    		canvas.addEventListener("mouseup", listener);
		    		canvas.addEventListener("mouseout", listener);
		        }
		        else{
		        	console.log("컬러링")
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
		}
		
		function listener(event) {
			switch (event.type) {
			case "mousedown":
				initDraw(event);
				break;

			case "mousemove":
				if (pos.drawable)
					draw(event);
				break;

			case "mouseout":
			case "mouseup":
				finishDraw();
				break;
			}
		}
		function initDraw(event) {

			// 선그리기 호출
			ctx.beginPath();

			pos.drawable = true;
			ctx.lineWidth = pos.width;
			// 색 지정 코드
			ctx.fillStyle = pos.color;
			// 채우기 지정 코드
			ctx.strokeStyle = pos.color;
			// 선 마감 코드
			ctx.lineCap='square';
			console.log(ctx.lineCap);
			// 상대 좌표를 구하는 코드
			// 미디어커리로 좌표 수정 필수
			var coors = getPosition(event);
			coors.X-=370;
			coors.Y-=210;
			pos.X = coors.X;
			pos.Y = coors.Y;
			console.log(pos.X+"x좌표")
			console.log(pos.Y+"y좌표")
			ctx.moveTo(pos.X, pos.Y);
		}

		function draw(event) {
			ctx.fillStyle = pos.color;
			ctx.strokeStyle = pos.color;
			var coors = getPosition(event);
			ctx.lineTo(coors.X-370, coors.Y-210);
			pos.X = coors.X;
			pos.Y = coors.Y;
			ctx.stroke();
		}

		 
		function finishDraw(){
			 if(event.type != 'mouseout'){
			        restore_array.push(ctx.getImageData(0,0,canvas.width, canvas.height));
			        restore_array1.push(ctx.getImageData(0,0,canvas.width, canvas.height));
			        index += 1;
			        max = index;
			        console.log(index+"index")
			        }
			        //console.log(restore_array);
			        
		    pos.drawable = false;
		    pos.X = -1;
		    pos.Y = -1;
		    
		}

		function getPosition(event) {
			var x = event.pageX - canvas.offsetLeft;
			var y = event.pageY - canvas.offsetTop;
			return {
				X : x,
				Y : y
			};
		}

		function clear_canvas(){
			if (confirm("그림이 초기화 됩니다!")) {
				ctx.clearRect(0,0,canvas.width, canvas.height);
			    restore_array=[];
			    index =-1;
			    img = new Image();
			    img.src = "select/${filename}";
		        img.onload = function(){
		            ctx.drawImage(img, 0,0, 500,500);
		    		canvas.addEventListener("mousedown", listener);
		    		canvas.addEventListener("mousemove", listener);
		    		canvas.addEventListener("mouseup", listener);
		    		canvas.addEventListener("mouseout", listener);
		        }
			}
			else{
				return;
			}
		}	

		function undo_last(){
			if (index == -1){
				alert("스케치가 없습니다.")
			}
			else{
				if(index <= 0){
		    		if (confirm("그림이 초기화 됩니다!")) {
		    		ctx.clearRect(0,0,canvas.width, canvas.height);
		    		restore_array=[];
		    		restore_array1=[];
		    	    index =-1;
		    	    img = new Image();
		    	    img.src = "select/${filename}";
			        img.onload = function(){
			            ctx.drawImage(img, 0,0, 500,500);
			    		canvas.addEventListener("mousedown", listener);
			    		canvas.addEventListener("mousemove", listener);
			    		canvas.addEventListener("mouseup", listener);
			    		canvas.addEventListener("mouseout", listener);
			        }
		    		} else{
		    			return;
		    		}
		    	} else {
		    		index -= 1 ;
		    		restore_array1.push(restore_array.pop());
		    		ctx.putImageData(restore_array[index],0,0);
		    		console.log(index+"index2")
		    	}
			}
		}

		function redo_last(){
			if (index == -1){
				alert("스케치가 없습니다.")
			}
			else {
				if(index >= max ){
			        index = max;
			        ctx.putImageData(restore_array[index],0,0);
			        console.log(index+"index3")
			    } else{
					index += 1;
					restore_array.push(restore_array1.pop());
					ctx.putImageData(restore_array[index],0,0);
					console.log(index+"index4")
			    }
			}
		}

		function saveImage() {
			console.log("saveImage()");
			var imageName = document.getElementById("title").value;
			console.log(imageName);
			console.log(imageName.lenght);
			if (imageName.length == 0) {
				imageName = "image";
			}
			imageName += ".png";
			var savedImage = document.getElementById("saveImage");
			var image = document.getElementById("canvas")
					.toDataURL("image/png").replace("image/png",
							"image/octet-stream");

			console.log(savedImage + "세이브이미지");
			console.log(image + "이미지");

			savedImage.setAttribute("download", imageName);
			savedImage.setAttribute("href", image);
		}
	</script>
	
</body>

</html>