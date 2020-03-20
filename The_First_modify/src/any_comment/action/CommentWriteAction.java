package any_comment.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import any_comment.svc.CommentWriteService;
import any_comment.vo.AnyCommentBean;
import any_comment.vo.ActionForward;

public class CommentWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("CommunityWriteProAction!");
		request.setCharacterEncoding("UTF-8");
		
		//파라미터 가져오기
		String nowPage = request.getParameter("nowPage");
		int post_num = Integer.parseInt(request.getParameter("comment_board"));
		String nickname = request.getParameter("comment_nickname");
		String comment = request.getParameter("comment_content");
		
		AnyCommentBean anyCommentBean = new AnyCommentBean(post_num, nickname, comment);
		
		CommentWriteService commentWriteService = new CommentWriteService();
	
		// js로 넘기니까 체크 필요없음
		boolean isWriteSuccess = commentWriteService.writeComment(anyCommentBean);
		
		return null;
	}

}
