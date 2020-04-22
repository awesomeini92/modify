package coding_free.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import coding_free.svc.CodingFreeCommentHeartService;
import coding_free.svc.CodingFreeCommentListService;
import coding_free.vo.ActionForward;
import coding_free.vo.CodingFreeBean;
import member.svc.MemberUpdateProService;

public class CmmntDeleteHeartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CmmntDELETEHeartAction!");
		request.setCharacterEncoding("utf-8");
		ActionForward forward = null;
		
		int cmmnt_num = Integer.parseInt(request.getParameter("comment_num"));
		String recommender = request.getParameter("recommender");

		
		CodingFreeCommentListService codingFreeCommentListService = new CodingFreeCommentListService();
		String nickname = codingFreeCommentListService.getNickname(cmmnt_num);
		 
		CodingFreeCommentHeartService codingFreeCommentHeartService = new CodingFreeCommentHeartService();
		boolean isSuccess = codingFreeCommentHeartService.deleteHeart(cmmnt_num,recommender);
		
		if(isSuccess) {
			System.out.println("delete 성공");
			boolean isSuccessUpdate = codingFreeCommentHeartService.updateHeartCount(cmmnt_num);
			if(isSuccessUpdate) {
				MemberUpdateProService memberUpdateProService = new MemberUpdateProService();
					isSuccess = memberUpdateProService.minusHeartLP(nickname);
					if(isSuccess) {
						System.out.println("update 성공");
					}
			}
		}
		
		
		return forward;
	}
}
