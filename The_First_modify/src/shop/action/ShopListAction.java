package shop.action;

import java.util.ArrayList;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import shop.svc.ShopListService;
import vo.ActionForward;
import shop.vo.ShopBean;


public class ShopListAction implements Action {
	
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ShopListAction");
		
		ActionForward forward = null;
		
		// 오늘 본 상품 목록을 저장하는 ArrayList 객체 생성
		ArrayList<String> todayImageList = new ArrayList<String>();
		// 이전에 본 상품 목록이 저장되어 있는 쿠키에 접근하기 위해 request 객체의 getCookies() 메서드 호출
		Cookie[] cookieArray = request.getCookies();
		
		// 쿠키가 비어있지 않을 경우 모든 쿠키 중 이름이 "today" 로 시작하는 쿠키 값을 ArrayList 에 저장
		if(cookieArray != null) {
			for(int i = 0; i < cookieArray.length; i++) {
				if(cookieArray[i].getName().startsWith("today")) {
					todayImageList.add(cookieArray[i].getValue());
				}
			}
		}
		
		// ShopListService 인스턴스 생성 및 getShopList() 메서드를 호출하여 상품 목록 가져오기
		// => 파라미터 : X     리턴타입 : ArrayList<ShopBean> (shopList)
		ShopListService shopListService = new ShopListService();
		ArrayList<ShopBean> shopList = shopListService.getShopList();
		
		// request 객체의 setAttribute() 메서드를 호출하여 객체 저장(shopList, todayImageList)
		request.setAttribute("shopList", shopList);
		request.setAttribute("todayImageList", todayImageList);
		
		// ActionForward 객체를 생성하여 shop 폴더 내의 shop_list.jsp 페이지 이동 설정
		forward = new ActionForward();
		forward.setPath("/shop/shop_list.jsp");
		
		return forward;
	}

}

















