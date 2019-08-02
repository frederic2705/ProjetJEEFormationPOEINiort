package projetjee.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import projetjee.bll.UserManager;
import projetjee.bo.User;

/**
 * Servlet implementation class ServletConnexion
 */
@WebServlet("/ServletConnexion")
public class ServletConnexion extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private int compteur = 0; 
   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletConnexion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		session.invalidate ();
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/connexion.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// Initialisation des erreurs possibles
		List<String> erreurs = new ArrayList<String>();
		
		//Récupération du formulaire
		String mail = request.getParameter("email");
		String mdp = request.getParameter("mdp");
		User user = new User(); 
				
		
		
		//Recupération de la bdd
		UserManager rm = new UserManager();
		user.setMail(mail);
		user.setMdp(mdp);
		User userConnexion = null;
		
		try {
			
			 userConnexion = rm.selectRole(user);
			System.out.println(userConnexion.getMail() + " " + userConnexion.getMdp());
			if((user.getMail().equals("")) && (user.getMdp().equals("")))
			{
				erreurs.add("Veuillez, saisir un mail et un mot de passe.");
				compteur++;
			}
			else
			{
				if(!user.getMail().equals(userConnexion.getMail()))
				{
					erreurs.add("Mail non valide");
					compteur++;
				}
				
				if(!user.getMdp().equals(userConnexion.getMdp()))
				{
					erreurs.add("Mot de passe non valide");
					compteur++;
				}
			}
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	
		//gestion des 3 tentatives de connexion
		if(compteur > 3)
		{
			RequestDispatcher rd = request.getRequestDispatcher("inscription");
			rd.forward(request, response);
		}
		//
		
		if(erreurs.size()>0)
		{
			request.setAttribute("erreurs", erreurs);
			RequestDispatcher rd = request.getRequestDispatcher("connexion");
			rd.forward(request, response);
		}
		else
		{
			//création session
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(10*60);
			compteur = 0;
			session.setAttribute("currentSessionUser", userConnexion);
			RequestDispatcher rd = request.getRequestDispatcher("accueil");
			rd.forward(request, response);
		}
		

	}

}
