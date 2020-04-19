package coding.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import coding.svc.CmmntHeartService;
import vo.ActionForward;

public class CmmntDeleteHeartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CmmntDELETEHeartAction!");
		request.setCharacterEncoding("utf-8");
		ActionForward forward = null;
		
		int cmmnt_num = Integer.parseInt(request.getParameter("comment_num"));
		String recommender = request.getParameter("recommender");
//		int cmmnt_num = 2;
		 
		CmmntHeartService cmmntHeartService = new CmmntHeartService();
		boolean isSuccess = cmmntHeartService.deleteHeart(cmmnt_num,recommender);
		
		if(isSuccess) {
			System.out.println("delete 성공");
			boolean isSuccessUpdate = cmmntHeartService.updateHeartCount(cmmnt_num);
			if(isSuccessUpdate) {
				System.out.println("update 성공");
			}
		}
		
		
		
		return forward;
	}

}
