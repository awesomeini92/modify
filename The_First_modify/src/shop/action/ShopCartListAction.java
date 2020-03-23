package shop.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import shop.svc.ShopListService;
import shop.vo.ShopBean;
import vo.ActionForward;

public class ShopCartListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ShopListAction!");
		ActionForward forward = null;
		
		// ShopListService 인스턴스 생성 및 getShopList() 메서드를 호출하여 상품 목록 가져오기
		ShopListService shopListService = new ShopListService();
		ArrayList<ShopBean> shopList = shopListService.getShopList();
		
		int totalMoney = 0;
		int money = 0;
		
		for(int i = 0; i<shopList.size(); i++) {
			money = shopList.get(i).getPrice() * shopList.get(i).getQty();
			totalMoney+=money;
		}
		
		// request 객체의 setAttribute() 메서드를 호출하여 객체 저장(shopList)
		request.setAttribute("shopList", shopList);
		request.setAttribute("totalMoney", totalMoney);
				
		// ActionForward 객체를 생성하여 shop 폴더 내의 shop_list.jsp 페이지 이동 설정 (Dispatch 방식)
		forward = new ActionForward();
		forward.setPath("/shop/shop_list.jsp");
				
		return forward;


	}

}

















