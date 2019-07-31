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
	private static final String SELECT="SELECT (mail, mdp) FROM USERS;";
	private static final String SELECT_BY_MDP_MAIL="SELECT id, mail, mdp FROM USERS WHERE mail = ? AND mdp = ?; ";
	
	
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
			pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<User> select()
	{
		List<User> users = new ArrayList<>();
		try(Connection cnx = ConnectionProvider.getConnection())
		{
			PreparedStatement pstmt = cnx.prepareStatement(SELECT, PreparedStatement.RETURN_GENERATED_KEYS);
			ResultSet rs = pstmt.executeQuery();
			
		
			while(rs.next()) {
				
				User tmp = new User();
				tmp.setMail( rs.getString("mail"));
				tmp.setMdp(rs.getString("mdp"));
				users.add(tmp);
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
			ResultSet rs = pstmt.executeQuery();
			pstmt.setString(1, user.getMail());
			pstmt.setString(2, user.getMdp());
			
			
	}catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		return user;
	}
	
	
}

