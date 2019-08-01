<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="projetjee.bo.User" %>
    <%@ page import="projetjee.bo.Commentaire" %>
    <%@ page import="java.util.List" %>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"><link rel="stylesheet" type="text/css" href="./css/style.css"/>
<link rel="stylesheet" type="text/css" href="./css/style.css"/>
<title>Mon compte</title>
</head>
<body>
<!-- Nav -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	  
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" 
	  aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarText">
	    <ul class="navbar-nav mr-auto">
	    
	      <li class="nav-item active">
	        <a class="nav-link" href="#">Accueil <span class="sr-only">(current)</span></a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">Nos plats</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">Connexion</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">Inscription</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">Mon Compte</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="#">Ajouter un plat</a>
	      </li>
	    </ul>
	  </div>
	</nav>
	<!-- FIN Nav -->
	<div class="container-fluid">
	
	<div class="row">
		<div class="col-md-12 ">
			<div class="row absolute">
			<form action="">
				<div class="col-md-12">
					<label>Mail :</label>
					<p><% request.getAttribute("mail"); %>uneadresse@mail.fr</p>
					<input type="email" class="form-control" id="mail" />
					<input type="button" value="Modifier">
				</div>
				<div class="col-md-12">
					<label><% request.getAttribute("mdp");%>Mot de passe :</label>
					<input type="password" id="mdp" value="password" name="mdp">
					<input type="button" value="Modifier">
				</div>
				
				<div class="col-md-12">
					<label>Message :</label>
					<figure>
						<pre></pre>
					</figure>
				</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>