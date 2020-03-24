package coding.action;

import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import coding.svc.CmmntListService;
import coding.svc.CodingDetailService;
import coding.svc.CodingListService;
import coding.svc.CodingReplyListService;
import coding.vo.CmmntBean;
import coding.vo.CodingBean;
import coding.vo.Coding_refBean;
import coding.vo.PageInfo;
import svc.AllService;
import vo.ActionForward;

public class CodingDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		String page = request.getParameter("page"); 
		
		int reply_page = 1;
		int reply_limit = 1;
		
		if(request.getParameter("reply_page") != null) {
			reply_page = Integer.parseInt(request.getParameter("reply_page")); // 정수로 변환하여 저장
		}
		
		System.out.println(reply_page);
		
		CodingDetailService codingDetailService = new CodingDetailService();
		CodingBean article = codingDetailService.getArticle(num);
		
		CodingReplyListService codingReplyListService = new CodingReplyListService();
		ArrayList<Coding_refBean>article_refList = codingReplyListService.getReplyList(num, reply_page, reply_limit);
		
		
		// 리턴받은 BoardBean 객체가 null 이 아닐 경우 BoardDetailService 클래스의 plusReadcount() 메서드 호출
		if(article != null) {
			codingDetailService.updateReadcount(num);
		}
		
		//답글 페이지
		int listCount = codingReplyListService.getReplyListCount(num);

		int maxPage = (int)((double)listCount / reply_limit + 0.95);
		int startPage = (((int)((double)reply_page / 10 + 0.9)) - 1) * 10 + 1;
		int endPage = startPage + 10 - 1;
				
		if(endPage > maxPage) {
			endPage = maxPage;
		}
				
		// PageInfo 객체에 페이지 정보 저장
		PageInfo replyPageInfo = new PageInfo(reply_page, maxPage, startPage, endPage, listCount);
		
		AllService allService = new AllService();
		Date today = allService.getToday();
		
		//댓글페이지 계산
		
		request.setAttribute("today", today);
		request.setAttribute("replyPageInfo", replyPageInfo);
		request.setAttribute("article", article);
		request.setAttribute("page", page);
		request.setAttribute("article_refList", article_refList);
//		request.setAttribute("cmmntList", cmmntList);
//		request.setAttribute("cmmnt_pageInfo", cmmnt_pageInfo);
//		request.setAttribute("cmmnt_page", cmmnt_page);
		
		
		forward = new ActionForward();
//		forward.setPath("/coding/codingView.jsp");
		forward.setPath("/coding/mdf_codingView.jsp");
		
		return forward;
	}

}
