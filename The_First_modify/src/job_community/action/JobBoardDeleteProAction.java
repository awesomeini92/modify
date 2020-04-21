package job_community.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import job_community.svc.JobBoardDeleteProService;
import job_community.vo.ActionForward;

public class JobBoardDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		String page = request.getParameter("page");
				
		JobBoardDeleteProService boardDeleteProService = new JobBoardDeleteProService();
		
			boolean isDeleteSuccess = boardDeleteProService.removeArticle(num);
					
			if(!isDeleteSuccess) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('글 삭제 실패!')");
				out.println("history.back()");
				out.println("</script>");
			} else {
				forward = new ActionForward();
				forward.setPath("JobBoardList.job?page=" + page);
				forward.setRedirect(true);
			}
					
		return forward;
	}
	
}
