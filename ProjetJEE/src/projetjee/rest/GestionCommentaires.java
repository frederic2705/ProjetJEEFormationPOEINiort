package projetjee.rest;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import projetjee.bo.Commentaire;
import projetjee.bo.Plat;
import projetjee.bo.Restaurant;
import projetjee.bo.User;

public class GestionCommentaires {
	private static int i;
	private static Restaurant resto1 = new Restaurant();
	
	private static Plat plat1 = new Plat("Nom_Plat_1", "Carottes, steak", "Descriptif_Plat_1", 15.5f, 1, resto1);
	private static Plat plat2 = new Plat("Nom_Plat_2", "Purée, missile", "Descriptif_Plat_2", 10.5f, 1, resto1);
	
	private static User user1 = new User(1, "Mathonneau", "Alexandre", "alexandre.mathonneau@gmail.com", "Pa$$w0rd", "user");
	private static User user2 = new User(2, "Talu", "Jean", "jean.taluminium@gmail.com", "Pa$$w0rd", "admin");
	
	private static List<Commentaire> commentaires = new ArrayList<Commentaire>();
	private static Date date = new Date(2019, 07, 31);
	private static Commentaire commentaire1 = new Commentaire(1, "Contenu commentaire1", 10, date, plat1, user1);
	private static Commentaire commentaire2 = new Commentaire(2, "Contenu commentaire2", 8, date, plat2, user1);
	
	static {	
			commentaires.add(commentaire1);
			commentaires.add(commentaire2);
			
			i = 2;
		}

}
