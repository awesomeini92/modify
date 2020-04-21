package job_community.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import static db.JdbcUtil.*;

import job_community.vo.JobBoardBean;

public class JobBoardDAO {
	
	private JobBoardDAO() {}
	
	
	public static JobBoardDAO instance = new JobBoardDAO();
	
	public static JobBoardDAO getInstance() {
		return instance;
	}
	// ----------------------------------------------------
	
	Connection con;

	// 외부로부터 Connection 객체를 전달받아 저장할 setConnection 메서드
	public void setConnection(Connection con) {
		this.con = con;
	}

	// 글쓰기
	public int insertArticle(JobBoardBean jobBoardBean) {
		int insertCount = 0;
		System.out.println("JobBOardDAO insertArticle");
		
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO job_community VALUES (null, ?, ?, ?, ?, ?, now());";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, jobBoardBean.getNickname());
			pstmt.setString(2, jobBoardBean.getSubject());
			pstmt.setString(3, jobBoardBean.getContent());
			pstmt.setString(4, jobBoardBean.getFile());
			pstmt.setInt(5, 0);
			
			insertCount = pstmt.executeUpdate();
			System.out.println(insertCount);
			System.out.println(jobBoardBean.getNickname());
			System.out.println(jobBoardBean.getSubject());
			System.out.println(jobBoardBean.getContent());
			System.out.println(jobBoardBean.getFile());
			
		} catch (SQLException e) {
			System.out.println("insertArticle() 에러" + e.getMessage());
		}finally {
			close(pstmt);
		}
		
		return insertCount;
	}
	
	// ============ 글 목록 조회 ============= 
		public int selectListCount() {

			int listCount = 0;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			try {
				String sql = "SELECT COUNT(*) FROM job_community";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					listCount = rs.getInt(1);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			
			return listCount;
		}

		// 게시물 목록 조회 후 리턴
		public ArrayList<JobBoardBean> selectArticleList(int page, int limit) {
			ArrayList<JobBoardBean> articleList = new ArrayList<JobBoardBean>();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			int startRow = (page - 1) * 10;
			
			try {
				String sql = "SELECT * FROM job_community ORDER BY num DESC LIMIT ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, limit);
	            rs = pstmt.executeQuery();
	            
	            // ResultSet 객체 내의 모든 레코드를 각각 레코드별로 BoardBean 에 담아서 ArrayList 객체에 저장
	            // => 패스워드 제외
	            while(rs.next()) {
	                JobBoardBean boardBean = new JobBoardBean();
	                boardBean.setNum(rs.getInt("num"));
	                boardBean.setNickname(rs.getString("nickname"));
	                boardBean.setSubject(rs.getString("subject"));
	                boardBean.setContent(rs.getString("content"));
	                boardBean.setReadcount(rs.getInt("readcount"));
	                boardBean.setFile(rs.getString("file"));
	                boardBean.setDate(rs.getDate("date"));
	                
	                articleList.add(boardBean);
	            }
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			
			return articleList;
		}

		// ============ 게시물 상세 내용 조회 ============
		public JobBoardBean selectArticle(int num) {
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			System.out.println(num);
			JobBoardBean article = null;
			
			// 글번호(num)에 해당하는 게시물 정보 조회
			try {
				String sql = "SELECT * FROM job_community WHERE num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				rs = pstmt.executeQuery();
				
				// 게시물이 존재할 경우 BoardBean 객체에 저장
				if(rs.next()) {
					article = new JobBoardBean();
					article.setNum(rs.getInt("num"));
					article.setNickname(rs.getString("nickname"));
					article.setSubject(rs.getString("subject"));
					article.setContent(rs.getString("content"));
	                article.setReadcount(rs.getInt("readcount"));
	                article.setFile(rs.getString("file"));
	                article.setDate(rs.getDate("date"));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
			}
			
			return article;
		}

		public int updateReadcount(int num) {
			PreparedStatement pstmt = null;
			int updateCount = 0;
			
			try {
				String sql = "UPDATE job_community SET readcount=readcount+1 WHERE num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				updateCount = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return updateCount;
		}

		
		public int updateArticle(JobBoardBean article) {
			int updateCount = 0;
			PreparedStatement pstmt = null;
			
			try {
				String sql = "UPDATE job_community SET subject=?, content=? WHERE num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, article.getSubject());
				pstmt.setString(2, article.getContent());
				pstmt.setInt(3, article.getNum());
				
				updateCount = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return updateCount;
		}

		
		// ========== 글 삭제 ===========
		// => 삭제를 위한 패스워드 확인은 글 수정의 isArticleWriter() 메서드 함께 사용
		public int deleteArticle(int num) {
			int deleteCount = 0;
			PreparedStatement pstmt = null;
			
			try {
				String sql = "DELETE FROM job_community WHERE num=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num);
				deleteCount = pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
			}
			
			return deleteCount;
		}
	
	
}
