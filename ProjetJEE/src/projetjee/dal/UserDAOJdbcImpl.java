package projetjee.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import projetjee.bo.Plat;
import projetjee.bo.User;

public class UserDAOJdbcImpl implements UserDAO {
	public static final String INSERT="INSERT INTO USERS (nom, prenom, mail, mdp, roles_id) VALUES (?,?,?,?,?);";
	private static final String UPDATE = "UPDATE USERS set mail=? , mdp=? where id=?";

	private static final String SELECT_BY_MDP_MAIL="SELECT id, mail, mdp FROM USERS WHERE mail = ? AND mdp = ?; ";
	private static final String SELECT="SELECT nom, prenom, mail, mdp FROM USERS where id=?;"; 
	
	public void insert(User user) throws Exception {
		try(Connection cnx = ConnectionProvider.getConnection())
		{
			PreparedStatement pstmt = cnx.prepareStatement(INSERT, PreparedStatement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, user.getNom());
			pstmt.setString(2, user.getPrenom());
			pstmt.setString(3, user.getMail());
			pstmt.setString(4, user.getMdp());
			pstmt.setInt(5, 1);
			pstmt.executeUpdate();
			ResultSet rs = pstmt.getGeneratedKeys();
			if(rs.next())
			{
				user.setId(rs.getInt(1));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void update(User user) throws Exception {
		try(Connection cnx = ConnectionProvider.getConnection())
		{
			PreparedStatement pstmt = cnx.prepareStatement(UPDATE, PreparedStatement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, user.getMail());
			pstmt.setString(2, user.getMdp());
			pstmt.setInt(3, user.getId());
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
public User select(int id)
	{
		User users = null;
		try(Connection cnx = ConnectionProvider.getConnection())
		{
			PreparedStatement pstmt = cnx.prepareStatement(SELECT, PreparedStatement.RETURN_GENERATED_KEYS);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			
		
			while(rs.next()) {
				
				users = new User(id,  rs.getString("nom"), rs.getString("prenom"), rs.getString("mail"), rs.getString("mdp"), "user");				
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return users;
	}
	
	public User selectByMdpAndMail(User user)
	{
		try(Connection cnx = ConnectionProvider.getConnection())
		{
			PreparedStatement pstmt = cnx.prepareStatement(SELECT_BY_MDP_MAIL, PreparedStatement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, user.getMail());
			pstmt.setString(2, user.getMdp());
			ResultSet rs = pstmt.executeQuery();
			user = new User();
			if(rs.next())
			{
				user.setId(rs.getInt("id"));
				user.setMail(rs.getString("mail"));
				user.setMdp(rs.getString("mdp"));
			}
			
			
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		return user;
	}
	
	
}

