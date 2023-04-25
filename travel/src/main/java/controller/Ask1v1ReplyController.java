package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Ask1v1Dao;
import front.Handle;
import vo.Ask1v1Vo;

public class Ask1v1ReplyController implements Handle {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	//	HttpSession session = request.getSession();
		Ask1v1Dao dao = Ask1v1Dao.getInstance();
		
		int ino = Integer.parseInt(request.getParameter("ino"));
		String admincontent = request.getParameter("admincontent");
		String icheck = request.getParameter("icheck");
		String iasktitle = request.getParameter("iasktitle");
		
		Ask1v1Vo vo = Ask1v1Vo.builder()
				.ino(ino)
				.icheck(icheck)
				.iasktitle(iasktitle)
				.admincontent(admincontent)
				.build();
		
	int result = dao.reply(vo);
		
	
	if (result != 0) {
		response.sendRedirect("./ask1v1");
	}

}
}
