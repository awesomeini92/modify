package coding.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import coding.svc.CmmntDeleteProService;
import coding.svc.CodingDeleteProService;
import vo.ActionForward;

public class CmmntDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		System.out.println("CmmntDeleteProAction");
		
		int post_num = Integer.parseInt(request.getParameter("post_num"));
		int comment_num = Integer.parseInt(request.getParameter("comment_num"));
		String page = request.getParameter("page");
		
		CmmntDeleteProService cmmntDeleteProService = new CmmntDeleteProService();
		boolean isDelete = cmmntDeleteProService.deleteCmmntHeart(comment_num);
		 
		System.out.println("1");
		if(isDelete) {
			System.out.println("2");
			isDelete = cmmntDeleteProService.deleteCmmnt(comment_num);
			System.out.println("3");
			if(isDelete) {
				System.out.println("4");
				forward = new ActionForward();
	//			request.setAttribute("post_num", post_num);
	//			request.setAttribute("page", page);
//				forward.setPath("CodingDetail.code");
//				forward.setPath("/coding/make_cmmntView.jsp");
				forward.setPath("CmmntList.code?post_num="+post_num);
//				forward.setRedirect(true);
			}
		}
		return forward;
	}

}
