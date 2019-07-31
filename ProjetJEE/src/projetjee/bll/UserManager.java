package projetjee.bll;

import java.util.List;

import projetjee.bo.User;
import projetjee.dal.UserDAO;
import projetjee.dal.UserDAOJdbcImpl;

public class UserManager {
	private UserDAO dao;
	
	public UserManager() {
		this.dao = new UserDAOJdbcImpl();
	}
	
	public User ajouter(String nom, String prenom, String mail, String mdp, String role) throws Exception
	{
		User user = new User(nom, prenom, mail, mdp, role);
		this.dao.insert(user);
		return user;
		
	}
	
	public User update(User user) throws Exception
	{
		this.dao.update(user);
		return user;
	}
	
	public List<User> getAll() throws Exception {
		return dao.select();
	}
	
	public User selectConnection(User user) throws Exception {
		this.dao.selectByMdpAndMail(user);
		return user;
	}
}
