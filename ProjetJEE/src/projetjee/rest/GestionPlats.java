package projetjee.rest;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;

import projetjee.bll.PlatManager;
import projetjee.bo.Plat;
import projetjee.bo.Restaurant;

@Path("/plats")
public class GestionPlats {
	PlatManager pm = new PlatManager();
	List<Plat> plats = new ArrayList<Plat>();

	
	@GET
	public List<Plat> getPlat() throws Exception {
		plats = pm.getAll();
		System.out.println(plats.toString());
		return plats;
	}

}
