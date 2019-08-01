package projetjee.rest;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;

import projetjee.bll.CommentaireManager;
import projetjee.bll.PlatManager;
import projetjee.bo.Commentaire;
import projetjee.bo.Plat;
import projetjee.bo.Restaurant;
import projetjee.bo.User;

@Path("/commentaires")
public class GestionCommentaires {

	CommentaireManager cm = new CommentaireManager();
	List<Commentaire> commentaires = new ArrayList<Commentaire>();
	
	
	@GET
	public List<Commentaire> getCommentaire(Plat plat) throws Exception {
		commentaires = cm.getCommentairesParPlat(plat);
		System.out.println(commentaires.toString());
		return commentaires;
	}

}
