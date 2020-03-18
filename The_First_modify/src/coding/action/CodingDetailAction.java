package coding.action;

import java.util.ArrayList;

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
import vo.ActionForward;

public class CodingDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		int num = Integer.parseInt(request.getParameter("num"));
		String page = request.getParameter("page"); 

		
		System.out.println(page);
		
		CodingDetailService codingDetailService = new CodingDetailService();
		CodingBean article = codingDetailService.getArticle(num);
		
		CodingReplyListService codingReplyListService = new CodingReplyListService();
		ArrayList<Coding_refBean>article_refList = codingReplyListService.getReplyList(num);
		
		
		// 리턴받은 BoardBean 객체가 null 이 아닐 경우 BoardDetailService 클래스의 plusReadcount() 메서드 호출
		if(article != null) {
			codingDetailService.updateReadcount(num);
		}
		

		//댓글페이지 계산
		
		

		request.setAttribute("article", article);
		request.setAttribute("page", page);
		request.setAttribute("article_refList", article_refList);
//		request.setAttribute("cmmntList", cmmntList);
//		request.setAttribute("cmmnt_pageInfo", cmmnt_pageInfo);
//		request.setAttribute("cmmnt_page", cmmnt_page);
		
		
		forward = new ActionForward();
		forward.setPath("/coding/codingView.jsp");
		
		return forward;
	}

}
