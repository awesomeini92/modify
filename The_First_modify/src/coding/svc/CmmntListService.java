package coding.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.*;
import java.sql.Connection;
import java.util.ArrayList;

import coding.dao.CodingDAO;
import coding.vo.CmmntBean;

public class CmmntListService {

	public int getCommentListCount(int num) {
		int listCount = 0;
		Connection con = getConnetion();
		CodingDAO codingDAO = CodingDAO.getInstance();
		codingDAO.setConnection(con);
		
		listCount = codingDAO.selectCommentListCount(num);
		
		close(con);
		
		return listCount;
	}
															//post_num,cmmnt_page,cmmnt_limit
	public ArrayList<CmmntBean> getCmmntList(int post_num, int cmmnt_page, int cmmnt_limit) {
		ArrayList<CmmntBean> cmmntList = null;
		
		Connection con = getConnetion();
		CodingDAO codingDAO = CodingDAO.getInstance();
		codingDAO.setConnection(con);
		
		cmmntList = codingDAO.selectCmmntList(post_num, cmmnt_page, cmmnt_limit);
		
		return cmmntList;
	}

}
