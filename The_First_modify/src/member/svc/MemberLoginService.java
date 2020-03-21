package member.svc;

import static db.JdbcUtil.*;

import java.sql.Connection;

import member.dao.MemberDAO;
import member.vo.MemberBean;

public class MemberLoginService {
	
	public int isLoginMember(MemberBean member) {
//		System.out.println("MemberLoginService - isLoginMember()");
		int loginResult = 0;
		
		Connection con = getConnection();
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.setConnection(con);
		
		loginResult = memberDAO.selectLoginMember(member);
		
		close(con);
		
		return loginResult;
	}
	
}
