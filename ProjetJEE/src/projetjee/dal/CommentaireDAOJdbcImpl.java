package projetjee.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import projetjee.bo.Commentaire;
import projetjee.bo.Plat;
import projetjee.bo.Restaurant;
import projetjee.bo.User;

public class CommentaireDAOJdbcImpl implements CommentaireDAO
{
	private static final String INSERT = "INSERT INTO COMMENTAIRES(commentaire, users_id, plats_id, note, date) VALUES (?, ?, ?, ?, ?);";
	
	private static final String UPDATE = "UPDATE COMMENTAIRES set commentaire = ?, note = ? WHERE id = ?;";
	
	private static final String DELETE = "DELETE FROM COMMENTAIRES WHERE id = ?;";
	
	private static final String SELECT_ALL_BY_USER = "SELECT COMMENTAIRES.id as idCommentaire, commentaire, users_id, plats_id, note, date, "
			+ "USERS.id as idUser, USERS.nom as nomUser, prenom, mail, mdp, "
			+ "PLATS.id as idPlat, PLATS.nom as nomPlat, ingredients, descriptif, prix, PLATS.img as imgPlat, restos_id, "
			+ "RESTOS.id as idResto, RESTOS.nom as nomResto, adresse, RESTOS.img as imgResto, ROLES.id as idRole, ROLES.nom as nomRole "
			+ "FROM COMMENTAIRES, USERS, PLATS, RESTOS, ROLES "
			+ "WHERE roles_id = idRole AND users_id = idUser AND COMMENTAIRES.plats_id = idPlat AND restos_id = idResto AND users_id = 2;";
	
	private static final String SELECT_ALL_BY_PLAT = "SELECT COMMENTAIRES.id as idCommentaire, commentaire, users_id, plats_id, note, date, "
			+ "USERS.id as idUser, USERS.nom as nomUser, prenom, mail, mdp, "
			+ "PLATS.id as idPlat, PLATS.nom as nomPlat, ingredients, descriptif, prix, PLATS.img as imgPlat, restos_id, "
			+ "RESTOS.id as idResto, RESTOS.nom as nomResto, adresse, RESTOS.img as imgResto, ROLES.id as idRole, ROLES.nom as nomRole "
			+ "FROM COMMENTAIRES, USERS, PLATS, RESTOS, ROLES "
			+ "WHERE roles_id = idRole AND users_id = idUser AND COMMENTAIRES.plats_id = idPlat AND restos_id = idResto AND plats_id = ?;";
	
	public void insert(Commentaire commentaire) throws Exception 
	{
		if(commentaire==null)
		{
			Exception exception = new Exception();
			throw exception;
		}
		
		try(Connection cnx = ConnectionProvider.getConnection())
		{
			PreparedStatement pstmt = cnx.prepareStatement(INSERT, PreparedStatement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, commentaire.getContenu());
			pstmt.setInt(2, commentaire.getUser().getId());
			pstmt.setInt(3, commentaire.getPlat().getId());
			pstmt.setInt(4, commentaire.getNote());
			pstmt.setDate(5, commentaire.getDate());
			pstmt.executeUpdate();
			ResultSet rs = pstmt.getGeneratedKeys();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			throw e;
		}	
	}
	
	public void update(Commentaire commentaire) throws Exception 
	{
		if(commentaire==null)
		{
			Exception exception = new Exception();
			throw exception;
		}
		
		try(Connection cnx = ConnectionProvider.getConnection())
		{
			PreparedStatement pstmt = cnx.prepareStatement(UPDATE, PreparedStatement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, commentaire.getContenu());
			pstmt.setInt(2, commentaire.getNote());
			pstmt.setInt(3, commentaire.getId());
			pstmt.executeUpdate();
			ResultSet rs = pstmt.getGeneratedKeys();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			throw e;
		}	
	}
	
	public void delete(Commentaire commentaire) throws Exception 
	{
		if(commentaire==null)
		{
			Exception exception = new Exception();
			throw exception;
		}
		
		try(Connection cnx = ConnectionProvider.getConnection())
		{
			PreparedStatement pstmt = cnx.prepareStatement(DELETE, PreparedStatement.RETURN_GENERATED_KEYS);
			pstmt.setInt(1, commentaire.getId());
			pstmt.executeUpdate();
			ResultSet rs = pstmt.getGeneratedKeys();
		}
		catch(Exception e)
		{
			e.printStackTrace();
			throw e;
		}	
	}
	
	public List<Commentaire> selectAllByUser(User user) throws Exception
	{
		List<Commentaire> retourListe = new ArrayList<Commentaire>();
		Commentaire retour = null;
		PreparedStatement pstmt = null;
		
		if(user == null)
		{
			Exception exception = new Exception();
			throw exception;
		}
		
		try(Connection cnx = ConnectionProvider.getConnection())
		{			
			pstmt = cnx.prepareStatement(SELECT_ALL_BY_USER);
			//pstmt.setInt(1, user.getId());
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{			
				//User user = new User(rs.getInt("USERS.id"), rs.getString("USERS.nom"), rs.getString("USERS.prenom"), rs.getString("mail"), rs.getString("mdp"), rs.getString("ROLES.nom"));
				Restaurant resto = new Restaurant(rs.getInt("idResto"), rs.getString("nom"), rs.getString("adresse"), rs.getString("imgResto"));
				Plat plat = new Plat(rs.getInt("idPlat"), rs.getString("nomPlat"), rs.getString("ingredients"), rs.getString("descriptif"), rs.getFloat("prix"), rs.getString("img"), rs.getInt("quantite"), resto);
				retour = new Commentaire(rs.getInt("id"), rs.getString("commentaire"), rs.getInt("note"), rs.getDate("date"), plat, user);
				
				retourListe.add(retour);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			throw e;
		}	
		
		return retourListe;
	}	
	
	public List<Commentaire> selectAllByPlat(Plat plat) throws Exception
	{
		List<Commentaire> retourListe = new ArrayList<Commentaire>();
		Commentaire retour = null;
		PreparedStatement pstmt = null;
		
		if(plat == null)
		{
			Exception exception = new Exception();
			throw exception;
		}
		
		try(Connection cnx = ConnectionProvider.getConnection())
		{			
			pstmt = cnx.prepareStatement(SELECT_ALL_BY_PLAT);
			pstmt.setInt(1, plat.getId());
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next())
			{			
				User user = new User(rs.getInt("idUser"), rs.getString("nomUser"), rs.getString("prenom"), rs.getString("mail"), rs.getString("mdp"), rs.getString("nomRole"));
				Restaurant resto = new Restaurant(rs.getInt("idResto"), rs.getString("nom"), rs.getString("adresse"), rs.getString("imgResto"));
				//Plat plat = new Plat(rs.getInt("PLATS.id"), rs.getString("PLATS.nom"), rs.getString("ingredients"), rs.getString("descriptif"), rs.getFloat("prix"), rs.getString("img"), rs.getInt("quantite"), resto);
				retour = new Commentaire(rs.getInt("id"), rs.getString("commentaire"), rs.getInt("note"), rs.getDate("date"), plat, user);
				
				retourListe.add(retour);
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			throw e;
		}	
		
		return retourListe;
	}
}
