package coding.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import coding.svc.CodingDeleteProService;
import member.svc.MemberUpdateProService;
import vo.ActionForward;

public class CodingDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		int num = Integer.parseInt(request.getParameter("num"));
		String page = request.getParameter("page");
		String nickname = request.getParameter("nickname");
		
		CodingDeleteProService codingDeleteProService = new CodingDeleteProService();


			boolean isDeleteSuccess = codingDeleteProService.removeArticle(num);

			if(!isDeleteSuccess) {
				// 리턴받은 수정 결과(isModifySuccess)가 false 일 경우
				// => 자바스크립트를 사용하여 "글 수정 실패!" 출력 후 이전 페이지로 이동
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('글 삭제 실패!')");
				out.println("history.back()");
				out.println("</script>");			
			}else {
				MemberUpdateProService memberUpdateProService = new MemberUpdateProService();
				boolean isSuccess = memberUpdateProService.minusArticletLP(nickname);
				if(isSuccess){
					forward = new ActionForward();
					request.setAttribute("page", page);
					forward.setPath("/coding/codingList.jsp");
					forward.setRedirect(true);
				}
			} 
			

		
		return forward;
	}

}
