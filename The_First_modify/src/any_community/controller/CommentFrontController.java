package any_community.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import any_community.action.Action;
import any_community.action.CommentListAction;
import any_community.action.CommentWriteAction;
import any_community.vo.ActionForward;

@WebServlet("*.anyC")
public class CommentFrontController extends HttpServlet{

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String command = request.getServletPath();
		
		ActionForward forward = null;
		Action action = null;
		System.out.println("command : " + command);
		
		if (command.equals("/CommentWritePro.anyC")) {
			action = new CommentWriteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/CommentList.anyC")) {
			action = new CommentListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
	}
	
	@Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
            doProcess(request,response);
    }      
	
	@Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
            doProcess(request,response);
    }
 
	
}
