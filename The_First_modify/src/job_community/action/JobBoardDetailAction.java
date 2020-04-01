package job_community.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import job_community.svc.JobBoardDetailService;
import job_community.svc.JobBoardListService;
import job_community.vo.ActionForward;
import job_community.vo.JobBoardBean;

public class JobBoardDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BoardDetailAction");
		
		int board_num = Integer.parseInt(request.getParameter("board_num")); // 실제 사용을 위해 형변환 필요
		String nowPage = request.getParameter("page"); // 단순 전달용이므로 별도의 형변환 불필요
		
		
		JobBoardDetailService boardDetailService = new JobBoardDetailService();
		JobBoardBean article = boardDetailService.getArticle(board_num);
		
		JobBoardListService boardListService = new JobBoardListService();
		
		// 리턴받은 BoardBean 객체가 null 이 아닐 경우 BoardDetailService 클래스의 plusReadcount() 메서드 호출
		if(article != null) {
			boardDetailService.plusReadcount(board_num);
		}
		
		// 게시물 정보(BoardBean 객체), 페이지번호(page) 를 request 객체에 저장
		request.setAttribute("article", article);
		request.setAttribute("page", nowPage);
		
		
		// ActionForward 객체를 생성하여 board 폴더 내의 qna_board_view.jsp 로 이동 설정
		ActionForward forward = new ActionForward();
		forward.setPath("/jobBoard/job_board_view.jsp");
		
		return forward;
	}
	
}