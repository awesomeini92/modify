package action;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import coding.svc.CodingListService;
import coding.vo.CodingBean;
import svc.AllService;
import vo.ActionForward;

public class MainAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward =null;
		
		
		AllService allService = new AllService();
		Date today = allService.getToday();
		
		CodingListService codingListService = new CodingListService();
		ArrayList<CodingBean> articleList = null;
		articleList = codingListService.getArticleList();
		
		request.setAttribute("today", today);
		request.setAttribute("articleList", articleList);
		
		forward = new ActionForward();
		forward.setPath("/index.jsp");
		
		return forward;
	}

}
