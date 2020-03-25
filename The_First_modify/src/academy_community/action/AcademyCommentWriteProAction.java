package academy_community.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import academy_community.svc.AcademyCommentWriteProService;
import academy_community.vo.AcademyCommentBean;
import academy_community.vo.ActionForward;

public class AcademyCommentWriteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		System.out.println("CommentWriteProAction!");
		ActionForward forward = null;

		int num = Integer.parseInt(request.getParameter("num"));
		
		AcademyCommentBean commentBean = new AcademyCommentBean();
		
		commentBean.setPost_num(num);
		commentBean.setNickname(request.getParameter("nickname"));
		commentBean.setComment(request.getParameter("comment"));
		
		AcademyCommentWriteProService commentWriteProService = new AcademyCommentWriteProService();
		boolean isCommentWrite = commentWriteProService.registComment(commentBean);
		
		System.out.println("isCommentWrite = " + isCommentWrite);
		
		// 글쓰기 성공 여부에 따른 후속 처리(이동 작업)
		// => 실패 시 : 자바스크립트를 사용하여 실패 메세지 출력 후, 이전 페이지로 이동
		// => 성공 시 : ActionForward 객체를 생성하여 글목록(BoardList.ac) 페이지 요청(Redirect 방식)
		if(!isCommentWrite) { // 글쓰기 실패
			// HTML 문서 형식으로 출력하기 위해 response 객체의 setContentType() 메서드 호출 => HTML 타입 지정
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter(); // HTML 태그 출력을 위한 Writer 객체 가져오기
			// out 객체의 println() 메서드를 호출하여 HTML 태그 작성
			out.println("<script>"); // 자바스크립트 실행을 위한 <script> 시작 태그
			out.println("alert('댓글 등록 실패')"); // alert dialog 출력
			out.println("history.back()"); // 또는 out.println("history.go(-1)");  // 이전 페이지로 돌아가기
			out.println("</script>"); // 자바스크립트 종료 위한 <script> 끝 태그
		} else { // 글쓰기 성공
			forward = new ActionForward(); // ActionForward 객체 생성
			forward.setPath("BoardList.ac"); // 서블릿 주소 지정
			forward.setRedirect(true); // Redirect 방식(true) 지정
		}
		
		// ActionForward 객체 리턴
		return forward; 
	}

}
