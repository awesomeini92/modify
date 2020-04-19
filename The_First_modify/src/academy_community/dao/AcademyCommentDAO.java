package academy_community.dao;

import static academy_community.db.JdbcUtil.*;
import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import academy_community.vo.AcademyCommentBean;
import coding_free.vo.CodingFreeCommentBean;

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

	public List<AcademyCommentBean> getCommentList(int post_num) {
		List<AcademyCommentBean> list = new ArrayList<AcademyCommentBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// ORDER BY comment_num
			String sql = "SELECT *, time(date) AS time FROM academy_comment where post_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, post_num);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				AcademyCommentBean academyCommentBean = new AcademyCommentBean();
				academyCommentBean.setComment_num(rs.getInt("comment_num"));
				academyCommentBean.setPost_num(rs.getInt("post_num"));
				academyCommentBean.setNickname(rs.getString("nickname"));
				academyCommentBean.setComment(rs.getString("comment"));
				academyCommentBean.setDate(rs.getDate("date"));
				academyCommentBean.setTime(rs.getString("time"));
				list.add(academyCommentBean);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return list;
	}

	public int getCommentListCount(int num) {
		int commentListCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			// ORDER BY comment_num
			String sql = "SELECT count(*) FROM academy_comment where post_num = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				commentListCount = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return commentListCount;
	}

}
