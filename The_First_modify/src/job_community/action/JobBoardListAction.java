package job_community.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import job_community.svc.JobBoardListService;
import job_community.vo.ActionForward;
import job_community.vo.JobBoardBean;
import job_community.vo.PageInfo;

public class JobBoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		int page = 1; // 현재 페이지 번호
		int limit = 10; // 한 페이지 당 출력할 게시물 수
		// page 파라미터가 존재할 경우 파라미터에 전달된 데이터를 현재 페이지 번호로 대체
		// => URL 주소 뒤에 XXX.bo?page=XXX 형태로 파라미터 전달됨
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page")); // 정수로 변환하여 저장
		}
		
		// BoardListService 인스턴스 생성 후 게시물 목록 갯수 가져오기
		JobBoardListService boardListService = new JobBoardListService();
		int listCount = boardListService.getListCount();
//		System.out.println("총 게시물 수 : " + listCount);
		
		// BoardListService 객체의 getArticleList() 메서드를 호출하여 게시물 목록 가져오기
		// => 파라미터로 현재 페이지(page) 와 게시물 수(limit) 를 전달
		// => ArrayList<BoardBean> 타입 객체 리턴
		ArrayList<JobBoardBean> articleList = boardListService.getArticleList(page, limit);
		
		int maxPage = (int)((double)listCount / limit + 0.95);
		int startPage = (((int)((double)page / 10 + 0.9)) - 1) * 10 + 1;
		int endPage = startPage + 10 - 1;
		
		// 마지막 페이지 번호가 총 페이지 수 보다 클 경우 총 페이지 수를 마지막 페이지 번호로 설정
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// PageInfo 객체에 페이지 정보 저장
		PageInfo pageInfo = new PageInfo(page, maxPage, startPage, endPage, listCount);
		
		// request 객체의 setAttribute() 메서드를 호출하여 페이지 정보, 게시물 목록 저장
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("articleList", articleList);
		
		// ActionForward 객체를 생성하여 board 폴더의 qna_board_list.jsp 페이지로 이동(Dispatch 방식)
		forward = new ActionForward();
		forward.setPath("/job_community/job_board_list.jsp");
		// forward.setRedirect(false) 는 생략 가능(기본값)
		
		return forward;
	}

}
