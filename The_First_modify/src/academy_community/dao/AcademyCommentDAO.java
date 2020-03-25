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

// ============ �뙎湲� �벐湲� ============= 
	public int insertComment(AcademyCommentBean commentBean) {
//		System.out.println("CommentDAO - insertComment()");
		
		int insertCount = 0; // executeUpdate() 硫붿꽌�뱶瑜� �넻�빐 湲��벐湲� �옉�뾽 �닔�뻾 寃곌낵瑜� ���옣�븷 蹂��닔
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO academy_comment VALUES (?,?,?,?,now())";
			
			// Connection 媛앹껜濡쒕��꽣 PreparedStatement 媛앹껜 媛��졇���꽌 荑쇰━ �쟾�떖
			pstmt = con.prepareStatement(sql);
			
			// ? �뙆�씪誘명꽣媛� 梨꾩슦湲�
			pstmt.setInt(1, 0); //�뙎湲�踰덊샇 comment_num
			pstmt.setInt(2, commentBean.getPost_num());
			pstmt.setString(3, commentBean.getNickname());
			pstmt.setString(4, commentBean.getComment());
			
			// 荑쇰━ �떎�뻾
			insertCount = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println("insertComment() �뿉�윭 : " + e.getMessage());
		} finally {
			close(pstmt);
		}
		
		return insertCount;
	}

}
