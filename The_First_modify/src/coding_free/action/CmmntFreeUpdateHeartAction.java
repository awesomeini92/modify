package coding_free.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import coding_free.svc.CodingFreeCommentHeartService;
import coding_free.svc.CodingFreeCommentListService;
import coding_free.vo.ActionForward;
import member.svc.MemberUpdateProService;

public class CmmntFreeUpdateHeartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		System.out.println("CmmntFreeUpdateHeartAction");

		int post_num = Integer.parseInt(request.getParameter("post_num"));
		int cmmnt_num = Integer.parseInt(request.getParameter("cmmnt_num"));
		String recommender = request.getParameter("recommender");
		
		CodingFreeCommentHeartService codingFreeCommentHeartService = new CodingFreeCommentHeartService();
		boolean isSuccess = codingFreeCommentHeartService.insertHeart(post_num, cmmnt_num, recommender);
		
		CodingFreeCommentListService codingFreeCommentListService = new CodingFreeCommentListService();
		String nickname = codingFreeCommentListService.getNickname(cmmnt_num);
		
		if(isSuccess) {
			isSuccess = codingFreeCommentHeartService.updateHeartCount(cmmnt_num);
			if(isSuccess) {
				MemberUpdateProService memberUpdateProService = new MemberUpdateProService();
				isSuccess = memberUpdateProService.updateHeartLP(nickname);
				if(isSuccess) {
					System.out.println("-~~~~~~~~~~~~~~~update 성공");
				}			
			}
		}
		
		return forward;
	}

}
