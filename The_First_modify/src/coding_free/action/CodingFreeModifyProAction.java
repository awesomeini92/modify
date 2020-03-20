package coding_free.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import coding_free.svc.CodingFreeModifyService;
import coding_free.vo.ActionForward;
import coding_free.vo.CodingFreeBean;

public class CodingFreeModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CodingFreeModifyProAction");

		ActionForward forward = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		String page = request.getParameter("page");
		
		CodingFreeModifyService codingFreeModifyService = new CodingFreeModifyService();
		
		CodingFreeBean article = new CodingFreeBean();
		article.setNum(num);
		article.setSubject(request.getParameter("subject"));
		article.setContent(request.getParameter("content"));
			
		boolean isModifySuccess = codingFreeModifyService.modifyArticle(article);
	
		if(!isModifySuccess) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('글 수정 실패!')");
			out.println("history.back()");
			out.println("</script>");
		} else {
			forward = new ActionForward();
			forward.setPath("CodingFreeDetail.any?num=" + num + "&page=" + page);
			forward.setRedirect(true);
		}
		
		return forward;
	}

}
