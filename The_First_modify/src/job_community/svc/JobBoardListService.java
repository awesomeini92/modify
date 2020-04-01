package job_community.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import job_community.dao.JobBoardDAO;
import job_community.vo.JobBoardBean;


public class JobBoardListService {

	public int getListCount() {
		System.out.println("BoardListService - getListCount()");
		int listCount = 0; // 총 게시물 수 저장할 변수
		
		Connection con = getConnection();
		JobBoardDAO boardDAO = JobBoardDAO.getInstance();
		boardDAO.setConnection(con);

		listCount = boardDAO.selectListCount();
		
		close(con);
		
		return listCount;
	}

	public ArrayList<JobBoardBean> getArticleList(int page, int limit) {
		System.out.println("BoardListService - getArticleList()");
		ArrayList<JobBoardBean> articleList = null;
		
		Connection con = getConnection();
		JobBoardDAO boardDAO = JobBoardDAO.getInstance();
		boardDAO.setConnection(con);
		
		articleList = boardDAO.selectArticleList(page, limit);
		
		close(con);
		
		return articleList;
	}
}
