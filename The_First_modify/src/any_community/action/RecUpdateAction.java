package any_community.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import any_community.svc.RecService;
import any_community.vo.ActionForward;

public class RecUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RecUpdateAction!");
		request.setCharacterEncoding("utf-8");
		ActionForward forward = null;
		
		int num = Integer.parseInt(request.getParameter("no"));
		String nickname = request.getParameter("nickname");
		
		// 확인메시지
		System.out.println("실행하기전에 받아온 값 체크");
		System.out.println("num : " + num + ", nickname : " + nickname);
		
		//
		RecService recService = new RecService();
		int result = recService.recCheck(num,nickname);
		
		if (result == 0) {
			System.out.println("RecUpdateAction - recUpdate");
			boolean isUpdateSuccess = recService.recUpdate(num,nickname);
			
			// 확인메시지
			if (isUpdateSuccess) {
				System.out.println("추천 성공");
			} else {
				System.out.println("추천 실패");
			}
		} else {
			System.out.println("RecUpdateAction - recDelete");
			boolean isDeleteSuccess = recService.recDelete(num,nickname);
			
			// 확인메시지
			if (isDeleteSuccess) {
				System.out.println("추천 삭제 성공");
			} else {
				System.out.println("추천 삭제 실패");
			}
		}
		
		return forward;
	}

}
