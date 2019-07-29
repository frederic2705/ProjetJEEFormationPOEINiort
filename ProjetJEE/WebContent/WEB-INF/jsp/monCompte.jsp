<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="./css/style.css"/>
<title>Mon compte</title>
</head>
<body>
	<div class="container-fluid">
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
			<div class="row">
			<form action="">
				<div class="col-md-12">
					<label>Mail :</label>
					<p>uneadresse@mail.fr</p>
					<input type="email" class="form-control" id="mail" />
					<input type="button" value="Modifier">
				</div>
				<div class="col-md-12">
					<label>Mot de passe :</label>
					<input type="password" id="mdp" value="password" name="mdp">
					<input type="button" value="Modifier">
				</div>
				<div class="col-md-12">
					<label>Message :</label>
					<figure>
						<pre>Ceci est un test</pre>
					</figure>
				</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>