<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
          
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

<%
	List<String> erreurs = (List<String>)request.getAttribute("erreurs");
	if(erreurs != null && erreurs.size() > 0) {
		out.print("<ul>");
		for (String err : erreurs) {
			out.print("<li>"+err+"</li>");
		}
		out.print("</ul>");
	}
%>
<form method="post" action="<%= request.getContextPath()%>/ServletConnexion">
	<p>
		<label for="email">email : </label>
		<input type="text" id="email" name="email">
	</p>
	<p>
		<label for="mdp">Mot de passe : </label>
		<input type="password" id="mdp" name="mdp">
	</p>

	<input type="submit" value="Valider">
</form>

<br>
<p>Erreur de saisie... Veuillez remplir les champs correctement</p>

</body>
</html>