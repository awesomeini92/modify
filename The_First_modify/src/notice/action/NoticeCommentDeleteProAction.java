package notice.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.svc.NoticeCommentDeleteProService;
import notice.vo.ActionForward;


public class NoticeCommentDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeCommentDeleteProAction");
		ActionForward forward = null;
		
		int post_num = Integer.parseInt(request.getParameter("post_num"));
		int comment_num = Integer.parseInt(request.getParameter("comment_num"));
		String nickname = request.getParameter("nickname");
//		String page = request.getParameter("page");
		
		NoticeCommentDeleteProService noticeCommentDeleteProService = new NoticeCommentDeleteProService();
		boolean isDeleteSuccess = noticeCommentDeleteProService.deleteCmmnt(comment_num);
		
			if (!isDeleteSuccess) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('글 삭제 실패!')");
				out.println("history.back()");
				out.println("</script>");
			}else {
//				MemberUpdateProService memberUpdateProService = new MemberUpdateProService();
//				boolean isSuccess = memberUpdateProService.minusCommentLP(nickname);
//				if(isSuccess) {
	//				request.setAttribute("post_num", post_num);
					forward = new ActionForward();
		//			forward.setPath("NoticeDetail.no");
					forward.setPath("NoticeDetail.no?post_num="+post_num);
		//			forward.setPath("NoticeDetail.no?page=" + nowPage);
					forward.setRedirect(true);
				}
			
		
		return forward;
	}

}