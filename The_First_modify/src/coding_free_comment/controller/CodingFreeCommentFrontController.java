package coding_free_comment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import coding_free_comment.action.Action;
import coding_free_comment.action.CodingFreeCommentWriteAction;
import coding_free_comment.vo.ActionForward;

@WebServlet("*.cfC")
public class CodingFreeCommentFrontController extends HttpServlet{

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String command = request.getServletPath();
		
		ActionForward forward = null;
		Action action = null;
		System.out.println("command : " + command);
		
		if (command.equals("/CodingFreeCommentWritePro.cfC")) {
			action = new CodingFreeCommentWriteAction();
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
