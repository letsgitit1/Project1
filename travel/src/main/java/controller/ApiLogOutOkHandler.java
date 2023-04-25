package controller;


import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import front.Handle;


public class ApiLogOutOkHandler implements Handle {

   @Override
   public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	  System.out.println("로그아웃 들어옴");
      HttpSession session = request.getSession();
      session.invalidate();
      RequestDispatcher dispatcher = request.getRequestDispatcher("/apiLogout.jsp");
      dispatcher.forward(request, response);
   }
}
