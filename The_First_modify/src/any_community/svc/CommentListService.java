package any_community.svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import any_community.dao.CommentDAO;
import any_community.vo.AnyCommentBean;

public class CommentListService {
	
	public ArrayList<AnyCommentBean> getCommentList(int post_num) {
		System.out.println("CommentListService");

		ArrayList<AnyCommentBean> list = new ArrayList<AnyCommentBean>();
		
		Connection con = getConnection();
		CommentDAO cdao = CommentDAO.getInstance();
		cdao.setConnection(con);
		
		list = cdao.getCommentList(post_num);
		
		close(con);
		
		return list;
	}

}
