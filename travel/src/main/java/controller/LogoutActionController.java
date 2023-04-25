package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import front.Handle;

public class LogoutActionController implements Handle{

	@Override
	public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		session.invalidate();
		String contextPath=request.getContextPath();
		System.out.println(contextPath);
		System.out.println("로그아웃이요");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/logout.jsp");
		dispatcher.forward(request, response);
	}
}
