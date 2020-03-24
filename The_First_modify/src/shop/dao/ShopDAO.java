package shop.dao;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.sun.jndi.url.corbaname.corbanameURLContextFactory;


import shop.vo.ShopBean;


public class ShopDAO {
	// --------------------------------------------------
	// 싱글톤 패턴을 활용한 BoardDAO 인스턴스 생성 및 리턴
	private ShopDAO() {}
	
	private static ShopDAO instance = new ShopDAO();

	public static ShopDAO getInstance() {
		return instance;
	}
	// ----------------------------------------------------
	
	static Connection con;

	// 외부로부터 Connection 객체를 전달받아 저장할 setConnection 메서드
	public void setConnection(Connection con) {
		this.con = con;
	}
	
	// ========== 상품 목록 조회 ===========
	public ArrayList<ShopBean> selectShopList() {
		
		System.out.println("ShopDAO - selectShopList()");
		
		// shop 테이블 내의 목록을 조회하여 ArrayList<ShopBean> 객체에 저장 후 리턴
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		ArrayList<ShopBean> shopList=null;
		
		try {
			// 조회 결과(ResultSet) 객체가 존재할 경우
			// 반복문을 사용하여 1개 상품 정보를 ShopBean 객체에 저장하고
			// ShopBean 객체를 ArrayList<ShopBean> 객체에 저장 반복
			String sql = "SELECT * FROM shop";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			shopList = new ArrayList<ShopBean>();
			
			while(rs.next()) {
				ShopBean shopBean = new ShopBean(
					rs.getString("product_cod"),
					rs.getString("buyer_id"),
					rs.getString("product_name"),
					rs.getInt("price"),
					rs.getInt("stock"),
					rs.getString("product_image"),	
					rs.getString("product_info"),
					rs.getInt("purchase_count"),
					rs.getDate("date"),
					rs.getInt("qty")
					
				);
				
				shopList.add(shopBean);
			}
		} catch (SQLException e) {
//			e.printStackTrace();
			System.out.println("selectShopList() 에러! - " + e.getMessage());
 		} finally {
 			close(rs);
 			close(pstmt);
 		}
				
		return shopList;
	}
	
	
	// =========== 상품 상세 정보 조회 ============
		public ShopBean selectShop(String product_cod) {
			// product_cod 값에 해당하는 레코드 조회 후 ShopBean 객체에 저장
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			ShopBean shopBean = null;
			
			try {
				String sql = "SELECT * FROM shop WHERE product_cod=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, product_cod);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					shopBean = new ShopBean(
							rs.getString("product_cod"),
							rs.getString("buyer_id"),
							rs.getString("product_name"),
							rs.getInt("price"),
							rs.getInt("stock"),
							rs.getString("product_image"),	
							rs.getString("product_info"),
							rs.getInt("purchase_count"),
							rs.getDate("date"),
							rs.getInt("qty")
							
						);
				}
				
			} catch (SQLException e) {
//				e.printStackTrace();
				System.out.println("selectShop() 에러! - " + e.getMessage());
	 		} finally {
	 			close(rs);
	 			close(pstmt);
	 		}
			
			return shopBean;
		}
	


	
	// =============== 상품 등록 ================
		public static int insertProduct(ShopBean shopBean) {
			System.out.println("ShopDAO = insertProduct()");
			int insertCount = 0; //작업 수행 결과 저장할 변수
			
			PreparedStatement pstmt = null;
			
			try {
				String sql = "INSERT INTO shop VALUES (?,null,?,?,?,?,?,?,now());";
				
				pstmt = con.prepareStatement(sql);
				
				pstmt.setString(1, shopBean.getProduct_cod());
				pstmt.setString(2, shopBean.getProduct_name());
				pstmt.setInt(3, shopBean.getPrice());
				pstmt.setInt(4, shopBean.getStock());
				pstmt.setString(5, shopBean.getProduct_image());
				pstmt.setString(6, shopBean.getProduct_info());
				pstmt.setInt(7, shopBean.getPurchase_count());
				
				insertCount = pstmt.executeUpdate();
				
			} catch (SQLException e) {
//				e.printStackTrace();
				System.out.println("insertProduct() 에러 : " + e.getMessage());
			} finally {
				close(pstmt);
			}
			
			return insertCount;
		}
	
	
	


	


	
}
















