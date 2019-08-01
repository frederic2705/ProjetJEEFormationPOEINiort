package projetjee.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import projetjee.bo.Plat;

public class PlatDAOJdbcImpl implements PlatDAO {
	
	public static final String INSERT="INSERT INTO PLATS (nom, ingredients, descriptif, prix, img) (?,?,?,?,?);";
	public static final String SELECTALL="SELECT id,nom,ingredients,descriptif,prix,img FROM PLATS;";
	
	public void insert(Plat plat) {
		try(Connection cnx = ConnectionProvider.getConnection())
		{
			PreparedStatement pstmt = cnx.prepareStatement(INSERT, PreparedStatement.RETURN_GENERATED_KEYS);
			pstmt.setString(1, plat.getNom());
			pstmt.setString(2, plat.getIngredients());
			pstmt.setString(3, plat.getDescriptif());
			pstmt.setFloat(4, plat.getPrix());
			pstmt.setString(5, plat.getImage());
			pstmt.executeUpdate();
			ResultSet rs = pstmt.getGeneratedKeys();
			if(rs.next())
			{
				plat.setId(rs.getInt(1));
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public List<Plat> selectAll()
	{
		List<Plat> plats = new ArrayList<>();
		try(Connection cnx = ConnectionProvider.getConnection())
		{
			PreparedStatement pstmt = cnx.prepareStatement(SELECTALL, PreparedStatement.RETURN_GENERATED_KEYS);
			ResultSet rs = pstmt.executeQuery();
			
		
			while(rs.next()) {
				
				Plat tmp = new Plat();
				tmp.setId( rs.getInt("id"));
				tmp.setNom( rs.getString("nom"));
				tmp.setIngredients(rs.getString("ingredients"));
				tmp.setDescriptif(rs.getString("descriptif"));
				tmp.setPrix(rs.getFloat("prix"));
				tmp.setImage(rs.getString("img"));
				plats.add(tmp);
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return plats;

	}

}
