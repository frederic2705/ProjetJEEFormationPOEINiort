<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
  <title>Nos plats</title>
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">  
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
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
	      <li class="nav-item active">
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
	      <li class="nav-item">
	        <a class="nav-link" href="ajouterUnPlat">Ajouter un plat</a>
	      </li>
	    </ul>
	  </div>
	</nav>
	<!-- FIN Nav -->

<!-- Carousel et descriptif -->
<div class="container">
    <div class="row">
		<div class="col-md-8"> 
		  <div id="myCarousel" class="carousel slide" data-interval="false">
		    <!-- Indicators -->
		    <ol class="carousel-indicators">
		      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
		      <li data-target="#myCarousel" data-slide-to="1"></li>
		      <li data-target="#myCarousel" data-slide-to="2"></li>
		      <li data-target="#myCarousel" data-slide-to="3"></li>
		      <li data-target="#myCarousel" data-slide-to="4"></li>
		      <li data-target="#myCarousel" data-slide-to="5"></li>
		      <li data-target="#myCarousel" data-slide-to="6"></li>
		      <li data-target="#myCarousel" data-slide-to="7"></li>
		    </ol>
		
		    <!-- Wrapper for slides -->
		    <div class="carousel-inner">
		      <div class="item thumbnail active">
		        <img src="./img/salade_chevre_chaud.jpg" alt="Los Angeles" style="max-width:100%;">
		      </div>
		
		      <div class="item thumbnail">
		        <img src="./img/salade_automne_champignons_sautes.jpg" alt="Chicago" style="max-width:100%;">
		      </div>
		    
		      <div class="item thumbnail">
		        <img src="./img/taboule_libanais.jpg" alt="New york" style="max-width:100%;">
		      </div>
		    
		      <div class="item thumbnail">
		        <img src="./img/burger_avocat_bacon.jpg" alt="New york" style="max-width:100%;">
		      </div>
		    
		      <div class="item thumbnail">
		        <img src="./img/chiktaye_morue_guadeloupe.jpg" alt="New york" style="max-width:100%;">
		      </div>
		    
		      <div class="item thumbnail">
		        <img src="./img/cake_banane_chocolat.jpg" alt="New york" style="max-width:100%;">
		      </div>
		    
		      <div class="item thumbnail">
		        <img src="./img/tarte_tatin.jpg" alt="New york" style="max-width:100%;">
		      </div>
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
		<div>
			<h4>Titre</h4>
			<p>Descriptif</p>
		</div>
	</div>
  </div>
</div>
<!-- Fin carousel et descriptif -->

<!-- Infos -->
<div class="container">
    <div class="row">
		<div class="col-md-8">
		<div>
			<h4>Infos</h4>
			<p>Note moyenne : </p>
			<p>Nombre total de commande dans nos restaurants : </p>
			<p>Commentaires : </p>
		</div>		
	</div>
  </div>
</div>
<!-- Fin infos -->

<!-- Evaluation User -->
<div class="container">
    <div class="row">
		<div class="col-md-8">
		<div>
			<h4>Votre évaluation : </h4>
			<p>Note : </p>
			<p>Commentaires : </p>
		</div>		
	</div>
  </div>
</div>
<!-- Fin evaluation User -->

<!-- Modifs commentaires Admin -->
<div class="container">
    <div class="row">
		<div class="col-md-8">
		<div>
			<h4>Votre évaluation : </h4>
			<p>Note : </p>
			<p>Commentaires : </p>
		</div>		
	</div>
  </div>
</div>
<!-- Fin modifs commentaires Admin -->

</body>
</html>