package coding_free.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import coding_free.svc.CodingFreeDeleteProService;
import coding_free.vo.ActionForward;

public class CodingFreeDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CodingFreeDeleteProAction");
		ActionForward forward = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		String nowPage = request.getParameter("page");
		
		CodingFreeDeleteProService codingFreeDeleteProService = new CodingFreeDeleteProService();
		boolean isDeleteSuccess = codingFreeDeleteProService.deleteArticle(num);
		
		if (!isDeleteSuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글 삭제 실패!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("CodingFreeList.cf?page=" + nowPage);
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
