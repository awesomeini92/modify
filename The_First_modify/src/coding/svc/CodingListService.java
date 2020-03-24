package coding.svc;

import java.sql.Connection;
import java.util.ArrayList;
import static db.JdbcUtil.*;

import coding.dao.CodingDAO;
import coding.vo.CodingBean;
import coding.vo.Coding_refBean;

public class CodingListService {

	public int getListCount() {
		int listCount = 0;
		Connection con = getConnection();
		CodingDAO codingDAO = CodingDAO.getInstance();
		codingDAO.setConnection(con);
		
		listCount = codingDAO.selectListCount();
		
		close(con);
		
		return listCount;
	}

	public ArrayList<CodingBean> getArticleList(int page, int limit) {
		ArrayList<CodingBean> articleList = null;
		Connection con = getConnection();
		CodingDAO codingDAO = CodingDAO.getInstance();
		codingDAO.setConnection(con);
		
		articleList = codingDAO.selectArticleList(page, limit);
		
		close(con);
		
		return articleList;
	}

	public ArrayList<CodingBean> getArticleList() {
		ArrayList<CodingBean> articleList = null;
		Connection con = getConnection();
		CodingDAO codingDAO = CodingDAO.getInstance();
		codingDAO.setConnection(con);
		
		articleList = codingDAO.selectArticleList();
		
		close(con);
		return null;
	}
	
	

}
