package shop.svc;

import static db.JdbcUtil.*;

import java.sql.Connection;
import java.util.ArrayList;

import shop.dao.ShopDAO;
import shop.vo.ShopBean;

public class ShopListService {
	
	public ArrayList<ShopBean> getShopList() {
		
		System.out.println("ShopListService - getShopList()");
		
		ArrayList<ShopBean> shopList = null;
		
		// 1. Connection 객체 가져오기
		Connection con = getConnection();
		
		// 2. DAO 객체 가져오기(싱글톤 패턴)
		ShopDAO shopDAO = ShopDAO.getInstance();
		
		// 3. DAO 객체에 Connection 객체 전달하기
		shopDAO.setConnection(con);
		
		// 4. DB 작업을 위한 DAO 객체의 메서드 호출
				// => ShopDAO 객체의 selectShopList() 메서드를 호출하여 상품 목록 가져오기
		shopList = shopDAO.selectShopList();
		
		// 5. Connection 객체 반환하기
		close(con);
		
		return shopList;
	}
}



















