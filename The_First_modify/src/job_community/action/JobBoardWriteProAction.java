package job_community.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import job_community.svc.JobBoardWriteProService;
import job_community.vo.ActionForward;
import job_community.vo.JobBoardBean;

public class JobBoardWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		JobBoardBean jobBoardBean = new JobBoardBean();
		jobBoardBean.setBoard_nickname(request.getParameter("job_board_nickname"));
		jobBoardBean.setBoard_subject(request.getParameter("job_board_subject"));
		jobBoardBean.setBoard_content(request.getParameter("job_board_content"));
		
		JobBoardWriteProService jobBoardWriteProService = new JobBoardWriteProService();
		boolean isWriteSuccess = jobBoardWriteProService.registArticle(jobBoardBean);
		
		if(!isWriteSuccess) { 
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter(); 
			out.println("alert('게시물 등록 실패!')"); 
			out.println("history.back()"); 
			out.println("</script>"); 
		} else { 
			forward = new ActionForward(); 
			forward.setPath("JobBoardList.job");
			forward.setRedirect(true); 
		}
		
		return forward;
	}

}
