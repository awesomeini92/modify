package conding.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import coding.action.CmmntDeleteHeartAction;
import coding.action.CmmntDeleteProAction;
import coding.action.CmmntHeartListAction;
import coding.action.CmmntListAction;
import coding.action.CmmntModifyFormAction;
import coding.action.CmmntModifyProAction;
import coding.action.CmmntWriteProAction;
import coding.action.CodingDeleteFormAction;
import coding.action.CodingDeleteProAction;
import coding.action.CodingDetailAction;
import coding.action.CodingListAction;
import coding.action.CodingModifyFormAction;
import coding.action.CodingModifyProAction;
import coding.action.CodingReplyDetailAction;
import coding.action.CodingReplyListAction;
import coding.action.CodingReplyWriteAction;
import coding.action.CodingReplyWriteProAction;
import coding.action.CodingWriteFormAction;
import coding.action.CodingReplySelectedAction;
import coding.action.CodingWriteProAction;
import coding.action.CmmntUpdateHeartAction;
import coding.action.pre_CodingReplyDetailAction;
import vo.ActionForward;

@WebServlet("*.code")
public class CodingFrontController extends HttpServlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String command = request.getServletPath();
		
		Action action = null;
		ActionForward forward = null;
		
		System.out.println(".code 페이지 이동");
		
		if(command.equals("/CodingList.code")) {
			action = new CodingListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/CodingWriteForm.code")) {
			action = new CodingWriteFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/CodingWirtePro.code")) {
			action = new CodingWriteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/CodingDetail.code")) {
			action = new CodingDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/CodingModifyForm.code")) {
			action = new CodingModifyFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/CodingModifyPro.code")) {
			action = new CodingModifyProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if(command.equals("/CodeFileDown.code")) {
			forward = new ActionForward();
			forward.setPath("/coding/file_down.jsp");
		}else if(command.equals("/CodingReplyWrite.code")) {
			action = new CodingReplyWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/CodingReplyWirtePro.code")) {
			action = new CodingReplyWriteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/CodingReplyList.code")) {
			action = new CodingReplyListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/pre_CodingReplyDetail.code")) { //원래 디테일액션
			action = new pre_CodingReplyDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/CodingReplyDetail.code")) { //지금은 페이징
			action = new CodingReplyDetailAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/CodingDeleteForm.code")) {
				action = new CodingDeleteFormAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(command.equals("/CodingDeletePro.code")) {
			action = new CodingDeleteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/CodingReplySelected.code")) {
			action = new CodingReplySelectedAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/CodingReplySelectedFin.code")) {
			action = new CodingDetailAction();  //????????
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/CmmntList.code")) {
			action = new CmmntListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/CmmntWritePro.code")) {
			action = new CmmntWriteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/CmmntModifyForm.code")) {
			action = new CmmntModifyFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/CmmntModifyPro.code")) {
			action = new CmmntModifyProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/CmmntDeletePro.code")) {
			action = new CmmntDeleteProAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/CmmntHeartList.code")) {
			action = new CmmntHeartListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/CmmntUpdateHeart.code")) {
			action = new CmmntUpdateHeartAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/CmmntDeleteHeart.code")) {
			action = new CmmntDeleteHeartAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		
		
		// 이동 설정
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
		doProcess(request, response);
	}
	
}
