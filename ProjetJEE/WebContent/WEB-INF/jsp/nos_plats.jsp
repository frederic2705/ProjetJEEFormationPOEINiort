<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
 
<!-- 	<link href="bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="css/style.css" rel="stylesheet"/>
    <script src="jquery/jquery-3.2.1.js"></script>
    <script src="bootstrap-3.3.7/js/bootstrap.js"></script>    -->    
       
<meta charset="UTF-8">

<title>Nos plats</title>
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
		<div class="col-md-6">
			<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img class="d-block w-100" src="./img/salade_automne_champignons_sautes.jpg" alt="Slide 1" style="max-height:400px">
			    </div>
			    <div class="carousel-item">
			      <img class="d-block w-100" src="./img/salade_chevre_chaud.jpg" alt="Slide 2" style="max-height:400px">
			    </div>
			    <div class="carousel-item">
			      <img class="d-block w-100" src="./img/burger_avocat_bacon.jpg" alt="Slide 3" style="max-height:400px">
			    </div>
			    <div class="carousel-item">
			      <img class="d-block w-100" src="./img/chiktaye_morue_guadeloupe.jpg" alt="Slide 5" style="max-height:400px">
			    </div>
			    <div class="carousel-item">
			      <img class="d-block w-100" src="./img/taboule_libanais.jpg" alt="Slide 6" style="max-height:400px">
			    </div>
			    <div class="carousel-item">
			      <img class="d-block w-100" src="./img/cake_banane_chocolat.jpg" alt="Slide 7" style="max-height:400px">
			    </div>
			    <div class="carousel-item">
			      <img class="d-block w-100" src="./img/tarte_tatin.jpg" alt="Slide 8" style="max-height:400px">
			    </div>
			  </div>
			  <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </a>
			  <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </a>
			</div>
		</div>
		<div class="col-md-4">
			<h2>
				Heading
			</h2>
			<p>
				Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.
			</p>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<form role="form">
				<div class="form-group">
					 
					<label for="exampleInputEmail1">
						Email address
					</label>
					<input type="email" class="form-control" id="exampleInputEmail1" />
				</div>
				<div class="form-group">
					 
					<label for="exampleInputPassword1">
						Password
					</label>
					<input type="password" class="form-control" id="exampleInputPassword1" />
				</div>
				<div class="form-group">
					 
					<label for="exampleInputFile">
						File input
					</label>
					<input type="file" class="form-control-file" id="exampleInputFile" />
					<p class="help-block">
						Example block-level help text here.
					</p>
				</div>
				<div class="checkbox">
					 
					<label>
						<input type="checkbox" /> Check me out
					</label>
				</div> 
				<button type="submit" class="btn btn-primary">
					Submit
				</button>
			</form>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<form role="form">
				<div class="form-group">
					 
					<label for="exampleInputEmail1">
						Email address
					</label>
					<input type="email" class="form-control" id="exampleInputEmail1" />
				</div>
				<div class="form-group">
					 
					<label for="exampleInputPassword1">
						Password
					</label>
					<input type="password" class="form-control" id="exampleInputPassword1" />
				</div>
				<div class="form-group">
					 
					<label for="exampleInputFile">
						File input
					</label>
					<input type="file" class="form-control-file" id="exampleInputFile" />
					<p class="help-block">
						Example block-level help text here.
					</p>
				</div>
				<div class="checkbox">
					 
					<label>
						<input type="checkbox" /> Check me out
					</label>
				</div> 
				<button type="submit" class="btn btn-primary">
					Submit
				</button>
			</form>
		</div>
	</div>
</div>

</body>
</html>