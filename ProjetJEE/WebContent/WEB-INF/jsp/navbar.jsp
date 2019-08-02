
<%@ page import="projetjee.bo.User" %> 


	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	  
	  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" 
	  aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
	    <span class="navbar-toggler-icon"></span>
	  </button>
	  <div class="collapse navbar-collapse" id="navbarText">
	    <ul class="navbar-nav mr-auto">
	    <% User role = (User) session.getAttribute("currentSessionUser"); %>
	    
	      <li class="nav-item">
	        <a class="nav-link" href="accueil">Accueil <span class="sr-only">(current)</span></a>
	      </li>
	      <li class="nav-item">
	        <a class="nav-link" href="nos_plats">Nos plats</a>
	      </li>
	   
	       <% 
	      	if(session.getAttribute("currentSessionUser") == null)
	     	 {
				out.print("<li class=\"nav-item\">");
				out.print("<a class=\"nav-link\" href=\"inscription\">");
				out.print("Inscription");
				out.print("</a>");
				out.print("</li>");
			}
			
	      %>
 
	      <% 
	      if(session.getAttribute("currentSessionUser") != null)
	      {
	      	if(role.getRole().equals("admin"))
	     	 {
				out.print("<li class=\"nav-item\">");
				out.print("<a class=\"nav-link\" href=\"ajouterUnPlat\">");
				out.print("Ajouter un plat");
				out.print("</a>");
				out.print("</li>");
			}
	      }
			
	      %>
	    </ul>
	      <ul class="navbar-nav navbar-right">
	        <li  class="nav-item">
	        	<a class="nav-link" href="/ProjetJEE/ServletConnexion">
	        		<span class="glyphicon glyphicon-log-in"></span>
				        <%
			
							if(session.getAttribute("currentSessionUser") != null)
							{
								out.print("Deconnexion");	
							}
							else
							{
								out.print("Connexion");	
							}
			
						%>
				</a>
			</li>
			
			<% 
	      	if(session.getAttribute("currentSessionUser") != null)
	     	 {
				out.print("<li class=\"nav-item\">");
				out.print("<a class=\"nav-link\" href=\"monCompte\">");
				out.print("<span class=\"glyphicon glyphicon-user\">");
				out.print("</span>");
				out.print("Mon compte");
				out.print("</a>");
				out.print("</li>");
			}
			
	      %>
			
	      </ul>
	    </div>
	  </div>
	</nav>
	
