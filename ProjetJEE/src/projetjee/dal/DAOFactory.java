package projetjee.dal;

public abstract class DAOFactory 
{	
	public static CommentaireDAO getCommentaireDAO()
	{
		return new CommentaireDAOJdbcImpl();
	}
	
	public static PlatDAO getPlatDAO()
	{
		return new PlatDAOJdbcImpl();
	}
	
	public static UserDAO getUserDAO()
	{
		return new UserDAOJdbcImpl();
	}
}
