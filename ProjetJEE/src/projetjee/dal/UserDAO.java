package projetjee.dal;

import projetjee.bo.User;

public interface UserDAO {
	public void insert(User user) throws Exception;
	public void update(User user) throws Exception;
}
