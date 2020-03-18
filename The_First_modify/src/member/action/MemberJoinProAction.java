package member.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.svc.MemberJoinProService;
import member.vo.ActionForward;
import member.vo.MemberBean;

public class MemberJoinProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MemberJoinProAction!");
		ActionForward forward = null;

		// 파라미터 4개 가져오기
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String nickname = request.getParameter("nickname");
		String email = request.getParameter("email");

		// 파라미터 4개 => MemberBean 객체에 저장
		MemberBean member = new MemberBean(id, password, nickname, email);

		// MemberJoinProService 클래스의 joinMember() 메서드 호출하여 추가 작업 요청
		// => 파라미터 : MemberBean 리턴타입 : boolean
		MemberJoinProService memberJoinProService = new MemberJoinProService();
		boolean isJoinSuccess = memberJoinProService.joinMember(member);

		if (!isJoinSuccess) { // 가입 실패
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter(); // HTML 태그 출력을 위한 Writer 객체 가져오기
			out.println("<script>"); // 자바스크립트 실행을 위한 <script> 시작 태그
			out.println("alert('회원 가입 실패!')"); // alert dialog 출력
			out.println("history.back()"); // 또는 out.println("history.go(-1)"); // 이전 페이지로 돌아가기
			out.println("</script>"); // 자바스크립트 종료 위한 <script> 끝 태그
		} else { // 글쓰기 성공
			forward = new ActionForward(); // ActionForward 객체 생성
			forward.setPath(""); // 서블릿 주소 지정
			forward.setRedirect(true); // Redirect 방식(true) 지정
		}

		return forward;
	}

}
