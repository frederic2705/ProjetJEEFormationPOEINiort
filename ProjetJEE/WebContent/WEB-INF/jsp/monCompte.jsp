<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"><link rel="stylesheet" type="text/css" href="./css/style.css"/>
<link rel="stylesheet" type="text/css" href="./css/style.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
 <%@ page import="projetjee.bo.User" %>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<title>Mon compte</title>
</head>
<body>
<%@ include file="navbar.jsp" %>

	<div class="container-fluid">
		<div class="row absolute background coin-arrondi" style="margin-left: auto; margin-right: auto">
			<div class="col-md-12">
				<div class="row">
				<form action="">
					<div class="col-md-12">
						<label>Mail :</label>
						<p>uneadresse@mail.fr</p>
						<input type="email" class="form-control" id="mail" />
						<br>
						<input type="button" value="Modifier">
						<br>
						<br>
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