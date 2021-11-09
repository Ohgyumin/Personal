<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<script type="text/javascript">
function Update(){
	if(confirm("회원정보를 수정하시겠습니까?") == true ){
		document.client.submit();
	}
	else{
		return;
	}
}
function Delete(){
	if(confirm("회원정보를 삭제하시겠습니까?") == true ){
		location.href="delete.do";
	}
	else{
		return;
	}
}
</script>

<head>
  <!-- Basic -->
  <meta charset="utf-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <!-- Mobile Metas -->
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>My page</title>

  <!-- slider stylesheet -->
  <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.1.3/assets/owl.carousel.min.css" />

  <!-- bootstrap core css -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css" />

  <!-- fonts style -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,700|Poppins:400,700|Roboto:400,700&display=swap" rel="stylesheet" />

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
                <a href="signIn.jsp">
                  Sign In
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
            <a href="signIn.jsp">
              Sign In
            </a>
          </div>
          <form class="form-inline my-2 my-lg-0">
            <button class="btn  my-2 my-sm-0 nav_search-btn" type="submit"></button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
  <!-- custom menu -->


  <!-- contact section -->

  <section class="contact_section">
    <div class="container-fluid">
      <div class="row">
        <div class="col-lg-4 offset-lg-2 col-md-5 offset-md-1">
          <h2 class="custom_heading">Sign Up</h2>
          <form action="update.do" method="post" id="client">
            <div>
              <input type="text" name="id" value="${data.id}" placeholder="${data.id}" readonly/>
            </div>
            <div>
              <input type="password" name="pw" value="${data.pw}" placeholder="${data.pw}" />
            </div>
            <div>
              <input type="text" name="name" value="${data.name}" placeholder="${data.name}" />
            </div>
            <div class="d-flex  mt-4 ">
            <div>
              <button type="submit" onclick="Update()">
                Update
              </button>
              <button type="button" onclick="Delete()">
                Delete
              </button>
              </div>
            </div>
          </form>
        </div>
        <div class="col-md-6 px-0">
          <div class="img-box">
            <img src="images/contact.jpg" alt="" class="w-100" />
          </div>
        </div>
      </div>
    </div>
  </section>
  <section class="do_section layout_padding-bottom">
    <div class="container">
      <div class="custom_heading-container">
        <h2>
          What we do
        </h2>
      </div>
      <div class="row">
        <div class="col-md-3 col-sm-6">
          <div class="content-box bg-red">
            <div class="img-box">
              <img src="images/idea.png" alt="" />
            </div>
            <div class="detail-box">
              <h6>
                Original Ideas
              </h6>
              <p>
                It is a long established fact that a reader will be distracted
                by the readable content
              </p>
            </div>
          </div>
        </div>
        <div class="col-md-3 col-sm-6">
          <div class="content-box bg-green">
            <div class="img-box">
              <img src="images/controller.png" alt="" />
            </div>
            <div class="detail-box">
              <h6>
                Great apps
              </h6>
              <p>
                It is a long established fact that a reader will be distracted
                by the readable content
              </p>
            </div>
          </div>
        </div>
        <div class="col-md-3 col-sm-6">
          <div class="content-box bg-red">
            <div class="img-box">
              <img src="images/monitor.png" alt="" />
            </div>
            <div class="detail-box">
              <h6>
                High Resolution
              </h6>
              <p>
                It is a long established fact that a reader will be distracted
                by the readable content
              </p>
            </div>
          </div>
        </div>
        <div class="col-md-3 col-sm-6">
          <div class="content-box bg-green">
            <div class="img-box">
              <img src="images/rocket-ship.png" alt="" />
            </div>
            <div class="detail-box">
              <h6>
                Fast Loading
              </h6>
              <p>
                It is a long established fact that a reader will be distracted
                by the readable content
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- end contact section -->

  <!-- info section -->
  <section class="info_section layout_padding-top layout_padding2-bottom">
    <div class="container">
      <div class="row">
        <div class="col-md-6 col-lg-3">
          <div class="info_links pl-lg-5">
            <h4>
              Menu
            </h4>
            <ul>
              <li>
                <a href="index.html">
                  Home
                </a>
              </li>
              <li>
                <a href="about.html">
                  About
                </a>
              </li>
              <li>
                <a class="" href="portfolio.html">Portfolio </a>
              </li>
              <li>
                <a class="" href="service.html">Services</a>
              </li>
              <li class="active">
                <a href="contact.html">
                  Contact Us
                </a>
              </li>
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
      &copy; 2019 All Rights Reserved By
      <a href="https://html.design/">Free Html Templates</a>
    </p>
  </footer>
  <!-- footer section -->

  <script src="js/jquery-3.4.1.min.js"></script>
  <script src="js/bootstrap.js"></script>
  <script src="js/circles.min.js"></script>
  <script src="js/custom.js"></script>

</body>

</html>