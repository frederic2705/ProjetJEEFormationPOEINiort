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
import projetjee.bll.CommentaireManager;
import projetjee.bll.UserManager;
import projetjee.bo.Commentaire;
import projetjee.bo.User;

/**
 * Servlet implementation class ServletMonCompte
 */
@WebServlet("/ServletMonCompte")
public class ServletMonCompte extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletMonCompte() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("currentSessionUser");
		int id = 0;
		String userMdp = null;
		String userMail = null;
		if (user != null) {
			id = user.getId();
			userMdp = user.getMdp();
			userMail = user.getMail();
		}
				
		CommentaireManager am = new CommentaireManager();
		List<Commentaire> commentaire = new ArrayList<Commentaire>();
		try {
			commentaire = am.getCommentairesParUser(user);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println(commentaire);
		request.setAttribute("mdp", userMdp);
		request.setAttribute("mail", userMail);
		request.setAttribute("commentaire", commentaire);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/jsp/monCompte.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

			HttpSession session = request.getSession();
			User user = (User) session.getAttribute("currentSessionUser");
			UserManager rm = new UserManager();
			String mdp = request.getParameter("mdp");
			String mail = request.getParameter("mail");
			if(mail == null)
			{
				mail = user.getMail();
				user.setMail(mail);
				user.setMdp(mdp);
				System.out.println(user.getMail());
				try {
					rm.update(user);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			if(mdp.equals(user.getMdp()))
			{
				mdp = user.getMdp();
				user.setMdp(mdp);
				user.setMail(mail);
				try {
					System.out.println(user.getMail());
					rm.update(user);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			RequestDispatcher rd = request.getRequestDispatcher("accueil");
			rd.forward(request, response);
	}

}
