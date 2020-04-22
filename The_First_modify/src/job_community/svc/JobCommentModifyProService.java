package job_community.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;

import job_community.dao.JobBoardDAO;
import job_community.vo.JobCommentBean;

public class JobCommentModifyProService {

	public boolean updateCmmntJob(JobCommentBean jobCommentBean) {
		boolean isSuccess = false;
		Connection con = getConnection();
		JobBoardDAO jobBoardDAO = JobBoardDAO.getInstance();
		jobBoardDAO.setConnection(con);
		
		int success = jobBoardDAO.updateCmmntJob(jobCommentBean);
		if(success>0) {
			isSuccess=true;
		}
		
		close(con);
		return isSuccess;
	}

}
