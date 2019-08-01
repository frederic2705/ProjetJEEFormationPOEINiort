<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./css/style.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">     

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>     
<meta charset="UTF-8">

<title>Connexion</title>
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
	      <li class="nav-item active">
	        <a class="nav-link" href="connexion">Connexion</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="inscription">Inscription</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="monCompte">Mon Compte</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="ajouterUnPlat">Ajouter un plat</a>
	      </li>
	    </ul>
	  </div>
	</nav>
	<!-- FIN Nav -->
<br>

<div class="container-fluid">
		<div class="row  absolute background coin-arrondi" style="margin-left: auto; margin-right: auto">
			<div class="col-md-12 ">
			 <br>
			<form method="post" action="<%= request.getContextPath()%>/ServletConnexion">
				<div class="form-group">
					<label for="email">Email : </label>
					<input type="email" class="form-control" id="email" name="email">
				</div>
				
				<div class="form-group">
					<label for="mdp">Mot de passe : </label>
					<input type="password" class="form-control" id="mdp" name="mdp">
				</div>
				<div class="form-group">
					<input type="submit" class="btn btn-secondary btn-lg btn-block value="Valider">
				</div>
			</form>
			<div class="erreur">
				<%
					List<String> erreurs = (List<String>)request.getAttribute("erreurs");
					if(erreurs != null && erreurs.size() > 0) {
						out.print("<pre>");
						out.print("<ul>");
						for (String err : erreurs) {
							out.print("<li>"+err+"</li>");
						}
						out.print("</ul>");
						out.print("</pre>");
					}
				%>
			</div>
		</div>
	</div>
</div>
</body>
</html>