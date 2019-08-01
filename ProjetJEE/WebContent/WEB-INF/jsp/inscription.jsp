<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./css/style.css"/>
<title>Inscription</title>
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
	    
	      <li class="nav-item ">
	        <a class="nav-link" href="accueil">Accueil <span class="sr-only">(current)</span></a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="nos_plats">Nos plats</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="connexion">Connexion</a>
	      </li>
	      <li class="nav-item active">
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
	<div class="container-fluid">
		<div class="row absolute">
			<div class="col-md-12 ">
			 <br>
				<form method="POST" action="/ProjetJEE/ServletInscription">
				
					<div class="form-group">			 
						<label for="Nom">
							Nom :
						</label>
						<input type="text" class="form-control" id="Nom" name="Nom"/>
					</div>
					
					<div class="form-group">
									 
						<label >
							Prenom :
						</label>
						<input type="text" class="form-control" id="prenom" name="prenom"/>
					</div>
					
					<div class="form-group">
						<label for="mail">
							Mail :
						</label>
						<input type="email" class="form-control" id="mail" name="mail" />
						
					</div>
					
					<div class="form-group">
						<label for="mdp">
							Mot de passe :
						</label>
						<input type="password" class="form-control" maxlength="32" id="mdp" name="mdp"/>
					</div>
					
					<div class="form-group">
						<label for="mdp2">
							Confirmation de mot de passe :
						</label>
						<input type="password" class="form-control" id="mdp2" maxlength="32" name="mdp2" />
					</div>
					
					<div class="form-group">
						<label for="commentaire">
							Commentaire :
						</label>
						<input type="text" class="form-control" id="commentaire" name="commentaire"/>
					</div>
					
					<div class="form-group">
						<input type="submit" class="btn btn-secondary btn-lg btn-block"  value=Valider />
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>