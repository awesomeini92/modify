package job_community.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import job_community.svc.JobBoardModifyProService;
import job_community.vo.ActionForward;
import job_community.vo.JobBoardBean;

public class JobBoardModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardModifyProAction");
		
		ActionForward forward = null;
		
		int board_num = Integer.parseInt(request.getParameter("board_num"));
		String page = request.getParameter("page");
		
		JobBoardModifyProService boardModifyProService = new JobBoardModifyProService();
		
		JobBoardBean article = new JobBoardBean();
		article.setBoard_num(board_num);
		article.setBoard_subject(request.getParameter("board_subject"));
		article.setBoard_content(request.getParameter("content"));
		
		boolean isModifySuccess = boardModifyProService.modifyArticle(article);
			
			if(!isModifySuccess) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('글 수정 실패!')");
				out.println("history.back()");
				out.println("</script>");
			} else {
				forward = new ActionForward();
				forward.setPath("JobBoardDetail.bo?board_num=" + board_num + "&page=" + page);
				forward.setRedirect(true);
			}
		
		return forward;
	}
	
}
