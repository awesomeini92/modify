package any_community.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import any_community.svc.CommentListService;
import any_community.vo.AnyCommentBean;
import any_community.svc.CommunityDetailService;
import any_community.vo.ActionForward;
import any_community.vo.CommunityBean;

public class CommunityDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CommunityDetailAction!");
		
		int num = Integer.parseInt(request.getParameter("num"));
		String nowPage = request.getParameter("page");
		System.out.println("nowPage : " + nowPage);
		
		CommunityDetailService communityDetailService = new CommunityDetailService();
		CommunityBean article = communityDetailService.getArticle(num);
		
		CommentListService commentListService = new CommentListService();
		ArrayList<AnyCommentBean> comentList = commentListService.getCommentList(num);
		
		if (comentList.size() > 0) {
			request.setAttribute("commentList", comentList);
		}
		
		if (article != null) {
			CommunityDetailService.plusReadcount(num);
		}
		
		request.setAttribute("article", article);
		request.setAttribute("page", nowPage);
		
		ActionForward forward = new ActionForward();
		forward.setPath("/any_community/communityView.jsp");
		
		return forward;
	}

}
