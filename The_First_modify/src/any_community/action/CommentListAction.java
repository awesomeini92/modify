package any_community.action;

import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import any_community.svc.CommentListService;
import any_community.vo.ActionForward;
import any_community.vo.AnyCommentBean;

public class CommentListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CommentListAction!");
		request.setCharacterEncoding("UTF-8");

		int post_num = Integer.parseInt(request.getParameter("post_num"));

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		CommentListService commentListService = new CommentListService();
		ArrayList<AnyCommentBean> list = commentListService.getCommentList(post_num);
		
		// 구해온 댓글 목록을 반복문을 이용하여 json 형식으로 문자열 변수(json)에 누적 저장
		String json = "{\"replyList\":["; // replyList는 키값이 됨
		for (int i = 0; i < list.size(); i++) {
			String nickname = list.get(i).getNickname();
			String comment = list.get(i).getComment();
			Date date = list.get(i).getDate();
			SimpleDateFormat df = new SimpleDateFormat("YY-MM-dd");
			int comment_num = list.get(i).getComment_num();
			
			json += "[{\"nickname\":\"" + nickname + "\"},";
			json += "{\"reply_date\":\"" + df.format(date) + "\"},";
			json += "{\"comment\":\"" + comment + "\"},";
			json += "{\"comment_num\":\"" + comment_num + "\"}]";
			
			if (i != list.size() - 1) {
				json += ",";
			}
		}
		json += "]}";
		
		// 누적된 json 형식의 문자열을 호출한 페이지(뷰페이지)로 보내줌
		out.print(json);

		return null;
	}

}
