package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Ask1v1Dao;
import front.Handle;
import vo.Ask1v1Vo;
import vo.MemberVo;

public class MyInqurityController implements Handle {

   @Override
   public void handle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      Ask1v1Dao dao = Ask1v1Dao.getInstance();
      
      MemberVo user = (MemberVo)request.getSession().getAttribute("user");
      List<Ask1v1Vo> list = dao.showMyAnswer(user.getId());
      System.out.println(list.size());
      request.setAttribute("askList", list);
      RequestDispatcher dispatcher = request.getRequestDispatcher("inqurity.jsp");
      dispatcher.forward(request, response);
   }

}