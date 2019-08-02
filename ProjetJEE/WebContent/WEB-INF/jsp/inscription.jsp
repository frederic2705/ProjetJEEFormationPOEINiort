<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="./css/style.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<title>Inscription</title>
</head>
<body>
<%@ include file="navbar.jsp" %>
	<div class="container-fluid">
		<div class="row absolute background coin-arrondi" style="margin-left: auto; margin-right: auto">
			<div class="col-lg-12 col-xs-12 col-sm-12 col-md-12">
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
				<div class="erreur">
				<%
					List<String> erreurs = (List<String>)request.getAttribute("erreurs");
					if(erreurs != null && erreurs.size() > 0) {
						out.print("<pre>");
						out.print("<ul>");
						for (String err : erreurs) {
							out.print("<li>"+err+"</li>");
						}
						out.print("</ul>");
						out.print("</pre>");
					}
				%>
			</div>
			</div>
		</div>
	</div>
</body>
</html>