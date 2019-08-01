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
		
		//test de récupération
		System.out.println(mail);
		System.out.println(mdp);
		
		if((mail.equals("")) && (mdp.equals("")))
		{
			erreurs.add("Veuillez, mettre un mail et un mot de passe.");
		}
		
		//Recupération de la bdd
		UserManager rm = new UserManager();
		user.setMail(mail);
		user.setMdp(mdp);
		
		try {
			
			User userConnexion = rm.selectConnection(user);
			if((user.getMail().equals("")) && (user.getMdp().equals("")))
			{
				erreurs.add("Aucune données correspondante.");
			}
		} 
		catch (Exception e) 
		{
			erreurs.add("Aucune données correspondante.");
		}
	
		
		
		
		if(erreurs.size()>0)
		{
			request.setAttribute("erreurs", erreurs);
			RequestDispatcher rd = request.getRequestDispatcher("connexion");
			rd.forward(request, response);
		}
		else
		{
			HttpSession session = request.getSession();
			session.setMaxInactiveInterval(10);
			RequestDispatcher rd = request.getRequestDispatcher("accueil");
			rd.forward(request, response);
		}
		

	}

}
