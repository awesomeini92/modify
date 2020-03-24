package shop.svc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import shop.vo.CartBean;



public class ShopCartQtyChangeService {

	public void changeCartQty(String product_cod, int qty, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		// 세션 객체로부터 ArrayList<CartBean> 객체 가져오기
		ArrayList<CartBean> cartList = (ArrayList<CartBean>) session.getAttribute("cartList");
		
		// for문을 사용하여 ArrayList 객체내의 CartBean 객체 중 product_cod 값이 같은 상품 찾기
		// => 해당 상품의 수량을 입력받은 수량(qty)으로 변경
		for(CartBean cartBean : cartList) {
			if(cartBean.getProduct_cod() == product_cod) {
//				System.out.println("일치하는 상품 : " + product_cod);
				cartBean.setQty(qty); // 수량 변경
			}
		}
		
		// 별도의 저장 작업 등을 수행하지 않아도 세션 객체 내의 ArrayList 객체에 바로 적용되므로
		// 세션이 유지되는 한 변경 내용이 그대로 바로 적용됨
		
		
	}
		
}










//