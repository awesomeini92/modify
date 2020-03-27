package admin.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import admin.action.ProductListAction;
import notice.action.NoticeDeleteProAction;
import notice.action.NoticeDetailAction;
import notice.action.NoticeListAction;
import notice.action.NoticeModifyFormAction;
import notice.action.NoticeModifyProAction;
import notice.action.NoticeWriteProAction;
import vo.ActionForward;

@WebServlet("*.ad")
public class AdminFrontController extends HttpServlet {

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("AdminFrontController!");
		
		//post방식 요청에 대한 한글처리
		request.setCharacterEncoding("UTF-8");

		// 요청된 서블릿 주소를 바로 추출
		String command = request.getServletPath();
		System.out.println("command : " + command);
		
		// 공통된 작업 처리를 위한 Action, ActionForward 타입 변수 선언
		Action action = null;
		ActionForward forward = null;
		
		
		if(command.equals("/AdminList.ad")) {
			forward = new ActionForward();
			forward.setPath("/admin/admin_list.jsp");
			
		}else if(command.equals("/ProductList.ad")) {
			action = new ProductListAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
				
		}else if(command.equals("/NoticeDetail.no")) {
			action = new NoticeDetailAction();
			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(command.equals("/NoticeModifyForm.no")) {
			action = new NoticeModifyFormAction();
//			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(command.equals("/NoticeModifyPro.no")) {
			action = new NoticeModifyProAction();
//			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(command.equals("/NoticeDeleteForm.no")) {
			forward = new ActionForward();
			forward.setPath("/notice/notice_delete.jsp");
			
		} else if(command.equals("/NoticeDeletePro.bo")) {
			action = new NoticeDeleteProAction();
//			
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else if(command.equals("/NoticeFileDown.no")) {
			forward = new ActionForward();
			forward.setPath("/notice/file_down.jsp");
		}
		
		
		
		if (forward != null) {
			if (forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else { 
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}else {
			System.out.println("ActionForward 객체 값이 null 입니다.");
		}
		
		
		
		
	}
	
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

}
