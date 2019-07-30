package projetjee.bll;

import java.sql.Date;
import java.util.List;
import projetjee.bo.Commentaire;
import projetjee.bo.Plat;
import projetjee.bo.User;
import projetjee.dal.CommentaireDAO;
import projetjee.dal.DAOFactory;

public class CommentaireManager 
{
	private CommentaireDAO commentaireDAO;
	
	public CommentaireManager() 
	{
		this.commentaireDAO = DAOFactory.getCommentaireDAO();
	}

	public Commentaire ajouter(String contenu, int note, Date date, Plat plat, User user) throws Exception
	{		
		Commentaire commentaire = new Commentaire(contenu, note, date, plat, user);

		this.commentaireDAO.insert(commentaire);
		
		return commentaire;
	}
	
	public Commentaire modifierCommentaire(Commentaire commentaire) throws Exception
	{
		this.commentaireDAO.update(commentaire);
		return commentaire;
	}
	
	public void supprimerCommentaire(Commentaire commentaire) throws Exception
	{
		this.commentaireDAO.delete(commentaire);
	}
	
	public List<Commentaire> getCommentairesParUser(User user) throws Exception
	{
		List<Commentaire> retour = null;		
		retour = commentaireDAO.selectAllByUser(user);
		
		return retour;
	}
	
	public List<Commentaire> getCommentairesParPlat(Plat plat) throws Exception
	{
		List<Commentaire> retour = null;		
		retour = commentaireDAO.selectAllByPlat(plat);		
		return retour;
	}
}
