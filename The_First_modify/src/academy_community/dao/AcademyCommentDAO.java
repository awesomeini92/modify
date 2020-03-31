package academy_community.dao;

import static academy_community.db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import academy_community.vo.AcademyCommentBean;

public class AcademyCommentDAO {
	private AcademyCommentDAO() {}
	
	private static AcademyCommentDAO instance = new AcademyCommentDAO();

	public static AcademyCommentDAO getInstance() {
		return instance;
	}
	// ---------------------------------------------------
	static Connection con = null;

	public void setConnection(Connection con) {
		this.con = con;
	}

// ============ 댓글 쓰기 ============= 
	public int insertComment(AcademyCommentBean commentBean) {
//		System.out.println("CommentDAO - insertComment()");
		
		int insertCount = 0; // executeUpdate() 메서드를 통해 글쓰기 작업 수행 결과를 저장할 변수
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO academy_comment VALUES (?,?,?,?,now())";
			
			// Connection 객체로부터 PreparedStatement 객체 가져와서 쿼리 전달
			pstmt = con.prepareStatement(sql);
			
			// ? 파라미터값 채우기
			pstmt.setInt(1, 0); //댓글번호 comment_num
			pstmt.setInt(2, commentBean.getPost_num());
			pstmt.setString(3, commentBean.getNickname());
			pstmt.setString(4, commentBean.getComment());
			
			// 쿼리 실행
			insertCount = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insertComment() 에러 : " + e.getMessage());
		} finally {
			close(pstmt);
		}
		
		return insertCount;
	}

}
