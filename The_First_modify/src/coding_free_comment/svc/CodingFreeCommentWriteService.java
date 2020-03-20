package coding_free_comment.svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import coding_free_comment.dao.CodingFreeCommentDAO;
import coding_free_comment.vo.CodingFreeCommentBean;

public class CodingFreeCommentWriteService {

	public boolean writeComment(CodingFreeCommentBean codingFreeCommentBean) {
		System.out.println("CodingFreeCommentWriteService");
		boolean isWriteSuccess = false;

		Connection con = getConnection();
		CodingFreeCommentDAO cdao = CodingFreeCommentDAO.getInstance();
		cdao.setConnection(con);

		int insertCount = cdao.writeComment(codingFreeCommentBean);

		if (insertCount > 0) {
			commit(con);
			isWriteSuccess = true;
		} else {
			rollback(con);
		}

		close(con);

		return isWriteSuccess;
	}

}
