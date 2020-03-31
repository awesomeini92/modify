package academy_community.svc;

import static academy_community.db.JdbcUtil.*;

import java.sql.Connection;
import java.util.Date;

import academy_community.dao.AllDAO;

public class AllService {
	public Date getToday() {
		Connection con = getConnection();
		AllDAO allDAO = AllDAO.getInstance();
		allDAO.setConnection(con);
		
		Date today = allDAO.getToday();
		
		return today;
	}
}
