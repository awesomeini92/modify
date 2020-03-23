package any_community.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import any_community.svc.RecService;
import any_community.vo.ActionForward;

public class RecCountAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("RecCountAction!");
		request.setCharacterEncoding("utf-8");
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		int num = Integer.parseInt(request.getParameter("no"));
		
		RecService recService = new RecService();
		int count = recService.recCount(num);
		
		// view 페이지에 count값 전달
		out.println(count);
		out.close();

		return null;
	}

}
