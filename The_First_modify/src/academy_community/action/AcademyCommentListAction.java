package academy_community.action;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import academy_community.svc.AcademyCommentService;
import academy_community.svc.AcademyListService;
import academy_community.vo.AcademyBean;
import academy_community.vo.AcademyCommentBean;
import academy_community.vo.ActionForward;
import academy_community.vo.PageInfo;
import svc.AllService;

public class AcademyCommentListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("BoardListAction!");
		
		ActionForward forward = null;
		int post_num = Integer.parseInt(request.getParameter("post_num"));
		String session_nick = request.getParameter("session_nick");
		
		// date 시간
		AllService allService = new AllService();
		Date today = allService.getToday();
		
		// BoardListService 인스턴스 생성 후 게시물 목록 갯수 가져오기
		AcademyListService boardListService = new AcademyListService();
		AcademyCommentService academyCommentService = new AcademyCommentService();
		List<AcademyCommentBean> cmmntList = academyCommentService.getCommentList(post_num);
		
		
		
		ArrayList<AcademyBean> articleList = null;
		articleList = boardListService.getArticleList();
		
		request.setAttribute("articleList", articleList);
		request.setAttribute("today", today);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String json = "{\"cmmntList\":["; // replyList는 키값이 됨
		
		for (int i = 0; i < cmmntList.size(); i++) {
			String nickname = cmmntList.get(i).getNickname();
			String comment = cmmntList.get(i).getComment();
			Date date = cmmntList.get(i).getDate();
			String time = cmmntList.get(i).getTime();
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			int cmmnt_num = cmmntList.get(i).getComment_num();
			
			json += "[{\"cmmnt_num\":\"" + cmmnt_num + "\"},"; //0
			if(date.compareTo(today)==0) {
				json += "{\"cmmnt_date\":\"" + time + "\"},";		//1
			}else {
				json += "{\"cmmnt_date\":\"" + df.format(date) + "\"},";		//1
			}
			json += "{\"nickname\":\"" + nickname + "\"},";//2
			json += "{\"session_nick\":\"" + session_nick + "\"},";		//3
			json += "{\"comment\":\"" +comment + "\"}]";   //4
			
			if (i != cmmntList.size() - 1) {
				json += ",";
			}
		}
		json += "]}";
		
		// 누적된 json 형식의 문자열을 호출한 페이지(뷰페이지)로 보내줌
		out.print(json);
		return forward;

	}

}
