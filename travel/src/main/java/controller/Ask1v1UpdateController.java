package controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Ask1v1Dao;
import front.Handle;
import vo.Ask1v1Vo;

public class Ask1v1UpdateController implements Handle {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String iaskcategory = request.getParameter("iaskcategory");
		String icontent = request.getParameter("icontent");
		String mid = request.getParameter("mid");
		String icheck = request.getParameter("icheck");
		Date idate = new Date();

		Ask1v1Vo vo = Ask1v1Vo.builder()

				.icontent(icontent)
				.mid(mid)
				.build();
		Ask1v1Dao dao = Ask1v1Dao.getInstance();
		int result = dao.update(vo);

		RequestDispatcher dispatcher = request.getRequestDispatcher("ask1v1.jsp");
		dispatcher.forward(request, response);
	}
}