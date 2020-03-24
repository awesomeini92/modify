package shop.action;

import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shop.vo.ActionForward;



public class ShopViewAction implements Action {
	
	

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ShopViewAction!");
		ActionForward forward = null;
		
		// 파라미터로 전달받은 id값 가져오기
		int id = Integer.parseInt(request.getParameter("id"));
		
		// DogViewService 클래스의 getDogView() 메서드를 호출하여 상세 정보 가져오기
		// => 파라미터 : id    리턴타입 : DogBean(dogBean)
		DogViewService dogViewService = new DogViewService();
		DogBean dogBean = dogViewService.getDogView(id);
		
		// DogBean 객체가 null 이 아니면 조회수 증가(plusReadcount() 메서드 호출)
		if(dogBean != null) {
			dogViewService.plusReadcount(id);
		}
		
		// DogBean 객체를 request 객체에 저장
		request.setAttribute("dog", dogBean);
		
		// 현재 상세정보를 읽어온 상품의 id 값을 이름으로 하여 이미지 파일명을 쿠키에 추가(쿠키 유효기간 1일)
//		Cookie todayImageCookie = new Cookie("today" + id, dogBean.getImage());
		Cookie todayImageCookie = new Cookie("today" + id, URLEncoder.encode(dogBean.getImage(), "UTF-8"));
		// => 톰캣 환경에서 쿠키값을 한글로 지정할 때 발생하는 오류 해결책 : UTF-8 로 인코딩
		todayImageCookie.setMaxAge(60 * 60 * 24); // 60초 -> 60분 -> 24시 = 1일
		// response 객체에 쿠키 전달
		response.addCookie(todayImageCookie);
		
		// ActionForward 객체를 사용하여 dog 폴더의 dogView.jsp 페이지로 이동 설정
		forward = new ActionForward();
		forward.setPath("/dog/dogView.jsp");
		
		return forward;
	}

}






