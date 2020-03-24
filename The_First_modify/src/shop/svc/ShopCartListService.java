package shop.svc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import shop.vo.CartBean;


public class ShopCartListService {

	public ArrayList<CartBean> getCartList(HttpServletRequest request) {
		// HttpSession 객체 가져와서 세션 내의 ArrayList<CartBean> 객체 가져오기
		HttpSession session = request.getSession();
		ArrayList<CartBean> cartList = (ArrayList<CartBean>) session.getAttribute("cartList");
		
		return cartList;
	}
	
}
