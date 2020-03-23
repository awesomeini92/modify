package svc;

import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.Date;

import dao.AllDAO;

public class AllService {
	public Date getToday() {
		Connection con = getConnection();
		AllDAO allDAO = AllDAO.getInstance();
		allDAO.setConnection(con);
		
		Date today = allDAO.getToday();
		
		return today;
	}
}
