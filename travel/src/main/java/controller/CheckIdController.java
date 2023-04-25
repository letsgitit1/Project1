package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import front.Handle;

public class CheckIdController implements Handle {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String val = request.getParameter("val");
		
		MemberDao dao = MemberDao.getInstance();
		int cnt = dao.checkId(val);
		PrintWriter out = response.getWriter();
		
		if(cnt == 1) {
			System.out.println("아이디 중복");
		}else {
			System.out.println("아이디 사용가능");
		}
		out.write(cnt + "");
		out.close();
	}

}
