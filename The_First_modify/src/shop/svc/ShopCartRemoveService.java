package shop.svc;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import shop.vo.CartBean;



public class ShopCartRemoveService {

	public void cartRemove(String[] cartIdArr, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		// 세션 객체로부터 ArrayList<CartBean> 객체 가져오기
		ArrayList<CartBean> cartList = (ArrayList<CartBean>) session.getAttribute("cartList");
		
		for(int i = 0; i < cartList.size(); i++) {
			for(int j = 0; j < cartIdArr.length; j++) {
				// 일치하는 Product_cod 가 있을 경우 해당 CartBean 객체를 ArrayList 에서 제거
				if(cartList.get(i).getProduct_cod() == cartIdArr[j]) {
					cartList.remove(i); // 인덱스(int)로 제거할 때
//					cartList.remove(cartList.get(i)); // 객체(Object)로 제거할 때
				}
			}
		}
		
	}
}















