package shop.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import shop.svc.ShopCartAddService;
import vo.ActionForward;
import shop.vo.ShopBean;


public class ShopCartAddAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("ShopCartAddAction!");
		ActionForward forward = null;
		
		// 카드에 담을 상품 코드 가져오기
		String product_cod = request.getParameter("product_cod");
		
		// ShopCartAddService 의 getCartShop() 메서드를 호출하여 product_cod 에 해당하는 상품 정보 가져오기
		// => 파라미터 : product_cod       리턴타입 : ShopBean
		ShopCartAddService shopCartAddService = new ShopCartAddService();
		ShopBean cartShop = shopCartAddService.getCartShop(product_cod);
		
		// ShopCartAddService 의 addCart() 메서드 호출하여 장바구니 담기 작업 수행
		// => 파라미터 : ShopBean, request 객체(Session 객체 가져오기 위해)    리턴값 : X
		shopCartAddService.addCart(cartShop, request);
		
		// ActionForward 객체를 사용하여 ShopCartList.shop 페이지로 이동 설정 - Redirect 방식
		forward = new ActionForward();
		forward.setPath("ShopCartList.shop");
		forward.setRedirect(true);
		
		return forward;
	}

}



















