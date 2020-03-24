package shop.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import shop.svc.ShopCartQtyChangeService;
import vo.ActionForward;



public class ShopCartQtyChangeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("ShopCartQtyChangeAction");
		ActionForward forward = null;
		
		// 카드에 담을 상품 코드 가져오기
		String product_cod = request.getParameter("product_cod");
		// 변경된 수량 가져오기
		int qty = Integer.parseInt(request.getParameter("qty"));
//		System.out.println(id + ", " + qty);
		
//		// ShopCartQtyChangeService 의 changeCartQty() 메서드 호출하여 장바구니 수량 변경 작업 수행
//		// => 파라미터 : product_cod, qty, request 객체    리턴값 : X
		ShopCartQtyChangeService shopCartQtyChangeService = new ShopCartQtyChangeService();
		shopCartQtyChangeService.changeCartQty(product_cod, qty, request);
		
//		
//		// ActionForward 객체를 사용하여 ShopCartList.shop 페이지로 이동 설정 - Redirect 방식
		forward = new ActionForward();
		forward.setPath("ShopCartList.shop");
		forward.setRedirect(true);
		
		return forward;
	}

}
