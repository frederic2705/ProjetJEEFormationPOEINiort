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
		
		//test de récupération
		System.out.println(mail);
		System.out.println(mdp);
		
		if((mail == null) & (mdp == null))
		{
			erreurs.add("Veuillez, mettre un mail et un mot de passe.");
		}
		
		//Recupération de la bdd
		UserManager rm = new UserManager();
		try 
		{
			List<User> user = rm.getAll();
		}
		catch (Exception e) 
		{
			
			e.printStackTrace();
		}
		
		request.setAttribute("mail", mail);
		request.setAttribute("mdp", mdp);
		
		
		if(erreurs.size()>0)
		{
			request.setAttribute("erreurs", erreurs);
			RequestDispatcher rd = request.getRequestDispatcher("connexion");
			rd.forward(request, response);
		}
		else
		{
			
			RequestDispatcher rd = request.getRequestDispatcher("accueil");
			rd.forward(request, response);
		}
		
		
		
		
		
	}

}
