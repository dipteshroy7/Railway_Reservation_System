package in.diptesh.DAO;

import in.diptesh.entity.UserData;

public interface UserDAO {
	public String authenticate(UserData u2);
	public String registration(UserData u1);
	public String delete(UserData user);
	public String checkPnr(int pnr);
}
