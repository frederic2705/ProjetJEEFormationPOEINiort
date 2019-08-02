package projetjee.bll;

import java.util.List;

import projetjee.bo.Plat;
import projetjee.bo.Restaurant;
import projetjee.dal.DAOFactory;
import projetjee.dal.PlatDAO;

public class PlatManager {
	private PlatDAO dao;
	
	public PlatManager() 
	{
		this.dao = DAOFactory.getPlatDAO();
	}
	public Plat ajouter(String nom, String ingredients, String descriptif, float prix, String image, int restoId) throws Exception
	{
		Restaurant restaurant = new Restaurant();
		restaurant.setId(restoId);
		Plat plat = new Plat (nom, ingredients, descriptif, prix , image, restaurant);
		this.dao.insert(plat);
		return plat;
	}
	public List<Plat> getAll() throws Exception {
		return dao.selectAll();
	}

}
