package job_community.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import job_community.dao.JobBoardDAO;

public class JobCommentDeleteProService {

	public boolean deleteComment(int comment_num) {
		boolean isSuccess = false;
		Connection con = getConnection();
		JobBoardDAO jobBoardDAO = JobBoardDAO.getInstance();
		jobBoardDAO.setConnection(con);
		
		int success = jobBoardDAO.deleteComment(comment_num);
		if(success>0) {
			isSuccess=true;
		}
		
		close(con);
		return isSuccess;
	}

}
