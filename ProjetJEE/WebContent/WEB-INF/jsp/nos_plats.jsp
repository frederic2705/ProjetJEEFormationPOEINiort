<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
  <title>Nos plats</title>
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <%@ page import="projetjee.bo.User" %>  
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>

<body onload="afficher(0)">
<%@ include file="navbar.jsp" %>
<!-- Carousel et descriptif -->
<div class="container">
    <div class="row">
		<div class="col-md-8"> 
		  <div id="myCarousel" class="carousel slide" data-interval="false">
		
		    <!-- Wrapper for slides -->
		    <div class="carousel-inner" id="carousel" style="border-radius:30px;">
		    </div>
		
		    <!-- Left and right controls -->
		    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
		      <span class="glyphicon glyphicon-chevron-left"></span>
		      <span class="sr-only">Previous</span>
		    </a>
		    <a class="right carousel-control" href="#myCarousel" data-slide="next">
		      <span class="glyphicon glyphicon-chevron-right"></span>
		      <span class="sr-only">Next</span>
		    </a>
		  </div>
	  </div>
	  
	<div class="col-md-4">
		<div id="descriptif">
		</div>
	</div>
  </div>
</div>
<!-- Fin carousel et descriptif -->

<!-- Infos & Editer-->
<div class="container">
    <div class="row">
		<div class="col-md-8">
			<div id="infos">
			</div>		
	</div>
  </div>
</div>
<!-- Fin infos -->

<!-- Evaluation User -->
<div class="container">
    <div class="row">
		<div class="col-md-8">
		<div id="modifAdmin">
		</div>		
	</div>
  </div>
</div>
<!-- Fin evaluation User -->

<!-- Modifs commentaires Admin -->
<div class="container">
    <div class="row">
		<div class="col-md-8">
		<div id="comUser">
		</div>		
	</div>
  </div>
</div>
<!-- Fin evaluation User -->

<script type="text/javascript" src="js/restPlats.js"></script>
</body>
</html>