package projetjee.dal;

import java.util.List;

import projetjee.bo.Plat;

public interface PlatDAO {
	public void insert (Plat plat);
	public List<Plat> selectAll();
}
