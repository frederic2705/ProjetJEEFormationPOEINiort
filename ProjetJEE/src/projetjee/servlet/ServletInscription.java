package projetjee.servlet;

import java.io.IOException;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import projetjee.bll.UserManager;
import projetjee.bo.User;

/**
 * Servlet implementation class ServletInscription
 */
@WebServlet("/ServletInscription")
public class ServletInscription extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletInscription() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/inscription.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Récupération du formulaire
		String nom = request.getParameter("Nom");
		String prenom = request.getParameter("prenom");
		String mail = request.getParameter("mail");
		String mdp = request.getParameter("mdp");
		String mdp2 = request.getParameter("mdp2");
		String commentaire = request.getParameter("commentaire");
		
		
		//test de récupération
		System.out.println(nom);
		System.out.println(prenom);
		System.out.println(mail);
		System.out.println(commentaire);
		System.out.println(mdp);
		
		//vérification format de mail
		String regex = "^([_a-zA-Z0-9-]+(\\.[_a-zA-Z0-9-]+)*@[a-zA-Z0-9-]+(\\.[a-zA-Z0-9-]+)*(\\.[a-zA-Z]{1,6}))?$";
        Pattern p = Pattern.compile(regex);
		Matcher m = p.matcher(mail);
		boolean b = m.matches();
		
		if ((b == true) & (mdp.equals(mdp2)))
		{
			UserManager rm = new UserManager ();
			try 
			{
				User userInsere = rm.ajouter(nom, prenom, mail, mdp, "user");
			} 
			catch (Exception e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("accueil");
			rd.forward(request, response);
			
		}
		else
		{
			response.sendRedirect("inscription");
		}
		
	}

}
