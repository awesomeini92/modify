package job_community.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.commit;
import static db.JdbcUtil.getConnection;
import static db.JdbcUtil.rollback;

import java.sql.Connection;

import job_community.dao.JobBoardDAO;
import job_community.vo.JobBoardBean;

public class JobBoardDetailService {

	public JobBoardBean getArticle(int board_num) throws Exception {
		System.out.println("BoardDetailService - getArticle()");

		Connection con = getConnection();
		JobBoardDAO boardDAO = JobBoardDAO.getInstance();
		boardDAO.setConnection(con);
		
		JobBoardBean article = null;
		
		article = boardDAO.selectArticle(board_num);
		
		close(con);
		
		return article;
	}
	
	public void plusReadcount(int num) throws Exception {

		Connection con = getConnection();
		JobBoardDAO boardDAO = JobBoardDAO.getInstance();
		boardDAO.setConnection(con);
		
		int updateCount = boardDAO.updateReadcount(num);
		
		if(updateCount > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
	}

}
