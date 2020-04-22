package coding.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import coding.svc.CmmntHeartService;
import coding_free.svc.CodingFreeCommentHeartService;
import vo.ActionForward;

public class CmmntUpdateHeartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CmmntUpdateHeartAction!");
		request.setCharacterEncoding("utf-8");
		ActionForward forward = null;
		
		int cmmnt_num = Integer.parseInt(request.getParameter("cmmnt_num"));
		System.out.println(cmmnt_num);
		String recommender = request.getParameter("recommender");
//		int cmmnt_num = 2;
		 
		CmmntHeartService cmmntHeartService = new CmmntHeartService();
		boolean isSuccess = cmmntHeartService.insertHeart(cmmnt_num,recommender);
		
		if(isSuccess) {
			System.out.println("insert 성공");
			boolean isSuccessUpdate = cmmntHeartService.updateHeartCount(cmmnt_num);
			if(isSuccessUpdate) {
				System.out.println("update 성공");
			}
		}
		
		
		
		return forward;
	}

}
