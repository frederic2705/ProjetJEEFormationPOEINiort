<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="./css/style.css"/>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<title>Ajouter un plat</title>
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
	    
	      <li class="nav-item">
	        <a class="nav-link" href="accueil">Accueil <span class="sr-only">(current)</span></a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="nos_plats">Nos plats</a>
	      </li>
	       <li class="nav-item">
	        <a class="nav-link" href="/ProjetJEE/ServletConnexion">
	        <%
				if(session.getAttribute("currentSessionUser") != null)
				{
					out.print("Deconnexion");	
				}
				else
				{
					out.print("Connexion");	
				}
			%>
			 </a>
	      </li>
	      <% 
	      	if(session.getAttribute("currentSessionUser") == null)
	     	 {
				out.print("<li class=\"nav-item\">");
				out.print("<a class=\"nav-link\" href=\"inscription\">");
				out.print("Inscription");
				out.print("</a>");
				out.print("</li>");
			}
			
	      %>
	      <li class="nav-item">
	        <a class="nav-link" href="monCompte">Mon Compte</a>
	      </li>
	      <li class="nav-item active">
	        <a class="nav-link" href="ajouterUnPlat">Ajouter un plat</a>
	      </li>
	    </ul>
	  </div>
	</nav>
	<!-- FIN Nav -->
	<div class="container-fluid">
	<div class="row absolute background coin-arrondi" style="margin-left: auto; margin-right: auto">
		<div class="col-md-12">
			<div class="row">
			<form action="">
				<div class="col-md-12">
					<label for="nom">Nom :</label>
					<input type="text" class="form-control" id="nom" name="nom" />	
				</div>
				
				<br>
				<br>
				
				<div class="col-md-12">
					<label for="description">Description :</label>
					<textarea id="description" placeholder="Une description..." rows="5" cols="80"></textarea>
				</div>
				
				<div class="col-md-12">
					<label for="ingredient">Ingredient : </label>
					<textarea id="ingredient" placeholder="des ingredient..." rows="5" cols="80"></textarea>
				</div>
				
				<div class="col-md-12">
					<label for="prix">Prix :</label>
					<input type="number" class="form-control" id="prix" name="prix" />	
				</div>
				
				<div class="col-md-12">
					<label for="urlImg">Image :</label>
					<input type="file" class="form-control-file" id="urlImg" />	
				</div>
				<br>
				<div class="col-md-12">
					<input type="submit" value="Ajouter" >
				</div>

				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>