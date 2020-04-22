package notice.action;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.svc.NoticeCommentModifyService;
import notice.vo.ActionForward;
import notice.vo.NoticeCommentBean;
import svc.AllService;

public class NoticeCommentModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("NoticeCommentModifyProAction!");
		
		int comment_num = Integer.parseInt(request.getParameter("comment_num"));
//		String page = request.getParameter("page");
		
		NoticeCommentBean noticeCommentBean = new NoticeCommentBean();
		noticeCommentBean.setComment(request.getParameter("comment"));
		noticeCommentBean.setNickname(request.getParameter("nickname"));
		noticeCommentBean.setComment_num(comment_num);
		
		
		NoticeCommentModifyService noticeCommentModifyService = new NoticeCommentModifyService();
		boolean isSuccess = noticeCommentModifyService.updateComment(noticeCommentBean);
		
//		if (comentList.size() > 0) {
//			request.setAttribute("commentList", comentList);
//		}
//		
//		if (article != null) {
//			CodingFreeDetailService.plusReadcount(post_num);
//		}
		
		AllService allService = new AllService();
		Date today = allService.getToday();
		
//		request.setAttribute("article", article);
//		request.setAttribute("page", page);
		request.setAttribute("today", today);
//		request.setAttribute("post_num", post_num);
		
		ActionForward forward = new ActionForward();
//		forward.setPath("/coding_free/codingFreeView.jsp");
		forward.setPath("NoticeDetail.no");
		
		return forward;
	}

}
