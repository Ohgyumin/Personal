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
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <!-- Site Metas -->
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="author" content="" />

  <title>Upload</title>
<script type="text/javascript">
function upload(){
	document.upload.submit();
}
</script>
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
                <a class="nav-link" href="board.do">Board</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="select.jsp">Coloring</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="Canvas.jsp">Canvas</a>
              </li>
            </ul>
            <c:choose>
            <c:when test="${empty id}">
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
            </c:when>
            <c:otherwise>
            <div class="user_option">
              <div class="login_btn-container">
                <a href="signout.do">
                  Sign Out
                </a>
                <a href="mypage.do">
                  Mypage
                </a>
              </div>
              <form class="form-inline my-2 my-lg-0">
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
          <li class="nav-item active">
            <a class="nav-link pl-0" href="index.jsp">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="board.do">Board</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="select.jsp">Coloring</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="canvas.jsp">Canvas</a>
          </li>
        </ul>
        <c:choose>
            <c:when test="${empty id}">
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
            </c:when>
            <c:otherwise>
            <div class="user_option">
              <div class="login_btn-container">
                <a href="signout.do">
                  Sign Out
                </a>
                <a href="mypage.do">
                  Mypage
                </a>
              </div>
              <form class="form-inline my-2 my-lg-0">
                <button class="btn  my-2 my-sm-0 nav_search-btn" type="submit"></button>
              </form>
            </div>
           </c:otherwise>
            </c:choose>
      </div>
    </div>
  </div>
  </div>
  <!-- about section -->

  <section class="about_section layout_padding mt-5">
    <div class="container">
      <div class="row">
        <div class="col-md-7">
          <div class="img-box">
            <img src="images/about-img.png" alt="" />
          </div>
        </div>
        <div class="col-md-5">
          <div class="detail-box">
            <div class="custom_heading-container">
              <h2>※업로드페이지(미구현)※ </h2>
            </div>
			<form action="upload.do" name="upload" method="post" enctype="multipart/form-data">
            <div>
				<input type="file" name="fileUpload" required>
				<input type="text" name="Dtitle" placeholder="Title" required>
				<br>
				<textarea name="Dcontent" style="resize:none;" required></textarea>
			</div>
            <div>
              <input type="submit" value="등록하기">
            </div>
            </form>
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
            <h4>
              Menu
            </h4>
            <ul>
              <li><a href="index.jsp"> Home </a></li>
			  <li class="active"><a href="board.do">Board</a></li>
		      <li><a href="select.jsp">Coloring</a></li>
		 	  <li><a href="canvas.jsp">Canvas</a></li>
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