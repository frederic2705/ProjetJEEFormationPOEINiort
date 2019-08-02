<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="http://maps.google.com/maps/api/js?sensor=false" 
          type="text/javascript"></script>
          
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        
<meta charset="UTF-8">

<title>Accueil</title>
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
	        <a class="nav-link" href="<%= request.getContextPath()%>/ServletMonCompte">Mon Compte</a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="<%= request.getContextPath()%>/ServletConnexion">Ajouter un plat</a>
	      </li>
	    </ul>
	  </div>
	</nav>
	<!-- FIN Nav -->
<div class="container-fluid">
	<div class="row" style="margin-top:50px">
		<div class="col-md-8">
			<div class="row">
				<div class="col-md-6">
					<div class="card">
						<img class="card-img-top" alt="Image resto1" src="./img/resto1.jpg" style="min-height:200px;" />
						<div class="card-block">
							<h5 class="card-title">
								Resto 1
							</h5>
							<p class="card-text">
								Venez vous restaurationner au restaurant number 1
							</p>
							<p class="card-text">
								Adresse 1
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card">
						<img class="card-img-top" alt="Image resto2" src="./img/resto2.jpeg" style="min-height:200px;" />
						<div class="card-block">
							<h5 class="card-title">
								Resto 2
							</h5>
							<p class="card-text">
								Venez vous restaurationner au restaurant number 2
							</p>
							<p class="card-text">
								Adresse 2
							</p>
						</div>
					</div>
				</div>				
			</div>
		</div>
	
		<div class="col-md-4" id="map" style="min-height:500px;">
			
		</div>
	</div>
</div>

<script>
				var locations = [
      ['Resto de Nantes', 47.215358, -1.550445, 1],
      ['Resto de Rennes', 48.114112, -1.68138, 2],
    ];

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 7,
      center: new google.maps.LatLng(47.46, -2.32),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var infowindow = new google.maps.InfoWindow();

    var marker, i;

    for (i = 0; i < locations.length; i++) {  
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        map: map
      });

      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent(locations[i][0]);
          infowindow.open(map, marker);
        }
      })(marker, i));
    }
			</script>

</body>
</html>