package projetjee.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import projetjee.bll.PlatManager;
import projetjee.bo.Plat;
import projetjee.bo.Restaurant;

/**
 * Servlet implementation class ServletAjoutPlat
 */
@WebServlet("/ServletAjoutPlat")
public class ServletAjoutPlat extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ServletAjoutPlat() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nom = request.getParameter("nom");
		String description = request.getParameter("description");
		String ingredient = request.getParameter("ingredient");
		String prix = request.getParameter("prix");
		String image = request.getParameter("img");
		String restosId = request.getParameter("resto");	
		
		PlatManager rm = new PlatManager();
		Plat plat;
		try {
			plat = rm.ajouter(nom, ingredient, description, Float.valueOf(prix),image, Integer.valueOf(restosId));
			//System.out.println(plat.getId() + " " + plat.getNom() + " " + plat.getIngredients() + " " + plat.getDescriptif() + " " + plat.getPrix() + " " + plat.getImage() + " " + plat.getRestaurant().getId());
		} catch (NumberFormatException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("accueil");
		rd.forward(request, response);
	}

}
