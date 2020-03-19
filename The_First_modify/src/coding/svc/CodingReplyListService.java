package coding.svc;

import java.sql.Connection;
import java.util.ArrayList;
import static db.JdbcUtil.*;

import coding.dao.CodingDAO;
import coding.vo.CodingBean;
import coding.vo.Coding_refBean;

public class CodingReplyListService {

	public ArrayList<Coding_refBean> getReplyList(int post_num, int reply_page, int reply_limit) {
		ArrayList<Coding_refBean> article_refList = null;
		Connection con = getConnetion();
		CodingDAO codingDAO = CodingDAO.getInstance();
		codingDAO.setConnection(con);
		
		article_refList = codingDAO.selectArticleReplyList(post_num, reply_page, reply_limit);
		
		close(con);
		
		return article_refList;
	}

	
	public int getReplyListCount(int post_num) {
		int listCount = 0;
		Connection con = getConnetion();
		CodingDAO codingDAO = CodingDAO.getInstance();
		codingDAO.setConnection(con);
		
		listCount = codingDAO.selectReplyListCount(post_num);
		
		close(con);
		
		return listCount;
	}

	//????
	public ArrayList<Coding_refBean> getArticleReplyList(int post_num, int reply_page, int reply_limit) {
		ArrayList<Coding_refBean> article_refList = null;
		Connection con = getConnetion();
		CodingDAO codingDAO = CodingDAO.getInstance();
		codingDAO.setConnection(con);
		
		article_refList = codingDAO.selectArticleReplyList(post_num, reply_page, reply_limit);
		
		close(con);
		
		return article_refList;
	}

}
