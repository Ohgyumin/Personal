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

<!-- slider stylesheet -->
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
		<!-- header section strats -->
		<header class="header_section">
      <div class="container-fluid">
        <nav class="navbar navbar-expand-lg custom_nav-container pt-3">
          <a class="navbar-brand" href="index.jsp">
            <img src="images/logo.png" alt="" />
            <span>
              Brainwave
            </span>
          </a>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto mr-2">
              <li class="nav-item active">
                <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="select.jsp">Select</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="canvas.jsp">Canvas</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="service.html">Services</a>
              </li>

              <li class="nav-item">
                <a class="nav-link" href="contact.html">Contact us</a>
              </li>
            </ul>
            <div class="user_option">
              <div class="login_btn-container">
                <a href="">
                  Login
                </a>
              </div>
              <form class="form-inline my-2 my-lg-0">
                <button class="btn  my-2 my-sm-0 nav_search-btn" type="submit"></button>
              </form>
            </div>
          </div>
        </nav>
      </div>
    </header>
		<!-- end header section -->
	<!-- custom menu -->
	<div class="custom_menu-container">
    <div class="container">
      <div class="custom_menu">
        <ul class="navbar-nav ">
          <li class="nav-item active">
            <a class="nav-link pl-0" href="index.jsp">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="select.jsp">select </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="canvas.jsp">canvas</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="service.html">Services</a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="contact.html">Contact us</a>
          </li>
        </ul>
        <div class="user_option">
          <div class="login_btn-container">
            <a href="">
              Login
            </a>
          </div>
          <form class="form-inline my-2 my-lg-0">
            <button class="btn  my-2 my-sm-0 nav_search-btn" type="submit"></button>
          </form>
        </div>
      </div>
    </div>
  </div>
	<!-- custom menu -->

	<!-- about section -->

	<section class="about_section layout_padding mt-5">
		<div class="container">
			<div class="row">
			<div class="col-md-7">
				<canvas id="canvas" width="500" height="500"style="border: 1px solid black;">
				</canvas>
				</div>
				<div style="width: 40%; float: right;">
					<div class="custom_heading-container">
						<h2>Palette</h2>
					</div>
					<div>
						<img src="img/red.png" onclick="selectColor('red')"> <img
							src="img/orange.png" onclick="selectColor('orange')">
						<button type="button" onclick="selectWidth('10')">10</button>
						<br>
						<div>
							Title <input id="title" size="15">
						</div>
						<br>
					</div>
					<div>
						<a id="saveImage" download="image.png"> <input type="button"
							value="Save" onclick="saveImage()">
						</a>
					</div>
				</div>
			</div>
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
							<li><a href="index.html"> Home </a></li>
							<li class="active"><a href="about.html"> About </a></li>
							<li><a class="" href="portfolio.html">Portfolio </a></li>
							<li><a class="" href="service.html">Services</a></li>
							<li><a href="contact.html"> Contact Us </a></li>
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

	<script src="js/jquery-3.4.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	<script src="js/circles.min.js"></script>
	<script src="js/custom.js"></script>
	<script>
		var pos = {
			drawable : false,
			x : -1,
			y : -1
		};
		var canvas, ctx;

		window.onload = function() {
			canvas = document.getElementById("canvas");
			ctx = canvas.getContext("2d");

			canvas.addEventListener("mousedown", listener);
			canvas.addEventListener("mousemove", listener);
			canvas.addEventListener("mouseup", listener);
			canvas.addEventListener("mouseout", listener);
		}
		function selectColor(choosedColor) {
			// 색 받아오기
			pos.color = choosedColor;
		}
		function selectWidth(choosedWidth) {
			// 색 받아오기
			pos.width = choosedWidth;
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
			ctx.fillStyle = pos.color;
			ctx.strokeStyle = pos.color;

			// 상대 좌표를 구하는 코드
			// 미디어커리로 좌표 수정 필수
			var coors = getPosition(event);
			coors.X-=370;
			coors.Y-=263;
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
			ctx.lineTo(coors.X-370, coors.Y-263);
			pos.X = coors.X;
			pos.Y = coors.Y;
			ctx.stroke();
		}

		function finishDraw() {
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
			savedImage.contextPath
		}
	</script>
</body>

</html>