package job_community.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import job_community.dao.JobBoardDAO;
import job_community.vo.JobBoardBean;

public class JobBoardModifyProService {

	public boolean modifyArticle(JobBoardBean article) throws Exception {
		// 글 번호에 해당하는 게시물에 저장된 패스워드와 입력받은 패스워드를 비교하여 일치여부 리턴
		int updateCount = 0;
		boolean isModifySuccess = false;
		
		Connection con = getConnection();
		JobBoardDAO boardDAO = JobBoardDAO.getInstance();
		boardDAO.setConnection(con);
		
		updateCount = boardDAO.updateArticle(article);
		
		if(updateCount > 0) {
			commit(con);
			isModifySuccess = true;
		} else {
			rollback(con);
		}
		
		
		close(con);
		
		return isModifySuccess;
	}
}
