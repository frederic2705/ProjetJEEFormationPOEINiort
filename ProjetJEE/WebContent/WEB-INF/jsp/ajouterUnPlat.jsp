<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./css/style.css"/>
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
	        <a class="nav-link" href="connexion">Connexion</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="inscription">Inscription</a>
	      </li>
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
	<div class="row">
		<div class="col-md-12 absolute">
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