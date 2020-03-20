package coding_free.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import coding_free_comment.svc.CodingFreeCommentListService;
import coding_free_comment.vo.CodingFreeCommentBean;
import coding_free.svc.CodingFreeDetailService;
import coding_free.vo.ActionForward;
import coding_free.vo.CodingFreeBean;

public class CodingFreeDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CommunityDetailAction!");
		
		int num = Integer.parseInt(request.getParameter("num"));
		String page = request.getParameter("page");
		
		CodingFreeDetailService codingFreeDetailService = new CodingFreeDetailService();
		CodingFreeBean article = codingFreeDetailService.getArticle(num);
		
		CodingFreeCommentListService commentListService = new CodingFreeCommentListService();
		ArrayList<CodingFreeCommentBean> comentList = commentListService.getCommentList(num);
		
		if (comentList.size() > 0) {
			request.setAttribute("commentList", comentList);
		}
		
		if (article != null) {
			CodingFreeDetailService.plusReadcount(num);
		}
		
		request.setAttribute("article", article);
		request.setAttribute("page", page);
		
		ActionForward forward = new ActionForward();
		forward.setPath("/coding_free/codingFreeView.jsp");
		
		return forward;
	}

}
