package projetjee.rest;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;

import projetjee.bo.Plat;
import projetjee.bo.Restaurant;

@Path("/plats")
public class GestionPlats {
	
	
	private static int i;
	private static Restaurant resto1 = new Restaurant();
	
	private static List<Plat> plats = new ArrayList<Plat>();
	private static Plat plat1 = new Plat("Nom_Plat_1", "Carottes, steak", "Descriptif_Plat_1", 15.5f, 1, resto1);
	private static Plat plat2 = new Plat("Nom_Plat_2", "Purée, missile", "Descriptif_Plat_2", 10.5f, 1, resto1);
	
	static {
		
		plats.add(plat1);
		plats.add(plat2);

		i = 2;
	}
	
	@GET
	public List<Plat> getPlat() {
		return plats;
	}

}
