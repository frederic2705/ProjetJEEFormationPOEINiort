package projetjee.dal;

import java.util.List;

import projetjee.bo.User;

public interface UserDAO {
	public void insert(User user) throws Exception;
	public void update(User user) throws Exception;
	public List<User> select()throws Exception;;
	public User selectByMdpAndMail(User user)throws Exception;;
}
