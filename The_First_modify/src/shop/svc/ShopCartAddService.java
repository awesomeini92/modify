package shop.svc;

import static db.JdbcUtil.close;
import static db.JdbcUtil.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import shop.dao.ShopDAO;
import shop.vo.CartBean;
import shop.vo.ShopBean;

public class ShopCartAddService {

	public ShopBean getCartShop(String product_cod) {
		Connection con = getConnection();
		ShopDAO shopDAO = ShopDAO.getInstance();
		shopDAO.setConnection(con);
		
		// ShopDAO 의 selectShop() 메서드를 호출하여 상세 정보 가져오기
		// => 파라미터 : product_cod  리턴타입 : ShopBean(shopBean)
		ShopBean shopBean = shopDAO.selectShop(product_cod);
		
		
		close(con);
		
		return shopBean;
	}

	public void addCart(ShopBean cartShop, HttpServletRequest request) {
		// Session 작업을 수행하기 위해 HttpSession 객체를 request 객체로부터 가져와야하므로 request 전달받음
		HttpSession session = request.getSession();
		
		// 기존 세션 객체의 카트 정보를 ArrayList<CartBean> 객체에 저장
		ArrayList<CartBean> cartList = (ArrayList<CartBean>) session.getAttribute("cartList");
		
		// ArrayList 객체(카트 정보)가 비어있을 경우 객체 생성 후 session 객체에 저장
		if(cartList == null) {
			cartList = new ArrayList<CartBean>();
			session.setAttribute("cartList", cartList);
		}
		
		
		boolean isNewCart = true; // 장바구니 중복 추가를 방지하기 위한 변수(새 상품인지 구분)
		
		for(int i = 0; i < cartList.size(); i++) {
			// ShopBean 객체의 product_cod 값과 ArrayList 객체의 product_cod 값이 같은지 판별
			if(cartShop.getProduct_cod() == cartList.get(i).getProduct_cod()) {
				// 기존 장바구니 상품과 중복되므로 isNewCart 를 false 로 변경 후 수량 1 증가시킴
				System.out.println("상품 중복됨 " + cartShop.getProduct_cod() + ", " + cartList.get(i).getProduct_cod());
				isNewCart = false; // 새 상품이 아니므로 false 로 변경
				cartList.get(i).setQty(cartList.get(i).getQty() + 1); // 기존 카트 상품 수량 1 증가
				break;
			}
		}
		
		System.out.println(isNewCart);
		
		if(isNewCart) { // 중복되는 카트 상품이 없을 경우
			// CartBean 객체를 생성하여 상품 정보 저장한 후 ArrayList 객체에 CartBean 객체 추가
			CartBean cart = new CartBean(
					cartShop.getProduct_cod(), 
					cartShop.getProduct_image(),
					cartShop.getProduct_name(),
					cartShop.getPrice(),
					1);
			
			cartList.add(cart);
		}
		
	}
	
	
	
}













