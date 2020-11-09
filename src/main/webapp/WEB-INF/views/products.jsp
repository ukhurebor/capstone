<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!--[if IE]>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<![endif]-->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Favicons Icon -->

<title>Products</title>

<!-- Mobile Specific -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS Style -->

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

<!-- Header -->
  <jsp:include page="header.jsp"/>
  <!-- end header --> 
   
  <!-- Main Container -->
  <div style="margin:25px;">
	<form action="addProduct" method="post">
	<div class="form-group" style="width:30%">
		<label for="name">Product Name</label>
		<input type="text" class="form-control" id="name" name="name" placeholder="iPad Pro"/>
	</div>
		<div class="form-group" style="width:30%">
		<label for="price">Product Price</label>
		<input type="text" class="form-control" id="price" name="price" placeholder="999.99"/>
	</div>
		<div class="form-group" style="width:30%">
		<label for="color">Product Color</label>
		<input type="text" class="form-control" id="color" name="color" placeholder=""/>
 	</div>
 		<div class="form-group" style="width:30%">
		<label for="size">Product Size</label>
		<input type="text" class="form-control" id="size" name="size" placeholder=""/>	
 	</div>
 		<div class="form-group" style="width:30%">
		<label for="type">Product Type</label>
		<input type="text" class="form-control" id="type" name="type" placeholder=""/>	
 	</div>
 		<div class="form-group" style="width:30%">
		<label for="email">Email</label>
		<input type="text" class="form-control" id="email" name="email" placeholder=""/>	
 	</div>	
 		<div class="form-group" style="width:30%">
		<label for="des">Des</label>
		<input type="text" class="form-control" id="des" name="des" placeholder=""/>
	</div>	
		<div class="form-group" style="width:30%">
		<label for="img">Img</label>
		<input type="text" class="form-control" id="img" name="img" placeholder=""/>
	</div>	
 	<!-- ADD INPUTS FOR des and img -->
 	
 	
 		<!-- <h1>Women</h1>
 		<h2>Handbags</h2>
 		<select>
 			<option value="clutch">Clutch Handbags</option>
 			<option value="hobo">Hobo Handbags</option>
 			<option value="designer">Designer Handbags</option>
 			<option value="shoulderbags">Shoulder Bags</option>
 		</select>
 		<h2>Accesories</h2>
 		<select>
 			<option value="headsets">Head sets</option>
 			<option value="batteries">Batteries</option>
 			<option value="screen">Screen Protectors</option>
 			<option value="memorycards">Memory Cards</option>
 			<option value="cases">Cases</option>
 			<option value="diaperbags">Diaper Bags</option>
 			<option value="backbags">Back Bags</option>
 		</select>
 		<h3>Electronics</h3>
 		<select>
 			<option value="samsung">Samsung</option>
 			<option value="apple">Apple</option>
 			<option value="nokia">Nokia</option>
 			<option value="blackberry">Blackberry</option>
 			<option value="htc">HTC</option>
 		</select>	
 		<h4>Appliances</h4>
 		<select>
 		<option value="vaccumcleaners">Vaccum Cleaners</option>
 		<option value="indoorlighting">Indoor Lighting</option>
 		<option value="kitchentools">Kitchen Tools</option>
 		<option value="waterpurifier">Water Purifier</option>
 		</select>
 		<h5>Computer</h5>
 		<select>
 		<option value="externalharddisk">External Hard Disk</option>
 		<option value="pendrives">Pendrives</option>
 		<option value="headphones">Headphones</option>
 		<option value="pccomponents">PC Components</option>
 		</select>
 		<h6>Audio Video</h6>
 		<select>
 		<option value="mp3players">MP3 Players</option>
 		<option value="lpods">IPods</option>
 		<option value="speakers">Speakers</option>
 		<option value="videoplayers">Video Players</option>
 		</select> -->
 		<button type="submit" class="btn btn-primary">SUBMIT</button>
 		</form>
 		</div>
 		<!--  <ul>
 		 
 		
                  <li> <a class="active" href="#/women.html">Women</a> <span class="subDropdown minus"></span>
                    <ul class="level0_415" style="display:block">
                      <li> <a href="#/women/tops.html"> Handbags </a> <span class="subDropdown plus"></span>
                        <ul class="level1" style="display:none">
                          <li> <a href="#/women/tops/evening-tops.html"> Clutch Handbags </a> </li>
                          <li> <a href="#/women/tops/shirts-blouses.html"> Diaper Bags </a> </li>
                          <li> <a href="#/women/tops/tunics.html"> Back Bags </a> </li>
                          <li> <a href="#/women/tops/vests.html"> Hobo handbags </a> </li>
                          end for-each
                        </ul>
                         </li>
                      level1
                      <li> <a href="#/women/bags.html"> Jackets </a> <span class="subDropdown plus"></span>
                        <ul class="level1" style="display:none">
                          <li> <a href="#/women/bags/bags.html"> Bags </a> </li>
                          <li> <a href="#/women/bags/designer-handbags.html"> Designer Handbags </a> </li>
                          <li> <a href="#/women/bags/purses.html"> Purses </a> </li>
                          <li> <a href="#/women/bags/shoulder-bags.html"> Shoulder Bags </a> </li>
                          end for-each
                        </ul>
                        level1
                      <li> <a href="#/women/dresses.html"> Dresses </a> <span class="subDropdown plus"></span>
                        <ul class="level1" style="display:none">
                          <li> <a href="#/women/dresses/casual-dresses.html"> Casual Dresses </a> </li>
                          <li> <a href="#/women/dresses/evening.html"> Evening </a> </li>
                          <li> <a href="#/women/dresses/designer.html"> Designer </a> </li>
                          <li> <a href="#/women/dresses/party.html"> Party </a> </li>
                          end for-each
                        </ul>
                        level1 
                         level1
                      <li> <a href="#/accesories.html"> Accesories </a> <span class="subDropdown plus"></span>
                        <ul class="level1" style="display:none">
                          <li> <a href="#/accesories/headsets.html"> HeadSets </a> </li>
                          <li> <a href="#/accesories/batteries.html"> Batteries </a> </li>
                          <li> <a href="#/accesories/screen-protectors.html"> Screen Protectors </a> </li>
                          <li> <a href="#/accesories/memory-cards.html"> Memory Cards </a> </li>
                          <li> <a href="#/accesories/cases.html"> Cases </a> </li>
                          end for-each
                        </ul>
                        </li>
                      level1
                      <li> <a href="#/cameras.html"> Cameras </a> <span class="subDropdown plus"></span>
                        <ul class="level1" style="display:none">
                          <li> <a href="#/cameras/digital-cameras.html"> Digital Cameras </a> </li>
                          <li> <a href="#/cameras/camcorders.html"> Camcorders </a> </li>
                          <li> <a href="#/cameras/lenses.html"> Lenses </a> </li>
                          <li> <a href="#/cameras/filters.html"> Filters </a> </li>
                          <li> <a href="#/cameras/tripod.html"> Tripod </a> </li>
                          end for-each
                        </ul>
                        </li>
                        </ul>
                        </li>
                        </ul> -->
                        
<script type="text/javascript" src="static/js/jquery.fancybox.js"></script> 
<script type="text/javascript" src="static/js/toggle.js"></script>
<script type="text/javascript" src="static/js/jquery.min.js"></script> 
<script type="text/javascript" src="static/js/bootstrap.min.js"></script> 
<script type="text/javascript" src="static/js/jquery.flexslider.js"></script> 
<script type="text/javascript" src="static/js/parallax.js"></script> 
<script type="text/javascript" src="static/js/common.js"></script> 
<script type="text/javascript" src="static/js/revslider.js"></script> 
<script type="text/javascript" src="static/js/owl.carousel.min.js"></script>
<script type="text/javascript" src="static/js/cloud-zoom.js"></script>
<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
</body>
</html>