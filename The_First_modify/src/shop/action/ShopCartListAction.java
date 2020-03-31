package shop.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import shop.svc.ShopCartListService;
import shop.vo.CartBean;
import vo.ActionForward;

public class ShopCartListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("ShopCartListAction");
			
		ActionForward forward = null;
		
		ShopCartListService shopCartListService = new ShopCartListService();
		ArrayList<CartBean> cartList = shopCartListService.getCartList(request);
			
		int totalMoney = 0;
		int money = 0;
		
		for(int i = 0; i<cartList.size(); i++) {
			money = cartList.get(i).getPrice() * cartList.get(i).getQty();
			totalMoney+=money;
		}
		
		
		request.setAttribute("totalMoney", totalMoney);
		request.setAttribute("cartList", cartList);
		
		forward = new ActionForward();
		forward.setPath("/shop/shop_cart_list.jsp");
		
		
		return forward;
	}

}
