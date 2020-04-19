package coding_free.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import coding_free.svc.CodingFreeCommentHeartService;
import coding_free.vo.ActionForward;

public class CmmntFreeUpdateHeartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		System.out.println("CmmntFreeUpdateHeartAction");

		int cmmnt_num = Integer.parseInt(request.getParameter("cmmnt_num"));
		String recommender = request.getParameter("recommender");
		
		CodingFreeCommentHeartService codingFreeCommentHeartService = new CodingFreeCommentHeartService();
		boolean isSuccess = codingFreeCommentHeartService.insertHeart(cmmnt_num, recommender);
		
		if(isSuccess) {
			isSuccess = codingFreeCommentHeartService.updateHeartCount(cmmnt_num);
			if(isSuccess) {
				System.out.println("-~~~~~~~~~~~~~~~update 성공");
			}
		}
		
		return forward;
	}

}
