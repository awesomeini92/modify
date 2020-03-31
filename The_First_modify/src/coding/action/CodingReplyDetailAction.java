package coding.action;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import any_community.svc.CommentListService;
import coding.svc.CmmntListService;
import coding.svc.CodingDetailService;
import coding.svc.CodingListService;
import coding.svc.CodingReplyListService;
import coding.vo.CmmntBean;
import coding.vo.CodingBean;
import coding.vo.Coding_refBean;
import coding.vo.PageInfo;
import jdk.nashorn.internal.runtime.JSONFunctions;
import netscape.javascript.JSObject;
import svc.AllService;
import vo.ActionForward;

public class CodingReplyDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		System.out.println("CodingReplyDetailAction");
		
		int post_num = Integer.parseInt(request.getParameter("post_num"));
		String page = request.getParameter("page"); 
		
		int reply_page = 1;
		int reply_limit = 1;
		
		if(request.getParameter("reply_page") != null) {
			reply_page = Integer.parseInt(request.getParameter("reply_page")); // 정수로 변환하여 저장
		}
		
		System.out.println(reply_page);
		
		CodingReplyListService codingReplyListService = new CodingReplyListService();
		List<Coding_refBean> replyList = codingReplyListService.getArticleReplyList(post_num, reply_page, reply_limit);
		
//		Coding_refBean article_ref= codingReplyListService.getReplyArticle(post_num);
		
		
		// 리턴받은 BoardBean 객체가 null 이 아닐 경우 BoardDetailService 클래스의 plusReadcount() 메서드 호출
//		if(article_ref != null) {
////			codingDetailService.updateReadcount(post_num);
//		}
		
	
		AllService allService = new AllService();
		Date today = allService.getToday();
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String json = "{\"replyList\":["; // replyList는 키값이 됨
		for (int i = 0; i < replyList.size(); i++) {
			String nickname = replyList.get(i).getNickname();
			String subject = replyList.get(i).getSubject();
			String content = replyList.get(i).getContent();
			String file = replyList.get(i).getFile();
			Date date = replyList.get(i).getDate();
			String time = replyList.get(i).getTime();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			int readcount = replyList.get(i).getReadcount();
			int ref_num = replyList.get(i).getRef_num();
			
			json += "[{\"nickname\":\"" + nickname + "\"},"; //0
			if(date.compareTo(today)==0) {
				json += "{\"reply_date\":\"" + time + "\"},";		//1
			}else {
				json += "{\"reply_date\":\"" + df.format(date) + "\"},";		//1
			}
			json += "{\"readcount\":\"" + readcount + "\"},";		//2
			json += "{\"ref_num\":\"" + ref_num + "\"},";		//3
			json += "{\"subject\":\"" + subject + "\"},"; //4
			json += "{\"file\":\"" + file + "\"},";		//5
			json += "{\"content\":\"" + content + "\"},";		//6
			json += "{\"file\":\"" + file + "\"}]";		//7
			
			if (i != replyList.size() - 1) {
				json += ",";
			}
		}
		json += "]}";
		
		// 누적된 json 형식의 문자열을 호출한 페이지(뷰페이지)로 보내줌
		out.print(json);

		return forward;
	}

}
