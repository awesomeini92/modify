package coding_free.dao;

import static db.JdbcUtil.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import coding_free.vo.CodingFreeCommentBean;

public class CodingFreeCommentDAO {

	private CodingFreeCommentDAO() {}
	private static CodingFreeCommentDAO instance = new CodingFreeCommentDAO();
	public static CodingFreeCommentDAO getInstance() {
		return instance;
	}
	
	Connection con = null;
	
	public void setConnection(Connection con) {
		this.con = con;
	}

	
	// 댓글작성
	public int writeComment(CodingFreeCommentBean CodingFreeCommentBean) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int insertCount = 0;
		int num = 0;
		
		try {
			String sql = "SELECT max(comment_num) as mnum FROM coding_free_comment";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				num = rs.getInt("mnum") + 1;
			}
			
		    sql = "INSERT INTO coding_free_comment VALUES (?,?,?,?,now())";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setInt(2, CodingFreeCommentBean.getPost_num());
			pstmt.setString(3, CodingFreeCommentBean.getNickname());
			pstmt.setString(4, CodingFreeCommentBean.getComment());
			
			insertCount = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rs);
		}

		return insertCount;
	}
	
	// 댓글 목록 가져오기
	public ArrayList<CodingFreeCommentBean> getCommentList(int post_num) {
		ArrayList<CodingFreeCommentBean> list = new ArrayList<CodingFreeCommentBean>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM coding_free_comment where post_num = ? ORDER BY comment_num";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, post_num);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				CodingFreeCommentBean CodingFreeCommentBean = new CodingFreeCommentBean();
				CodingFreeCommentBean.setComment_num(rs.getInt("comment_num"));
				CodingFreeCommentBean.setPost_num(rs.getInt("post_num"));
				CodingFreeCommentBean.setNickname(rs.getString("nickname"));
				CodingFreeCommentBean.setComment(rs.getString("comment"));
				CodingFreeCommentBean.setDate(rs.getDate("date"));
				list.add(CodingFreeCommentBean);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return list;
	}
	
	
}
