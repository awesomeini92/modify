package coding_free.svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import coding_free.dao.CodingFreeDAO;
import coding_free.vo.CodingFreeBean;

public class CodingFreeModifyService {

	public boolean modifyArticle(CodingFreeBean article) {
		System.out.println("CodingFreeModifyService - modifyArticle");
		boolean isModifySuccess = false;
		int updateCount = 0;
		
		Connection con = getConnection();
		CodingFreeDAO cdao = CodingFreeDAO.getInstance();
		cdao.setConnection(con);
		
		updateCount = cdao.updateArticle(article);
		
		if (updateCount > 0) {
			commit(con);
			isModifySuccess = true;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isModifySuccess;
	}

}
