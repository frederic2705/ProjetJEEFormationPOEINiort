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
	
	public Plat ajouter(String nom, String ingredients, String descriptif, float prix, int quantite, Restaurant restaurant) throws Exception
	{
		Plat plat = new Plat (nom, ingredients, descriptif, prix, quantite , restaurant);
		return plat;
	}
	public List<Plat> getAll() throws Exception {
		List<Plat> retour = null;
		retour = dao.selectAll();
		return retour;
	}
}
