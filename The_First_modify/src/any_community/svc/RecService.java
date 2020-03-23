package any_community.svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import any_community.dao.CommunityDAO;

public class RecService {

	// 추천 유무 체크
	public int recCheck(int num, String nickname) {
		System.out.println("RecService - recCheck");
		int result = 0;
		
		Connection con = getConnection();
		CommunityDAO cdao = CommunityDAO.getInstance();
		cdao.setConnection(con);
		
		result = cdao.recCheck(num, nickname);
		
		close(con);
		
		return result;
	}

	// 추천
	public boolean recUpdate(int num, String nickname) {
		System.out.println("RecService - recUpdate");
		boolean isUpdateSuccess = false;
		
		Connection con = getConnection();
		CommunityDAO cdao = CommunityDAO.getInstance();
		cdao.setConnection(con);
		
		int updateCount = cdao.recUpdate(num, nickname);
		
		if (updateCount > 0) {
			commit(con);
			isUpdateSuccess = true;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isUpdateSuccess;
	}

	// 추천삭제
	public boolean recDelete(int num, String nickname) {
		System.out.println("RecService - recDelete");
		boolean isDeleteSuccess = false;
		
		Connection con = getConnection();
		CommunityDAO cdao = CommunityDAO.getInstance();
		cdao.setConnection(con);
		
		int deleteCount = cdao.recDelete(num, nickname);
	
		if (deleteCount > 0) {
			commit(con);
			isDeleteSuccess = true;
		} else {
			rollback(con);
		}
		
		close(con);
		
		return isDeleteSuccess;
	}

	// 추천수 카운팅
	public int recCount(int num) {
		System.out.println("RecService - recCount");
		int count = 0;
		
		Connection con = getConnection();
		CommunityDAO cdao = CommunityDAO.getInstance();
		cdao.setConnection(con);
		
		count = cdao.recCount(num);
		
		close(con);
		
		return count;
	}

}
