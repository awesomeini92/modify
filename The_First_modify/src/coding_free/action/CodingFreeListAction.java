package coding_free.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import coding_free.svc.CodingFreeListService;
import coding_free.vo.ActionForward;
import coding_free.vo.CodingFreeBean;
import coding_free.vo.PageInfo;

public class CodingFreeListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CodingFreeListAction!");
		ActionForward forward = null;
		
		int page = 1;
		int limit = 10;
		
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		CodingFreeListService codingFreeListService = new CodingFreeListService();
		int listCount = codingFreeListService.getListCount();
		
		ArrayList<CodingFreeBean> articleList = codingFreeListService.getArticleList(page, limit);
		
		int maxPage = (int)((double)listCount / limit + 0.95);
		int startPage = (((int)((double)page / 10 + 0.9)) - 1) * 10 + 1;
		int endPage = startPage + 10 - 1;

		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pageInfo = new PageInfo(page, maxPage, startPage, endPage, listCount);
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("articleList", articleList);
		
		forward = new ActionForward();
		forward.setPath("/coding_free/codingFreeList.jsp");
		
		return forward;
	}

}
