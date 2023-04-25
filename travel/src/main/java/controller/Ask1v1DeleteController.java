package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Ask1v1Dao;
import front.Handle;

public class Ask1v1DeleteController implements Handle {

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int mid = Integer.parseInt(request.getParameter("mid"));
		Ask1v1Dao dao = Ask1v1Dao.getInstance();

		int result = dao.delete(mid);

		RequestDispatcher dispatcher = request.getRequestDispatcher("ask1v1.jsp");
		dispatcher.forward(request, response);
	}
}