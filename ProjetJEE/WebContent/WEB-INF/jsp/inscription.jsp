<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="./css/style.css"/>
<title>Inscription</title>
</head>
<body>

	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">
			<!-- Nav -->
			<nav class="navbar navbar-inverse navbar-fixed-top">
				  <div class="container-fluid">
					    
					    <ul class="nav navbar-nav">
					      <li class="active"><a href="#">Home</a></li>
					      <li><a href="#">Accueil</a></li>
					      <li><a href="#">Nos plats</a></li>
					      <li><a href="#">Connexion</a></li>
					      <li><a href="#">Inscription</a></li>
					    </ul>
				  </div>
				</nav>
				<!-- FIN Nav -->

				<div class="row">
					<div class="col-md-12 absolute">
						<form role="form">
							<div class="form-group">
								 
								<label for="Nom">
									Nom :
								</label>
								<input type="text" class="form-control" id="Nom" />
							</div>
							<div class="form-group">
								 
								<label for="prenom">
									Prenom :
								</label>
								<input type="text" class="form-control" id="prenom" />
							</div>
							<div class="form-group">
								 
								<label for="mail">
									mail
								</label>
								<input type="email" class="form-control" id="mail" />
							</div>
							<div class="form-group">
								 
								<label for="mdp">
									Mot de passe :
								</label>
								<input type="password" class="form-control" id="mdp" />
							</div>
							<div class="form-group">
								 
								<label for="mdp2">
									Mot de passe :
								</label>
								<input type="password" class="form-control" id="mdp2" />
							</div>
							<div class="form-group">
								 
								<label for="commentaire">
									Commentaire :
								</label>
								<input type="text" class="form-control" id="commentaire" />
							</div>
							<div class="form-group">
								
								<input type="submit" class="btn btn-default btn-lg btn-block"  value=Valider name="inscription" id="inscription" />
							</div>
							
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>



</body>
</html>