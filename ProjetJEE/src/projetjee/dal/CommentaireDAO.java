package projetjee.dal;

import java.util.List;

import projetjee.bo.Commentaire;
import projetjee.bo.Plat;
import projetjee.bo.User;

public interface CommentaireDAO 
{
	public void insert(Commentaire commentaire) throws Exception;
	public void update(Commentaire commentaire) throws Exception;
	public void delete(Commentaire commentaire) throws Exception;
	public List<Commentaire> selectAllByUser(User user) throws Exception;
	public List<Commentaire> selectAllByPlat(Plat plat) throws Exception;
}
