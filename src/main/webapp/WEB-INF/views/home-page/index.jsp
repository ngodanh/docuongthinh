<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Home</title>
	<link href="${pageContext.request.contextPath}/resources/css/common.css" rel="stylesheet" >
	<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet" >
    <link href="${pageContext.request.contextPath}/resources/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/resources/css/menu.css" rel="stylesheet" type="text/css" />
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="${pageContext.request.contextPath}/resources/js/jquery-2.2.1.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/menuscript.js"></script>
    <script src="${pageContext.request.contextPath}/resources/js/test.js"></script>
    <link rel="stylesheet" href="https://cdn.pannellum.org/2.3/pannellum.css"/>
    <script type="text/javascript" src="https://cdn.pannellum.org/2.3/pannellum.js"></script>
</head>
<body>
	<div class="header-container">
		<div class="row">
			<img src="/SpringMvcJdbcTemplate/resources/images/9874_logo_03.png" style="width: 200px; height: 100px">
			<ul id="nav" class="menuHeader">
		        <li><a href="${pageContext.request.contextPath}/">Trang chủ</a>
		        </li>
		        <li><a href="#">Giới thiệu</a>
		        </li>
		        <li><a href="#">Sản phẩm</a>
		            <ul>
		                <li><a href="#">Tủ</a></li>
		                <li><a href="#">Ghế</a></li>
		                <li><a href="#">Bàn ăn</a></li>
		            </ul>
		        </li>
		        <li><a href="${pageContext.request.contextPath}/design-online.html">Thiết kế online</a></li>
		        <li><a href="#">Tin tức</a></li>
		        <li><a href="#">Liên hệ</a></li>
		    </ul>
	    </div>
	</div>
	<div class="body-wrapper">
		<div id="panorama"></div>
	</div>
</body>
</html>