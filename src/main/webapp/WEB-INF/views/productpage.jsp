<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<!--[if IE]>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Favicons Icon -->

<title>${thisProduct.name}</title>

<!-- Mobile Specific -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS Style -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link rel="stylesheet" href="static/css/fancybox.css" type="text/css">
<link rel="stylesheet" href="static/css/animate.css" type="text/css">
<link rel="stylesheet" href="static/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="static/css/style.css" type="text/css">
<link rel="stylesheet" href="static/css/revslider.css" type="text/css">
<link rel="stylesheet" href="static/css/owl.carousel.css" type="text/css">
<link rel="stylesheet" type="text/css" href="static/css/flexslider.css">
<link rel="stylesheet" href="static/css/owl.theme.css" type="text/css">
<link rel="stylesheet" href="static/css/font-awesome.css" type="text/css">

<link rel="stylesheet" type="text/css" href="static/css/internal.css">
<link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="static/css/font-awesome.css" media="all">
<link rel="stylesheet" type="text/css" href="static/css/simple-line-icons.css" media="all">
<link rel="stylesheet" type="text/css" href="static/css/style.css" media="all">
<link rel="stylesheet" type="text/css" href="static/css/revslider.css" >
<link rel="stylesheet" type="text/css" href="static/css/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="static/css/owl.theme.css">
<link rel="stylesheet" type="text/css" href="static/css/flexslider.css">
<link rel="stylesheet" type="text/css" href="static/css/jquery.mobile-menu.css">

<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700,800,900' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300italic,300,600,600italic,400italic,700,700italic,800,800italic' rel='stylesheet' type='text/css'>
</head>
<body>

  <jsp:include page="header.jsp"/>
   <div style="margin:30px;">
  
  
<h1>${thisProduct.name }</h1>
<h2>${thisProduct.price }</h2>
<h2>${thisProduct.color }</h2>
<h2>${thisProduct.size }</h2>
<h2>${thisProduct.type }</h2>
</div>

 <c:forEach var="item" items="${products}">
  <h5 class="card-header">${item.name}</h5>
  <div class="card-body">
    <h5 class="card-title">Type: ${item.type }</h5>
    <p class="card-text"> Color: ${item.color}<br> $${item.price}  </p>
    <a href="productpage?id=${item.id}" class="btn btn-primary">See Item</a>
  </div>
 </c:forEach>
</body>
</html>