<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./css/style.css"/>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
 
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>         

<title>Ajouter un plat</title>
</head>
<body>
	<%@ include file="navbar.jsp" %>
	
	<div class="container-fluid">
	<div class="row absolute background coin-arrondi" style="margin-left: auto; margin-right: auto">
		<div class="col-md-12">
			<div class="row">
			<form method="POST" action="<%= request.getContextPath()%>/ServletAjoutPlat">
				
				<div class="col-md-12">
					<label for="nom">Nom :</label>
					<input type="text" class="form-control" id="nom" name="nom" />	
				</div>
				
				<br>
				<br>
				
				<div class="col-md-12">
					<label for="description">Description :</label>
					<textarea id="description" placeholder="Une description..." rows="5" cols="80" name="description"></textarea>
				</div>
				
				<div class="col-md-12">
					<label for="ingredient">Ingredient : </label>
					<textarea id="ingredient" placeholder="des ingredient..." rows="5" cols="80" name="ingredient"></textarea>
				</div>
				
				<div class="col-md-12">
					<label for="prix">Prix :</label>
					<input type="number" class="form-control" id="prix" name="prix" />	
				</div>
								
				<div class="col-md-12">
					<label for="urlImg">Image :</label>
					<input type="file" class="form-control-file" id="urlImg" name="img"/>	
				</div>
				<br>
				<div class="col-md-12">
					<select id="resto" name="resto">
					    <option value="">Choisissez un restaurant</option>
					    <option value="1">Nantes</option>
					    <option value="2">Rennes</option>
					</select>
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