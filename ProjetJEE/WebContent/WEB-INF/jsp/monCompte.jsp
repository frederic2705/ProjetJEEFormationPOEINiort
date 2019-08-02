<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="projetjee.bo.User" %>
    <%@ page import="projetjee.bo.Commentaire" %>
    <%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./css/style.css"/>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
 
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>         

<meta charset="UTF-8">


<title>Mon compte</title>
</head>
<body>
<%@ include file="navbar.jsp" %>
	<div class="container-fluid">
	
	<div class="row absolute background coin-arrondi" style="margin-left: auto; margin-right: auto">
		<div class="col-md-12 ">
			<div class="row" style="text-align: center">
			<form method="POST" action="/ProjetJEE/ServletMonCompte">
				<div class="col-md-12 form-group">
					<label>Mail :</label>
					<p><%= request.getAttribute("mail") %></p>
					<input type="email" class="form-control" id="mail" />
					<input type="submit" value="Modifier">
				</div>
				<div class="col-md-12 form-group">
					<label>Mot de passe :</label>
					<input type="password" id="mdp" value="<%= request.getAttribute("mdp")%>" name="mdp">
					<input type="submit" value="Modifier">
				</div>
				
				<div class="col-md-12 form-group">
						<% for (Commentaire commentaire : (List<Commentaire>)(request.getAttribute("commentaire"))){ %>
								<h3>Message</h3>
								<ul>
									<li><%= commentaire.getContenu()%></li>
								</ul>
						<% } %>
				</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>