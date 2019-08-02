package projetjee.rest;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;

import projetjee.bll.CommentaireManager;
import projetjee.bo.Commentaire;

@Path("/commentaires")
public class GestionCommentaires {

	CommentaireManager cm = new CommentaireManager();
	private static List<Commentaire> commentaires;
	
	
	static {
		commentaires = new ArrayList<Commentaire>();
	}
	
	@GET
	@Path("/{id : \\d+}")
	public List<Commentaire> getCommentaire(
			@PathParam("id") int id) throws Exception {
		commentaires = cm.getCommentairesParPlat(id);
		return commentaires;
	}
	
	@POST
	public Commentaire ajouterCommentaire(
			@FormParam("value") String value)
	{
		Commentaire commentaire = new Commentaire();
		commentaires.add(commentaire);
		return commentaire;
	}
	
	@PUT
	@Path("/{id : \\d+}")
	public Commentaire modifierCommentaire(
			@PathParam("id") int id,
			@FormParam("value") String value) throws Exception
	{
		Commentaire commentaireAModifier = null;
		for(Commentaire com : commentaires)
		{
			if(com.getId()==id)
			{
				com.setContenu(value);
				commentaireAModifier=com;
				cm.modifierCommentaire(commentaireAModifier);
				break;
			}
		}
		
		return commentaireAModifier;
	}
	
	@DELETE
	@Path("/{id : \\d+}")
	public boolean Commentaire(@PathParam("id") int id) throws Exception
	{
		Commentaire commentaireASupprimer = null;
		for(Commentaire com : commentaires)
		{
			if(com.getId()==id)
			{
				commentaireASupprimer=com;
				cm.supprimerCommentaire(commentaireASupprimer);
				break;
			}
		}
		return commentaires.remove(commentaireASupprimer);
	}

}
