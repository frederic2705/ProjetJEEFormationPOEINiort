package projetjee.rest;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;

import projetjee.bll.CommentaireManager;
import projetjee.bo.Commentaire;

@Path("/commentaires")
public class GestionCommentaires {

	CommentaireManager cm = new CommentaireManager();
	List<Commentaire> commentaires = new ArrayList<Commentaire>();
	
	
	@GET
	@Path("/{id : \\d+}")
	public List<Commentaire> getCommentaire(
			@PathParam("id") int id) throws Exception {
		commentaires = cm.getCommentairesParPlat(id);
		return commentaires;
	}

}
