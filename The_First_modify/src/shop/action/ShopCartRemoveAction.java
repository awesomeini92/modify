package shop.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import shop.svc.ShopCartRemoveService;
import vo.ActionForward;


public class ShopCartRemoveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("ShopCartRemoveAction");
		ActionForward forward = null;
		
		// 체크박스(remove) 값 가져오기 = 다중 선택 체크박스이므로 배열로 가져오기
		String[] cartIdArr = request.getParameterValues("remove");
		
		// ShopCartRemoveService 클래스의 cartRemove() 메서드를 호출하여 카트에서 제거 작업 수행
		// 파라미터 : cartIdArr 배열, request 객체
		ShopCartRemoveService shopCartRemoveService = new ShopCartRemoveService();
		shopCartRemoveService.cartRemove(cartIdArr, request);
		
		// ActionForward 객체 생성 및 "ShopCartList.shop" 서블릿 요청
		forward = new ActionForward();
		forward.setPath("DogCartList.dog");
		
		return forward;
	}

}
