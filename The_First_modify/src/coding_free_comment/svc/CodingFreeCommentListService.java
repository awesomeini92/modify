package coding_free_comment.svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import coding_free_comment.dao.CodingFreeCommentDAO;
import coding_free_comment.vo.CodingFreeCommentBean;

public class CodingFreeCommentListService {
	
	public ArrayList<CodingFreeCommentBean> getCommentList(int post_num) {
		System.out.println("CodingFreeCommentListService");
		ArrayList<CodingFreeCommentBean> list = new ArrayList<CodingFreeCommentBean>();
		
		Connection con = getConnection();
		CodingFreeCommentDAO cdao = CodingFreeCommentDAO.getInstance();
		cdao.setConnection(con);
		
		list = cdao.getCommentList(post_num);
		
		close(con);
		
		return list;
		
	}

}
